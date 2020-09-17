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

        public static DataTable dtDate = new DataTable()
        { Columns = { "Date" } };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // rgvStartDate.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");
                // rgvEndDate.ValueToCompare = DateTme.Today.ToString("yyyy-MM-dd");
                int x = DateTime.Today.Day;
                  
                txtFromDate.Attributes["min"] =  Convert.ToDateTime(DateTime.Today.AddDays(-x+1)).ToString("yyyy-MM-dd");// DateTime.Today.ToString("yyyy-MM-dd");
                BindLeaveMaster();
                BindGridLeave("1");
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
                    Days = GridLeaveDay.Rows.Count.ToString()

                };

                _isInserted = objTask.Add_Leave(objLeaveApplication);

                if (_isInserted == -1)
                {
                    lblMessage.Text = "Failed to Add Leave" + objLeaveApplication.ApplicationDate + " " + Convert.ToDateTime(objLeaveApplication.ToDate).ToString("dd/MMM/yyyy") + " " +objLeaveApplication.Days;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    for (int i = 0; i < GridLeaveDay.Rows.Count; i++)
                    {
                        string x=((RadioButtonList)GridLeaveDay.Rows[i].FindControl("radLeave")).SelectedValue;
                    }
                    objTask.AddLeaveDetails(GridLeaveDay,_isInserted);
                    lblMessage.Text = "Leave Added";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    objCommon.SendMailLeaveApplication( objLeaveApplication,ddlLeaveType.SelectedItem.Text);
                    BindGridLeave("1");
                    AddNew.Visible = true;
                    LeaveNumbers.Visible = true;
                    newLeave.Visible = false;
                }

            }

            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace);
            }
        }

        public void BindGridLeave(string mode)
        {
            DataSet dtLeaveDetails;

            dtLeaveDetails = objTask.GetLeaveDetailsByEmployee(Session["LoginID"].ToString(),mode);
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
            BindGridLeave(ddlStatus.SelectedValue);
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

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            dtDate.Clear();
            DataTable dtChk= objTask.CheckAppliedLeave(Session["LoginID"].ToString(),Convert.ToDateTime(txtFromDate.Text).ToString("dd/MMM/yy"),Convert.ToDateTime(txtToDate.Text).ToString("dd/MMM/yy"));
            if (dtChk.Rows.Count == 0)
            {
                for (DateTime date = Convert.ToDateTime(txtFromDate.Text); date <= Convert.ToDateTime(txtToDate.Text); date = date.AddDays(1))
                {
                    if ((date.DayOfWeek != DayOfWeek.Saturday) && (date.DayOfWeek != DayOfWeek.Sunday))
                    {
                        dtDate.Rows.Add(date.ToShortDateString());
                    }
                }


                GridLeaveDay.DataSource = dtDate;
                GridLeaveDay.DataBind();
                lblMessage.Text = "";
                divDetails.Visible = true;
            }
            else
            {
                lblMessage.Text = "Already Applied for leave in this date range";
            }
            
        }

      
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            AddNew.Visible = false;
            LeaveNumbers.Visible = false;
            newLeave.Visible = true;
        }

        protected void radLeave_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridLeave_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int vid = Convert.ToInt32(GridLeave.DataKeys[e.Row.RowIndex].Value.ToString());
                GridView gvDetails = e.Row.FindControl("gvmp") as GridView;
                gvDetails.DataSource = objTask.GetLeaveDateDetailsByLeaveID(vid);
                gvDetails.DataBind();


            }
        }

        protected void gvmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string vid = (e.Row.FindControl("lblApproved") as Label).Text;
                string uid = (e.Row.FindControl("lblApplied") as Label).Text;
                if(uid =="1.00")
                {
                    (e.Row.FindControl("lblAppliedLeave") as Label).Text= "Full Day";
                }
                else if(uid =="0.50")
                {
                    (e.Row.FindControl("lblAppliedLeave") as Label).Text = "Half Day";
                }


                if (vid == "1.00")
                {
                    (e.Row.FindControl("lblApprovedLeave") as Label).Text = "Full Day";
                }
                else if (vid == "0.50")
                {
                    (e.Row.FindControl("lblApprovedLeave") as Label).Text = "Half Day";
                }
                else if (vid == "0.00")
                {
                    (e.Row.FindControl("lblApprovedLeave") as Label).Text = "Rejected";
                }
                else if (vid == "")
                {
                    (e.Row.FindControl("lblApprovedLeave") as Label).Text = "Pending Approval";
                }

            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            BindGridLeave(ddlStatus.SelectedValue);
        }
    }
}