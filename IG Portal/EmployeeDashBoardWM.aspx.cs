using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class Employee_DashBoard : System.Web.UI.Page
    {
        DataTable dtNotifications = new DataTable();
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable AllData = objTask.GetEmployeeByID(Convert.ToInt32(Session["LoginID"].ToString()));
                BindBugCount();
                BindTaskCount();

            }
        }
        public void BindBugCount()
        {
            long result = 0;
            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "1");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            result = objCommon.GetPendingBugCount(Session["LoginID"].ToString(),"1");
            lnkBug.Text = result.ToString();
        }

        public void BindTaskCount()
        {
            long result = 0;
            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "1");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            result = objCommon.GetPendingTaskCount(Session["LoginID"].ToString(), "2");
            lnkTask.Text = result.ToString();
        }

        protected void lblBug_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewBug.aspx");
        }

        protected void lblTask_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewAssignedTaskEmployee.aspx");
        }
    }
}