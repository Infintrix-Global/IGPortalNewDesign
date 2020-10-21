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
    public partial class QADashBoard : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                PopulateChart();
                BindBugList();
                txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtDate.Text = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd");
                BindProjectStatusBugChart();
                BindProjectTaskBugRatio();
                BindProjectMaster();
                BindTaskList();
            }
        }

        public void BindProjectMaster()
        {
         

            ddlProjectBug.DataSource = objCommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectBug.DataTextField = "ProjectName";
            ddlProjectBug.DataValueField = "ID";
            ddlProjectBug.DataBind();
            ddlProjectBug.Items.Insert(0, new ListItem("--- Select All---", "0"));

            ddlProjectTask.DataSource = objCommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectTask.DataTextField = "ProjectName";
            ddlProjectTask.DataValueField = "ID";
            ddlProjectTask.DataBind();
            ddlProjectTask.Items.Insert(0, new ListItem("--- Select All---", "0"));
        }
        public void PopulateChart()
        {
            Chart1.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
            Chart1.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;
            //Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            DataTable dt = objCommon.GetQADashBoardDetails(Session["LoginID"].ToString(), "1", "0",DateTime.Now.ToString(), DateTime.Now.ToString());

            //foreach (DataRow r in dt.Rows)
            //{
            //    Series s = new Series((r["WorkDate"].ToString()));
            //    s.ChartType = SeriesChartType.Column;

            //    if (!(r["Hours"] is null))
            //    {
            //        s.Points.AddXY("Hours", new object[] { r["Hours"] });
            //        s.Points[0].ToolTip = r["WorkDate"].ToString() + ":" + r["Hours"].ToString();

            //    }
            //    else
            //    {
            //        s.Points.AddXY("Bug/Task", 0);
            //    }

            //    Chart1.Series.Add(s);
            //}
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
            nv.Add("@mode", "2");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            DataTable dtTask = objCommon.GetQADashBoardDetails(Session["LoginID"].ToString(), "2", ddlProjectBug.SelectedValue,DateTime.Now.ToString(), DateTime.Now.ToString());
            DataList1.DataSource = dtTask;
            DataList1.DataBind();
        }

        public void BindTaskList()
        {

            NameValueCollection nv = new NameValueCollection();
            nv.Add("@mode", "3");
            nv.Add("@LoginID", Session["LoginID"].ToString());
            DataTable dtTask = objCommon.GetQADashBoardDetails(Session["LoginID"].ToString(), "5", ddlProjectBug.SelectedValue, DateTime.Now.ToString(), DateTime.Now.ToString());
            DataList2.DataSource = dtTask;
            DataList2.DataBind();
        }

        protected void ddlProjectBug_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindBugList();
        }

        protected void lnkBug_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewBug.aspx");
        }

        public void BindProjectStatusBugChart()
        {
            Chart2.Series.Clear();
            Chart2.ChartAreas["ChartArea2"].AxisX.MajorGrid.Enabled = false;
            Chart2.ChartAreas["ChartArea2"].AxisY.MajorGrid.Enabled = false;
           
            DataTable dt = objCommon.GetQADashBoardDetails(Session["LoginID"].ToString(), "3", "0",txtDate.Text, txtToDate.Text);
            foreach (DataRow r in dt.Rows)
            {
                Series s = new Series((r["ProjectName"].ToString()));
                s.ChartType = SeriesChartType.Column;

                if (!(r["CompletedBug"] is null))
                {
                   /// s.ToolTip = r["ProjectName"].ToString() + ":" + r["CompletedBug"].ToString();
                    s.Points.AddXY("Completed", new object[] { r["CompletedBug"] });
                    s.Points[0].ToolTip = r["ProjectName"].ToString() + ":" + r["CompletedBug"].ToString();
                }
                else
                {
                    s.Points.AddXY("Completed", 0);
                }
                if (!(r["OpenBug"] is null))
                {
                    //s.ToolTip = r["ProjectName"].ToString() + ":" + r["OpenBug"].ToString();
                    s.Points.AddXY("Open", new object[] { r["OpenBug"] });
                    s.Points[1].ToolTip = r["ProjectName"].ToString() + ":" + r["OpenBug"].ToString();
                }
                else
                {
                    s.Points.AddXY("Open", 0);
                }

                if (!(r["ClosedBug"] is null))
                {
                  //  s.ToolTip = r["ProjectName"].ToString() + ":" + r["ClosedBug"].ToString();
                    s.Points.AddXY("Closed", new object[] { r["ClosedBug"] });
                    s.Points[2].ToolTip = r["ProjectName"].ToString() + ":" + r["ClosedBug"].ToString();
                }
                else
                {
                    s.Points.AddXY("Closed", 0);
                }
                Chart2.Series.Add(s);
            }

           
        }

        public void BindProjectTaskBugRatio()
        {
            
            Chart3.ChartAreas["ChartArea3"].AxisX.MajorGrid.Enabled = false;
            Chart3.ChartAreas["ChartArea3"].AxisY.MajorGrid.Enabled = false;

            DataTable dt = objCommon.GetQADashBoardDetails(Session["LoginID"].ToString(), "4", "0", DateTime.Now.ToString(), DateTime.Now.ToString());
            foreach (DataRow r in dt.Rows)
            {
                Series s = new Series((r["ProjectName"].ToString()));
                s.ChartType = SeriesChartType.Column;

                if (!(r["Ratio"] is null))
                {
                    s.Points.AddXY("Bug/Task", new object[] { r["Ratio"] });
                    s.Points[0].ToolTip = r["ProjectName"].ToString() + ":" + r["Ratio"].ToString();

                }
                else
                {
                    s.Points.AddXY("Bug/Task", 0);
                }
               
                Chart3.Series.Add(s);
            }


        }

        protected void txtToDate_TextChanged(object sender, EventArgs e)
        {
            BindProjectStatusBugChart();
        }

        protected void go_Click(object sender, EventArgs e)
        {
            BindProjectStatusBugChart();
        }

      

        protected void ddlTaskBug_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTaskList();
        }

        protected void ddlProjectTask_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}