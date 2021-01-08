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
    public partial class ReleaseManagement : System.Web.UI.Page
    {
        General objGeneral = new General();
        public static DataTable dtTask = new DataTable()
        { Columns = { "Task" } };
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindReleaseManagement();
                BindProjectMaster();
            }
        }

        public void BindReleaseManagement()
        {
            DataSet dtRM;
            dtRM = objTask.GetReleaseManagement(Session["LoginID"].ToString());
            GridReleaseManagement.DataSource = dtRM.Tables[0];
            GridReleaseManagement.DataBind();
            count.Text = "Number of Release =" + dtRM.Tables[0].Rows.Count;
            ViewState["dirState"] = dtRM;
            ViewState["sortdr"] = "Asc";
        }

        public void BindTask()
        {


            chkTask.DataSource = objCommon.GetTaskTitleMasterForRelease( ddlProjectName.SelectedValue,Session["LoginID"].ToString());
            chkTask.DataTextField = "TaskDetails";
            chkTask.DataValueField = "AssignedTaskID";
            chkTask.DataBind();

        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objCommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";
            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int _isInserted = -1;
                ReleaseDetails objRM = new ReleaseDetails()
                {
                    Link = txtLink.Text,
                    Date = txtDate.Text,
                    Description = txtTaskDescription.Text,
                    Type = radType.SelectedValue,
                    ProjectName = ddlProjectName.SelectedValue,

                };
                foreach (ListItem item in chkTask.Items)
                {
                    if (item.Selected)
                    {
                        dtTask.Rows.Add(item.Text);
                    }
                }
                _isInserted = objCommon.AddRelease(objRM);

                if (_isInserted == -1)
                {

                    lblmsg.Text = "Failed to Add MOM";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }

                else
                {
                    // lblmsg.Text = "MOM Added ";
                    objTask.AddReleaseTask(dtTask, _isInserted);
                    
                  
                    objCommon.SendMailRelease(dtTask,ddlProjectName.SelectedItem.Text,ddlProjectName.SelectedValue,radType.SelectedValue,txtDate.Text,txtTaskDescription.Text);
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    btnAddNew.Visible = true;
                    addRelease.Visible = false;
                    viewRelease.Visible = true;

                    BindReleaseManagement();
                  
                }
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace + ex.Message);
            }
        }

        protected void GridReleaseManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridReleaseManagement.PageIndex = e.NewPageIndex;
            BindReleaseManagement();
        }

        protected void GridReleaseManagement_Sorting(object sender, GridViewSortEventArgs e)
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
                GridReleaseManagement.DataSource = dtrslt;
                GridReleaseManagement.DataBind();
            }
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            btnAddNew.Visible = false;
            addRelease.Visible = true;
            viewRelease.Visible = false;
        }

        protected void GridReleaseManagement_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dtRMTask = new DataTable();
                int vid = Convert.ToInt32(GridReleaseManagement.DataKeys[e.Row.RowIndex].Value.ToString());
                GridView gvTask = e.Row.FindControl("gvmp") as GridView;
                gvTask.DataSource = objTask.GetRMTask(vid);
                gvTask.DataBind();
            }
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProjectName.SelectedIndex != 0)
            {
                BindTask();
            }
        }

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    DataTable dt = new DataTable();
        //    string sqr = "Select AT.TaskDetails,TTM.ID,AT.ID as AssignedTaskID from AssignedTask AT " +
        //        "inner join TaskTitleMaster TTM on At.TaskTitle=TTM.ID where AT.AssignTo="+ Session["LoginID"].ToString() +
        //        " and AT.ProjectName=" +ddlProjectName.SelectedValue + "and AT.Status not in (6) and AT.IsActive=1";
        //    if (txtSearch.Text != "")
        //    {
        //        sqr += "and AT.TaskDetails like '%' +'" + txtSearch.Text + "'+ '%'";
        //    }

        //    dt = objGeneral.GetDatasetByCommand(sqr);
        //    chkTask.DataSource = dt;
        //    chkTask.DataBind();
        //    chkTask.DataTextField = "TaskDetails";
        //    chkTask.DataValueField = "AssignedTaskID";
        //}
    }
}