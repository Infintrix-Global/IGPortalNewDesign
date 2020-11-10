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
    public partial class ViewEvent : System.Web.UI.Page
    {
        BAL_Task objTask = new BAL_Task();
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridEvent();
            }
        }

        public void BindGridEvent()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetEventMaster();
            GridEvent.DataSource = dt;
            GridEvent.DataBind();
            count.Text = "Number of Events =" + dt.Rows.Count;
        }


        protected void GridEvent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridEvent.PageIndex = e.NewPageIndex;
            BindGridEvent();
        }

        protected void GridEvent_Sorting(object sender, GridViewSortEventArgs e)
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
                GridEvent.DataSource = dtrslt;
                GridEvent.DataBind();
            }
        }

        protected void GridEvent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int tid = Convert.ToInt32(e.CommandArgument);
                objTask.RemoveEvent(tid);
                BindGridEvent();

            }
            if (e.CommandName == "Edit")
            {
                int tid = Convert.ToInt32(e.CommandArgument);
                // Session["BlogID"] = tid.ToString();// Convert.ToInt32(((Label)row.FindControl("lblTID")).Text);
                Response.Redirect("~/EventMaster.aspx?EventID=" + objCommon.Encrypt(tid.ToString()));

            }
        }

        protected void GridEvent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (((Label)e.Row.FindControl("lblStatus")).Text == "True")
                    {
                        ((ImageButton)e.Row.FindControl("imgDelete")).ImageUrl = "~/images/Active.png";
                        ((ImageButton)e.Row.FindControl("imgDelete")).ToolTip = "Change to Inactive";
                        ((Label)e.Row.FindControl("lblStatusName")).Text = "Active";
                    }
                    else
                    {

                        ((Label)e.Row.FindControl("lblStatusName")).Text = "Inactive";
                        ((ImageButton)e.Row.FindControl("imgDelete")).ImageUrl = "~/images/Inactive.png";
                        ((ImageButton)e.Row.FindControl("imgDelete")).ToolTip = "Change to Active";
                    }
                }
            }

            catch (Exception ex)
            {

            }
        }
       
    }
}