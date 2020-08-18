using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class AssignProject : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)

            {
                BindEmployeeMaster();
                
            }
        }

        public void BindEmployeeMaster()
        {
            ddlEmployee.DataSource = objCommon.GetLoginMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlEmployee.DataTextField = "EmployeeName";
            ddlEmployee.DataValueField = "ID";
            ddlEmployee.DataBind();
            ddlEmployee.Items.Insert(0, new ListItem("--- Select ---", "0"));
            
        }

        public void BindProjectMaster()
        {
            
                chkProject.DataSource = objCommon.GetUnAssignedProjectByEmployee(Convert.ToInt32(ddlEmployee.SelectedValue));
                chkProject.DataTextField = "ProjectName";
                chkProject.DataValueField = "ID";
                chkProject.DataBind();
           
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            foreach (ListItem item in chkProject.Items)
            {
                if (item.Selected)
                    _isInserted = objTask.AssignProject(Convert.ToInt32(ddlEmployee.SelectedValue),item.Value);

                if (_isInserted == -1)
                {
                    lblMessage.Text = "Failed to assign Project";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {

                    lblMessage.Text = "Project Assigned";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                   
                }
            }
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProjectMaster();
            BindGridProject();
        }

        public void BindGridProject()
        {
            if(ddlEmployee.SelectedIndex!=0)
            {
                DataTable dtTaskDetails;
                dtTaskDetails = objCommon.GetAssignedProjectByEmployee(Convert.ToInt32(ddlEmployee.SelectedValue));
                GridProject.DataSource = dtTaskDetails;
                GridProject.DataBind();
            }
        }

        protected void GridProject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int pmid = Convert.ToInt32(e.CommandArgument);
                objTask.UnAssignProject(pmid);
                BindGridProject();

            }
        }
    }
}