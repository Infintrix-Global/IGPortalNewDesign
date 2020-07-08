using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class ProjectMaster : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GetProjectList();

            }
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            _isInserted = objCommon.AddProject(Session["CompanyID"].ToString(),txtProjectName.Text);
            if (_isInserted == -1)
            {

                lblmsg.Text = "Failed to Add Project";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                GetProjectList();
            }
            else if (_isInserted == 0)
            {

                lblmsg.Text = "Project Exists";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                lblmsg.Text = "Project Added ";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                Clear();
                GetProjectList();
            }
        }

        public void Clear()
        {
            txtProjectName.Text = "";
        }
        protected void btclear_Click(object sender, EventArgs e)
        {
            txtProjectName.Text = "";
            GetProjectList();
        }

        public void GetProjectList()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetProjectMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            GridProject.DataSource = dt;
            GridProject.DataBind();
            count.Text = "Number of Project =" + dt.Rows.Count;
        }

        protected void GridProject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProject.PageIndex = e.NewPageIndex;
            GetProjectList();
        }

        protected void GridProject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")

            {
                int pid = Convert.ToInt32(e.CommandArgument);
                Session["ProjectID"] = pid;
                Response.Redirect("~/AddProjectDetails.aspx");
            }
        }
    }
}