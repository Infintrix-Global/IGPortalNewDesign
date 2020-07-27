using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using IG_Portal.BAL_Classes;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class PendingAssignTask : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindGridAssignTask();

            }
            lblmsg.Text = "";
        }

        public void BindGridAssignTask()
        {
            DataTable dtTaskDetails;
           
            dtTaskDetails = objTask.GetPendingTask(Convert.ToInt32(Session["LoginID"].ToString()));
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

        protected void GridAssignTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Assign")
                {
                    int _IsConfirm = -1;

                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridAssignTask.Rows[rowIndex];
                    string developerID = (row.FindControl("ddlDeveloper") as DropDownList).SelectedValue;
                    string id = (row.FindControl("lblID") as Label).Text;
                    
                    if (developerID == "0")
                    {
                        lblmsg.Text = "Failed-Please Select Developer ";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        _IsConfirm = objTask.AssignTask(Convert.ToInt32(id), developerID);
                        if (_IsConfirm == -1)
                        {
                            lblmsg.Text = "Failed To Assign";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg.Text = "Task Assigned";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                            BindGridAssignTask();
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void GridAssignTask_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataSource = objcommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataTextField = "EmployeeName";
                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataValueField = "ID";
                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataBind();

                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Items.Insert(0, new ListItem("--- Select Developer ---", "0"));
            }
        }
    }
}