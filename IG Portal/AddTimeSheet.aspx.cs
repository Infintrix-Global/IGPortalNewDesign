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
    public partial class AddTasks : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        static string timeSheetID;
        static string AddTSBugID;
        protected void Page_UnLoad(object sender, EventArgs e)
        {

            Session["TimeSheetID"] = null;
            Session["AddTSBugID"] = null;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            rgvStartDate.MinimumValue = DateTime.Today.AddDays(-3).ToString("yyyy-MM-dd");
            rgvStartDate.MaximumValue = DateTime.Now.ToString("yyyy-MM-dd");
            if (!IsPostBack)
            {

                BindProjectMaster();
                BindTaskMaster();
                BindTaskCategory();


                txtDate.Attributes["min"] = DateTime.Now.AddDays(-3).ToString("yyyy-MM-dd");
                txtDate.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
                timeSheetID = Session["TimeSheetID"] as string;
                AddTSBugID = Session["AddTSBugID"] as string;
                {

                    if (string.IsNullOrEmpty(timeSheetID) && string.IsNullOrEmpty(AddTSBugID))
                    {
                        txtDate.Text = Convert.ToDateTime(DateTime.Today).ToString("yyyy-MM-dd");
                        Clear();
                    }
                    else if (string.IsNullOrEmpty(AddTSBugID))
                    {
                        txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                        AutoFillTimeSheet();
                    }
                    else if (string.IsNullOrEmpty(timeSheetID))
                    {
                        //txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                        AutoFillTimeSheetForBug();
                    }
                }
            }
        }



        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
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

        public void BindTaskMaster()
        {
            ddlTaskType.DataSource = objcommon.GetTaskMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlTaskType.DataTextField = "TaskName";
            ddlTaskType.DataValueField = "ID";

            ddlTaskType.DataBind();
            ddlTaskType.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindTaskTitleMasterRegularTask(string projectID)
        {
            ddlTaskTitle.DataSource = objcommon.GetTaskTitleMaster(projectID);
            ddlTaskTitle.DataTextField = "TaskTitle";
            ddlTaskTitle.DataValueField = "ID";

            ddlTaskTitle.DataBind();
            ddlTaskTitle.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindTaskTitleMasterBug(string projectID)
        {
            ddlTaskTitle.DataSource = objcommon.GetTaskTitleMasterForBug(projectID, Session["LoginID"].ToString(), 1);
            ddlTaskTitle.DataTextField = "BugDetails";
            ddlTaskTitle.DataValueField = "ID";

            ddlTaskTitle.DataBind();
            ddlTaskTitle.Items.Insert(0, new ListItem("--- Select ---", "0"));
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

        //protected void imgPopup_Click(object sender, ImageClickEventArgs e)
        //{

        //    if (Calendar1.Visible == true)
        //    {
        //        Calendar1.Visible = false;
        //    }
        //    else
        //    {
        //        Calendar1.Visible = true;
        //        txtDate.Text = "";
        //    }
        //}

        //protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        //{

        //    if (e.Day.Date > DateTime.Today || e.Day.Date < DateTime.Today.AddDays(-3))
        //    {
        //        e.Day.IsSelectable = false;
        //    }
        //}

        //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        //{
        //    txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
        //    Calendar1.Visible = false;


        //}

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;

            //timeSheetID = Session["TimeSheetID"] as string;
            try
            {
                TimeSheetDetails objTimeSheetDetails = new TimeSheetDetails()
                {
                    LoginID = Convert.ToInt32(Session["LoginID"].ToString()),
                    ProjectName = ddlProjectName.SelectedValue,
                    TaskCategory = ddlTaskCategory.SelectedValue,
                    TaskName = ddlTaskType.SelectedValue,
                    Comment = txtComment.Text,
                    TaskDetails = txtTaskDescription.Text,
                    Status = ddlStatus.SelectedValue,
                    WorkDate = (Convert.ToDateTime(txtDate.Text)).ToString("dd MMMM yyyy"),
                    StartTime = (Convert.ToDateTime(txtStartTime.Text)).ToString("hh:mm tt"),
                    EndTime = (Convert.ToDateTime(txtEndTime.Text)).ToString("hh:mm tt"),
                };
                if (ddlTaskTitle.SelectedItem.Text == "Other")
                {
                    objTimeSheetDetails.TaskTitle = txtTaskTitle.Text;
                    objTimeSheetDetails.Mode = 2;
                }
                else
                {
                    requiredtxttitle.Enabled = false;
                    objTimeSheetDetails.TaskTitle = ddlTaskTitle.SelectedValue;
                    objTimeSheetDetails.Mode = 1;
                }
                if (string.IsNullOrEmpty(timeSheetID))
                {
                    _isInserted = objTask.Add_TimeSheet(objTimeSheetDetails);

                    if (_isInserted == -1)
                    {
                        lblMessage.Text = "Failed to Add TimeSheet";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblMessage.Text = "TimeSheet Added";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        Clear();


                    }
                }
                else
                {
                    objTimeSheetDetails.TimeSheetID = Convert.ToInt32(timeSheetID);
                    _isInserted = objTask.UpdateTimeSheet(objTimeSheetDetails);
                    if (_isInserted == -1)
                    {
                        lblMessage.Text = "Failed to Update TimeSheet";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblMessage.Text = "TimeSheet Updated";
                        Session["TimeSheetID"] = null;
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("~/ViewTask.aspx");

                    }
                }
            }

            catch (Exception ex)
            {

            }

        }

        public void Clear()
        {
            ddlProjectName.SelectedIndex = 0;
            ddlTaskType.SelectedIndex = 0;
            //txtDate.Text = "";
            txtTaskTitle.Text = "";
            txtTaskTitle.Visible = false;
            txtStartTime.Text = "";
            txtEndTime.Text = "";
            ddlStatus.SelectedIndex = 0;
            txtTaskDescription.Text = "";
            ddlTaskTitle.SelectedIndex = 0;
            txtComment.Text = "";
            ddlTaskCategory.SelectedIndex = 0;
            requiredtxttitle.Enabled = true;
            //Calendar1.SelectedDates.Clear();
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

        protected void ddlTaskTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTaskTitle.SelectedItem.Text == "Other")
            {
                txtTaskTitle.Visible = true;

            }

            else
            {
                txtTaskTitle.Visible = false;
            }
        }

        public void AutoFillTimeSheet()
        {
            DataTable dtTimeSheet = new DataTable();
            dtTimeSheet = objTask.AutoFillTimeSheet(Convert.ToInt32(timeSheetID.Trim()));
            ddlProjectName.SelectedValue = dtTimeSheet.Rows[0]["ProjectName"].ToString();
            ddlTaskCategory.SelectedValue = dtTimeSheet.Rows[0]["TaskCategory"].ToString();
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
            ddlTaskType.SelectedValue = dtTimeSheet.Rows[0]["TaskType"].ToString();
            ddlTaskTitle.SelectedValue = dtTimeSheet.Rows[0]["TaskTitle"].ToString();

            txtTaskDescription.Text = dtTimeSheet.Rows[0]["TaskDetails"].ToString();
            txtDate.Text = Convert.ToDateTime(dtTimeSheet.Rows[0]["WorkDate"].ToString()).ToString("yyyy-MM-dd");
            txtStartTime.Text = dtTimeSheet.Rows[0]["StartTime"].ToString();
            ddlStatus.SelectedValue = dtTimeSheet.Rows[0]["Status"].ToString();
            txtEndTime.Text = dtTimeSheet.Rows[0]["EndTime"].ToString();
            txtComment.Text = dtTimeSheet.Rows[0]["Comment"].ToString();
        }

        public void AutoFillTimeSheetForBug()
        {
            DataTable dtTimeSheet = new DataTable();
            dtTimeSheet = objTask.AutoFillTimeSheetForBug(Convert.ToInt32(AddTSBugID.Trim()));
            ddlProjectName.SelectedValue = dtTimeSheet.Rows[0]["ProjectID"].ToString();
            ddlTaskCategory.SelectedValue = "2";
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
            //ddlTaskType.SelectedValue = dtTimeSheet.Rows[0]["TaskType"].ToString();
            ddlTaskTitle.SelectedValue = AddTSBugID.ToString();

            //txtTaskDescription.Text = dtTimeSheet.Rows[0]["TaskDetails"].ToString();
           // txtDate.Text = Convert.ToDateTime(dtTimeSheet.Rows[0]["WorkDate"].ToString()).ToString("yyyy-MM-dd");
           // txtStartTime.Text = dtTimeSheet.Rows[0]["StartTime"].ToString();
           // ddlStatus.SelectedValue = dtTimeSheet.Rows[0]["Status"].ToString();
           // txtEndTime.Text = dtTimeSheet.Rows[0]["EndTime"].ToString();
           // txtComment.Text = dtTimeSheet.Rows[0]["Comment"].ToString();
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