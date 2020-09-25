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
    public partial class AdminDashBoard : System.Web.UI.Page
    {
        DataTable dtNotifications = new DataTable();
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    DataTable AllData = objTask.GetEmployeeByID(Convert.ToInt32(Session["LoginID"].ToString()));
                    BindProjectMaster();
                    BindBugCount();
                    BindTaskCount();
                    BindTaskList();
                    BindBugList();
                    BindProjectCount();
                    PopulateChart();
                    txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    PopulateChartEmployeeTimeSheet();
                    BindProjectBugTaskChart();
                    Session["EmployeeID"] = Session["LoginID"];
                    //BindNotifications();
                }
            }
        }

        public void BindProjectMaster()
        {
            ddlPRoject.DataSource = objCommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlPRoject.DataTextField = "ProjectName";
            ddlPRoject.DataValueField = "ID";
            ddlPRoject.DataBind();
            ddlPRoject.Items.Insert(0, new ListItem("--- Select All---", "0"));

            ddlProjectBug.DataSource = objCommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectBug.DataTextField = "ProjectName";
            ddlProjectBug.DataValueField = "ID";
            ddlProjectBug.DataBind();
            ddlProjectBug.Items.Insert(0, new ListItem("--- Select All---", "0"));
        }

        public void BindProjectCount()
        {
            long result = 0;
            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "1");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            result = objCommon.GetManagerDashBoardCount(Session["LoginID"].ToString(), "1","0");
            lblProject.Text = result.ToString();
        }
        public void BindBugCount()
        {
            long result = 0;
            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "2");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            result = objCommon.GetManagerDashBoardCount(Session["LoginID"].ToString(), "2", "0");
            lnkBug.Text = result.ToString();
        }

        public void BindTaskCount()
        {
            long result = 0;
            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "3");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            result = objCommon.GetManagerDashBoardCount(Session["LoginID"].ToString(), "3", "0");
            lnkTask.Text = result.ToString();
        }

        public void BindBugList()
        {

            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "4");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            DataTable dtTask = objCommon.GetManagerDashBoardDataList(Session["LoginID"].ToString(), "4",ddlProjectBug.SelectedValue);
            DataList1.DataSource = dtTask;
            DataList1.DataBind();
        }

        public void BindTaskList()
        {

            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "5");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            DataTable dtTask = objCommon.GetManagerDashBoardDataList(Session["LoginID"].ToString(), "5",ddlPRoject.SelectedValue);
            dlTask.DataSource = dtTask;
            dlTask.DataBind();
        }


        public void PopulateChart()
        {
            Chart1.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
            Chart1.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;
            //Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            DataTable dt = objCommon.GetManagerDashBoardDataList(Session["LoginID"].ToString(), "6","0");
            Chart1.DataSource = dt;
            Chart1.Series[0].ChartType = SeriesChartType.Column;
            Chart1.Legends[0].Enabled = true;

            Chart1.ChartAreas[0].AxisY.Interval = 1;
            Chart1.Series[0].XValueMember = "WorkDate";
            Chart1.Series[0].YValueMembers = "Hours";
            Chart1.DataBind();
        }

        public void BindProjectBugTaskChart()
        {
            Chart2.ChartAreas["ChartArea2"].AxisX.MajorGrid.Enabled = false;
            Chart2.ChartAreas["ChartArea2"].AxisY.MajorGrid.Enabled = false;
            DataTable dt = objCommon.GetManagerDashBoardDataList(Session["LoginID"].ToString(), "8", "0");
            foreach (DataRow r in dt.Rows)
            {
                Series s = new Series( (r["ProjectName"].ToString()));
                s.ChartType = SeriesChartType.Column;
               
                if (!(r["Bugs"] is  null))
                {
                    s.ToolTip = r["ProjectName"].ToString();
                    s.Points.AddXY("Bugs", new object[] { r["Bugs"] });
                }
                else
                    {
                    s.Points.AddXY("Bugs", 0);
                }
                if (!(r["Tasks"] is null))
                {
                    s.ToolTip = r["ProjectName"].ToString();
                    s.Points.AddXY("Tasks", new object[] { r["Tasks"] });
                }
                else
                {
                    s.Points.AddXY("Tasks", 0);
                }
               
                Chart2.Series.Add(s);
            }

            //Chart2.ChartAreas["ChartArea2"].AxisX.MajorGrid.Enabled = false;
            //Chart2.ChartAreas["ChartArea2"].AxisY.MajorGrid.Enabled = false;
            ////Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
           
            //Chart2.DataSource = dt;
            //Chart2.Series[0].ChartType = SeriesChartType.Column;
            //Chart2.Legends[0].Enabled = true;

            //Chart2.ChartAreas[0].AxisY.Interval = 1;
            //Chart2.Series[0].XValueMember = "Project";
            //Chart2.Series[0].YValueMembers = "Hours";
            //Chart2.DataBind();
        }

        protected void PopulateChartEmployeeTimeSheet()
        {

            DataTable dt = objTask.GetTimeSheetHoursForBarGraphForManager(txtDate.Text, Session["LoginID"].ToString());
            Chart3.DataSource = dt;
            Chart3.Series[0].ChartType = SeriesChartType.Bar;
            Chart3.Legends[0].Enabled = true;

            Chart3.ChartAreas[0].AxisY.Interval = 1;
            Chart3.Series[0].XValueMember = "EmployeeName";
            Chart3.Series[0].YValueMembers = "Hours";
            Chart3.DataBind();
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            PopulateChartEmployeeTimeSheet();
        }

        protected void ddlPRoject_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTaskList();
        }

        protected void ddlProjectBug_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindBugList();
        }

        protected void dlTask_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {


                    Label label = e.Item.FindControl("lblstatus") as Label;
                    if ((label.Text == "1") || (label.Text == "7") || (label.Text == "5"))
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

        protected void lnkBug_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewBug.aspx");
        }

        protected void lnkTask_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PendingAssignTask.aspx");
        }
    }
}