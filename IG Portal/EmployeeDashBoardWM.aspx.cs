using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
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
                BindTaskList();
                BindBugList();
                PopulateChart();
            }
        }


        protected void PopulateChart()
        {
            Chart1.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
            Chart1.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;
            //Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            DataTable dt = objCommon.GetTimeSheetHoursForBarGraphByEmployee(Session["LoginID"].ToString(), "5");
            Chart1.DataSource = dt;
            Chart1.Series[0].ChartType = SeriesChartType.Column;
            Chart1.Legends[0].Enabled = true;

            Chart1.ChartAreas[0].AxisY.Interval = 1;
            Chart1.Series[0].XValueMember = "WorkDate";
            Chart1.Series[0].YValueMembers = "Hours";
            Chart1.DataBind();
        }
        public void BindBugList()
        {

            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "4");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            DataTable dtTask = objCommon.GetAssignedTaskListByEmployee(Session["LoginID"].ToString(), "4");
            DataList1.DataSource = dtTask;
            DataList1.DataBind();
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
            nv.Add("@mode", "2");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            result = objCommon.GetPendingTaskCount(Session["LoginID"].ToString(), "2");
            lnkTask.Text = result.ToString();
        }

        public void BindTaskList()
        {
           
            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "3");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            DataTable dtTask = objCommon.GetAssignedTaskListByEmployee(Session["LoginID"].ToString(), "3");
            dlTask.DataSource = dtTask;
            dlTask.DataBind();
        }

        protected void lblBug_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewBug.aspx");
        }

        protected void lblTask_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewAssignedTaskEmployee.aspx");
        }

        protected void dlTask_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {


                    Label label = e.Item.FindControl("lblstatus") as Label;
                    if ((label.Text =="1") || (label.Text == "7") || (label.Text == "5"))
                    {
                        (e.Item.FindControl("lblStatusName") as Label).BackColor = System.Drawing.Color.Red;
                    }
                    else if (label.Text == "2") 

                    {
                            (e.Item.FindControl("lblStatusName") as Label).BackColor = System.Drawing.Color.Green;
                        }

                    else if (label.Text == "4") 

                    {
                        (e.Item.FindControl("lblStatusName") as Label).BackColor = System.Drawing.Color.Yellow;
                    }


                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}