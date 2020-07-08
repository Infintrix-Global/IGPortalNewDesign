using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class ViewTask : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        General objGeneral = new General();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                CheckRole();
                BindProjectMaster();
                BindTaskCategory();
                BindTaskMaster();
                BindInitialStatusMaster();
                BindTaskTitleMasterRegularTask("0");

            }
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
                DataTable dtCheckRights = objcommon.GetRoleRights(Session["Role"].ToString(), 6);
                if (dtCheckRights.Rows[0]["IsPrintAllowed"] is true)
                {
                    if (Session["Role"].ToString() == "2")
                    {
                        BindEmployeeMaster();
                        ddlEmployeeName.SelectedValue = Session["LoginID"].ToString();
                        ddlEmployeeName.Enabled = true;
                        BindEmployeeTask(ddlEmployeeName.SelectedValue);
                    }
                    else if (Session["Role"].ToString() == "4")
                    {
                        BindEmployeeManagerMaster();
                        ddlEmployeeName.SelectedValue = Session["LoginID"].ToString();
                        ddlEmployeeName.Enabled = true;
                        BindEmployeeTask(ddlEmployeeName.SelectedValue);
                    }
                }
                else if (dtCheckRights.Rows[0]["IsPrintAllowed"] is false)
                {
                    BindEmployeeMaster();
                    ddlEmployeeName.SelectedValue = Session["LoginID"].ToString();
                    ddlEmployeeName.Enabled = false;
                    BindEmployeeTask(ddlEmployeeName.SelectedValue);
                }

            }
        }

        public void BindEmployeeMaster()
        {
            ddlEmployeeName.DataSource = objcommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlEmployeeName.DataTextField = "EmployeeName";
            ddlEmployeeName.DataValueField = "ID";
            ddlEmployeeName.DataBind();
            ddlEmployeeName.Items.Insert(0, new ListItem("--- Select All ---", "0"));
        }

        public void BindEmployeeManagerMaster()
        {
            ddlEmployeeName.DataSource = objcommon.GetEmployeeMasterbyManager(Session["LoginID"].ToString());
            ddlEmployeeName.DataTextField = "EmployeeName";
            ddlEmployeeName.DataValueField = "ID";
            ddlEmployeeName.DataBind();
            ddlEmployeeName.Items.Insert(0, new ListItem("--- Select All ---", "0"));
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";

            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindTaskCategory()
        {
            ddlTaskCategory.DataSource = objcommon.GetTaskCategory(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlTaskCategory.DataTextField = "TaskCategory";
            ddlTaskCategory.DataValueField = "ID";

            ddlTaskCategory.DataBind();
            ddlTaskCategory.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindInitialStatusMaster()
        {
           
            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindStatusMaster()
        {
            ddlStatus.DataSource = objcommon.GetStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";

            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindBugStatusMaster()
        {
            ddlStatus.DataSource = objcommon.GetBugStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";

            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindTaskMaster()
        {
            ddlTaskType.DataSource = objcommon.GetTaskMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlTaskType.DataTextField = "TaskName";
            ddlTaskType.DataValueField = "ID";

            ddlTaskType.DataBind();
            ddlTaskType.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindGridTask()
        {
            DataTable dtTaskDetails;
            //if (Session["Role"].ToString() == "2" || Session["Role"].ToString() == "4")
            //{
            //     dtTaskDetails = objTask.GetTaskDetailsAllEmployee();
            //    GridTask.DataSource = dtTaskDetails;
            //    GridTask.DataBind();
            //    GridFillTask();
            //}
            //else if (Session["Role"].ToString() == "1")
            //{
            dtTaskDetails = objTask.GetTaskDetailsByEmployee(Convert.ToInt32(ddlEmployeeName.SelectedValue));
            GridTask.DataSource = dtTaskDetails;
            GridTask.DataBind();
            GridFillTask();
            // }

            void GridFillTask()
            {
                if (dtTaskDetails.Rows.Count > 0)
                {
                    tottime.Text = "Total Time Spent=" + dtTaskDetails.Rows[0]["TotalTime"].ToString();
                }
                else
                {
                    tottime.Text = "";
                }
                count.Text = "Number of Tasks= " + dtTaskDetails.Rows.Count;
                btExport.Visible = true;
                ViewState["dirState"] = dtTaskDetails;
                ViewState["sortdr"] = "Asc";
            }
        }

       

        public void BindEmployeeTask(string empID)
        {
            DataTable dtTaskDetails;
            if (empID == "0")
            {
                dtTaskDetails = objTask.GetTaskDetailsAllEmployee();
                GridTask.DataSource = dtTaskDetails;
                GridTask.DataBind();
                GridFillTask();
            }
            else
            {
                dtTaskDetails = objTask.GetTaskDetailsByEmployee(Convert.ToInt32(ddlEmployeeName.SelectedValue));
                GridTask.DataSource = dtTaskDetails;
                GridTask.DataBind();
                GridFillTask();
            }

            void GridFillTask()
            {
                if (dtTaskDetails.Rows.Count > 0)
                {
                    tottime.Text = "Total Time Spent=" + dtTaskDetails.Rows[0]["TotalTime"].ToString();
                }
                else
                {
                    tottime.Text = "";
                }
                count.Text = "Number of Tasks= " + dtTaskDetails.Rows.Count;
                btExport.Visible = true;
                ViewState["dirState"] = dtTaskDetails;
                ViewState["sortdr"] = "Asc";
            }
        }

        public void BindTaskTitleMasterRegularTask(string projectID)
        {
            ddlTaskTitle.DataSource = objcommon.GetTaskTitleByProject(projectID);
            ddlTaskTitle.DataTextField = "TaskTitle";
            ddlTaskTitle.DataValueField = "ID";

            ddlTaskTitle.DataBind();
            ddlTaskTitle.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindTaskTitleMasterBug(string projectID)
        {
            ddlTaskTitle.DataSource = objcommon.GetTaskTitleMasterForBug(projectID);
            ddlTaskTitle.DataTextField = "BugDetails";
            ddlTaskTitle.DataValueField = "ID";

            ddlTaskTitle.DataBind();
            ddlTaskTitle.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            txtFromDate.Text = "";
            txtToDate.Text = "";
            ddlProjectName.SelectedIndex = 0;
            ddlTaskTitle.SelectedIndex = 0;
            ddlTaskType.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlTaskCategory.SelectedIndex = 0;
            CheckRole();
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuery = "";
                string strQuery1 = "";
                string strqtime = "";
                string strqueryfinal = "";
                 DataTable dtSearch1;
                DataTable dtTime;

                if ((txtToDate.Text == "" && txtFromDate.Text != "") || (txtToDate.Text != "" && txtFromDate.Text == ""))
                {
                    //GridTask.DataSource = null;
                    //GridTask.DataBind();
                    //count.Text = "Number of Tasks = 0";
                }

                else
                {
                    // strqtime = "SELECT CONVERT(TIME, DATEADD(s, SUM(( DATEPART(hh, TimePeriod) * 3600 ) + ( DATEPART(mi, TimePeriod) * 60 ) + DATEPART(ss, TimePeriod)), 0)) AS TotalTime FROM   TimeSheet TS where  TS.IsActive=1";
                    strqtime = "DECLARE @TimeinSecond INT  SET @TimeinSecond = ";
                    strqtime += "(SELECT  SUM(( DATEPART(hh, TimePeriod) * 3600 ) + ( DATEPART(mi, TimePeriod) * 60 ) + DATEPART(ss, TimePeriod)) AS TotalTime FROM   TimeSheet TS where  TS.IsActive=1";
                    
                    
                        
                        strQuery = "(Select TS.LoginID,TS.ID ,SUBSTRING(EmployeeName, 1, (SELECT CHARINDEX(' ',EmployeeName ))) as EmployeeName,TTM.TaskTitle,TS.StartTime,TS.EndTime,TS.TimePeriod,TS.Comment,TM.TaskName,PM.ProjectName,TS.TaskDetails,WorkDate,SM.StatusName,TC.TaskCategory from TimeSheet TS" +
                        " inner join TaskMaster TM on TS.TaskType=TM.ID inner join ProjectMaster PM on PM.ID=TS.ProjectName inner join StatusMaster SM on TS.Status=SM.ID inner join TaskTitleMaster TTM on TS.TaskTitle=TTM.ID inner join Login L on L.ID=TS.LoginID inner join TaskCategory TC on TC.ID=TS.TaskCategory where TS.IsActive=1 and TC.ID=1";

                    strQuery1 = "(Select TS.LoginID,TS.ID ,SUBSTRING(EmployeeName, 1, (SELECT CHARINDEX(' ',EmployeeName ))) as EmployeeName,TTM.BugDetails as TaskTitle,TS.StartTime,TS.EndTime,TS.TimePeriod,TS.Comment,TM.TaskName,PM.ProjectName,TS.TaskDetails,TS.WorkDate,SM.StatusName,TC.TaskCategory from TimeSheet TS" +
                       " inner join TaskMaster TM on TS.TaskType=TM.ID inner join ProjectMaster PM on PM.ID=TS.ProjectName inner join StatusMaster SM on TS.Status=SM.ID inner join Bug TTM on TS.TaskTitle=TTM.ID inner join Login L on L.ID=TS.LoginID inner join TaskCategory TC on TC.ID=TS.TaskCategory where TS.IsActive=1 and TC.ID=2";
                    if (Session["Role"].ToString() == "2")
                    {
                        //add nothing
                    }
                    else if (Session["Role"].ToString() == "4")
                    {
                        strQuery += " and (L.Manager = '" + Session["LoginID"].ToString() + "'  or L.ID=  '" + Session["LoginID"].ToString() + "')";
                        strQuery1 += " and (L.Manager = '" + Session["LoginID"].ToString() + "'  or L.ID=  '" + Session["LoginID"].ToString() + "')";
                    }


                    if (txtToDate.Text == "" && txtFromDate.Text == "")
                    {
                       
                        if (ddlEmployeeName.SelectedIndex > 0)
                        {
                            strQuery += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                            strQuery1 += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                            strqtime += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                        }
                        if (ddlProjectName.SelectedIndex > 0)
                        {
                            strQuery += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                            strQuery1 += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                            strqtime += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                        }
                        if(ddlTaskCategory.SelectedIndex>0)
                        {
                            strQuery += " and TS.TaskCategory ='" + ddlTaskCategory.SelectedValue + "'";
                            strQuery1 += " and TS.TaskCategory ='" + ddlTaskCategory.SelectedValue + "'";
                            strqtime += " and TS.TaskCategory ='" + ddlTaskCategory.SelectedValue + "'";
                        }
                        if (ddlTaskType.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                            strQuery1 += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                            strqtime += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                        }
                        if (ddlTaskTitle.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                            strQuery1 += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                            strqtime += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                        }
                        if (ddlStatus.SelectedIndex > 0)
                        {
                            strQuery += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                            strQuery1 += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                            strqtime += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                        }

                        strQuery += ") union  ";
                        strQuery1 += ")  order by TS.WorkDate DESC ";
                        strqtime += ")  SELECT RIGHT('0' + CAST(@TimeinSecond / 3600 AS VARCHAR),4) + ':' + RIGHT('0' + CAST((@TimeinSecond / 60) % 60 AS VARCHAR), 2) + ':' + RIGHT('0' + CAST(@TimeinSecond % 60 AS VARCHAR), 2) AS TotalTimehours";
                        strqueryfinal = strQuery + strQuery1;
                        dtTime = objGeneral.GetDatasetByCommand(strqtime);
                        dtSearch1 = objTask.SearchTask(strqueryfinal);
                        GridFillSearch();
                    }
                    else if (txtToDate.Text != "" && txtFromDate.Text != "")
                    {

                        if (ddlEmployeeName.SelectedIndex > 0)
                        {
                            strQuery += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                            strQuery1 += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                            strqtime += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                        }
                        if (ddlProjectName.SelectedIndex > 0)
                        {
                            strQuery += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                            strQuery1 += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                            strqtime += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                        }

                        if (ddlTaskCategory.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskCategory ='" + ddlTaskCategory.SelectedValue + "'";
                            strQuery1 += " and TS.TaskCategory ='" + ddlTaskCategory.SelectedValue + "'";
                            strqtime += " and TS.TaskCategory ='" + ddlTaskCategory.SelectedValue + "'";
                        }

                        if (ddlTaskType.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                            strQuery1 += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                            strqtime += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                        }
                        if (ddlTaskTitle.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                            strQuery1 += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                            strqtime += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                        }
                        if (ddlStatus.SelectedIndex > 0)
                        {
                            strQuery += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                            strQuery1 += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                            strqtime += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                        }

                        strQuery += " and TS.WorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                        strqtime += " and TS.WorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";

                        strQuery += ") union  ";
                        strQuery1 += ")  order by TS.WorkDate DESC ";
                        strqueryfinal = strQuery + strQuery1;
                        strqtime += ")  SELECT RIGHT('0' + CAST(@TimeinSecond / 3600 AS VARCHAR),4) + ':' + RIGHT('0' + CAST((@TimeinSecond / 60) % 60 AS VARCHAR), 2) + ':' + RIGHT('0' + CAST(@TimeinSecond % 60 AS VARCHAR), 2) AS TotalTimehours";
                        dtTime = objGeneral.GetDatasetByCommand(strqtime);
                        dtSearch1 = objTask.SearchTask(strqueryfinal);
                        GridFillSearch();
                       
                       

                    }
                }




                void GridFillSearch()
                {
                    if (dtSearch1 != null)
                    {
                        //DataTable dtSearch = dtSearch1.CopyToDataTable();
                        GridTask.DataSource = dtSearch1;
                        GridTask.DataBind();
                        tottime.Text = "Total Time Spent=" + dtTime.Rows[0]["TotalTimehours"].ToString();
                        count.Text = "Number of Tasks= " + (dtSearch1.Rows.Count).ToString();
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        GridTask.DataSource = dt;
                        GridTask.DataBind();
                        tottime.Text = "";
                        count.Text = "Number of Tasks= 0";
                    }
                    ViewState["dirState"] = dtSearch1;
                    ViewState["sortdr"] = "Asc";


                }

            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace + ex.Message);

            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            string FileName;
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.Charset = "";
                if (ddlEmployeeName.SelectedIndex > 0)
                {
                    FileName = "TimeSheet-" + ddlEmployeeName.SelectedItem.Text + DateTime.Now + ".xls";
                }
                else
                {
                     FileName = "TimeSheet-" + DateTime.Now + ".xls";
                }
                using (StringWriter sw = new StringWriter())
                {
                    HtmlTextWriter hw = new HtmlTextWriter(sw);

                    //To Export all pages
                    GridTask.AllowPaging = false;
                    GridTask.AllowSorting = false;
                    this.btSearch_Click(sender, e);

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
                    GridTask.GridLines = GridLines.Both;

                    GridTask.HeaderStyle.Font.Bold = true;
                    GridTask.RenderControl(hw);
                    Response.Write(sw.ToString());

                    Response.End();


                }

            }
            catch (Exception ex)
            {
                // General.ErrorMessage(ex.StackTrace + ex.Message);

            }
        }

        protected void GridTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridTask.PageIndex = e.NewPageIndex;
            btSearch_Click(sender, e);
        }

        protected void GridTask_Sorting(object sender, GridViewSortEventArgs e)
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
                GridTask.DataSource = dtrslt;
                GridTask.DataBind();
            }
        }

        protected void txtFromDate_TextChanged(object sender, EventArgs e)
        {
            if ((txtToDate.Text == "" && txtFromDate.Text == "") || (txtToDate.Text != "" && txtFromDate.Text != ""))
            {
                requiredFromDate.Enabled = false;
                requiredToDate.Enabled = false;
            }
            else
            {
                requiredFromDate.Enabled = true;
                requiredToDate.Enabled = true;

            }
        }

        protected void txtToDate_TextChanged(object sender, EventArgs e)
        {
            if ((txtToDate.Text == "" && txtFromDate.Text == "") || (txtToDate.Text != "" && txtFromDate.Text != ""))
            {
                requiredFromDate.Enabled = false;
                requiredToDate.Enabled = false;
            }
            else
            {
                requiredFromDate.Enabled = true;
                requiredToDate.Enabled = true;

            }
        }

        protected void ddlEmployeeName_SelectedIndexChanged(object sender, EventArgs e)
        {
            btSearch_Click(sender, e);
            //BindEmployeeTask(ddlEmployeeName.SelectedValue);

        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTaskCategory.SelectedIndex != 0)
            {
                if (ddlTaskCategory.SelectedValue == "1")
                {
                    BindTaskTitleMasterRegularTask(ddlProjectName.SelectedValue);
                    BindStatusMaster();
                }
                if (ddlTaskCategory.SelectedValue == "2")
                {
                    BindTaskTitleMasterBug(ddlProjectName.SelectedValue);
                    BindBugStatusMaster();
                }
            }

        }

        protected void GridTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Delete")
            {
                int tid = Convert.ToInt32(e.CommandArgument);
                objTask.RemoveTimeSheet(tid);
                BindEmployeeTask(ddlEmployeeName.SelectedValue);

            }
            if(e.CommandName == "Edit")
            {
                int tid = Convert.ToInt32(e.CommandArgument);
                Session["TimeSheetID"] = tid.ToString();// Convert.ToInt32(((Label)row.FindControl("lblTID")).Text);
                Response.Redirect("~/AddTimeSheet.aspx");
            }
        }

        protected void GridTask_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (((Label)e.Row.FindControl("lblLoginID")).Text == Session["LoginID"].ToString() && ((Convert.ToDateTime(((Label)e.Row.FindControl("lblWorkDate")).Text) <= DateTime.Now) && (Convert.ToDateTime(((Label)e.Row.FindControl("lblWorkDate")).Text) >= DateTime.Now.AddDays(-3))))
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

            catch (Exception ex)
            {

            }
        }

        protected void lnkAddTS_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddTimeSheet.aspx",false);
        }

        protected void ddlTaskCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProjectName.SelectedIndex != 0)
            {
                if (ddlTaskCategory.SelectedValue == "1")
                {
                    BindTaskTitleMasterRegularTask(ddlProjectName.SelectedValue);
                    BindStatusMaster();
                }
                if (ddlTaskCategory.SelectedValue == "2")
                {
                    BindTaskTitleMasterBug(ddlProjectName.SelectedValue);
                    BindBugStatusMaster();
                }
            }
        }
    }
}