using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using IG_Portal.BAL_Classes;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class PendingAssignTask : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjectMaster();
                BindEmployeeMaster();
                BindGridAssignTask();
                BindStatusMaster();
            }
            lblmsg.Text = "";
        }


        public void BindStatusMaster()
        {
            ddlTaskStatus.DataSource = objcommon.GetStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlTaskStatus.DataTextField = "StatusName";
            ddlTaskStatus.DataValueField = "ID";

            ddlTaskStatus.DataBind();
            ddlTaskStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";

            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindEmployeeMaster()
        {
            ddlempName.DataSource = objcommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlempName.DataTextField = "EmployeeName";
            ddlempName.DataValueField = "ID";

            ddlempName.DataBind();
            ddlempName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindGridAssignTask()
        {
            DataTable dtTaskDetails;
           
            dtTaskDetails = objTask.GetAllTask();
            GridAssignTask.DataSource = dtTaskDetails;
            GridAssignTask.DataBind();
            count.Text = "Number of Tasks= " + dtTaskDetails.Rows.Count;
            ViewState["dirState"] = dtTaskDetails;
            ViewState["sortdr"] = "Asc";


        }

        protected void GridAssignTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridAssignTask.PageIndex = e.NewPageIndex;
            btSearch_Click(sender, e);
        }

        protected void GridAssignTask_Sorting(object sender, GridViewSortEventArgs e)
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
                GridAssignTask.DataSource = dtrslt;
                GridAssignTask.DataBind();
            }
        }

        protected void GridAssignTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Assign")
                {
                    int _IsConfirm = -1;

                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridAssignTask.Rows[rowIndex];
                    string developerID = (row.FindControl("ddlDeveloper") as DropDownList).SelectedValue;
                    string id = (row.FindControl("lblID") as Label).Text;
                    
                    if (developerID == "0")
                    {
                        lblmsg.Text = "Failed-Please Select Developer ";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        _IsConfirm = objTask.AssignTask(Convert.ToInt32(id), developerID);
                        if (_IsConfirm == -1)
                        {
                            lblmsg.Text = "Failed To Assign";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg.Text = "Task Assigned";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                            objcommon.SendMailAssignTask(id);
                            BindGridAssignTask();
                        }
                    }
                }

                if (e.CommandName == "Remove")
                {
                    int _isDeleted = -1;
                    int bid = Convert.ToInt32(e.CommandArgument);
                    _isDeleted = objTask.RemoveTask(bid);
                    if (_isDeleted == -1)
                    {
                        lblMessage.Text = "Failed to delete Task";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblMessage.Text = "Task deleted ";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        btnSearch();
                    }


                }

                if (e.CommandName == "Edit")
                {
                    int bid = Convert.ToInt32(e.CommandArgument);
                    // Session["BugID"] = bid.ToString();
                    Response.Redirect("~/AssignTask.aspx?TaskIDEdit=" + objcommon.Encrypt(bid.ToString()));
                    //Response.Redirect("~/AddBug.aspx");
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void GridAssignTask_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (((Label)e.Row.FindControl("Label7")).Text =="" ) 
                {
                    ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = true;
                    ((Button)e.Row.FindControl("btnAssign")).Visible = true;
                    ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataSource = objcommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
                    ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataTextField = "EmployeeName";
                    ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataValueField = "ID";
                    ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataBind();

                    ((DropDownList)e.Row.FindControl("ddlDeveloper")).Items.Insert(0, new ListItem("--- Select Developer ---", "0"));
                }
                else
                {
                    ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = false;
                    ((Button)e.Row.FindControl("btnAssign")).Visible = false;
                    
                }

                if (((Label)e.Row.FindControl("lblCreatedBy")).Text == Session["LoginID"].ToString())
                {
                    ((ImageButton)e.Row.FindControl("imgDelete")).Visible = true;
                    ((ImageButton)e.Row.FindControl("lnkEdit")).Visible = true;
                }
                else
                {
                    ((ImageButton)e.Row.FindControl("imgDelete")).Visible = false;
                    ((ImageButton)e.Row.FindControl("lnkEdit")).Visible = false;
                }

            }
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            DataTable dtSearch1;
            string strqueryfinal = "";
            string strQuery = "";
            string strQuery1 = "";
            strQuery = "(Select TS.ID,TS.CreatedBy,TS.ID , TS.Comment,TS.Priority,TS.TaskAddedDateTime,'' as EmployeeName,TM.TaskName,PM.ProjectName" +
                ",TS.TaskDetails,TTM.TaskTitle,TS.AssignTo,TS.EstiamtedWorkTime,Convert(nvarchar(max),TS.EstimatedWorkDate,103) as EstimatedWorkDate from AssignedTask TS inner join TaskMaster TM on TS.TaskType = TM.ID inner join " +
                "ProjectMaster PM on PM.ID = TS.ProjectName inner join TaskTitleMaster TTM on TS.TaskTitle = TTM.ID " +
                " where TS.IsActive = 1 and IsDeleted=0  and TS.AssignTo is null";

            strQuery1 = " (Select TS.ID,TS.CreatedBy,TS.ID , " +
                "TS.Comment,TS.Priority,TS.TaskAddedDateTime,L.EmployeeName,TM.TaskName,PM.ProjectName,TS.TaskDetails,TTM.TaskTitle,TS.AssignTo" +
                ",TS.EstiamtedWorkTime,Convert(nvarchar(max),TS.EstimatedWorkDate,103) as EstimatedWorkDate " +
                "from AssignedTask TS inner join TaskMaster TM on TS.TaskType = TM.ID inner join ProjectMaster PM on PM.ID = TS.ProjectName " +
                "inner join TaskTitleMaster TTM on TS.TaskTitle = TTM.ID inner join Login L on L.ID = TS.AssignTo   where TS.IsActive = 1 " +
                " and IsDeleted=0 and TS.AssignTo is not null";

            if (ddlempName.SelectedIndex > 0)
            {
                strQuery += " and TTS.AssignTo ='" + ddlempName.SelectedValue + "'";
                strQuery1 += " and TS.AssignTo ='" + ddlempName.SelectedValue + "'";
               
            }
            if (ddlProjectName.SelectedIndex > 0)
            {
                strQuery += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                strQuery1 += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
               
            }

            if(ddlTaskStatus.SelectedIndex > 0)
            {
                strQuery += " and TS.Status ='" + ddlTaskStatus.SelectedValue + "'";
                strQuery1 += " and TS.Status ='" + ddlTaskStatus.SelectedValue + "'";
            }

            if (ddlStatus.SelectedValue == "1")
            {
               
                strQuery += ")  order by TS.[TaskAddedDateTime] desc";
                strqueryfinal = strQuery ;
                dtSearch1 = objTask.SearchTask(strqueryfinal);
                GridFillSearch();

            }
            if (ddlStatus.SelectedValue == "2")
            {
                
                strQuery1 += ")  order by TS.[TaskAddedDateTime] desc";
                strqueryfinal = strQuery1;
                dtSearch1 = objTask.SearchTask(strqueryfinal);
                GridFillSearch();

            }
            if (ddlStatus.SelectedValue == "3")
            {
                strQuery += ") union  ";
                strQuery1 += ")  order by TS.[TaskAddedDateTime] desc";
                strqueryfinal = strQuery + strQuery1;
                dtSearch1 = objTask.SearchTask(strqueryfinal);
                GridFillSearch();

            }
            

            void GridFillSearch()
            {
                if (dtSearch1 != null)
                {
                    //DataTable dtSearch = dtSearch1.CopyToDataTable();
                    GridAssignTask.DataSource = dtSearch1;
                    GridAssignTask.DataBind();
                    
                    count.Text = "Number of Tasks= " + (dtSearch1.Rows.Count).ToString();
                }
                else
                {
                    DataTable dt = new DataTable();
                    GridAssignTask.DataSource = dt;
                    GridAssignTask.DataBind();
                    
                    count.Text = "Number of Tasks= 0";
                }
                ViewState["dirState"] = dtSearch1;
                ViewState["sortdr"] = "Asc";


            }
        }

        public void btnSearch()
        {
            DataTable dtSearch1;
            string strqueryfinal = "";
            string strQuery = "";
            string strQuery1 = "";
            strQuery = "(Select TS.ID,TS.CreatedBy,TS.ID , TS.Comment,TS.Priority,TS.TaskAddedDateTime,'' as EmployeeName,TM.TaskName,PM.ProjectName" +
                ",TS.TaskDetails,TTM.TaskTitle,TS.AssignTo,TS.EstiamtedWorkTime,Convert(nvarchar(max),TS.EstimatedWorkDate,103) as EstimatedWorkDate from AssignedTask TS inner join TaskMaster TM on TS.TaskType = TM.ID inner join " +
                "ProjectMaster PM on PM.ID = TS.ProjectName inner join TaskTitleMaster TTM on TS.TaskTitle = TTM.ID " +
                " where TS.IsActive = 1 and IsDeleted=0  and TS.AssignTo is null";

            strQuery1 = " (Select TS.ID,TS.CreatedBy,TS.ID , " +
                "TS.Comment,TS.Priority,TS.TaskAddedDateTime,L.EmployeeName,TM.TaskName,PM.ProjectName,TS.TaskDetails,TTM.TaskTitle,TS.AssignTo" +
                ",TS.EstiamtedWorkTime,Convert(nvarchar(max),TS.EstimatedWorkDate,103) as EstimatedWorkDate " +
                "from AssignedTask TS inner join TaskMaster TM on TS.TaskType = TM.ID inner join ProjectMaster PM on PM.ID = TS.ProjectName " +
                "inner join TaskTitleMaster TTM on TS.TaskTitle = TTM.ID inner join Login L on L.ID = TS.AssignTo   where TS.IsActive = 1 " +
                " and IsDeleted=0 and TS.AssignTo is not null";

            if (ddlempName.SelectedIndex > 0)
            {
                strQuery += " and TTS.AssignTo ='" + ddlempName.SelectedValue + "'";
                strQuery1 += " and TS.AssignTo ='" + ddlempName.SelectedValue + "'";

            }
            if (ddlProjectName.SelectedIndex > 0)
            {
                strQuery += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                strQuery1 += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";

            }

            if (ddlTaskStatus.SelectedIndex > 0)
            {
                strQuery += " and TS.Status ='" + ddlTaskStatus.SelectedValue + "'";
                strQuery1 += " and TS.Status ='" + ddlTaskStatus.SelectedValue + "'";
            }

            if (ddlStatus.SelectedValue == "1")
            {

                strQuery += ")  order by TS.[TaskAddedDateTime] desc";
                strqueryfinal = strQuery;
                dtSearch1 = objTask.SearchTask(strqueryfinal);
                GridFillSearch();

            }
            if (ddlStatus.SelectedValue == "2")
            {

                strQuery1 += ")  order by TS.[TaskAddedDateTime] desc";
                strqueryfinal = strQuery1;
                dtSearch1 = objTask.SearchTask(strqueryfinal);
                GridFillSearch();

            }
            if (ddlStatus.SelectedValue == "3")
            {
                strQuery += ") union  ";
                strQuery1 += ")  order by TS.[TaskAddedDateTime] desc";
                strqueryfinal = strQuery + strQuery1;
                dtSearch1 = objTask.SearchTask(strqueryfinal);
                GridFillSearch();

            }


            void GridFillSearch()
            {
                if (dtSearch1 != null)
                {
                    //DataTable dtSearch = dtSearch1.CopyToDataTable();
                    GridAssignTask.DataSource = dtSearch1;
                    GridAssignTask.DataBind();

                    count.Text = "Number of Tasks= " + (dtSearch1.Rows.Count).ToString();
                }
                else
                {
                    DataTable dt = new DataTable();
                    GridAssignTask.DataSource = dt;
                    GridAssignTask.DataBind();

                    count.Text = "Number of Tasks= 0";
                }
                ViewState["dirState"] = dtSearch1;
                ViewState["sortdr"] = "Asc";


            }
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            ddlempName.SelectedIndex = 0;
            ddlProjectName.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            BindGridAssignTask();
        }
    }
}