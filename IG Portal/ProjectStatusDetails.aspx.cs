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
    public partial class ProjectStatusDetails : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string pid = Session["ProjectStatusID"].ToString();
                int x = Convert.ToInt32(pid);
                BindData(x);
            }
        }


        public void BindData(int ProjectID)
        {
            try
            {
                DataTable dt1 = objTask.GetProjectStatusReportbyProjectID(ProjectID);

                if (dt1.Rows.Count > 0)
                {
                    lblProjectName.Text = dt1.Rows[0]["ProjectName"].ToString();
                    lblProposedhrs.Text = dt1.Rows[0]["ProposedHours"].ToString();
                    lblPTask.Text = dt1.Rows[0]["PlannedTasks"].ToString();
                    lblPTaskHrs.Text = dt1.Rows[0]["PlannedTaskHours"].ToString();
                    lblATask.Text = dt1.Rows[0]["ActualTasks"].ToString();
                    lblATaskHrs.Text = dt1.Rows[0]["ActualTaskHours"].ToString();
                    lblBugs.Text = dt1.Rows[0]["BugCount"].ToString();
                    lblBugHrs.Text = dt1.Rows[0]["BugHours"].ToString();
                    lblTestingHrs.Text = dt1.Rows[0]["TestingHours"].ToString();
                    lblReTestingHrs.Text = dt1.Rows[0]["ReTestingHours"].ToString();
                    lblTimeSpent.Text = dt1.Rows[0]["ActualTimeSpent"].ToString();
                    lblMTimeDiff.Text = dt1.Rows[0]["ManagerTD"].ToString();
                    lblDTimeDiff.Text = dt1.Rows[0]["DevelopmentTD"].ToString();
                    lblTTimeDiff.Text = dt1.Rows[0]["TimeDifference"].ToString();
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}