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
    public partial class ProjectTaskReport : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                BindProjectMaster();
                BindGridTask();
               
            }

        }
        public void BindProjectMaster()
        {

                ddlProjectName.DataSource = objcommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
                ddlProjectName.DataTextField = "ProjectName";
                ddlProjectName.DataValueField = "ID";
                ddlProjectName.DataBind();
                ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
            }

        public void BindGridTask()
        {
            DataTable dtTaskDetails;

            dtTaskDetails = objTask.GetProjectTaskReport(Session["LoginID"].ToString());
            GridTask.DataSource = dtTaskDetails;
            GridTask.DataBind();
            GridFillTask();
        
        void GridFillTask()
        {
            if (dtTaskDetails.Rows.Count > 0)
            {
                    tottime.Text = "Total Task Estimated Hours=" + dtTaskDetails.Rows[0]["TotalEstimatedHours"].ToString();
                    actualtime.Text = "Total Task Actual Completion Hours=" + dtTaskDetails.Rows[0]["ActualTaskHours"].ToString();
                }
            else
            {
               // tottime.Text = "";
            }
            count.Text = "Number of Tasks= " + dtTaskDetails.Rows.Count;

            ViewState["dirState"] = dtTaskDetails;
            ViewState["sortdr"] = "Asc";
        }
    }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuery2 = "";
                string strsubq2 = "";
                string strsubq3 = "";
                string strQuery3 = "";
                string strQuery = "";
                string strQuery1 = "";
               
                string strQueryfinal = "";
                DataTable dtSearch1;
                strQuery2 = "DECLARE @TotalTimeSpent INT  SET @TotalTimeSpent = (Select cast(SUM(( DATEPART(hh, TimePeriod) * 3600 ) + ( DATEPART(mi, TimePeriod) * 60 ) + DATEPART(ss, TimePeriod)) as decimal(18,2))/3600 AS TotalTimeSpent from TImeSHeet TS" +
                     " where TS.ProjectName in(Select ProjectID from PRojectEmployeeMap where LoginID=" + Session["LoginID"].ToString() + ")  ";

                strsubq2 = "and TaskTitle in(Select TaskTitle from AssignedTask where IsActive=1";

                strQuery3 = "DECLARE @TotalTaskHours INT  SET @TotalTaskHours =(Select sum(cast(EstiamtedWorkTime as decimal(18,2)))  from AssignedTask AT inner join ProjectMaster PM on PM.ID=AT.ProjectNAme " +
                    "where Pm.ID in(Select ProjectID from PRojectEmployeeMap where LoginID ="+ Session["LoginID"].ToString() + ")";

                strsubq3 = "and AT.TaskTitle in (Select TaskTitle from TimeSheet where IsActive=1";



                strQuery = "Select *,@TotalTaskHours as TotalEstimatedHours,@TotalTimeSpent as ActualTaskHours from (Select AT.ID,AT.TaskDetails,PM.ProjectName,AT.EstimatedWorkDate,AT.EndDate,AT.EstiamtedWorkTime,At.TaskTitle from AssignedTask AT inner join ProjectMaster PM on PM.ID=AT.ProjectNAme " +
                    "where Pm.ID in(Select ProjectID from PRojectEmployeeMap where LoginID ="+ Session["LoginID"].ToString() + ")";

                strQuery1 = "(Select TaskTitle,cast(SUM(( DATEPART(hh, TimePeriod) * 3600 ) + ( DATEPART(mi, TimePeriod) * 60 ) + DATEPART(ss, TimePeriod)) as decimal(18,2))/3600 AS ActualTimeSpent from TImeSHeet TS" +
                    " where TS.ProjectName in(Select ProjectID from PRojectEmployeeMap where LoginID=" + Session["LoginID"].ToString() + ")";

                if (ddlProjectName.SelectedIndex > 0)
                {
                    strQuery += " and AT.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                    strQuery3 += " and AT.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                    strsubq3 += " and ProjectName ='" + ddlProjectName.SelectedValue + "'";
                    strsubq2 += " and ProjectName ='" + ddlProjectName.SelectedValue + "'";
                    strQuery3 += " and AT.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                    strQuery1 += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                    strQuery2 += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                }
                if (txtToDate.Text != "" && txtFromDate.Text != "")
                {
                    strQuery += " and AT.EstimatedWorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                    strQuery1 += " and TS.WorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                    strQuery3 += " and AT.EstimatedWorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                    strsubq3 += " and WorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                    strsubq2 += " and EstimatedWorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                    strQuery2 += " and TS.WorkDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                }

                strsubq2 += "  )";
                strsubq3 += "  )";
                strQuery2 += strsubq2+ "  )";
                strQuery3 += strsubq3 + ")";

                   strQuery += ") T1 inner join" ;
                strQuery1 += "  group by TaskTitle) T2 on T1.TaskTitle=T2.TaskTitle order by projectName asc";
                strQueryfinal = strQuery2 + strQuery3 +  strQuery + strQuery1;
                dtSearch1 = objTask.SearchBug(strQueryfinal);
                GridFillSearch();

                void GridFillSearch()
                {
                    if (dtSearch1 != null)
                    {
                        //DataTable dtSearch = dtSearch1.CopyToDataTable();
                        GridTask.DataSource = dtSearch1;
                        GridTask.DataBind();
                        tottime.Text = "Total Task Estimated Hours=" + dtSearch1.Rows[0]["TotalEstimatedHours"].ToString();
                        actualtime.Text= "Total Task Actual Completion Hours=" + dtSearch1.Rows[0]["ActualTaskHours"].ToString();
                        count.Text = "Number of Tasks= " + (dtSearch1.Rows.Count).ToString();
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        GridTask.DataSource = dt;
                        GridTask.DataBind();
                        tottime.Text = "";
                        actualtime.Text = "";
                       count.Text = "Number of Tasks= 0";
                    }
                    ViewState["dirState"] = dtSearch1;
                    ViewState["sortdr"] = "Asc";


                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            ddlProjectName.SelectedIndex = 0;
            txtFromDate.Text = "";
            txtToDate.Text = "";
        }

        protected void txtToDate_TextChanged(object sender, EventArgs e)
        {
            if (txtToDate.Text != "" && txtFromDate.Text != "")
            {
                requiredFromDate.Enabled = false;
                requiredToDate.Enabled = false;
                BindProjectMaster();
            }
            else
            {
                requiredFromDate.Enabled = true;
                requiredToDate.Enabled = true;

            }
        }

        protected void txtFromDate_TextChanged(object sender, EventArgs e)
        {
            if (txtToDate.Text != "" && txtFromDate.Text != "")
            {
                requiredFromDate.Enabled = false;
                requiredToDate.Enabled = false;
                BindProjectMaster();
            }
            else
            {
                requiredFromDate.Enabled = true;
                requiredToDate.Enabled = true;
            }
        }

        protected void GridTask_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                GridTask.DataSource = dtrslt;
                GridTask.DataBind();
            }
        }

        protected void GridTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridTask.PageIndex = e.NewPageIndex;
            btSearch_Click(sender, e);
        }

        protected void GridTask_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    string Atimespent = (e.Row.FindControl("lblATime") as Label).Text;
                    string Ptime = (e.Row.FindControl("lblPTime") as Label).Text;
                    decimal status = ((Convert.ToDecimal(Atimespent) - Convert.ToDecimal(Ptime)) / Convert.ToDecimal(Ptime)) * 100;

                    if (status < 0)
                    {
                        (e.Row.FindControl("lblStatus") as Label).Text = "Before Time";
                        (e.Row.FindControl("lblStatus") as Label).BackColor = System.Drawing.Color.Green;
                        (e.Row.FindControl("lblStatus") as Label).ForeColor = System.Drawing.Color.White;

                    }
                    if (status < 15 && status >= 0)
                    {
                        (e.Row.FindControl("lblStatus") as Label).Text = "On Time";
                        (e.Row.FindControl("lblStatus") as Label).BackColor = System.Drawing.Color.GreenYellow;
                        (e.Row.FindControl("lblStatus") as Label).ForeColor = System.Drawing.Color.White;
                    }

                    if (status >= 15 && status < 30)
                    {
                        (e.Row.FindControl("lblStatus") as Label).Text = "Slightly Delayed";
                        (e.Row.FindControl("lblStatus") as Label).BackColor = System.Drawing.Color.Yellow;
                        (e.Row.FindControl("lblStatus") as Label).ForeColor = System.Drawing.Color.White;
                    }


                    if (status >= 30 && status < 50)
                    {
                        (e.Row.FindControl("lblStatus") as Label).Text = "Delay at Risk";
                        (e.Row.FindControl("lblStatus") as Label).BackColor = System.Drawing.Color.Orange;
                        (e.Row.FindControl("lblStatus") as Label).ForeColor = System.Drawing.Color.White;
                    }


                    if (status >= 50)
                    {
                        (e.Row.FindControl("lblStatus") as Label).Text = "Delay at High Risk";
                        (e.Row.FindControl("lblStatus") as Label).BackColor = System.Drawing.Color.Red;
                        (e.Row.FindControl("lblStatus") as Label).ForeColor = System.Drawing.Color.White;
                    }

                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}