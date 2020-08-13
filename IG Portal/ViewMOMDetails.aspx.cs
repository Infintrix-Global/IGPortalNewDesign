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
    public partial class ViewMOMDetails : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindMOMDetails();

            }
        }

        public void BindMOMDetails()
        {
            try
            {
                DataSet dtMOM = new DataSet();

                dtMOM = objTask.GetMOMDetailsByID(Convert.ToInt32(Session["MOMID"].ToString()));
                if (dtMOM.Tables[0] != null)
                {
                    lblAgenda.Text = dtMOM.Tables[0].Rows[0]["Agenda"].ToString();
                    lblAttendee.Text = dtMOM.Tables[0].Rows[0]["AttendeeList"].ToString();
                    lblFromTime.Text = dtMOM.Tables[0].Rows[0]["FromTime"].ToString();
                    lblInitiator.Text = dtMOM.Tables[0].Rows[0]["Initiator"].ToString();
                    lblMeetingDate.Text = dtMOM.Tables[0].Rows[0]["MeetingDate"].ToString();
                    lblProjectName.Text = dtMOM.Tables[0].Rows[0]["PName"].ToString();
                    lblMeetingPlace.Text = dtMOM.Tables[0].Rows[0]["MeetingPlaceName"].ToString();
                    lblToTime.Text = dtMOM.Tables[0].Rows[0]["ToTime"].ToString();
                    
                }
                if (dtMOM.Tables[1] != null)
                {
                    GridMOMPoints.DataSource = dtMOM.Tables[1];
                    GridMOMPoints.DataBind();

                }
            }
            catch (Exception ex)
            {

            }
        }

        

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Notifications.aspx");

        }
    }

}