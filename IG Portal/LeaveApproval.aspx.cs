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
    public partial class LeaveApproval : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                BindGridLeave();
                lblmsg.Text = "";
            }
        }

        public void BindGridLeave()
        {
            DataTable dtLeaveDetails;

            dtLeaveDetails = objTask.GetPendingLeaveByManager(Session["LoginID"].ToString());
            GridLeave.DataSource = dtLeaveDetails;
            GridLeave.DataBind();
            count.Text = "Number of Leave Applications =" + dtLeaveDetails.Rows.Count;
            GridFillTask();

            void GridFillTask()
            {

                count.Text = "Number of Applications= " + dtLeaveDetails.Rows.Count;

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

        protected void GridLeave_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           int _isUpdated = -1;
            if (e.CommandName == "Approve")

            {
                int lid = Convert.ToInt32(e.CommandArgument);
                _isUpdated = objTask.ApproveLeave(lid);
                if (_isUpdated == -1)
                {

                    lblmsg.Text = "Failed to Approve Leave";
                    lblmsg.ForeColor = System.Drawing.Color.Red;

                }
                
                else
                {

                    lblmsg.Text = "Leave Approved";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    BindGridLeave();
                    //objCommon.SendMailLeaveApproval(lid,"2");
                    
                }
            }

            if (e.CommandName == "Reject")

            {
                int lid = Convert.ToInt32(e.CommandArgument);
                _isUpdated = objTask.RejectLeave(lid);
                if (_isUpdated == -1)
                {

                    lblmsg.Text = "Failed to Reject Leave";
                    lblmsg.ForeColor = System.Drawing.Color.Red;

                }

                else
                {

                    lblmsg.Text = "Leave Rejected";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    BindGridLeave();
                 //   objCommon.SendMailLeaveApproval(lid, "3");
                    
                }
            }
        }

        
    }
}