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
    public partial class Login : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //Session.Clear();
            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                txtUserName.Text = Request.Cookies["UserName"].Value;
                txtPassword.Attributes["value"] = Request.Cookies["Password"].Value;
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            LoginEntity _LoginEntity = new LoginEntity();
            _LoginEntity.UserName = txtUserName.Text;
            _LoginEntity.Password = objCommon.Encrypt(txtPassword.Text.Trim());

            BAL_Login _ballogin = new BAL_Login();
            DataTable _dtLogin = _ballogin.getLoginDetails(_LoginEntity);


            if (Convert.ToInt32(_dtLogin.Rows[0][0].ToString()) == -1)
            {

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Login", "alert('Enter Correct User Name or Password')", true);
            }
            else
            {
                string x = txtimgcode.Text;
                string y = Session["CaptchaImageText"].ToString();
                if (txtimgcode.Text == Session["CaptchaImageText"].ToString())
                {
                    //lblmsg.Text = "Excellent.......";
                    if (CheckBoxRemember.Checked)
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                    }
                    Response.Cookies["UserName"].Value = txtUserName.Text.Trim();
                    Response.Cookies["Password"].Value = txtPassword.Text.Trim();
                    Session["LoginID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                    Session["CompanyID"] = int.Parse(_dtLogin.Rows[0]["CompanyID"].ToString());
                    Session["Role"] = _dtLogin.Rows[0]["Role"].ToString();
                    Session["Mobile"] = _dtLogin.Rows[0]["EmployeeID"].ToString();

                    Session["EmployeeName"] = _dtLogin.Rows[0]["EmployeeName"].ToString();
/*admin */
                    if (_dtLogin.Rows[0]["Role"].ToString() == "2" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/Notifications.aspx");
                    }
                    /*manager */
                    if (_dtLogin.Rows[0]["Role"].ToString() == "4" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/Notifications.aspx");
                    }
                    /*consultant */
                    if (_dtLogin.Rows[0]["Role"].ToString() == "7" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/Notifications.aspx");
                    }
                    /*employee */
                    else if (_dtLogin.Rows[0]["Role"].ToString() == "1" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/EmployeeDashBoardWM.aspx");

                    }
                    /*client */
                    else if (_dtLogin.Rows[0]["Role"].ToString() == "8" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/ClientDashBoard.aspx");

                    }
                }
                else
                {
                    lblmsg.Text = "image code is not valid.";
                }
                this.txtimgcode.Text = "";
                
                
            }
        }
    }
}