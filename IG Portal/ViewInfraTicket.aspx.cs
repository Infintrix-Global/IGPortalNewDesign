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
    public partial class ViewInfraTicket : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                BindStatusMaster();
                BindClientMaster();
                BindSupport();
            }
        }

        public void BindAssetMaster(string ClientID)
        {
            ddlAssetName.DataSource = objCommon.GetAssetMasterbyCustomer(Convert.ToInt32(ClientID));
            ddlAssetName.DataTextField = "AssetName";
            ddlAssetName.DataValueField = "ID";
            ddlAssetName.DataBind();
            ddlAssetName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }
        public void BindClientMaster()
        {

            ddlClient.DataSource = objCommon.GetInfraClientMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlClient.DataTextField = "EmployeeName";
            ddlClient.DataValueField = "ID";
            ddlClient.DataBind();
            ddlClient.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

   
     
        protected void GridSupport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridSupport.PageIndex = e.NewPageIndex;
            btSearch_Click(sender, e);
        }

        public void BindStatusMaster()
        {
            ddlppStatus.DataSource = objCommon.GetSupportStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlppStatus.DataTextField = "StatusName";
            ddlppStatus.DataValueField = "ID";

            ddlppStatus.DataBind();
            ddlppStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));

            ddlStatus.DataSource = objCommon.GetSupportStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";

            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void ddlClient_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlClient.SelectedIndex > 0)
            {
                BindAssetMaster(ddlClient.SelectedValue);
            }
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

        public void BindSupport()
        {
            DataTable dtSupport;

            dtSupport = objTask.GetInfraSupportTicketsByEngineer(Session["LoginID"].ToString());
            GridSupport.DataSource = dtSupport;
            GridSupport.DataBind();
            count.Text = "Number of Tickets =" + dtSupport.Rows.Count;
            ViewState["dirState"] = dtSupport;
            ViewState["sortdr"] = "Asc";
        }

      

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            _isInserted = objTask.AddInfraSupportComment(txtppComment.Text, ddlppStatus.SelectedValue, lblppSupportID.Text, Session["LoginID"].ToString());
            if (_isInserted == -1)
            {
                lblMessage.Text = "Failed to Add Support Comment";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                lblMessage.Text = "Support Comment Added ";

                lblMessage.ForeColor = System.Drawing.Color.Green;
                BindSupport();
                Clear();

            }
        }

        public void Clear()
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
                    Response.Redirect("~/ViewInfraSupportHistory.aspx");
                }
            }
            catch (Exception ex)
            {

            }

        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            ddlAssetName.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlClient.SelectedIndex = 0;
           
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            DataTable dtSearch1 = new DataTable();
            try
            {
                string query = "Select S.*,AM.AssetName,AM.AssetNummber,L.EmployeeName as ClientName,SSM.StatusName,L2.EmployeeName as EngineerName from InfraSupport S inner join CustomerAssetMap AM on AM.ID = S.AssetID inner join " +
                    "Login L on L.ID = S.ClientID inner join SupportStatusMAster SSM on SSM.ID = S.Status" +
                    "inner join Login L2 on S.EngineerID=L2.ID  where S.IsActive = 1 and S.EngineerID = "+Session["LoginID"].ToString();



                string queryfinal;

                if (ddlAssetName.SelectedIndex > 0)
                {
                    query += " and S.AssetUD ='" + ddlAssetName.SelectedValue + "'";
                   
                }
                if (ddlClient.SelectedIndex > 0)
                {
                    query += " and S.ClientID ='" + ddlClient.SelectedValue + "'";
                 
                }
                if (ddlStatus.SelectedIndex > 0)
                {
                    query += " and S.Status ='" + ddlStatus.SelectedValue + "'";
                  
                }
                queryfinal = query  + " order by CreatedOn desc";
                dtSearch1 = objTask.SearchTask(query);
                GridFillSearch();


                void GridFillSearch()
                {
                    if (dtSearch1 != null)
                    {
                        //DataTable dtSearch = dtSearch1.CopyToDataTable();
                        GridSupport.DataSource = dtSearch1;
                        GridSupport.DataBind();
                        count.Text = "Number of Tickets= " + (dtSearch1.Rows.Count).ToString();
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        GridSupport.DataSource = dt;
                        GridSupport.DataBind();
                        count.Text = "Number of Tickets= 0";
                    }
                    ViewState["dirState"] = dtSearch1;
                    ViewState["sortdr"] = "Asc";


                }
            }
            catch (Exception ex)
            {

            }
        }

       
    }
}