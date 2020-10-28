using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class ProjectStatusReport : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridProject();
            }
        }

        public void BindGridProject()
        {
            DataTable dt = objTask.GetProjectStatusReport();
            GridProject.DataSource = dt;
            GridProject.DataBind();
            GridFillTask();
            

            void GridFillTask()
            {
                count.Text = "Number of Tasks= " + dt.Rows.Count;
                btExport.Visible = true;
                ViewState["dirState"] = dt;
                ViewState["sortdr"] = "Asc";
            }
        }

        protected void GridProject_Sorting(object sender, GridViewSortEventArgs e)
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
                GridProject.DataSource = dtrslt;
                GridProject.DataBind();
            }
        }

        protected void GridProject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProject.PageIndex = e.NewPageIndex;
            BindGridProject();
        }

        protected void GridProject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                int tid = Convert.ToInt32(e.CommandArgument);
                Session["ProjectStatusID"] = tid.ToString();// Convert.ToInt32(((Label)row.FindControl("lblTID")).Text);
                Response.Redirect("~/ProjectStatusDetails.aspx");
                //Response.Redirect("~/AddTimeSheet.aspx");
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            string FileName;
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.Charset = "";
                
                FileName = "ProjectStatusReport-" + DateTime.Now + ".xls";
                
                using (StringWriter sw = new StringWriter())
                {
                    HtmlTextWriter hw = new HtmlTextWriter(sw);

                    //To Export all pages
                    GridProject.AllowPaging = false;
                    GridProject.AllowSorting = false;
                 
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
                    GridProject.GridLines = GridLines.Both;
                    GridProject.HeaderStyle.Font.Bold = true;
                    GridProject.RenderControl(hw);
                    Response.Write(sw.ToString());
                    Response.End();

                }

            }
            catch (Exception ex)
            {
                // General.ErrorMessage(ex.StackTrace + ex.Message);

            }
        }
    }
}