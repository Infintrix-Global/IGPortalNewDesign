using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using IG_Portal.BAL_Classes;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class ViewAssignedTaskEmployee : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjectMaster();
               
                BindGridAssignTask();
                BindSearch();
                btSearch_Click(sender, e);


            }
            lblmsg.Text = "";
        }

        public void BindSearch()
        {

            string pid = Session["TSTProjectID"] as String;
            string sid = Session["TSTStatusID"] as String;
          
            if (!string.IsNullOrEmpty(pid))
            {
                ddlProjectName.SelectedValue = Session["TSTProjectID"].ToString();
            }
            if (!string.IsNullOrEmpty(sid))
            {
                ddlStatus.SelectedValue = Session["TSTStatusID"].ToString();
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

        public void BindGridAssignTask()
        {
            DataTable dtTaskDetails;

            dtTaskDetails = objTask.GetAllTaskByEmployee(Session["LoginID"].ToString());
            GridAssignTask.DataSource = dtTaskDetails;
            GridAssignTask.DataBind();
            count.Text = "Number of Tasks= " + dtTaskDetails.Rows.Count;
            ViewState["dirState"] = dtTaskDetails;
            ViewState["sortdr"] = "Asc";


        }

        protected void GridAssignTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridAssignTask.PageIndex = e.NewPageIndex;
            BindGridAssignTask();
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

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridAssignTask();
        }

        protected void GridAssignTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddTS")
            {
                int bid = Convert.ToInt32(e.CommandArgument);
                Session["TSTProjectID"] = ddlProjectName.SelectedValue;
                Session["TSTStatusID"] = ddlStatus.SelectedValue;
              //  Session["AddTSTaskID"] = bid.ToString();
                Response.Redirect("~/AddTimeSheet.aspx?AddTSTaskID=" + objcommon.Encrypt(bid.ToString()));
                //Response.Redirect("~/AddTimeSheet.aspx");
            }
        }

        protected void GridAssignTask_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((((Label)e.Row.FindControl("lblAssignTo")).Text == Session["LoginID"].ToString()))
                {
                    if ((((Label)e.Row.FindControl("lblStatus")).Text == "3") || (((Label)e.Row.FindControl("lblStatus")).Text == "6"))
                    {
                        ((LinkButton)e.Row.FindControl("lnkAddTS")).Visible = false;
                    }
                    else
                    {
                        ((LinkButton)e.Row.FindControl("lnkAddTS")).Visible = true;

                    }
                }
                else
                {
                    ((LinkButton)e.Row.FindControl("lnkAddTS")).Visible = false;

                }
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

                strQuery = "Select TS.ID,TS.CreatedBy,TS.ID , TS.Comment,TS.Priority,TS.TaskAddedDateTime,L.EmployeeName,TS.Status,SM.StatusName " +
                    ",TM.TaskName,PM.ProjectName,TS.TaskDetails,TTM.TaskTitle,TS.AssignTo from AssignedTask TS " +
                    " inner join TaskMaster TM on TS.TaskType = TM.ID inner join ProjectMaster PM on PM.ID = TS.ProjectName" +
                    "  inner join TaskTitleMaster TTM on TS.TaskTitle = TTM.ID inner join Login L on L.ID = TS.AssignTo inner join StatusMaster SM on TS.Status = SM.ID" +
                    "  where TS.IsActive = 1  and TS.AssignTo = " + Session["LoginID"].ToString();
	 
	


                if (ddlProjectName.SelectedIndex > 0)
                {
                    strQuery += " and TS.ProjectName ='" + ddlProjectName.SelectedValue + "'";
                   
                }
                if (ddlStatus.SelectedIndex == 0)
                {
                    strQuery += " and TS.Status not in (3,6) " ;
                    
                }
                
                 if (ddlStatus.SelectedIndex == 1)
                {
                    strQuery += " and TS.Status  in (3,6) ";
                }

                strQuery1 = " order by [Priority] asc";

                 strQueryfinal = strQuery + strQuery1;
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
            ddlStatus.SelectedIndex = 0;
            BindGridAssignTask();
                
        }
    }
}