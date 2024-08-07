﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class AddBug : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        static string bugID;
        static string ReopenBugID;
        static string AddBugID;

        protected void Page_UnLoad(object sender, EventArgs e)
        {
            Session["TaskIDAddBug"] = null;
            Session["BugID"] = null;
            Session["BugIDReopen"] = null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindProjectMaster();
                BindStatusMaster();
                BindTaskMaster();
                BindSuggestedByMaster();
                BindAssignToMaster();
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                if (Request.QueryString["BugID"] != null)
                {
                    Session["BugID"] = objcommon.Decrypt(Request.QueryString["BugID"]);
                }
                else
                {
                    Session["BugID"] = null;
                }
                if (Request.QueryString["BugIDReopen"] != null)
                {
                    Session["BugIDReopen"] = objcommon.Decrypt(Request.QueryString["BugIDReopen"]);
                }
                else
                {
                    Session["BugIDReopen"] = null;
                }
                if (Request.QueryString["TaskIDAddBug"] != null)
                {
                    Session["TaskIDAddBug"] = objcommon.Decrypt(Request.QueryString["TaskIDAddBug"]);
                }
                else
                {
                    Session["BugIDAdd"] = null;
                }
                bugID = Session["BugID"] as string;
                ReopenBugID = Session["BugIDReopen"] as string;
                AddBugID = Session["TaskIDAddBug"] as string;
                {
                    if ((string.IsNullOrEmpty(bugID)) && (string.IsNullOrEmpty(ReopenBugID)) && (string.IsNullOrEmpty(AddBugID)))
                    {
                        txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                        BindInitialStatusMaster();
                        Clear();
                        ddlStatus.SelectedValue = "1";
                    }
                    else if (!(string.IsNullOrEmpty(AddBugID)))
                    {
                        BindInitialStatusMaster();
                        txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                        AutoFillAddBugDetails();
                    }
                    else
                    {
                        BindStatusMaster();
                        txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                        AutoFillBug();
                    }

                }
                //rgvDate.MaximumValue = DateTime.Now.ToString("yyyy-MM-dd");
                //rgvDate.MinimumValue = DateTime.Now.AddYears(-100).ToString("yyyy-MM-dd");
                // txtDate.Attributes["min"] = DateTime.Now.AddYears(-100).ToString("yyyy-MM-dd");
                txtDate.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        public void BindAssignToMaster()
        {
            ddlAssignTo.DataSource = objcommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlAssignTo.DataTextField = "EmployeeName";
            ddlAssignTo.DataValueField = "ID";

            ddlAssignTo.DataBind();
            ddlAssignTo.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";
            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindTaskMaster()
        {
            ddlTaskType.DataSource = objcommon.GetBugsTaskMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlTaskType.DataTextField = "TaskName";
            ddlTaskType.DataValueField = "ID";

            ddlTaskType.DataBind();
            ddlTaskType.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindSuggestedByMaster()
        {
            ddlSuggetedBy.DataSource = objcommon.GetSuggestedByMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlSuggetedBy.DataTextField = "SuggestedName";
            ddlSuggetedBy.DataValueField = "ID";
            ddlSuggetedBy.DataBind();
            ddlSuggetedBy.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindTaskTitleMaster(string projectID)
        {
            ddlTaskTitle.DataSource = objcommon.GetTaskTitleMasterForAddBug(projectID);
            ddlTaskTitle.DataTextField = "TaskTitle";
            ddlTaskTitle.DataValueField = "ID";

            ddlTaskTitle.DataBind();
            ddlTaskTitle.Items.Insert(0, new ListItem("--- Select ---", "0"));

            //ddlIDMatch.DataSource = objcommon.GetTaskTitleMasterForAddBug(projectID);
            //ddlIDMatch.DataTextField = "ID";
            //ddlIDMatch.DataValueField = "AssignedTaskID";

            //ddlIDMatch.DataBind();
            //ddlIDMatch.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }

        public void BindPageMaster(string projectID)
        {
            ddlPageTitle.DataSource = objcommon.GetPageTitleMaster(projectID);
            ddlPageTitle.DataTextField = "PageName";
            ddlPageTitle.DataValueField = "ID";

            ddlPageTitle.DataBind();
            ddlPageTitle.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindStatusMaster()
        {
            ddlStatus.DataSource = objcommon.GetBugStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";

            ddlStatus.DataBind();

            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }


        public void BindInitialStatusMaster()
        {
            ddlStatus.DataSource = objcommon.GetInitialBugStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";
            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProjectName.SelectedIndex != 0)
            {
                BindTaskTitleMaster(ddlProjectName.SelectedValue);
                BindPageMaster(ddlProjectName.SelectedValue);
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
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
                //ddlIDMatch.SelectedValue = ddlTaskTitle.SelectedValue;
                //ddlTaskDetails.DataSource = objcommon.GetTaskTitleMasterForAddBug(ddlProjectName.SelectedValue);
                //ddlTaskDetails.DataTextField = "TaskDetails";
                //ddlTaskDetails.DataValueField = "ID";

                //ddlTaskDetails.DataBind();
                //ddlTaskDetails.SelectedValue = ddlIDMatch.SelectedItem.Text;
                //txtTaskDetails.Text = ddlTaskDetails.SelectedItem.Text;
            }
            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        public void ddlTaskTitle_SelectedIndexChanged()
        {
            if (ddlTaskTitle.SelectedItem.Text == "Other")
            {
                txtTaskTitle.Visible = true;

            }

            else
            {
                txtTaskTitle.Visible = false;
                //ddlTaskDetails.DataSource = objcommon.GetTaskTitleMasterForAddBug(ddlProjectName.SelectedValue);
                //ddlTaskDetails.DataTextField = "TaskDetails";
                //ddlTaskDetails.DataValueField = "ID";

                //ddlTaskDetails.DataBind();
                //ddlTaskDetails.SelectedValue = ddlTaskTitle.SelectedValue;
                //txtTaskDetails.Text = ddlTaskDetails.SelectedItem.Text;
            }
            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }


        public void Upload(int bugID)
        {
            int _isInserted = -1;
            string[] validFileTypes = { "jpeg", "png", "jpg" };

            var count = 0;
            foreach (HttpPostedFile uploadedFile in FileUpReciept.PostedFiles)
            {
                string ext = System.IO.Path.GetExtension(uploadedFile.FileName).ToLower();
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (isValidFile == true)
                {
                    string fn = System.IO.Path.GetFileName(uploadedFile.FileName);

                    if (!System.IO.Directory.Exists(@"~\BugsScreenshot"))
                    {
                        try
                        {
                            string Imgname = bugID + "_" + ddlProjectName.SelectedItem.Text + "_" + ddlPageTitle.SelectedItem.Text + fn;

                            string path = Server.MapPath(@"~\BugsScreenshot\");
                            System.IO.Directory.CreateDirectory(path);

                            _isInserted = objTask.AddBugScreenShot(bugID, Imgname);
                            uploadedFile.SaveAs(path + @"\" + Imgname);
                            count++;
                        }
                        catch (Exception ex)
                        {
                            lblMessage.Text = "Error: " + ex.Message;
                        }
                    }
                }


            }

            lblMessage.Text += count + " files uploaded";
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            string x = bugID;
            string y = ReopenBugID;
            //bugID = Session["BugID"] as string;
            //ReopenBugID = Session["BugIDReopen"] as string;
            try
            {
                BugDetails objBugDetails = new BugDetails()
                {

                    ProjectName = ddlProjectName.SelectedValue,
                    Comment = txtComment.Text,
                    TaskType = ddlTaskType.SelectedValue,
                    PageName = ddlPageTitle.SelectedValue,
                    Details = txtBugDescription.Text,
                    Status = ddlStatus.SelectedValue,
                    WorkDate = (Convert.ToDateTime(txtDate.Text)).ToString("dd MMMM yyyy"),
                    Priority = radPriority.SelectedValue,
                    SuggestedBy = ddlSuggetedBy.SelectedValue,
                    CrossCheckedBy = Session["LoginID"].ToString(),

                };
                if (ddlTaskTitle.SelectedItem.Text == "Other")
                {
                    objBugDetails.TaskTitle = txtTaskTitle.Text;
                    objBugDetails.Mode = 2;
                }
                else
                {
                    requiredtxttitle.Enabled = false;
                    objBugDetails.TaskTitle = ddlTaskTitle.SelectedValue;
                    objBugDetails.Mode = 1;
                }
                if (string.IsNullOrEmpty(bugID) && string.IsNullOrEmpty(ReopenBugID))
                {
                    if (ddlAssignTo.SelectedIndex == 0)
                    {
                        _isInserted = objTask.Add_Bugs(objBugDetails);

                        if (_isInserted == -1)
                        {
                            lblMessage.Text = "Failed to Add Bugs";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblMessage.Text = "Bugs Added ";
                            Upload(_isInserted);
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            objcommon.SendMailBug("New Bug Added", _isInserted);
                            Clear();

                        }
                    }
                    else
                    {
                        objBugDetails.AssignTo = ddlAssignTo.SelectedValue;
                        _isInserted = objTask.AssignBug(objBugDetails);

                        if (_isInserted == -1)
                        {
                            lblMessage.Text = "Failed to Assign Bug ";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblMessage.Text = "Bug Assigned";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            objcommon.SendMailAssignBug(_isInserted.ToString());
                            Clear();

                        }
                    }
                }

                else if (string.IsNullOrEmpty(ReopenBugID) && string.IsNullOrEmpty(AddBugID))
                {

                    objBugDetails.BugID = Convert.ToInt32(bugID);
                    if (ddlAssignTo.SelectedIndex == 0)
                    {
                        _isInserted = objTask.UpdateBug(objBugDetails);
                        if (_isInserted == -1)
                        {
                            lblMessage.Text = "Failed to Update Bug";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblMessage.Text = "Bug Updated";
                            Upload(_isInserted);
                            Session["BugID"] = null;
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            objcommon.SendMailBug("Bug Updated", _isInserted);
                            Clear();

                            Response.Redirect("~/ViewBug.aspx");

                        }
                    }
                    else
                    {
                        objBugDetails.AssignTo = ddlAssignTo.SelectedValue;
                        _isInserted = objTask.UpdateAssignBug(objBugDetails);

                        if (_isInserted == -1)
                        {
                            lblMessage.Text = "Failed to Assign Bug ";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblMessage.Text = "Bug Assigned";
                            Upload(_isInserted);
                            Session["BugID"] = null;
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            objcommon.SendMailAssignBug(_isInserted.ToString());
                            Clear();
                            Response.Redirect("~/ViewBug.aspx");


                        }
                    }
                }

                else if (string.IsNullOrEmpty(bugID) && string.IsNullOrEmpty(AddBugID))
                {
                    objBugDetails.BugID = Convert.ToInt32(ReopenBugID);
                    if (ddlAssignTo.SelectedIndex == 0)
                    {
                        _isInserted = objTask.ReopenBug(objBugDetails);
                        if (_isInserted == -1)
                        {
                            lblMessage.Text = "Failed to Reopen Bug";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblMessage.Text = "Bug Reopened";
                            Upload(_isInserted);
                            Session["BugIDReopen"] = null;
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            objcommon.SendMailBug("Bug Reopened", _isInserted);
                            Clear();
                            Response.Redirect("~/Notifications.aspx");

                        }
                    }
                    else
                    {
                        objBugDetails.AssignTo = ddlAssignTo.SelectedValue;
                        _isInserted = objTask.ReopenAssignBug(objBugDetails);

                        if (_isInserted == -1)
                        {
                            lblMessage.Text = "Failed to Reopen Bug ";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblMessage.Text = "Bug Reopened";
                            Upload(_isInserted);
                            Session["BugIDReopen"] = null;
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            objcommon.SendMailAssignBug(_isInserted.ToString());
                            Clear();
                            Response.Redirect("~/Notifications.aspx");


                        }
                    }
                }

            }

            catch (Exception ex)
            {

            }

        }


        public void Clear()
        {
            //  ddlProjectName.SelectedIndex = 0;
            //  ddlPageTitle.SelectedIndex = 0;
            //  ddlTaskType.SelectedIndex = 0;
            txtDate.Text = Convert.ToDateTime(DateTime.Today).ToString("yyyy-MM-dd"); ;
            txtTaskTitle.Text = "";
            txtTaskTitle.Visible = false;
            // ddlSuggetedBy.SelectedIndex = 0;

            ddlStatus.SelectedValue = "0";
            txtBugDescription.Text = "";
            requiredtxttitle.Enabled = true;
            ddlTaskTitle.SelectedIndex = 0;
            txtComment.Text = "";

        }

        public void AutoFillBug()
        {
            DataTable dtBug = new DataTable();
            if (string.IsNullOrEmpty(ReopenBugID))
            {
                dtBug = objTask.AutoFillBug(Convert.ToInt32(bugID.Trim()));
            }
            if (string.IsNullOrEmpty(bugID))
            {
                dtBug = objTask.AutoFillBug(Convert.ToInt32(ReopenBugID.Trim()));
            }
            ddlProjectName.SelectedValue = dtBug.Rows[0]["ProjectID"].ToString();
            BindTaskTitleMaster(ddlProjectName.SelectedValue);
            ddlTaskType.SelectedValue = dtBug.Rows[0]["TaskTypeID"].ToString();
            ddlTaskTitle.SelectedValue = dtBug.Rows[0]["TaskTitleID"].ToString();
            ///* Bind Task Details */
            //ddlTaskDetails.DataSource = objcommon.GetTaskTitleMasterForAddBug(ddlProjectName.SelectedValue);
            //ddlTaskDetails.DataTextField = "TaskDetails";
            //ddlTaskDetails.DataValueField = "ID";

            //ddlTaskDetails.DataBind();
            //ddlTaskDetails.SelectedValue = ddlTaskTitle.SelectedValue;
            //txtTaskDetails.Text = ddlTaskDetails.SelectedItem.Text;
            ///* end bind Task Detail */
            BindPageMaster(ddlProjectName.SelectedValue);
            ddlPageTitle.SelectedValue = dtBug.Rows[0]["PageID"].ToString();
            txtBugDescription.Text = dtBug.Rows[0]["BugDetails"].ToString();
            txtDate.Text = Convert.ToDateTime(dtBug.Rows[0]["WorkDate"].ToString()).ToString("yyyy-MM-dd");
            radPriority.Text = dtBug.Rows[0]["Priority"].ToString();
            if (string.IsNullOrEmpty(ReopenBugID))
            {
                ddlStatus.SelectedValue = dtBug.Rows[0]["Status"].ToString();
            }
            if (string.IsNullOrEmpty(bugID))
            {
                ddlStatus.SelectedValue = "7";
            }
            if (dtBug.Rows[0]["Developer"].ToString() != "")
            {
                ddlAssignTo.SelectedValue = dtBug.Rows[0]["Developer"].ToString();
            }
            ddlSuggetedBy.SelectedValue = dtBug.Rows[0]["SuggestedBy"].ToString();
            txtComment.Text = dtBug.Rows[0]["Comment"].ToString();
        }

        public void AutoFillAddBugDetails()
        {
            DataTable dtTask = new DataTable();


            if (!string.IsNullOrEmpty(AddBugID))
            {
                dtTask = objTask.GetAssignedTaskDetailsByID(Convert.ToInt32(AddBugID.Trim()));
            }
            ddlProjectName.SelectedValue = dtTask.Rows[0]["ProjectName"].ToString();
            BindPageMaster(ddlProjectName.SelectedValue);
            BindTaskTitleMaster(ddlProjectName.SelectedValue);

            ddlTaskTitle.SelectedValue = dtTask.Rows[0]["TaskTitle"].ToString();
            ddlTaskTitle_SelectedIndexChanged();
            ddlAssignTo.SelectedValue = dtTask.Rows[0]["AssignTo"].ToString();
            ddlStatus.SelectedValue = "1";
        }
    }
}