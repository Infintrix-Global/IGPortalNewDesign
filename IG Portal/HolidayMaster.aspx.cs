using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class HolidayMaster : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindYear();
                GetHolidayList();

            }
        }

        public void BindYear()
        {
            ddlYear.DataSource = objCommon.GetYearFromHolidayMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlYear.DataTextField = "Year";
            ddlYear.DataValueField = "Year";
            ddlYear.DataBind();
            ddlYear.SelectedValue = DateTime.Now.Year.ToString();
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            _isInserted = objCommon.AddHoliday(txtHolidayName.Text,txtHolidayDesription.Text,txtDate.Text,Session["LoginID"].ToString());
            if (_isInserted == -1)
            {

                lblmsg.Text = "Failed to Add Holiday";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                GetHolidayList();
            }
            else if (_isInserted == 0)
            {

                lblmsg.Text = "Holiday Exists";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                lblmsg.Text = "Holiday Added ";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                Clear();
                GetHolidayList();
            }
        }

        public void GetHolidayList()
        {
            DataTable dt = new DataTable();
            dt = objCommon.GetHolidayMaster(ddlYear.SelectedValue);
            GridHoliday.DataSource = dt;
            GridHoliday.DataBind();
            count.Text = "Number of Holidays =" + dt.Rows.Count;
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            Clear();

        }
        public void Clear()
        {
            txtHolidayName.Text = "";
            txtHolidayDesription.Text = "";
            txtDate.Text = "";
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetHolidayList();
        }
    }
}