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
    public partial class Employee_DashBoard : System.Web.UI.Page
    {
        DataTable dtNotifications = new DataTable();
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable AllData = objTask.GetEmployeeByID(Convert.ToInt32(Session["LoginID"].ToString()));

               // BindNotifications();
            }
        }

        //public void BindNotifications()
        //{
        //    dtNotifications = objTask.GetNotifications(Session["LoginID"].ToString());
        //    GridNotification.DataSource = dtNotifications;
        //    GridNotification.DataBind();
        //    ViewState["dirState"] = dtNotifications;
        //    ViewState["sortdr"] = "Asc";
        //}

        //protected void GridNotification_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GridNotification.PageIndex = e.NewPageIndex;
        //    BindNotifications();
        //}

        //protected void GridNotification_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    DataTable dtrslt = (DataTable)ViewState["dirState"];
        //    if (dtrslt.Rows.Count > 0)
        //    {
        //        if (Convert.ToString(ViewState["sortdr"]) == "Asc")
        //        {
        //            dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
        //            ViewState["sortdr"] = "Desc";
        //        }
        //        else
        //        {
        //            dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
        //            ViewState["sortdr"] = "Asc";
        //        }
        //        GridNotification.DataSource = dtrslt;
        //        GridNotification.DataBind();
        //    }
        //}

        //protected void GridNotification_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Row.RowType == DataControlRowType.DataRow)
        //        {
        //            DataTable dtNotify = new DataTable();
        //            int nid = Convert.ToInt32(GridNotification.DataKeys[e.Row.RowIndex].Value.ToString());
        //            dtNotify = objTask.GetNotificationsByID(nid);


        //            if (dtNotify.Rows[0]["Type"].ToString() == "1")
        //            {
        //                ((Button)e.Row.FindControl("btnConfirm")).Visible = true;
        //                ((Button)e.Row.FindControl("btnReject")).Visible = true;
        //                ((Button)e.Row.FindControl("btnAssign")).Visible = false;
        //                ((LinkButton)e.Row.FindControl("btnDetails")).Visible = false;
        //                ((Button)e.Row.FindControl("btnClosed")).Visible = false;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = false;
        //            }
        //            if (dtNotify.Rows[0]["Type"].ToString() == "2")
        //            {
        //                ((Button)e.Row.FindControl("btnConfirm")).Visible = false;
        //                ((Button)e.Row.FindControl("btnReject")).Visible = false;
        //                ((Button)e.Row.FindControl("btnAssign")).Visible = true;
        //                ((Button)e.Row.FindControl("btnClosed")).Visible = false;
        //                ((LinkButton)e.Row.FindControl("btnDetails")).Visible = true;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = true;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataSource = objCommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataTextField = "EmployeeName";
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataValueField = "ID";
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataBind();

        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Items.Insert(0, new ListItem("--- Select Developer ---", "0"));
        //            }


        //            if (dtNotify.Rows[0]["Type"].ToString() == "3")
        //            {
        //                ((Button)e.Row.FindControl("btnConfirm")).Visible = false;
        //                ((Button)e.Row.FindControl("btnReject")).Visible = false;
        //                ((Button)e.Row.FindControl("btnAssign")).Visible = false;
        //                ((Button)e.Row.FindControl("btnClosed")).Visible = false;
        //                ((LinkButton)e.Row.FindControl("btnDetails")).Visible = true;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = false;
        //            }

        //            if (dtNotify.Rows[0]["Type"].ToString() == "4")
        //            {
        //                ((Button)e.Row.FindControl("btnConfirm")).Visible = false;
        //                ((Button)e.Row.FindControl("btnReject")).Visible = false;
        //                ((Button)e.Row.FindControl("btnAssign")).Visible = false;
        //                ((Button)e.Row.FindControl("btnClosed")).Visible = true;
        //                ((LinkButton)e.Row.FindControl("btnDetails")).Visible = true;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = false;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}

        //protected void GridNotification_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    try
        //    {
        //        if (e.CommandName == "Confirm")
        //        {
        //            int _IsConfirm = -1;
        //            int id = Convert.ToInt32(e.CommandArgument);
        //            _IsConfirm = objTask.ConfirmMOMNotification(id);
        //            if (_IsConfirm == -1)
        //            {
        //                lblmsg.Text = "Failed To Confirm";
        //                lblmsg.ForeColor = System.Drawing.Color.Red;
        //            }
        //            else
        //            {
        //                lblmsg.Text = "TimeSheet Added for Meeting";
        //                lblmsg.ForeColor = System.Drawing.Color.Green;
        //            }
        //        }

        //        if (e.CommandName == "Reject")
        //        {
        //            int _IsConfirm = -1;
        //            int id = Convert.ToInt32(e.CommandArgument);
        //            _IsConfirm = objTask.RejectMOMNotification(id);
        //            if (_IsConfirm == -1)
        //            {
        //                lblmsg.Text = "Failed to Reject";
        //                lblmsg.ForeColor = System.Drawing.Color.Red;
        //            }
        //            else
        //            {

        //                lblmsg.Text = "Rejected";
        //                lblmsg.ForeColor = System.Drawing.Color.Green;
        //                BindNotifications();
        //            }
        //        }

        //        if (e.CommandName == "Assign")
        //        {
        //            int _IsConfirm = -1;

        //            int rowIndex = Convert.ToInt32(e.CommandArgument);
        //            GridViewRow row = GridNotification.Rows[rowIndex];
        //            string developerID = (row.FindControl("ddlDeveloper") as DropDownList).SelectedValue;
        //            string id = (row.FindControl("lblID") as Label).Text;
        //            if (developerID == "0")
        //            {
        //                lblmsg.Text = "Failed-Please Select Developer ";
        //                lblmsg.ForeColor = System.Drawing.Color.Red;
        //            }
        //            else
        //            {
        //                _IsConfirm = objTask.AssignBug(Convert.ToInt32(id), developerID);
        //                if (_IsConfirm == -1)
        //                {
        //                    lblmsg.Text = "Failed To Assign";
        //                    lblmsg.ForeColor = System.Drawing.Color.Red;
        //                }
        //                else
        //                {

        //                    lblmsg.Text = "Bug Assigned";
        //                    lblmsg.ForeColor = System.Drawing.Color.Green;
        //                    BindNotifications();
        //                }
        //            }
        //        }

        //        if (e.CommandName == "Details")
        //        {
        //            int id = Convert.ToInt32(e.CommandArgument);
        //            Session["BugID"] = id.ToString();
        //            Response.Redirect("ViewBugDetails.aspx");
        //        }

        //        if (e.CommandName == "Close")
        //        {
        //            int _IsClosed = -1;

        //            int id = Convert.ToInt32(e.CommandArgument);

        //            _IsClosed = objTask.CloseBug(Convert.ToInt32(id));
        //            if (_IsClosed == -1)
        //            {
        //                lblmsg.Text = "Failed To Close";
        //                lblmsg.ForeColor = System.Drawing.Color.Red;
        //            }
        //            else
        //            {

        //                lblmsg.Text = "Bug Closed";
        //                lblmsg.ForeColor = System.Drawing.Color.Green;
        //                BindNotifications();
        //            }

        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}


    }
}