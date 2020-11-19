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
    public partial class AddNews : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        static string NewsID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoginID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (Request.QueryString["NewsID"] != null)
                {
                    Session["NewsID"] = objCommon.Decrypt(Request.QueryString["NewsID"]);
                    btAdd.Text = "Update";
                }
                else
                {
                    Session["NewsID"] = null;
                    btAdd.Text = "Add";
                }
                NewsID = Session["NewsID"] as string;
                if (!string.IsNullOrEmpty(NewsID))
                {
                    //txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    AutoFillNews();
                }
                txtDate.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd"); ;

            }
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            if (string.IsNullOrEmpty(NewsID))
            {
                _isInserted = objCommon.AddNews(Session["LoginID"].ToString(), radType.SelectedValue, txtDate.Text, txtTitle.Text, CKEditor1.Text);
            }
            else
            {
                _isInserted = objCommon.UpdateNews(Session["LoginID"].ToString(), radType.SelectedValue, txtDate.Text, txtTitle.Text, CKEditor1.Text,NewsID);
            }
            if (_isInserted == -1)
            {

                lblmsg.Text = "Failed to Add News/Announcement";
                lblmsg.ForeColor = System.Drawing.Color.Red;
               
            }
            
            else
            {

                lblmsg.Text = "News/Announcement Added ";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                btclear_Click(sender,e);
                Response.Redirect("~/ViewNews.aspx");
            }
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            txtTitle.Text = "";
            txtDate.Text = "";
            CKEditor1.Text = "";
        }

        public void AutoFillNews()
        {
            DataTable dt = new DataTable();
          
            dt = objTask.GetNewsDetailsByID(NewsID);
            txtTitle.Text = dt.Rows[0]["Title"].ToString();
            CKEditor1.Text = dt.Rows[0]["Description"].ToString();
           txtDate.Text = Convert.ToDateTime(dt.Rows[0]["Date"].ToString()).ToString("yyyy-MM-dd");
            radType.SelectedValue = dt.Rows[0]["Type"].ToString();
        }
    }
}