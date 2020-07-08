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
    public partial class Bug_History : System.Web.UI.Page
    {
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindBugHistory(Session["BugHistoryID"].ToString());
               
            }
        }

        

        public void BindBugHistory(string bugID)
        {
            DataTable dtBugHistory;

            dtBugHistory = objTask.GetBugHistroy(bugID);
            GridBug.DataSource = dtBugHistory;
            GridBug.DataBind();
            count.Text = "Number of Records =" + dtBugHistory.Rows.Count;
            ViewState["dirState"] = dtBugHistory;
            ViewState["sortdr"] = "Asc";
        }

        protected void GridBug_Sorting(object sender, GridViewSortEventArgs e)
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
                GridBug.DataSource = dtrslt;
                GridBug.DataBind();
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
                
                    FileName = "BugHistory-" + DateTime.Now + ".xls";
                
                using (StringWriter sw = new StringWriter())
                {
                    HtmlTextWriter hw = new HtmlTextWriter(sw);

                    //To Export all pages
                    GridBug.AllowPaging = false;
                    GridBug.AllowSorting = false;
                   

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
                    GridBug.GridLines = GridLines.Both;

                    GridBug.HeaderStyle.Font.Bold = true;
                    GridBug.RenderControl(hw);
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