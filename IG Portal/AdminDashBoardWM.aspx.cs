using System;
using System.Data;
using IG_Portal.BAL_Classes;
using System.Web.UI.DataVisualization.Charting;

namespace IG_Portal
{
    public partial class SuperAdminDashBoard : System.Web.UI.Page
    {
        DataTable dtNotifications = new DataTable();
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["EmployeeID"] = Session["LoginID"];
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                PopulateChart();
                BindGridMOM();
                BindGridOpenBugs();
                BindGridCompletedBugs();
                BindGridEmployeeOpenBugs();
                BindGridEmployeeCompletedBugs();
            }
        }

        protected void PopulateChart()
        {

            DataTable dt = objTask.GetTimeSheetHoursForBarGraph(txtDate.Text);
            Chart1.DataSource = dt;
            Chart1.Series[0].ChartType = SeriesChartType.Bar;
            Chart1.Legends[0].Enabled = true;
            
            Chart1.ChartAreas[0].AxisY.Interval = 1;
            Chart1.Series[0].XValueMember = "EmployeeName";
            Chart1.Series[0].YValueMembers = "Hours";
            Chart1.DataBind();
        }

        public void BindGridMOM()
        {
            DataTable dtMOM;

            dtMOM = objTask.GetAdminDashBoardMOM();
            GridMOM.DataSource = dtMOM;
            GridMOM.DataBind();
        }


        public void BindGridOpenBugs()
        {
            try
            {
                DataTable dtBug;

                dtBug = objTask.GetAdminDashBoardProjectBug();
                GridBug.DataSource = dtBug;
                GridBug.DataBind();
            }
            catch(Exception ex)
            {
                
            }
        }

        public void BindGridEmployeeOpenBugs()
        {
            try
            {
                DataTable dtBug;

                dtBug = objTask.GetAdminDashBoardEmployeeBug();
                GridEmployeeBugs.DataSource = dtBug;
                GridEmployeeBugs.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        public void BindGridCompletedBugs()
        {
            try
            {
                DataTable dtBug;

                dtBug = objTask.GetAdminDashBoardProjectCompletedBug();
                GridCompletedBug.DataSource = dtBug;
                GridCompletedBug.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        public void BindGridEmployeeCompletedBugs()
        {
            try
            {
                DataTable dtBug;

                dtBug = objTask.GetAdminDashBoardEmployeeCompletedBug();
                GridEmployeeCompletedBugs.DataSource = dtBug;
                GridEmployeeCompletedBugs.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            PopulateChart();
        }
    }
}