using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class ViewSupportTicket : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                BindSupport();
                BindStatusMaster();
            }
        }

        protected void GridSupport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridSupport.PageIndex = e.NewPageIndex;
            BindSupport();
        }

        public void BindSupport()
        {
            DataTable dtSupport;

            dtSupport = objTask.GetSupportTickets();
            GridSupport.DataSource = dtSupport;
            GridSupport.DataBind();
            count.Text = "Number of Bugs =" + dtSupport.Rows.Count;
            ViewState["dirState"] = dtSupport;
            ViewState["sortdr"] = "Asc";
        }
        public void BindStatusMaster()
        {
            ddlppStatus.DataSource = objCommon.GetSupportStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlppStatus.DataTextField = "StatusName";
            ddlppStatus.DataValueField = "ID";

            ddlppStatus.DataBind();
            ddlppStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void GridSupport_Sorting(object sender, GridViewSortEventArgs e)
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
                GridSupport.DataSource = dtrslt;
                GridSupport.DataBind();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            _isInserted = objTask.AddSupportComment(txtppComment.Text, ddlppStatus.SelectedValue, lblppSupportID.Text,Session["LoginID"].ToString());
            if (_isInserted == -1)
            {
                lblMessage.Text = "Failed to Add Support Comment";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                lblMessage.Text = "Support Comment Added ";

                lblMessage.ForeColor = System.Drawing.Color.Green;

                Clear();

            }
        }

        public void  Clear()
        {
            txtppComment.Text = "";
            ddlppStatus.SelectedIndex = 0;
            lblppSupportID.Text = "";
        }

        protected void GridSupport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "Comment")
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridSupport.Rows[rowIndex % 10];
                    string SupportID = (row.FindControl("lblID") as Label).Text;
                    lblppSupportID.Text = SupportID;
                    ModalPopupExtender1.Show();
                    //NameValueCollection nv = new NameValueCollection();
                    //nv.Add("@PaymentID", Convert.ToString(id));
                    // objCommon.GetDataInsertORUpdate("SP_RejectPaymentVerification", nv);
                    //BindGridPayment();
                }

                if (e.CommandName == "Download")
                {
                    string rname = (e.CommandArgument).ToString();
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "filename=" + rname);
                    Response.TransmitFile(Server.MapPath("~/Support/") + rname);
                    Response.End();
                }

                if (e.CommandName == "ViewHistory")
                {
                    int bid = Convert.ToInt32(e.CommandArgument);
                    Session["SupportHistoryID"] = bid.ToString();
                    Response.Redirect("~/ViewSupportHistory.aspx");
                }
            }
            catch (Exception ex)
            {

            }
            
        }
    }
}