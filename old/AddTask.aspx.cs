using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class AddTask : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request.QueryString["LoginID"] == null)
                //{
                //    Response.Redirect("~/Login.aspx");
                //}
                //string lid = Request.QueryString["LoginID"];
                //Session["LoginID"] = lid;
                BindProjectMaster();
                BindTaskMaster();
            }
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMaster();
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";

            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }


        public void BindTaskMaster()
        {
            ddlTaskType.DataSource = objcommon.GetTaskMaster();
            ddlTaskType.DataTextField = "TaskName";
            ddlTaskType.DataValueField = "ID";

            ddlTaskType.DataBind();
            ddlTaskType.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }
        protected void imgPopup_Click(object sender, ImageClickEventArgs e)
        {

            if (Calendar1.Visible == true)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
                txtDate.Text = "";
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
           
            if (e.Day.Date > DateTime.Today || e.Day.Date < DateTime.Today.AddDays(-2))
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
            

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
           
            try
            {

                TimeSheetDetails objTimeSheetDetails = new TimeSheetDetails()
                {
                    LoginID = Convert.ToInt32(Session["LoginID"].ToString()),
                   ProjectName=ddlProjectName.SelectedValue,
                   TaskName=ddlTaskType.SelectedValue,
                   TaskTitle=txtTaskTitle.Text,
                   TaskDetails=txtTaskDescription.Text,
                   WorkDate=Convert.ToDateTime(txtDate.Text),
                   StartTime= Convert.ToDateTime(txtStartTime.Text),
                   EndTime= Convert.ToDateTime(txtEndTime.Text)
                };

               
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

            catch (Exception ex)
            {

            }

        }

        public void Clear()
        {
            ddlProjectName.SelectedIndex = 0;
            ddlTaskType.SelectedIndex = 0;
            txtDate.Text ="";
            txtStartTime.Text = "";
            txtEndTime.Text = "";
            txtTaskDescription.Text = "";
            txtTaskTitle.Text = "";
        }

    }
}