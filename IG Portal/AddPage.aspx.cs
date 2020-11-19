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
    public partial class AddPage : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        General objGeneral = new General();
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
            count.Text = "Number of Pages =" + dt.Rows.Count;
        }

        protected void GridPage_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridPage.PageIndex = e.NewPageIndex;
            GetPageList();
        }

        protected void GridPage_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridPage.EditIndex = -1;
            GetPageList();
        }

        protected void GridPage_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int _isDeleted = -1;
                string sqr = "update PageMaster set IsActive=0  where ID=" + e.CommandArgument.ToString();
                objGeneral.GetExecuteNonQueryByCommand(sqr);

                GetPageList();
            }
        }

        protected void GridPage_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridPage.EditIndex = e.NewEditIndex;
            GetPageList();
        }

        protected void GridPage_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridPage.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox tname = GridPage.Rows[e.RowIndex].FindControl("txtPageName") as TextBox;
            int _isUpdated = -1;
            string sqr = "update PageMaster set PageName='" + tname.Text + "' where ID=" + id.Text;
            objGeneral.GetExecuteNonQueryByCommand(sqr);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridPage.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            GetPageList();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string sqr = "Select PA.*,PR.ProjectName from PageMaster PA inner join ProjectMaster PR on PA.ProjectID=PR.ID where PA.IsActive=1";
            if (txtPageName.Text != "")
            {
                sqr += "and PA.PageName like '%' +'" + txtPageName.Text + "'+ '%'";
            }
            if(ddlProjectName.SelectedIndex!=0)
            {
                sqr += " and PA.ProjectID=" + ddlProjectName.SelectedValue;
            }

            dt = objGeneral.GetDatasetByCommand(sqr);
            GridPage.DataSource = dt;
            GridPage.DataBind();
            if (dt.Rows.Count > 0)
            {
                count.Text = "Number of Pages =" + dt.Rows.Count;
            }
            else
            {
                count.Text = "Number of Pages =0";
            }
        }
    }
}