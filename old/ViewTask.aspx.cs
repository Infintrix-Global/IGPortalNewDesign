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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                CheckRole();
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
                if (Session["Role"].ToString() == "Admin")
                {
                    BindEmployeeMaster();
                    ddlEmployeeName.Enabled = true;
                    pbAdmin.Visible = true;
                    pbEmployee.Visible = false;

                }
                else if (Session["Role"].ToString() == "Employee")
                {
                    BindEmployeeMaster();
                    ddlEmployeeName.SelectedValue = Session["LoginID"].ToString();
                    ddlEmployeeName.Enabled = false;
                    BindGridTask();
                    BindProjectMaster(Convert.ToInt32(ddlEmployeeName.SelectedValue));
                    pbEmployee.Visible = true;
                    pbAdmin.Visible = false;
                }
            }
        }

        public void BindEmployeeMaster()
        {
            ddlEmployeeName.DataSource = objcommon.GetEmployeeMaster();
            ddlEmployeeName.DataTextField = "EmployeeName";
            ddlEmployeeName.DataValueField = "ID";

            ddlEmployeeName.DataBind();
            ddlEmployeeName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindProjectMaster(int EmployeeID)
        {
            ddlProjectName.DataSource = objTask.GetProjectByEmployee(EmployeeID);
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";

            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }


        public void BindTaskMaster(int EmployeeID, string ProjectID)
        {
            ddlTaskType.DataSource = objTask.GetTaskByEmployeeProject(EmployeeID, ProjectID);
            ddlTaskType.DataTextField = "TaskName";
            ddlTaskType.DataValueField = "ID";

            ddlTaskType.DataBind();
            ddlTaskType.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindGridTask()
        {
            DataTable dtTaskDetails = objTask.GetTaskDetailsByEmployee(Convert.ToInt32(ddlEmployeeName.SelectedValue));
            GridTask.DataSource = dtTaskDetails;
            GridTask.DataBind();
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

        public void BindTaskTitleMaster(string employeeID, string projectID, string TaskID, int Mode)
        {
            ddlTaskTitle.DataSource = objcommon.GetTaskTitleForTimeSheet(employeeID, projectID, TaskID, Mode);
            ddlTaskTitle.DataTextField = "TaskTitle";
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

            CheckRole();
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            try
            {

                DataTable dtSearch1;

                if ((txtToDate.Text == "" && txtFromDate.Text != "") || (txtToDate.Text != "" && txtFromDate.Text == ""))
                {
                    //GridTask.DataSource = null;
                    //GridTask.DataBind();
                    //count.Text = "Number of Tasks = 0";
                }

                else if ((ddlProjectName.SelectedIndex != 0) && (ddlTaskType.SelectedIndex != 0) && (ddlTaskTitle.SelectedIndex != 0) && (txtToDate.Text != "") && (txtFromDate.Text != ""))
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), Convert.ToDateTime(txtFromDate.Text), Convert.ToDateTime(txtToDate.Text), 8);
                    GridFillSearch();
                }

                else if ((ddlProjectName.SelectedIndex != 0) && (ddlTaskTitle.SelectedIndex != 0) && (txtToDate.Text != "") && (txtFromDate.Text != ""))
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), Convert.ToDateTime(txtFromDate.Text), Convert.ToDateTime(txtToDate.Text), 7);
                    GridFillSearch();
                }

                else if ((ddlProjectName.SelectedIndex != 0) && (ddlTaskType.SelectedIndex != 0) && (txtToDate.Text != "") && (txtFromDate.Text != ""))
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), Convert.ToDateTime(txtFromDate.Text), Convert.ToDateTime(txtToDate.Text), 6);
                    GridFillSearch();
                }

                else if ((ddlProjectName.SelectedIndex != 0) && (ddlTaskType.SelectedIndex != 0) && (ddlTaskTitle.SelectedIndex != 0))
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), DateTime.Now, DateTime.Now, 5);
                    GridFillSearch();
                }

                else if ((ddlProjectName.SelectedIndex != 0) && (ddlTaskType.SelectedIndex != 0))
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), DateTime.Now, DateTime.Now, 4);
                    GridFillSearch();
                }

                else if ((ddlProjectName.SelectedIndex != 0) && (ddlTaskTitle.SelectedIndex != 0))
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), DateTime.Now, DateTime.Now, 3);
                    GridFillSearch();
                }

                else if ((ddlProjectName.SelectedIndex != 0) && (txtToDate.Text != "") && (txtFromDate.Text != ""))
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), Convert.ToDateTime(txtFromDate.Text), Convert.ToDateTime(txtToDate.Text), 2);
                    GridFillSearch();
                }


                else if (ddlProjectName.SelectedIndex != 0)
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), DateTime.Now, DateTime.Now, 1);
                    GridFillSearch();

                }

                else if ((txtToDate.Text != "") && (txtFromDate.Text != ""))
                {

                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), Convert.ToDateTime(txtFromDate.Text), Convert.ToDateTime(txtToDate.Text), 10);
                    GridFillSearch();

                }

                else
                {
                    dtSearch1 = objTask.SearchTask(Convert.ToInt32(ddlEmployeeName.SelectedValue), Convert.ToInt32(ddlProjectName.SelectedValue), Convert.ToInt32(ddlTaskType.SelectedValue), Convert.ToInt32(ddlTaskTitle.SelectedValue), DateTime.Now, DateTime.Now, 9);
                    GridFillSearch();
                }



                void GridFillSearch()
                {
                    if (dtSearch1.Rows.Count > 0)
                    {
                        //DataTable dtSearch = dtSearch1.CopyToDataTable();
                        GridTask.DataSource = dtSearch1;
                        GridTask.DataBind();
                        tottime.Text = "Total Time Spent=" + dtSearch1.Rows[0]["TotalTime"].ToString();
                        count.Text = "Number of Tasks= " + (dtSearch1.Rows.Count).ToString();
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        GridTask.DataSource = dt;
                        GridTask.DataBind();
                        tottime.Text = "";
                        count.Text = "Number of Tasks= " + (dtSearch1.Rows.Count).ToString();
                    }

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.Charset = "";
                string FileName = "TimeSheet-" + ddlEmployeeName.SelectedItem.Text + DateTime.Now + ".xls";
                using (StringWriter sw = new StringWriter())
                {
                    HtmlTextWriter hw = new HtmlTextWriter(sw);

                    //To Export all pages
                    GridTask.AllowPaging = false;
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
                 General.ErrorMessage(ex.StackTrace + ex.Message);
                throw ex;
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

            BindGridTask();
            BindProjectMaster(Convert.ToInt32(ddlEmployeeName.SelectedValue));
            BindTaskMaster(Convert.ToInt32(ddlEmployeeName.SelectedValue), ddlProjectName.SelectedValue);
            BindTaskTitleMaster(ddlEmployeeName.SelectedValue, ddlProjectName.SelectedValue, ddlTaskType.SelectedValue, 3);
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {

            BindTaskMaster(Convert.ToInt32(ddlEmployeeName.SelectedValue), ddlProjectName.SelectedValue);
            if (ddlProjectName.SelectedIndex != 0 && ddlTaskType.SelectedIndex != 0)
            {
                BindTaskTitleMaster(ddlEmployeeName.SelectedValue, ddlProjectName.SelectedValue, ddlTaskType.SelectedValue, 3);
            }
            else if (ddlProjectName.SelectedIndex != 0)
            {
                BindTaskTitleMaster(ddlEmployeeName.SelectedValue, ddlProjectName.SelectedValue, ddlTaskType.SelectedValue, 1);
            }
            else if (ddlTaskType.SelectedIndex != 0)
            {
                BindTaskTitleMaster(ddlEmployeeName.SelectedValue, ddlProjectName.SelectedValue, ddlTaskType.SelectedValue, 2);
            }
        }

        protected void ddlTaskType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProjectName.SelectedIndex != 0 && ddlTaskType.SelectedIndex != 0)
            {
                BindTaskTitleMaster(ddlEmployeeName.SelectedValue, ddlProjectName.SelectedValue, ddlTaskType.SelectedValue, 3);
            }
            else if (ddlProjectName.SelectedIndex != 0)
            {
                BindTaskTitleMaster(ddlEmployeeName.SelectedValue, ddlProjectName.SelectedValue, ddlTaskType.SelectedValue, 1);
            }
            else if (ddlTaskType.SelectedIndex != 0)
            {
                BindTaskTitleMaster(ddlEmployeeName.SelectedValue, ddlProjectName.SelectedValue, ddlTaskType.SelectedValue, 2);
            }
        }


    }
}