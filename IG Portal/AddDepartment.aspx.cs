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
    public partial class AddDepartment : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        General objGeneral = new General();
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

        protected void GridDepartment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridDepartment.EditIndex = -1;
            GetDepartmentList();
        }

        protected void GridDepartment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int _isDeleted = -1;
                string sqr = "update DepartmentMaster set IsActive=0  where ID=" + e.CommandArgument.ToString();
                objGeneral.GetExecuteNonQueryByCommand(sqr);
              
                GetDepartmentList();
            }
        }

        protected void GridDepartment_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridDepartment.EditIndex = e.NewEditIndex;
            GetDepartmentList();
        }

        protected void GridDepartment_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridDepartment.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox tname = GridDepartment.Rows[e.RowIndex].FindControl("txtTaskName") as TextBox;
            int _isUpdated = -1;
            string sqr = "update DepartmentMaster set DepartmentName='" + tname.Text + "' where ID=" + id.Text;
            objGeneral.GetExecuteNonQueryByCommand(sqr);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridDepartment.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            GetDepartmentList();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string sqr = "Select * from DepartmentMaster where IsActive=1";
            if (txtDepartmentName.Text != "")
            {
                sqr += "and DepartmentName like '%' +'" + txtDepartmentName.Text + "'+ '%'";
            }
           
            dt = objGeneral.GetDatasetByCommand(sqr);
            GridDepartment.DataSource = dt;
            GridDepartment.DataBind();
            if (dt.Rows.Count > 0)
            {
                count.Text = "Number of Department =" + dt.Rows.Count;
            }
            else
            {
                count.Text = "Number of Department =0";
            }
        }
    }
}