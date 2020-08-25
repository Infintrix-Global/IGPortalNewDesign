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
              
                BindStatusMaster();
                BindProjectMaster();
                BindClientMaster();
                CheckRole();
            }
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objCommon.GetProjectMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";
            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }
        public void BindClientMaster()
            {


            ddlClient.DataSource = objCommon.GetClientMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlClient.DataTextField = "EmployeeName";
            ddlClient.DataValueField = "ID";
            ddlClient.DataBind();
            ddlClient.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void CheckRole()
        {
            //DataTable AllData = objTask.GetEmployeeByID(Convert.ToInt32(Session["LoginID"].ToString()));
            if (Session["Role"] is null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                DataTable dtCheckRights = objCommon.GetRoleRights(Session["Role"].ToString(), 16);
                if (dtCheckRights.Rows[0]["IsPrintAllowed"] is true)
                {
                      ddlClient.Enabled = true;
                    BindSupport();
                    
                }
                else if (dtCheckRights.Rows[0]["IsPrintAllowed"] is false)
                {
                    ddlClient.SelectedValue = Session["LoginID"].ToString();
                    ddlClient.Enabled = false;
                    BindSupportClient();
                }

            }
        }
        protected void GridSupport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridSupport.PageIndex = e.NewPageIndex;
            btSearch_Click(sender, e);
        }

        public void BindSupport()
        {
            DataTable dtSupport;

            dtSupport = objTask.GetSupportTickets();
            GridSupport.DataSource = dtSupport;
            GridSupport.DataBind();
            count.Text = "Number of Tickets =" + dtSupport.Rows.Count;
            ViewState["dirState"] = dtSupport;
            ViewState["sortdr"] = "Asc";
        }

        public void BindSupportClient()
        {
            DataTable dtSupport;

            dtSupport = objTask.GetSupportTicketsByClient(ddlClient.SelectedValue);
            GridSupport.DataSource = dtSupport;
            GridSupport.DataBind();
            count.Text = "Number of Tickets =" + dtSupport.Rows.Count;
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

            ddlStatus.DataSource = objCommon.GetSupportStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";

            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
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
                BindSupport();
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

        protected void btclear_Click(object sender, EventArgs e)
        {
            ddlProjectName.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlClient.SelectedIndex = 0;
            CheckRole();
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            DataTable dtSearch1 = new DataTable();
            try
            {
                string query = "Select S.*,PM.ProjectName,L.EmployeeName as ClientName,SSM.StatusName from Support S inner join ProjectMaster PM on PM.ID=S.ProjectID inner join " +
                    "Login L on L.ID = S.ClientID inner join SupportStatusMAster SSM on SSM.ID = S.Status" +
                    "     where S.IsActive = 1";
                if (ddlProjectName.SelectedIndex > 0)
                {
                    query += " and S.ProjectID ='" + ddlProjectName.SelectedValue + "'";
                }
                if (ddlClient.SelectedIndex > 0)
                {
                    query += " and S.ClientID ='" + ddlClient.SelectedValue + "'";
                }
                if (ddlStatus.SelectedIndex > 0)
                {
                    query += " and S.Status ='" + ddlStatus.SelectedValue + "'";
                }
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
            catch(Exception ex)
            {

            }
        }
    }
}