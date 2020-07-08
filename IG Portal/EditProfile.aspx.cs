﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class EditProfile : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        public static int mode;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtCheckRights = objCommon.GetRoleRights(Session["Role"].ToString(), 8);
                if (dtCheckRights.Rows[0]["IsPrintAllowed"] is true)
                {
                    mode = 1;
                    bindAdminFeilds();
                }
                else if (dtCheckRights.Rows[0]["IsPrintAllowed"] is false)
                {
                    mode = 2;
                    bindEmployeeFeilds();
                }
                //    if (Session["Role"].ToString() == "2")
                //{
                //    //pbSAdmin.Visible = true;
                //    // pbEmployee.Visible = false;
                //    mode = 1;
                //    bindAdminFeilds();
                //}
                //else if (Session["Role"].ToString() == "1")
                //{
                //    // pbEmployee.Visible = true;
                //    //  pbSAdmin.Visible = false;
                //    mode = 2;
                //    bindEmployeeFeilds();
                //}

                string eid = Session["EmployeeID"].ToString();
                int x = Convert.ToInt32(eid);
                BindRole();
                BindEmployeeMaster();
                bindEmployeeProfile(x);

            }
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
            ddlRole.DataSource = objCommon.GetRole();
            ddlRole.DataTextField = "RoleName";
            ddlRole.DataValueField = "ID";
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void bindEmployeeFeilds()
        {
            txtMobileNo.Attributes.Add("readonly", "readonly");
            txtEmpCode.Attributes.Add("readonly", "readonly");
            txtEmail.Attributes.Add("readonly", "readonly");
            passsword.Visible = false;
            ddlRole.Enabled = false;
            ddlManager.Enabled = false;
        }

        public void bindAdminFeilds()
        {

            ddlRole.Enabled = true;
        }

        public void bindEmployeeProfile(int eid)
        {
            try
            {
                DataTable dt1 = objTask.GetEmployeeByID(eid);


                if (dt1.Rows.Count > 0)
                {
                    txtEmpCode.Text= dt1.Rows[0]["EmployeeCode"].ToString();
                    txtName.Text = dt1.Rows[0]["EmployeeName"].ToString();
                    txtAddress.Text = dt1.Rows[0]["Address"].ToString();
                    txtMobileNo.Text = dt1.Rows[0]["EmployeeID"].ToString();
                    txtEmail.Text = dt1.Rows[0]["Email"].ToString();
                    if (dt1.Rows[0]["DOB"].ToString() != "")
                    {
                        txtDOB.Text = Convert.ToDateTime(dt1.Rows[0]["DOB"].ToString()).ToString("yyyy-MM-dd");
                    }
                    if (dt1.Rows[0]["JoiningDate"].ToString() != "")
                    {
                        txtJoinDate.Text = Convert.ToDateTime(dt1.Rows[0]["JoiningDate"].ToString()).ToString("yyyy-MM-dd");
                    }
                    ddlRole.SelectedValue = dt1.Rows[0]["Role"].ToString();
                    ddlManager.SelectedValue = dt1.Rows[0]["Manager"].ToString();

                }

            }
            catch (Exception ex)
            {

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int _isInserted = -1;
                Employee objEmployee = new Employee()
                {
                    EmployeeID = Convert.ToInt32(Session["EmployeeID"].ToString()),
                    EmployeeCode = txtEmpCode.Text,
                    Name = txtName.Text,
                    Mobile = txtMobileNo.Text,
                    Email = txtEmail.Text,
                    Role = ddlRole.SelectedValue,
                    DOB = txtDOB.Text,
                    JoinDate = txtJoinDate.Text,
                    Address = txtAddress.Text,
                    Manager=ddlManager.SelectedValue,
                    Password = objCommon.Encrypt(txtPassword.Text)
            };

                if (mode == 1)
                {
                   
                    _isInserted = objCommon.UpdateEmployee(objEmployee,mode);
                }
               else if (mode == 2)
                {
                    _isInserted = objCommon.UpdateEmployee(objEmployee,mode);
                }

                if (_isInserted == -1)
                {

                    lblmsg.Text = "Failed to Update Employee";
                    lblmsg.ForeColor = System.Drawing.Color.Red;

                }

                else
                {

                    lblmsg.Text = "Employee Updated ";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("~/EmployeeProfile.aspx");

                }
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace + ex.Message);
            }
        }
    }
}