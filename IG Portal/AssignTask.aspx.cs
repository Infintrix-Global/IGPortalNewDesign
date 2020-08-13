using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using IG_Portal.BAL_Classes;
using System.Web.UI.WebControls;
using System.Data;

namespace IG_Portal
{
    public partial class AssignTask : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        static string ReopenTaskID;
        protected void Page_UnLoad(object sender, EventArgs e)
        {

           
            Session["TaskIDReopen"] = null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindProjectMaster();
                BindTaskMaster();
                BindAssignToMaster();
                ReopenTaskID = Session["TaskIDReopen"] as string;
                if ((string.IsNullOrEmpty(ReopenTaskID)))
                {
                   
                    Clear();
                }

                else
                {
                   
                    AutoFillTask();
                }

            }
        }


        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";

            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindAssignToMaster()
        {
            ddlAssignTo.DataSource = objcommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlAssignTo.DataTextField = "EmployeeName";
            ddlAssignTo.DataValueField = "ID";

            ddlAssignTo.DataBind();
            ddlAssignTo.Items.Insert(0, new ListItem("--- Select ---", "0"));
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

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTaskTitleMasterRegularTask(ddlProjectName.SelectedValue);
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


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;

           
            try
            {
                TaskAssignDetails objTaskAssignDetails = new TaskAssignDetails()
                {
                    LoginID = Convert.ToInt32(Session["LoginID"].ToString()),
                    ProjectName = ddlProjectName.SelectedValue,
                    TaskName = ddlTaskType.SelectedValue,
                    Comment = txtComment.Text,
                    TaskDetails = txtTaskDescription.Text,
                   
                    EstimatedWorkDate = (Convert.ToDateTime(txtDate.Text)).ToString("dd MMMM yyyy"),
                   
                     EstimatedWorkTime=txtTime.Text,
                   
                };
                if (ddlTaskTitle.SelectedItem.Text == "Other")
                {
                    objTaskAssignDetails.TaskTitle = txtTaskTitle.Text;
                    objTaskAssignDetails.Mode = 2;
                }
                else
                {
                    requiredtxttitle.Enabled = false;
                    objTaskAssignDetails.TaskTitle = ddlTaskTitle.SelectedValue;
                    objTaskAssignDetails.Mode = 1;
                }

                if (string.IsNullOrEmpty(ReopenTaskID) )
                {
                    if (ddlAssignTo.SelectedIndex == 0)
                    {
                        _isInserted = objTask.Add_AssignTask(objTaskAssignDetails);

                        if (_isInserted == -1)
                        {
                            lblMessage.Text = "Failed to Add Task ";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblMessage.Text = "Task Added";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            Clear();


                        }
                    }
                    else
                    {
                        objTaskAssignDetails.AssignTo = ddlAssignTo.SelectedValue;
                        _isInserted = objTask.AssignTask(objTaskAssignDetails);

                        if (_isInserted == -1)
                        {
                            lblMessage.Text = "Failed to Assign Task ";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblMessage.Text = "Task Assigned";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            objcommon.SendMailAssignTask(_isInserted.ToString());
                            Clear();


                        }

                    }
                }

                else
                {
                    objTaskAssignDetails.AssignTaskID = Convert.ToInt32(ReopenTaskID);
                    objTaskAssignDetails.AssignTo = ddlAssignTo.SelectedValue;
                    _isInserted = objTask.ReopenTask(objTaskAssignDetails);
                    if (_isInserted == -1)
                    {
                        lblMessage.Text = "Failed to Reopen Task";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblMessage.Text = "Task Reopened";
                        
                        Session["TaskIDReopen"] = null;
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                      
                        Clear();
                        Response.Redirect("~/Notifications.aspx");

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
            txtDate.Text = "";
            txtTaskTitle.Text = "";
            txtTaskTitle.Visible = false;
            txtTime.Text = "";
           
            ddlAssignTo.SelectedIndex = 0;
            txtTaskDescription.Text = "";
            ddlTaskTitle.SelectedIndex = 0;
            txtComment.Text = "";
           
            requiredtxttitle.Enabled = true;
            //Calendar1.SelectedDates.Clear();
        }

        public void AutoFillTask()
        {
            DataTable dtTask = new DataTable();
            if (!string.IsNullOrEmpty(ReopenTaskID))
            {
                dtTask = objTask.GetAssignedTaskDetailsByID(Convert.ToInt32(ReopenTaskID.Trim()));
            }
           
            ddlProjectName.SelectedValue = dtTask.Rows[0]["ProjectName"].ToString();
            BindTaskTitleMasterRegularTask(ddlProjectName.SelectedValue);
            ddlTaskType.SelectedValue = dtTask.Rows[0]["TaskType"].ToString();
            ddlTaskTitle.SelectedValue = dtTask.Rows[0]["TaskTitle"].ToString();
            ddlAssignTo.SelectedValue= dtTask.Rows[0]["AssignTo"].ToString();
            txtTaskDescription.Text = dtTask.Rows[0]["TaskDetails"].ToString();
            txtDate.Text = Convert.ToDateTime(dtTask.Rows[0]["EstimatedWorkDate"].ToString()).ToString("yyyy-MM-dd");
            txtTime.Text= dtTask.Rows[0]["EstiamtedWorkTime"].ToString();
            txtComment.Text = dtTask.Rows[0]["Comment"].ToString();
        }
    }
}