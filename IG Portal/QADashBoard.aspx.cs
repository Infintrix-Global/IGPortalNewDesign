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
                BindProjectMaster();
            }
        }

        public void BindProjectMaster()
        {
         

            ddlProjectBug.DataSource = objCommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectBug.DataTextField = "ProjectName";
            ddlProjectBug.DataValueField = "ID";
            ddlProjectBug.DataBind();
            ddlProjectBug.Items.Insert(0, new ListItem("--- Select All---", "0"));
        }
        public void PopulateChart()
        {
            Chart1.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
            Chart1.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;
            //Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            DataTable dt = objCommon.GetQADashBoardDetails(Session["LoginID"].ToString(), "1", "0",DateTime.Now,DateTime.Now);
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
            DataTable dtTask = objCommon.GetQADashBoardDetails(Session["LoginID"].ToString(), "2", ddlProjectBug.SelectedValue,DateTime.Now,DateTime.Now);
            DataList1.DataSource = dtTask;
            DataList1.DataBind();
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
            Chart2.ChartAreas.Clear();
            Chart2.ChartAreas["ChartArea2"].AxisX.MajorGrid.Enabled = false;
            Chart2.ChartAreas["ChartArea2"].AxisY.MajorGrid.Enabled = false;
           
            DataTable dt = objCommon.GetQADashBoardDetails(Session["LoginID"].ToString(), "3", "0",Convert.ToDateTime(txtDate.Text), Convert.ToDateTime(txtToDate.Text));
            foreach (DataRow r in dt.Rows)
            {
                Series s = new Series((r["ProjectName"].ToString()));
                s.ChartType = SeriesChartType.Column;

                if (!(r["CompletedBug"] is null))
                {
                    s.ToolTip = r["ProjectName"].ToString() + ":" + r["CompletedBug"];
                    s.Points.AddXY("Completed", new object[] { r["CompletedBug"] });
                }
                else
                {
                    s.Points.AddXY("Completed", 0);
                }
                if (!(r["OpenBug"] is null))
                {
                    s.ToolTip = r["ProjectName"].ToString() + ":" + r["OpenBug"];
                    s.Points.AddXY("Open", new object[] { r["OpenBug"] });
                }
                else
                {
                    s.Points.AddXY("Open", 0);
                }

                if (!(r["ClosedBug"] is null))
                {
                    s.ToolTip = r["ProjectName"].ToString() + ":" + r["ClosedBug"];
                    s.Points.AddXY("Closed", new object[] { r["ClosedBug"] });
                }
                else
                {
                    s.Points.AddXY("Closed", 0);
                }
                Chart2.Series.Add(s);
            }

           
        }

        protected void txtToDate_TextChanged(object sender, EventArgs e)
        {
            BindProjectStatusBugChart();
        }
    }
}