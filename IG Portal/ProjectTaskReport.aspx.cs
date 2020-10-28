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
        //    DataTable dtTaskDetails;

        //    dtTaskDetails = objTask.GetProjectTaskReport(Convert.ToInt32(Session["LoginID"].ToString()));
        //    GridTask.DataSource = dtTaskDetails;
        //    GridTask.DataBind();
        //    GridFillTask();
        //}

        //void GridFillTask()
        //{
        //    if (dtTaskDetails.Rows.Count > 0)
        //    {
        //        tottime.Text = "Total Time Spent=" + dtTaskDetails.Rows[0]["TotalTime"].ToString();
        //    }
        //    else
        //    {
        //        tottime.Text = "";
        //    }
           // count.Text = "Number of Tasks= " + dtTaskDetails.Rows.Count;

            //ViewState["dirState"] = dtTaskDetails;
           // ViewState["sortdr"] = "Asc";
       // }
    }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btclear_Click(object sender, EventArgs e)
        {

        }

        protected void txtToDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtFromDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridTask_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void GridTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}