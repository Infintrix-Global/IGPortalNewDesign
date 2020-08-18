using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class AddClientDetails : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetClientList();
            }
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int _isInserted = -1;
                ClientDetails objClient = new ClientDetails()
                {
                    CompanyID= Convert.ToInt32(Session["CompanyID"].ToString()),
                    Name = txtName.Text,
                    Mobile = txtMobile.Text,
                    Email = txtEmail.Text,
                    Password = objCommon.Encrypt("12345"),
                    Location = txtLocation.Text,
                };

                _isInserted = objCommon.AddClientDetails(objClient);

                if (_isInserted == -1)
                {

                    lblmsg.Text = "Failed to Add Client";
                    lblmsg.ForeColor = System.Drawing.Color.Red;

                }
                else if (_isInserted == 0)
                {

                    lblmsg.Text = "Client Exists";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {

                    lblmsg.Text = "Client Added ";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    objCommon.SendMail(txtEmail.Text.Trim(), txtMobile.Text.Trim(), "12345");
                    btclear_Click(sender, e);
                    GetClientList();
                }
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace + ex.Message);
            }
        }


        protected void btclear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtMobile.Text = "";
           
            txtEmail.Text = "";
        }

        public void GetClientList()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetClientList(Convert.ToInt32(Session["CompanyID"].ToString()));
            GridClient.DataSource = dt;
            GridClient.DataBind();
            count.Text = "Number of Clients =" + dt.Rows.Count;
            ViewState["dirState"] = dt;
            ViewState["sortdr"] = "Asc";
        }

        protected void GridClient_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridClient.PageIndex = e.NewPageIndex;
            GetClientList();
        }

        protected void GridClient_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                GridClient.DataSource = dtrslt;
                GridClient.DataBind();
            }
        }
    }
}