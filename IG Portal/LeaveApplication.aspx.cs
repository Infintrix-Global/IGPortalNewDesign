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
    public partial class LeaveApplication : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
               // rgvStartDate.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");
               // rgvEndDate.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");
                txtFromDate.Attributes["min"] =  Convert.ToDateTime(DateTime.Today).ToString("yyyy-MM-dd");// DateTime.Today.ToString("yyyy-MM-dd");
                BindLeaveMaster();
                BindGridLeave();
            }
        }

        public void BindLeaveMaster()
        {
            ddlLeaveType.DataSource = objCommon.GetLeaveMaster();
            ddlLeaveType.DataTextField = "LeaveName";
            ddlLeaveType.DataValueField = "ID";
            ddlLeaveType.DataBind();
            ddlLeaveType.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void txtFromDate_TextChanged(object sender, EventArgs e)
        {
            if(txtFromDate.Text!="")
            {
              // rgvEndDate.ValueToCompare = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
               txtToDate.Attributes["min"] = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                txtToDate.Text = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
           
            }
            else
            {
                txtToDate.Text = "";
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            System.TimeSpan duration = new System.TimeSpan(1, 0, 0, 0);
            TimeSpan ts =  Convert.ToDateTime(txtToDate.Text).Subtract(Convert.ToDateTime(txtFromDate.Text)).Add(duration) ;
            try
            {
                Leave objLeaveApplication = new Leave()
                {
                    LoginID = Convert.ToInt32(Session["LoginID"].ToString()),
                    ApplicationDate = DateTime.Now.ToString(),
                    FromDate = txtFromDate.Text,
                    ToDate = txtToDate.Text,
                    Reason = txtReason.Text,
                    Status = "1",
                    LeaveType = ddlLeaveType.SelectedValue,
                    Days = (Convert.ToInt32(ts.Days)).ToString()

                };

                _isInserted = objTask.Add_Leave(objLeaveApplication);

                if (_isInserted == -1)
                {
                    lblMessage.Text = "Failed to Add Leave" + objLeaveApplication.ApplicationDate + " " + Convert.ToDateTime(objLeaveApplication.ToDate).ToString("dd/MMM/yyyy") + " " +objLeaveApplication.Days;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {

                    lblMessage.Text = "Leave Added";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                 //   objCommon.SendMailLeaveApplication( objLeaveApplication);
                    BindGridLeave();
                }

            }

            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace);
            }
        }

        public void BindGridLeave()
        {
            DataSet dtLeaveDetails;

            dtLeaveDetails = objTask.GetLeaveDetailsByEmployee(Session["LoginID"].ToString());
                GridLeave.DataSource = dtLeaveDetails.Tables[0];
            GridLeave.DataBind();
            count.Text = "Number of Leave =" + dtLeaveDetails.Tables[0].Rows.Count;
                GridFillTask();
           
            void GridFillTask()
            {

                
                lblctpl.Text= dtLeaveDetails.Tables[1].Rows[0]["TotalPL"].ToString();
                lblctsl.Text = dtLeaveDetails.Tables[1].Rows[0]["TotalSL"].ToString();
               
                lblcapl.Text = dtLeaveDetails.Tables[1].Rows[0]["ApprovedPL"].ToString();
                lblcasl.Text = dtLeaveDetails.Tables[1].Rows[0]["ApprovedSL"].ToString();
              
                lblcrpl.Text = dtLeaveDetails.Tables[1].Rows[0]["RemainingPL"].ToString();
                lblcrsl.Text = dtLeaveDetails.Tables[1].Rows[0]["RemainingSL"].ToString();


                ViewState["dirState"] = dtLeaveDetails;
                ViewState["sortdr"] = "Asc";
            }
        }


        protected void GridLeave_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridLeave.PageIndex = e.NewPageIndex;
            BindGridLeave();
        }

        protected void GridLeave_Sorting(object sender, GridViewSortEventArgs e)
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
                GridLeave.DataSource = dtrslt;
                GridLeave.DataBind();
            }
        }
    }
}