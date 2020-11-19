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
            if(e.CommandName=="RemoveProject")
            {
                int _isDeleted = -1;
                _isDeleted = objCommon.RemoveProject(e.CommandArgument.ToString());
                GetProjectList();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = objCommon.SearchProject(txtProjectName.Text);
            GridProject.DataSource = dt;
            GridProject.DataBind();
            if(dt.Rows.Count  >0)
            {
                count.Text = "Number of Project =" + dt.Rows.Count;
            }
            else
            {
                count.Text = "Number of Project =0"; 
            }
        }

        protected void GridProject_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridProject.EditIndex = -1;
            GetProjectList();
        }

        protected void GridProject_RowEditing(object sender, GridViewEditEventArgs e)
        {

            //NewEditIndex property used to determine the index of the row being edited.  
            GridProject.EditIndex = e.NewEditIndex;
            GetProjectList();
        }

        protected void GridProject_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridProject.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox pname = GridProject.Rows[e.RowIndex].FindControl("txtPName") as TextBox;
            int _isUpdated = -1;
            _isUpdated = objCommon.UpdateProject(id.Text,pname.Text);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridProject.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            GetProjectList();
        }
    }
}