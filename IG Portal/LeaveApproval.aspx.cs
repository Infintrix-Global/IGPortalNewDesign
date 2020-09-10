﻿using System;
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

            if (e.CommandName == "Submit")

            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridLeave.Rows[rowIndex % 10];
                string leaveID = (row.FindControl("lblID") as Label).Text;
                GridView gldetails = (row.FindControl("gvmp") as GridView);
                lblppLeaveID.Text = leaveID;

                for (int i = 0; i < gldetails.Rows.Count; i++)
                {
                    string ldid = ((Label)gldetails.Rows[i].FindControl("lblldid")).Text;
                    string x = ((RadioButtonList)gldetails.Rows[i].FindControl("radLeave")).SelectedValue;
                    _isUpdated = objTask.ApproveLeaveDetailsManager(ldid, x);
                }

                ModalPopupExtender1.Show();
                //_isUpdated = objTask.ApproveLeaveManager(leaveID);
                //if (_isUpdated == -1)
                //{

                //    lblmsg.Text = "Failed to Change Status ";
                //    lblmsg.ForeColor = System.Drawing.Color.Red;

                //}

                //else
                //{

                //    lblmsg.Text = "Status Changed";
                //    lblmsg.ForeColor = System.Drawing.Color.Green;
                //    BindGridLeave();
                //    //objCommon.SendMailLeaveApproval(lid,"2");

                //}
            }

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
               // string vid = (e.Row.FindControl("lblApproved") as Label).Text;
                string uid = (e.Row.FindControl("lblApplied") as Label).Text;
                if (uid == "1.00")
                {
                    (e.Row.FindControl("lblAppliedLeave") as Label).Text = "Full Day";
                    (e.Row.FindControl("radLeave") as RadioButtonList).SelectedValue = "1";
                }
                else if (uid == "0.50")
                {
                    (e.Row.FindControl("lblAppliedLeave") as Label).Text = "Half Day";
                    (e.Row.FindControl("radLeave") as RadioButtonList).SelectedValue = "0.5";
                    (e.Row.FindControl("radLeave") as RadioButtonList).Items.RemoveAt(1);
                    
                }
                


                

            }
        }

        protected void radLeave_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isUpdated = -1;
            _isUpdated = objTask.ApproveLeaveManager(lblppLeaveID.Text,txtComment.Text);
            if (_isUpdated == -1)
            {

                lblmsg.Text = "Failed to Change Status ";
                lblmsg.ForeColor = System.Drawing.Color.Red;

            }

            else
            {

                lblmsg.Text = "Status Changed";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                BindGridLeave();
                //objCommon.SendMailLeaveApproval(lid,"2");

            }
        }
    }
}