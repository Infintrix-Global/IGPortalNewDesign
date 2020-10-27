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
    public partial class EmployeeMaster : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindEmployeeMaster();
                GetEmployeeList();
                BindDepartment();
                BindRole();
            }
        }


        public void BindDepartment()
        {
            chkDepartment.DataSource = objCommon.GetDepartmentMaster();
            chkDepartment.DataTextField = "DepartmentName";
            chkDepartment.DataValueField = "ID";
            chkDepartment.DataBind();
           
        }
        public void BindEmployeeMaster()
        {
            ddlManager.DataSource = objCommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlManager.DataTextField = "EmployeeName";
            ddlManager.DataValueField = "ID";
            ddlManager.DataBind();
            ddlManager.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindRole()
        {
            chkRole.DataSource = objCommon.GetRole();
            chkRole.DataTextField = "RoleName";
            chkRole.DataValueField = "ID";
            chkRole.DataBind();
            //chkRole.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtCheckEmail = new DataTable();
                if ((dtCheckEmail = objCommon.CheckEmailExists(txtEmail.Text.Trim())).Rows.Count == 0)
                {
                    int _isInserted = -1;
                    Employee objEmployee = new Employee()
                    {
                        CompanyID = Convert.ToInt32(Session["CompanyID"].ToString()),
                        Name = txtName.Text,
                        EmployeeCode = txtEmpCode.Text,
                        Mobile = txtMobile.Text,
                        Password = objCommon.Encrypt("12345"),
                        Email = txtEmail.Text,
                      //  Role = ddlRole.SelectedValue,
                        DOB = txtDOB.Text,
                        JoinDate = txtJoinDate.Text,
                        Address = txtAddress.Text,
                        Manager = ddlManager.SelectedValue
                    };

                    _isInserted = objCommon.AddEmployee(objEmployee);

                    if (_isInserted == -1)
                    {

                        lblmsg.Text = "Failed to Add Employee";
                        lblmsg.ForeColor = System.Drawing.Color.Red;

                    }
                    else if (_isInserted == 0)
                    {

                        lblmsg.Text = "Employee Exists";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblmsg.Text = "Employee Added ";
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                        foreach (ListItem item in chkDepartment.Items)
                        {
                            if (item.Selected)
                            {
                                 objCommon.AddEmployeeDepartment(_isInserted, item.Value);
                            }
                        }
                        foreach (ListItem item in chkRole.Items)
                        {
                            if (item.Selected)
                            {
                                objCommon.AddEmployeeRole(_isInserted, item.Value);
                            }
                        }
                        objCommon.SendMail(txtEmail.Text.Trim(), txtMobile.Text.Trim(), "12345");
                        GetEmployeeList();
                        btclear_Click(sender, e);
                    }
                }
                else
                {
                    lblStatus.Text = "Email already exists.Use Another Email ID";
                }
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace + ex.Message);
            }
        }


        protected void btclear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtMobile.Text = "";
            //ddlRole.SelectedIndex = 0;
            chkRole.ClearSelection();
            chkDepartment.ClearSelection();
            ddlManager.SelectedIndex = 0;
            txtDOB.Text = "";
            txtJoinDate.Text = "";
            txtEmpCode.Text = "";
            txtEmail.Text = "";
            lblStatus.Text = "";
        }

        public void GetEmployeeList()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetAllEmployeeList();
            GridEmployee.DataSource = dt;
            GridEmployee.DataBind();
            count.Text = "Number of Employees =" + dt.Rows.Count;
            ViewState["dirState"] = dt;
            ViewState["sortdr"] = "Asc";
        }

        protected void GridEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProfile")

            {
                int eid = Convert.ToInt32(e.CommandArgument);
                Session["EmployeeID"] = eid;
                Response.Redirect("~/EmployeeProfile.aspx");
            }
            if (e.CommandName == "EditProfile")

            {
                int eid = Convert.ToInt32(e.CommandArgument);
                Session["EmployeeID"] = eid;
                Response.Redirect("~/EditProfile.aspx");
            }

            if (e.CommandName == "RemoveProfile")

            {

                int eid = Convert.ToInt32(e.CommandArgument);
                Session["EmployeeID"] = eid;
                objCommon.RemoveEmployee(eid);
                GetEmployeeList();
            }
        }

        protected void GridEmployee_Sorting(object sender, GridViewSortEventArgs e)
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
                GridEmployee.DataSource = dtrslt;
                GridEmployee.DataBind();
            }
        }

        protected void GridEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DataTable dtCheckIsPrint = objCommon.GetRoleRights(Session["Role"].ToString(), 1);
                    if (dtCheckIsPrint.Rows[0]["IsEditAllowed"] is true)
                    {
                        ((ImageButton)e.Row.FindControl("imgEdit")).Visible = true;
                    }
                    else if (dtCheckIsPrint.Rows[0]["IsEditAllowed"] is false)
                    {
                        ((ImageButton)e.Row.FindControl("imgEdit")).Visible = false;
                    }
                    if (Session["LoginID"].ToString() == ((Label)e.Row.FindControl("lblID")).Text)
                    {
                        ((ImageButton)e.Row.FindControl("imgEdit")).Visible = true;

                    }
                    if (dtCheckIsPrint.Rows[0]["IsDeleteAllowed"] is true)
                    {
                        ((ImageButton)e.Row.FindControl("imgDelete")).Visible = true;
                    }
                    else if (dtCheckIsPrint.Rows[0]["IsDeleteAllowed"] is false)
                    {
                        ((ImageButton)e.Row.FindControl("imgDelete")).Visible = false;
                    }

                    if (dtCheckIsPrint.Rows[0]["IsViewAllowed"] is true)
                    {
                        ((ImageButton)e.Row.FindControl("imgView")).Visible = true;
                    }
                    else if (dtCheckIsPrint.Rows[0]["IsViewAllowed"] is false)
                    {
                        ((ImageButton)e.Row.FindControl("imgView")).Visible = false;
                    }



                    //if (Session["Role"].ToString() == "2")
                    //{
                    //    ((ImageButton)e.Row.FindControl("imgEdit")).Visible = true;
                    //    ((ImageButton)e.Row.FindControl("imgDelete")).Visible = true;
                    //}
                    //else
                    //{
                    //    if(Session["LoginID"].ToString() == ((Label)e.Row.FindControl("lblID")).Text)
                    //        {
                    //        ((ImageButton)e.Row.FindControl("imgEdit")).Visible = true;

                    //    }
                    //}
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GridEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridEmployee.PageIndex = e.NewPageIndex;
            GetEmployeeList();
        }
    }
}