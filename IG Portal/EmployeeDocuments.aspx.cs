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
    public partial class EmployeeDocuments : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindEmployeeDocs();
            }
        }

        public void BindEmployeeDocs()
        {
            DataTable dt = new DataTable();
            dt = objTask.GetEmployeeDocumentStatus(Convert.ToInt32(Session["CompanyID"].ToString()));
            GridDocumentStatus.DataSource = dt;
            GridDocumentStatus.DataBind();
            count.Text = "Number of Employee =" + dt.Rows.Count;
        }

        protected void GridDocumentStatus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            
            Session["EmployeeID"] = id;
            Response.Redirect("ViewEmployeeDocuments.aspx");
        }

        protected void GridDocumentStatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridDocumentStatus.PageIndex = e.NewPageIndex;
            BindEmployeeDocs();
        }
    }
}