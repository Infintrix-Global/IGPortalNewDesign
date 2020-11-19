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
    public partial class AddTask : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        General objGeneral = new General();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GetTaskList();
                BindDepartmentMaster();
            }
        }

        public void BindDepartmentMaster()
             {
            ddlDepartment.DataSource = objCommon.GetDepartmentMaster();
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "ID";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }
        protected void btAdd_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            _isInserted = objCommon.AddTaskName(Session["CompanyID"].ToString(), txtTaskName.Text,ddlDepartment.SelectedValue);
            if (_isInserted == -1)
            {

                lblmsg.Text = "Failed to Add Task";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                GetTaskList();
            }
            else if (_isInserted == 0)
            {

                lblmsg.Text = "Task Exists";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                lblmsg.Text = "Task Added ";
                lblmsg.ForeColor = System.Drawing.Color.Green;

                GetTaskList();
            }
        }

        
        protected void btclear_Click(object sender, EventArgs e)
        {
            txtTaskName.Text = "";
            GetTaskList();
        }

        public void GetTaskList()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetTaskMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            GridTask.DataSource = dt;
            GridTask.DataBind();
            count.Text = "Number of Task =" + dt.Rows.Count;
        }

        protected void GridTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridTask.PageIndex = e.NewPageIndex;
            GetTaskList();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string sqr = "Select TM.*,DM.DepartmentName,TM.TaskName+ '-' + DM.DepartmentName as TaskDepartment from TaskMaster TM inner join DepartmentMAster Dm on TM.DepartmentID=DM.ID where TM.IsActive=1";
            if (txtTaskName.Text != "")
            {
                sqr += "and TM.TaskName like '%' +'" + txtTaskName.Text + "'+ '%'";
            }
            if (ddlDepartment.SelectedIndex != 0)
            {
                sqr += "and TM.DepartmentID =" + ddlDepartment.SelectedValue;
            }
            sqr += " order by TaskName asc";
            dt = objGeneral.GetDatasetByCommand(sqr);
            GridTask.DataSource = dt;
            GridTask.DataBind();
            if (dt.Rows.Count > 0)
            {
                count.Text = "Number of Task =" + dt.Rows.Count;
            }
            else
            {
                count.Text = "Number of Task =0"; 
            }
        }

        protected void GridTask_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridTask.EditIndex = -1;
            GetTaskList();
        }

        protected void GridTask_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridTask.EditIndex = e.NewEditIndex;
            GetTaskList();
        }

        protected void GridTask_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridTask.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox tname = GridTask.Rows[e.RowIndex].FindControl("txtTaskName") as TextBox;
            int _isUpdated = -1;
            _isUpdated = objCommon.UpdateTask(id.Text, tname.Text);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridTask.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            GetTaskList();
        }

        protected void GridTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveTask")
            {
                int _isDeleted = -1;
                _isDeleted = objCommon.RemoveTask(e.CommandArgument.ToString());
                GetTaskList();
            }
        }
    }
}