using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnchanngepass_Click(object sender, EventArgs e)
        {
            int _isUpdated;
            _isUpdated = objCommon.UpdatePassword(txtUserName.Text.Trim(),objCommon.Encrypt(txtPassword.Text.Trim()));
            if (_isUpdated > 0)
            {
                lblCPass.Text = "Password Successfully Changed";
                txtPassword.Text = "";
                txtConfirmpass.Text = "";
            }
            else
            {
                lblCPass.Text = "Password Changed Not Successfully ";
            }
        }

        protected void btnOTP_Click(object sender, EventArgs e)
        {
            DataTable dtCheckEmail = new DataTable();
            if ((dtCheckEmail = objCommon.CheckEmailExists(txtUserName.Text.Trim())).Rows.Count > 0)
            {
                objCommon.SendMailForgotPassword(txtUserName.Text);
                lblVEmail.Text = "";
                dOTP.Visible = true;
                dEmail.Visible = false;
            }
            else
            {
                lblVEmail.Text = "Invalid Email-ID";
            }

        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            DataTable dtCheckOTP = new DataTable();
            if ((dtCheckOTP = objCommon.VerifyOTP(txtUserName.Text.Trim(), txtOTP.Text.Trim())).Rows.Count > 0)
            {
                dOTP.Visible = false;
                dPassword.Visible = true;
                lblVOTP.Text = "";
            }
            else
            {
                lblVOTP.Text = "Wrong OTP";
            }
        }

        protected void btnOback_Click(object sender, EventArgs e)
        {

            dOTP.Visible = false;
            dEmail.Visible = true;
        }
    }
}