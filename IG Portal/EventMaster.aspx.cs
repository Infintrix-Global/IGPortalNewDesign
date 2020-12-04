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
    public partial class EventMaster : System.Web.UI.Page
    {

        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        static string EventID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeMaster();
                if (Session["LoginID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (Request.QueryString["EventID"] != null)
                {
                    Session["EventID"] = objCommon.Decrypt(Request.QueryString["EventID"]);
                }
                else
                {
                    Session["NewsID"] = null;
                }
                EventID = Session["EventID"] as string;
                if (!string.IsNullOrEmpty(EventID))
                {
                    //txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    AutoFillEvent();
                }
            }
        }

        public void BindEmployeeMaster()
        {


            chkAttendee.DataSource = objCommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            chkAttendee.DataTextField = "EmployeeName";
            chkAttendee.DataValueField = "ID";
            chkAttendee.DataBind();

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            if (string.IsNullOrEmpty(EventID))
            {
                _isInserted = objCommon.AddEvent(Session["LoginID"].ToString(), txtDate.Text, txtLocation.Text, txtTitle.Text, CKEditor1.Text);
                foreach (ListItem item in chkAttendee.Items)
                {
                    if (item.Selected)
                    {
                        objCommon.AddEmployeeEvent(_isInserted, item.Value);
                    }
                }
            }
            else
            {
                _isInserted = objCommon.UpdateEvent(Session["LoginID"].ToString(), txtDate.Text, txtLocation.Text, txtTitle.Text, CKEditor1.Text, EventID);
                foreach (ListItem item in chkAttendee.Items)
                {
                    if (item.Selected)
                    {
                        objCommon.AddEmployeeEvent(Convert.ToInt32(EventID), item.Value);
                    }
                }
            }
            if (_isInserted == -1)
            {

                lblmsg.Text = "Failed to Add Event";
                lblmsg.ForeColor = System.Drawing.Color.Red;

            }

            else
            {

                lblmsg.Text = "Event Added ";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                btclear_Click(sender, e);
                Response.Redirect("~/ViewEvent.aspx");
            }
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            txtTitle.Text = "";
            txtDate.Text = "";
            CKEditor1.Text = "";
            chkAttendee.ClearSelection();
            txtLocation.Text = "";
        }

        public void AutoFillEvent()
        {
            DataSet dt = new DataSet();

            dt = objTask.GetEventDetailsByID(EventID);
            txtTitle.Text = dt.Tables[0].Rows[0]["Title"].ToString();
            CKEditor1.Text = dt.Tables[0].Rows[0]["Description"].ToString();
            txtDate.Text = Convert.ToDateTime(dt.Tables[0].Rows[0]["Date"].ToString()).ToString("yyyy-MM-dd");
           txtLocation.Text= dt.Tables[0].Rows[0]["Location"].ToString();
            foreach (DataRow dr in dt.Tables[1].Rows)
            {
                foreach (ListItem item in chkAttendee.Items)
                {
                    if (item.Value == dr["EmployeeID"].ToString())
                        item.Selected = true;
                }
                
            }
            if(dt.Tables[2].Rows.Count>0)
            {
                List<ListItem> files = new List<ListItem>();
                for (int i = 0; i < dt.Tables[2].Rows.Count; i++)
                {
                    string fileName = dt.Tables[2].Rows[i]["FileName"].ToString();
                    files.Add(new ListItem(fileName, "~/EventGallery/" + fileName));
                }
                DataListGallery.DataSource = files;
                DataListGallery.DataBind();
                photo.Visible = true;
            }
        }
    }
}