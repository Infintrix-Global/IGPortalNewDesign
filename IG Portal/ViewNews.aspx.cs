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
   
    public partial class ViewNews : System.Web.UI.Page
    {
        BAL_Task objTask = new BAL_Task();
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridNews();
            }
        }

        public void BindGridNews()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetNewsMaster();
            GridNews.DataSource = dt;
            GridNews.DataBind();
            count.Text = "Number of News/Annoucements =" + dt.Rows.Count;
        }


        protected void GridNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridNews.PageIndex = e.NewPageIndex;
            BindGridNews();
        }

        protected void GridNews_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void GridNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int tid = Convert.ToInt32(e.CommandArgument);
                objTask.RemoveNews(tid);
                BindGridNews();

            }
            if (e.CommandName == "Edit")
            {
                int tid = Convert.ToInt32(e.CommandArgument);
                // Session["BlogID"] = tid.ToString();// Convert.ToInt32(((Label)row.FindControl("lblTID")).Text);
                Response.Redirect("~/AddNews.aspx?NewsID=" + objCommon.Encrypt(tid.ToString()));

            }
        }

        protected void GridNews_Sorting(object sender, GridViewSortEventArgs e)
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
                GridNews.DataSource = dtrslt;
                GridNews.DataBind();
            }
        }
    }
}