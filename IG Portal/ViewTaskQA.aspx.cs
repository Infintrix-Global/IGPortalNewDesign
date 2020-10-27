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
    public partial class ViewTaskQA : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjectMaster();
                BindGridAssignTask();
                btSearch_Click(sender, e);
            }
            lblmsg.Text = "";
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";

            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindGridAssignTask()
        {
            DataTable dtTaskDetails;

            dtTaskDetails = objTask.GetApprovedTaskForQA(Session["LoginID"].ToString());
            GridAssignTask.DataSource = dtTaskDetails;
            GridAssignTask.DataBind();
            count.Text = "Number of Tasks= " + dtTaskDetails.Rows.Count;
            ViewState["dirState"] = dtTaskDetails;
            ViewState["sortdr"] = "Asc";


        }

        protected void GridAssignTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridAssignTask.PageIndex = e.NewPageIndex;
            btSearch_Click(sender, e);
        }

        protected void GridAssignTask_Sorting(object sender, GridViewSortEventArgs e)
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
                GridAssignTask.DataSource = dtrslt;
                GridAssignTask.DataBind();
            }
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuery = "";
                string strQuery1 = "";
                string strQueryfinal = "";
                DataTable dtSearch1;

                strQuery = "Select TS.ID,TS.CreatedBy,TS.ID , TS.Comment,TS.Priority,TS.TaskAddedDateTime,L.EmployeeName,TM.TaskName,PM.ProjectName,TS.TaskDetails," +
                    "TTM.TaskTitle,TS.AssignTo,TS.EstiamtedWorkTime,Convert(nvarchar(max), TS.EstimatedWorkDate, 103) as EstimatedWorkDate from AssignedTask TS" +
                    " inner  join TaskMaster TM on TS.TaskType = TM.ID inner join ProjectMaster PM on PM.ID = TS.ProjectName   " +
                    "  inner join TaskTitleMaster TTM on TS.TaskTitle = TTM.ID inner    join Login L on L.ID = TS.AssignTo   where TS.IsActive = 1   and TS.Status = 8 " +
                    "and TS.ProjectName in (Select ProjectID from  ProjectEmployeeMap where LoginID=" + Session["LoginID"].ToString() + " and IsActive=1 )";



                
                if (ddlProjectName.SelectedIndex > 0)
                {
                    strQuery += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";

                }


                strQueryfinal = strQuery;
                dtSearch1 = objTask.SearchBug(strQueryfinal);
                GridFillSearch();

                void GridFillSearch()
                {
                    if (dtSearch1 != null)
                    {
                        //DataTable dtSearch = dtSearch1.CopyToDataTable();
                        GridAssignTask.DataSource = dtSearch1;
                        GridAssignTask.DataBind();

                        count.Text = "Number of Tasks= " + (dtSearch1.Rows.Count).ToString();
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        GridAssignTask.DataSource = dt;
                        GridAssignTask.DataBind();

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
            
            BindGridAssignTask();

        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridAssignTask_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridAssignTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if(e.CommandName=="AddBug")
                {
                    int bid = Convert.ToInt32(e.CommandArgument);
                    Response.Redirect("~/AddBug.aspx?TaskIDAddBug=" + objcommon.Encrypt(bid.ToString()));
                   
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}