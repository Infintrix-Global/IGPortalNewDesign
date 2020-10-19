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
                BindDepartment();
                BindStatus();
                bindEmployeeProfile(x);

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

        public void BindStatus()
        {
            ddlStatus.DataSource = objCommon.GetEmployeeStatus();
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";
            ddlStatus.DataBind();

        }

        public void BindRole()
        {
            chkRole.DataSource = objCommon.GetRole();
            chkRole.DataTextField = "RoleName";
            chkRole.DataValueField = "ID";
            chkRole.DataBind();
           // chkRole.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void bindEmployeeFeilds()
        {
            txtMobileNo.Attributes.Add("readonly", "readonly");
            txtEmpCode.Attributes.Add("readonly", "readonly");
            txtEmail.Attributes.Add("readonly", "readonly");
            ddlStatus.Enabled = false;
            passsword.Visible = false;
            // ddlRole.Enabled = false;
            chkRole.Enabled = false;
            chkDept.Visible = false;
            department.Visible = false;
            ddlManager.Enabled = false;
            photoupload1.Visible = false;
        }

        public void bindAdminFeilds()
        {

            // ddlRole.Enabled = true;
            chkRole.Enabled = true;
        }

        public void bindEmployeeProfile(int eid)
        {
            try
            {
                DataTable dt1 = objTask.GetEmployeeByID(eid);


                if (dt1.Rows.Count > 0)
                {
                    txtLinkedIn.Text= dt1.Rows[0]["LinkedIn"].ToString();
                    lblProfile.Text = dt1.Rows[0]["Photo"].ToString();
                    lblProfile.Visible = false;
                    ImageProfile.ImageUrl = @"~\EmployeeProfile\" + dt1.Rows[0]["Photo"].ToString();
                    txtEmpCode.Text = dt1.Rows[0]["EmployeeCode"].ToString();
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
                   // ddlRole.SelectedValue = dt1.Rows[0]["Role"].ToString();
                    ddlStatus.SelectedValue = dt1.Rows[0]["Status"].ToString();
                    txtPassword.Text = objCommon.Decrypt(dt1.Rows[0]["Password"].ToString());
                    ddlManager.SelectedValue = dt1.Rows[0]["Manager"].ToString();
                    DataTable dtDepartment = objTask.GetDepartmentByEmployee(eid);

                    foreach (DataRow dr in dtDepartment.Rows)
                    {
                        foreach (ListItem item in chkDepartment.Items)
                        {
                            if (item.Value == dr["DepartmentID"].ToString())
                                item.Selected = true;
                        }
                        //chkDepartment.SelectedValue = dr["DepartmentID"].ToString();
                    }
                    DataTable dtRole = objTask.GetRoleByLoginID(eid.ToString());
                         foreach (DataRow dr in dtRole.Rows)
                    {
                        foreach (ListItem item in chkRole.Items)
                        {
                            if (item.Value == dr["ID"].ToString())
                                item.Selected = true;
                        }
                        //chkDepartment.SelectedValue = dr["DepartmentID"].ToString();
                    }


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
                   // Role = ddlRole.SelectedValue,
                    DOB = txtDOB.Text,
                    JoinDate = txtJoinDate.Text,
                    Address = txtAddress.Text,
                    Manager = ddlManager.SelectedValue,
                    Status = ddlStatus.SelectedValue,
                    LinkedIn = txtLinkedIn.Text,
                    Photo = lblProfile.Text,
                    Password = objCommon.Encrypt(txtPassword.Text)
                };

                if (ddlStatus.SelectedValue == "4")
                {
                    objEmployee.LastDay = txtLastDay.Text;
                }
                else
                {
                    objEmployee.LastDay = "";
                }
                if (mode == 1)  /* Admin edit */
                {

                    _isInserted = objCommon.UpdateEmployee(objEmployee, mode);
                    foreach (ListItem item in chkDepartment.Items)
                    {
                        if (item.Selected)
                        {
                            objCommon.AddEmployeeDepartment(Convert.ToInt32(Session["EmployeeID"].ToString()), item.Value);
                        }
                    }

                    foreach (ListItem item in chkRole.Items)
                    {
                        if (item.Selected)
                        {
                            objCommon.AddEmployeeRole(Convert.ToInt32(Session["EmployeeID"].ToString()), item.Value);
                        }
                    }
                }
                else if (mode == 2)  /* Employee edit */
                {
                    _isInserted = objCommon.UpdateEmployee(objEmployee, mode);
                    //foreach (ListItem item in chkDepartment.Items)
                    //{
                    //    if (item.Selected)
                    //    {
                    //        objCommon.AddEmployeeDepartment(Convert.ToInt32(Session["EmployeeID"].ToString()), item.Value);
                    //    }
                    //}
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

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStatus.SelectedValue == "4")
            {
                LastDay.Visible = true;
                txtLastDay.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
            else
            {
                LastDay.Visible = false;
            }
        }

        public void UploadImageProfile()
        {

            string filename = "", newfile = "";
            string[] validFileTypes = { "jpeg", "png", "jpg" };

            if (!FileUpProfile.HasFile)
            {
                this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select a file.');", true);
                FileUpProfile.Focus();
            }
            //string DD = txtFristName.Text;
            string aa = FileUpProfile.FileName;
            string ext = System.IO.Path.GetExtension(FileUpProfile.PostedFile.FileName).ToLower();
            bool isValidFile = false;
            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (isValidFile == true)
            {

                if (FileUpProfile.HasFile)
                {

                    filename = Server.MapPath(FileUpProfile.FileName);
                    newfile = FileUpProfile.PostedFile.FileName;
                    //                filecontent = System.IO.File.ReadAllText(filename);
                    FileInfo fi = new FileInfo(newfile);

                    // check folder exist or not
                    if (!System.IO.Directory.Exists(@"~\EmployeeProfile"))
                    {
                        try
                        {



                            string Imgname = txtEmpCode.Text + "_" + txtName.Text;

                            string path = Server.MapPath(@"~\EmployeeProfile\");
                            System.IO.Directory.CreateDirectory(path);
                            FileUpProfile.SaveAs(path + @"\" + Imgname + ext);

                            ImageProfile.ImageUrl = @"~\EmployeeProfile\" + Imgname + ext;
                            ImageProfile.Visible = true;
                            lblProfile.Visible = true;
                            lblProfile.Text = Imgname + ext;

                            //  IdentityPolicyImageUrl = Imgname + ext;


                        }
                        catch (Exception ex)
                        {
                            lblProfile.Text = "Not able to create new directory";
                        }

                    }
                }
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select valid file.');", true);
            }



        }


        protected void btnImageProfile_Click(object sender, EventArgs e)
        {
            UploadImageProfile();
        }
    }

    }