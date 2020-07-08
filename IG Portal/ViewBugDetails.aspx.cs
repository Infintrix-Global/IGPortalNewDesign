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
    public partial class ViewBugDetails : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindBugDetails();

            }
        }

        public void BindBugDetails()
        {
            try
            {
                DataSet dtBug = new DataSet();

               dtBug = objTask.GetBugDetailsByID(Convert.ToInt32(Session["BugID"].ToString()));
                if(dtBug.Tables[0] !=null)
                {
                    lblBugDetails.Text = dtBug.Tables[0].Rows[0]["BugDetails"].ToString();
                    lblComment.Text= dtBug.Tables[0].Rows[0]["Comment"].ToString();
                    lblCrossCheckedBy.Text = dtBug.Tables[0].Rows[0]["CrossCheckedByName"].ToString();
                    lblDate.Text = dtBug.Tables[0].Rows[0]["WorkDate"].ToString();
                    lblPriority.Text = dtBug.Tables[0].Rows[0]["Priority"].ToString();
                    lblProjectName.Text = dtBug.Tables[0].Rows[0]["ProjectName"].ToString();
                    lblPageName.Text = dtBug.Tables[0].Rows[0]["PageName"].ToString();
                    lblStatus.Text = dtBug.Tables[0].Rows[0]["StatusName"].ToString();
                    lblSuggestedBy.Text = dtBug.Tables[0].Rows[0]["SuggestedName"].ToString();
                    lblTaskTitle.Text = dtBug.Tables[0].Rows[0]["TaskTitle"].ToString();
                    lblDeveloper.Text= dtBug.Tables[0].Rows[0]["DeveloperName"].ToString();
                }
                if(dtBug.Tables[1] != null)
                {
                    GridBug.DataSource = dtBug.Tables[1];
                    GridBug.DataBind();
                    
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        protected void GridBug_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                if (e.CommandName == "Download")
                {
                    string rname = (e.CommandArgument).ToString();
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
                    Response.TransmitFile(Server.MapPath("~/BugsScreenShot/") + e.CommandArgument);
                    Response.End();
                }
            }
            catch(Exception ex)
            {

            }
            }

    }
}