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
    public partial class MonthlyHoursByEmployeeReport : System.Web.UI.Page
    {

        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        General objGeneral = new General();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindMonthName();
                BindYear();
                BindGridTask();
               
            }
        }

        public void BindMonthName()
        {
            ddlMonthName.SelectedValue = DateTime.Now.Month.ToString();
        }

        public void BindYear()
        {
            ddlYear.DataSource = objcommon.GetYearFromTimeSheet(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlYear.DataTextField = "Year";
            ddlYear.DataValueField = "Year";
            ddlYear.DataBind();
            ddlYear.SelectedValue = DateTime.Now.Year.ToString();
        }

        public void BindGridTask()
        {
            DataTable dtTaskDetails;
            //if (Session["Role"].ToString() == "2" || Session["Role"].ToString() == "4")
            //{
            //     dtTaskDetails = objTask.GetTaskDetailsAllEmployee();
            //    GridTask.DataSource = dtTaskDetails;
            //    GridTask.DataBind();
            //    GridFillTask();
            //}
            //else if (Session["Role"].ToString() == "1")
            //{
            dtTaskDetails = objTask.GetMonthlyHoursSpent(Convert.ToInt32(Session["CompanyID"].ToString()),ddlMonthName.SelectedValue,ddlYear.SelectedValue);
            GridTask.DataSource = dtTaskDetails;
            GridTask.DataBind();
            GridFillTask();
            // }

            void GridFillTask()
            {
               
                count.Text = "Number of Employees= " + dtTaskDetails.Rows.Count;
                btExport.Visible = true;
                ViewState["dirState"] = dtTaskDetails;
                ViewState["sortdr"] = "Asc";
            }
        }

        protected void ddlMonthName_SelectedIndexChanged(object sender, EventArgs e)
        {
            btSearch_Click(sender, e);
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            BindMonthName();
            BindGridTask();
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            DataTable dtTaskDetails;
           
            dtTaskDetails = objTask.GetMonthlyHoursSpent(Convert.ToInt32(Session["CompanyID"].ToString()), ddlMonthName.SelectedValue,ddlYear.SelectedValue);
            GridTask.DataSource = dtTaskDetails;
            GridTask.DataBind();
            GridFillTask();
            // }

            void GridFillTask()
            {

                count.Text = "Number of Employees= " + dtTaskDetails.Rows.Count;
                btExport.Visible = true;
                ViewState["dirState"] = dtTaskDetails;
                ViewState["sortdr"] = "Asc";
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
               
                    FileName = "Hour Spent Report-" + DateTime.Now + ".xls";
               
                using (StringWriter sw = new StringWriter())
                {
                    HtmlTextWriter hw = new HtmlTextWriter(sw);

                    //To Export all pages
                    GridTask.AllowPaging = false;
                    GridTask.AllowSorting = false;
                    this.btSearch_Click(sender, e);

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
                    GridTask.GridLines = GridLines.Both;

                    GridTask.HeaderStyle.Font.Bold = true;
                    GridTask.RenderControl(hw);
                    Response.Write(sw.ToString());

                    Response.End();


                }

            }
            catch (Exception ex)
            {
                // General.ErrorMessage(ex.StackTrace + ex.Message);

            }
        }

        protected void GridTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridTask.PageIndex = e.NewPageIndex;
            btSearch_Click(sender, e);
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
    }
}