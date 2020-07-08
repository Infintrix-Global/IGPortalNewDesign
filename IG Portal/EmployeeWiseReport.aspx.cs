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
    public partial class EmployeeWiseReport : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        General objGeneral = new General();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtFromDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                BindEmployeeMaster();
                BindGridTask();
                BindTaskMaster();
                BindStatusMaster();
                BindTaskTitleMaster("0");

            }
        }

        public void BindEmployeeMaster()
        {
            ddlEmployeeName.DataSource = objcommon.GetEmployeeMasterByDate(Convert.ToInt32(Session["CompanyID"].ToString()),txtFromDate.Text,txtToDate.Text);
            ddlEmployeeName.DataTextField = "EmployeeName";
            ddlEmployeeName.DataValueField = "ID";
            ddlEmployeeName.DataBind();
            ddlEmployeeName.Items.Insert(0, new ListItem("--- Select ---", "0"));
            
        }


        public void BindProjectMaster()
        {
           
                ddlProjectName.DataSource = objcommon.GetProjectMasterByEmployeeDate(Convert.ToInt32(ddlEmployeeName.SelectedValue),txtFromDate.Text, txtToDate.Text);
                ddlProjectName.DataTextField = "ProjectName";
                ddlProjectName.DataValueField = "ID";

                ddlProjectName.DataBind();
                ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
            
        }

        public void BindStatusMaster()
        {
            ddlStatus.DataSource = objcommon.GetStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
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
            dtTaskDetails = objTask.GetTaskDetailsByDate(Convert.ToInt32(Session["CompanyID"].ToString()), txtFromDate.Text,txtToDate.Text);
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

        protected void BindGrid()
        {
            GridTask.DataSource = ViewState["dirState"] as DataTable;
            GridTask.DataBind();
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

        public void BindTaskTitleMaster(string projectID)
        {
            ddlTaskTitle.DataSource = objcommon.GetTaskTitleByProject(projectID);
            ddlTaskTitle.DataTextField = "TaskTitle";
            ddlTaskTitle.DataValueField = "ID";

            ddlTaskTitle.DataBind();
            ddlTaskTitle.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtFromDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            BindEmployeeMaster();
            BindGridTask();
            ddlTaskTitle.SelectedIndex = 0;
            ddlTaskType.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuery = "";
                string strqtime = "";
                DataTable dtSearch1;
                DataTable dtTime;

                if ((txtToDate.Text == "" ) || (txtToDate.Text == "" ))
                {
                    //GridTask.DataSource = null;
                    //GridTask.DataBind();
                    //count.Text = "Number of Tasks = 0";
                }

                else
                {
                    strqtime = "SELECT CONVERT(TIME, DATEADD(s, SUM(( DATEPART(hh, TimePeriod) * 3600 ) + ( DATEPART(mi, TimePeriod) * 60 ) + DATEPART(ss, TimePeriod)), 0)) AS TotalTime FROM   TimeSheet TS where  TS.IsActive=1";
                    strQuery = "Select TS.LoginID,TS.ID ,L.EmployeeName,TTM.TaskTitle,TS.StartTime,TS.EndTime,TS.TimePeriod,TS.Comment,TM.TaskName,PM.ProjectName,TS.TaskDetails,WorkDate,SM.StatusName from TimeSheet TS inner join TaskMaster TM on TS.TaskType=TM.ID inner join ProjectMaster PM on PM.ID=TS.ProjectName inner join StatusMaster SM on TS.Status=SM.ID inner join TaskTitleMaster TTM on TS.TaskTitle=TTM.ID inner join Login L on L.ID=TS.LoginID where TS.IsActive=1";
                    if (Session["Role"].ToString() == "2")
                    {
                        //add nothing
                    }
                    else if (Session["Role"].ToString() == "4")
                    {
                        strQuery += " and (L.Manager = '" + Session["LoginID"].ToString() + "'  or L.ID=  '" + Session["LoginID"].ToString() + "')";
                    }


                    if (txtToDate.Text == "" && txtFromDate.Text == "")
                    {
                        //strqtime = "SELECT CONVERT(TIME, DATEADD(s, SUM(( DATEPART(hh, TimePeriod) * 3600 ) + ( DATEPART(mi, TimePeriod) * 60 ) + DATEPART(ss, TimePeriod)), 0)) AS TotalTime FROM   TimeSheet TS where  TS.IsActive=1";
                        // strQuery = "Select L.EmployeeName,TTM.TaskTitle,TS.StartTime,TS.EndTime,TS.TimePeriod,TS.Comment,TM.TaskName,PM.ProjectName,TS.TaskDetails,WorkDate,SM.StatusName from TimeSheet TS inner join TaskMaster TM on TS.TaskType=TM.ID inner join ProjectMaster PM on PM.ID=TS.ProjectName inner join StatusMaster SM on TS.Status=SM.ID inner join TaskTitleMaster TTM on TS.TaskTitle=TTM.ID inner join Login L on L.ID=TS.LoginID where TS.IsActive=1";
                        if (ddlEmployeeName.SelectedIndex > 0)
                        {
                            strQuery += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                            strqtime += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                        }
                        if (ddlProjectName.SelectedIndex > 0)
                        {
                            strQuery += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                            strqtime += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                        }
                        if (ddlTaskType.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                            strqtime += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                        }
                        if (ddlTaskTitle.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                            strqtime += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                        }
                        if (ddlStatus.SelectedIndex > 0)
                        {
                            strQuery += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                            strqtime += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                        }

                        strQuery += "order by WorkDate DESC ";

                        dtTime = objGeneral.GetDatasetByCommand(strqtime);
                        dtSearch1 = objTask.SearchTask(strQuery);
                        GridFillSearch();
                    }
                    else if (txtToDate.Text != "" && txtFromDate.Text != "")
                    {

                        //strqtime = "SELECT CONVERT(TIME, DATEADD(s, SUM(( DATEPART(hh, TimePeriod) * 3600 ) + ( DATEPART(mi, TimePeriod) * 60 ) + DATEPART(ss, TimePeriod)), 0)) AS TotalTime FROM   TimeSheet TS where  TS.IsActive=1";
                        //strQuery = "Select L.EmployeeName,TTM.TaskTitle,TS.StartTime,TS.EndTime,TS.TimePeriod,TS.Comment,TM.TaskName,PM.ProjectName,TS.TaskDetails,WorkDate,SM.StatusName from TimeSheet TS inner join TaskMaster TM on TS.TaskType=TM.ID inner join ProjectMaster PM on PM.ID=TS.ProjectName inner join StatusMaster SM on TS.Status=SM.ID inner join TaskTitleMaster TTM on TS.TaskTitle=TTM.ID inner join Login L on L.ID=TS.LoginID where TS.IsActive=1";
                        if (ddlEmployeeName.SelectedIndex > 0)
                        {
                            strQuery += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                            strqtime += " and TS.LoginID ='" + ddlEmployeeName.SelectedValue + "'";
                        }
                        if (ddlProjectName.SelectedIndex > 0)
                        {
                            strQuery += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                            strqtime += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                        }
                        if (ddlTaskType.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                            strqtime += " and TS.TaskType ='" + ddlTaskType.SelectedValue + "'";
                        }
                        if (ddlTaskTitle.SelectedIndex > 0)
                        {
                            strQuery += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                            strqtime += " and TS.TaskTitle ='" + ddlTaskTitle.SelectedValue + "'";
                        }
                        if (ddlStatus.SelectedIndex > 0)
                        {
                            strQuery += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                            strqtime += " and TS.Status ='" + ddlStatus.SelectedValue + "'";
                        }

                        strQuery += " and TS.WorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                        strqtime += " and TS.WorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                        strQuery += "order by WorkDate DESC ";

                        dtTime = objGeneral.GetDatasetByCommand(strqtime);
                        dtSearch1 = objTask.SearchTask(strQuery);
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
                        tottime.Text = "Total Time Spent=" + dtTime.Rows[0]["TotalTime"].ToString();
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
            if  (txtToDate.Text != "" && txtFromDate.Text != "")
            {
                requiredFromDate.Enabled = false;
                requiredToDate.Enabled = false;
                BindEmployeeMaster();
            }
            else
            {
                requiredFromDate.Enabled = true;
                requiredToDate.Enabled = true;

            }
            
        }

        protected void txtToDate_TextChanged(object sender, EventArgs e)
        {
            if (txtToDate.Text != "" && txtFromDate.Text != "")
            {
                requiredFromDate.Enabled = false;
                requiredToDate.Enabled = false;
                BindEmployeeMaster();
            }
            else
            {
                requiredFromDate.Enabled = true;
                requiredToDate.Enabled = true;
            }
            
        }

        protected void ddlEmployeeName_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            BindProjectMaster();
            btSearch_Click(sender, e);
           

        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {

            BindTaskTitleMaster(ddlProjectName.SelectedValue);
        }

      
    }
}