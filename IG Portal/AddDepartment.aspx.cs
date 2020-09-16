using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class AddDepartment : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GetDepartmentList();

            }
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            _isInserted = objCommon.AddDepartment(txtDepartmentName.Text);
            if (_isInserted == -1)
            {

                lblmsg.Text = "Failed to Add Department";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                GetDepartmentList();
            }
            else if (_isInserted == 0)
            {

                lblmsg.Text = "Department Exists";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                lblmsg.Text = "Department Added ";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                Clear();
                GetDepartmentList();
            }
        }

        public void Clear()
        {
            txtDepartmentName.Text = "";
        }
        protected void btclear_Click(object sender, EventArgs e)
        {
            txtDepartmentName.Text = "";
            GetDepartmentList();
        }

        public void GetDepartmentList()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetDepartmentMaster();
            GridDepartment.DataSource = dt;
            GridDepartment.DataBind();
            count.Text = "Number of Department =" + dt.Rows.Count;
        }

       


        protected void GridDepartment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridDepartment.PageIndex = e.NewPageIndex;
            GetDepartmentList();
        }
    }
}