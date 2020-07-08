using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class AddPage : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjectMaster();
                GetPageList();

            }
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objCommon.GetProjectMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";
            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            _isInserted = objCommon.AddPage(Session["CompanyID"].ToString(),ddlProjectName.SelectedValue, txtPageName.Text);
            if (_isInserted == -1)
            {

                lblmsg.Text = "Failed to Add Page";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                GetPageList();
            }
            else if (_isInserted == 0)
            {

                lblmsg.Text = "Page Exists";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                lblmsg.Text = "Page Added ";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                Clear();
                GetPageList();
            }
        }

        public void Clear()
        {
            txtPageName.Text = "";
        }
        protected void btclear_Click(object sender, EventArgs e)
        {
            txtPageName.Text = "";
            ddlProjectName.SelectedIndex = 0;
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProjectName.SelectedIndex != 0)
            {

                GetPageList();
            }
        }

        public void GetPageList()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetPageTitleMaster(ddlProjectName.SelectedValue);
            GridPage.DataSource = dt;
            GridPage.DataBind();
            count.Text = "Number of Project =" + dt.Rows.Count;
        }

        protected void GridPage_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridPage.PageIndex = e.NewPageIndex;
            GetPageList();
        }
    }
}