using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class AddTask : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
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
    }
}