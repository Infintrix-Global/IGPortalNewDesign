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
      
        General objGeneral = new General();
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
            BindGridProject();
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlEmployee.SelectedIndex!=0)
            {
                divSearch.Visible = true;
            }
            else
            {
                divSearch.Visible = false;
            }
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
            if (e.CommandName == "Remove")
            {
                int pmid = Convert.ToInt32(e.CommandArgument);
                objTask.UnAssignProject(pmid);
                BindGridProject();

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string sqr = "	Select PEM.*,PM.ProjectName from ProjectEmployeeMap PEM inner join ProjectMaster PM  on PM.ID=PEM.ProjectID where PEM.IsActive=1";
            if (txtProjectName.Text != "")
            {
                sqr += "and PM.ProjectName like '%' +'" + txtProjectName.Text + "'+ '%'";
            }
            if (ddlEmployee.SelectedIndex != 0)
            {
                sqr += "and pEM.LoginID= " + ddlEmployee.SelectedValue;
            }
            sqr += " order by ProjectName asc";
            dt = objGeneral.GetDatasetByCommand(sqr);
            GridProject.DataSource = dt;
            GridProject.DataBind();
            if (dt.Rows.Count > 0)
            {
                count.Text = "Number of Project =" + dt.Rows.Count;
            }
            else
            {
                count.Text = "Number of Project =0";
            }
        }
    }
}