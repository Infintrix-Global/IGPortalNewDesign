using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["Role"] is null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    if (Session["Role"].ToString() == "Admin")
                    {

                        pbAdmin.Visible = true;
                        pbEmployee.Visible = false;

                    }
                    else if (Session["Role"].ToString() == "Employee")
                    {

                        pbEmployee.Visible = true;
                        pbAdmin.Visible = false;
                    }
                }
            }
        }
        protected void btnchanngepass_Click(object sender, EventArgs e)
        {
            int _isUpdated;
            _isUpdated = objCommon.ChangePassword(Session["Mobile"].ToString(), objCommon.Encrypt(txtPassword.Text.Trim()));
            if (_isUpdated > 0)
            {
                lblCPass.Text = "Password Successfully Changed";
                txtPassword.Text = "";
                txtConfirmpass.Text = "";
                LoginLink.Visible = true;
                dPassword.Visible = false;
                //Response.Redirect("Login.aspx");
                
            }
            else
            {
                lblCPass.Text = "Password Changed Not Successfully ";
            }
        }


        

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            DataTable dtCheckpassword = new DataTable();
            if ((dtCheckpassword = objCommon.CheckCurrentPassword(Session["Mobile"].ToString(),objCommon.Encrypt(txtOldPass.Text))).Rows.Count > 0)
            {
                dPassword.Visible = true;
                dOldPass.Visible = false;
                lblVPass.Text = "";
            }
            else
            {
                lblVPass.Text = "Your Old Password is not correct.Please enter coreect password";
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}