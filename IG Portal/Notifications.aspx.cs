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
    public partial class Notifications : System.Web.UI.Page
    {
        General objGeneral = new General();
        DataSet dtNotifications = new DataSet();
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                //BindNotifications();
                BindNotificationMOM();
               BindNotificationAssign();
               BindNotificationBug();
               BindNotificationSolvedBug();
                BindNotificationSolvedTask();
                BindProjectMaster();
            }
        }

        //public void BindNotifications()
        //{
        //    dtNotifications = objTask.GetNotifications(Session["LoginID"].ToString());
        //    GridNotification.DataSource = dtNotifications;
        //    GridNotification.DataBind();
        //    count.Text = "Number of Notifications =" + dtNotifications.Rows.Count;
        //    ViewState["dirState"] = dtNotifications;
        //    ViewState["sortdr"] = "Asc";
        //}

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objCommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";
            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select Project ---", "0"));
        }
        public void BindNotificationMOM()
        {
            dtNotifications = objTask.GetNotifications(Session["LoginID"].ToString());
            GridNotificationMOM.DataSource = dtNotifications.Tables[0];
            GridNotificationMOM.DataBind();
            count1.Text = "Number of Notifications =" + dtNotifications.Tables[0].Rows.Count;
            if(dtNotifications.Tables[0].Rows.Count == 0)
            {
                btnConfirm.Visible = false;
                btnReject.Visible = false;
            }
            else
            {
                btnConfirm.Visible = true;
                btnReject.Visible = true;
            }
            ViewState["dirState1"] = dtNotifications.Tables[0];
            ViewState["sortdr1"] = "Asc";
        }

        public void BindNotificationAssign()
        {
            ddlDeveloper.DataSource = objCommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlDeveloper.DataTextField = "EmployeeName";
            ddlDeveloper.DataValueField = "ID";
            ddlDeveloper.DataBind();

            ddlDeveloper.Items.Insert(0, new ListItem("--- Select Developer ---", "0"));
            dtNotifications = objTask.GetNotifications(Session["LoginID"].ToString());
            GirdNotificationAssign.DataSource = dtNotifications.Tables[1];
            GirdNotificationAssign.DataBind();
            if (dtNotifications.Tables[1].Rows.Count == 0)
            {
                btnAssign.Visible = false;
                ddlDeveloper.Visible = false;
            }
            else
            {
                btnAssign.Visible = true;
                ddlDeveloper.Visible = true;
            }
            count2.Text = "Number of Notifications =" + dtNotifications.Tables[1].Rows.Count;
            ViewState["dirState2"] = dtNotifications.Tables[1];
            ViewState["sortdr2"] = "Asc";
        }

        public void BindNotificationBug()
        {
            dtNotifications = objTask.GetNotifications(Session["LoginID"].ToString());
            GirdNotificationBug.DataSource = dtNotifications.Tables[2];
            GirdNotificationBug.DataBind();
            count3.Text = "Number of Notifications =" + dtNotifications.Tables[2].Rows.Count;
            ViewState["dirState3"] = dtNotifications.Tables[2];
            ViewState["sortdr3"] = "Asc";
        }

        public void BindNotificationSolvedBug()
        {
            dtNotifications = objTask.GetNotifications(Session["LoginID"].ToString());
            GridNotificationSolvedBug.DataSource = dtNotifications.Tables[3];
            GridNotificationSolvedBug.DataBind();
            count4.Text = "Number of Notifications =" + dtNotifications.Tables[3].Rows.Count;
            if (dtNotifications.Tables[3].Rows.Count == 0)
            {
                btnClose.Visible = false;
               
            }
            else
            {
                btnClose.Visible = true;
               
            }
            ViewState["dirState4"] = dtNotifications.Tables[3];
            ViewState["sortdr4"] = "Asc";
        }

        public void BindNotificationSolvedTask()
        {
            dtNotifications = objTask.GetNotifications(Session["LoginID"].ToString());
            GridNotificationSolvedTask.DataSource = dtNotifications.Tables[4];
            GridNotificationSolvedTask.DataBind();
            count5.Text = "Number of Notifications =" + dtNotifications.Tables[4].Rows.Count;
            if (dtNotifications.Tables[4].Rows.Count == 0)
            {
                btnCloseTask.Visible = false;

            }
            else
            {
                btnCloseTask.Visible = true;

            }
            ViewState["dirState5"] = dtNotifications.Tables[4];
            ViewState["sortdr5"] = "Asc";
        }

        //protected void GridNotification_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GridNotification.PageIndex = e.NewPageIndex;
        //    BindNotifications();
        //}

        //protected void GridNotification_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    DataTable dtrslt = (DataTable)ViewState["dirState"];
        //    if (dtrslt.Rows.Count > 0)
        //    {
        //        if (Convert.ToString(ViewState["sortdr"]) == "Asc")
        //        {
        //            dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
        //            ViewState["sortdr"] = "Desc";
        //        }
        //        else
        //        {
        //            dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
        //            ViewState["sortdr"] = "Asc";
        //        }
        //        GridNotification.DataSource = dtrslt;
        //        GridNotification.DataBind();
        //    }
        //}

        //protected void GridNotification_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Row.RowType == DataControlRowType.DataRow)
        //        {
        //            DataTable dtNotify = new DataTable();
        //            int nid = Convert.ToInt32(GridNotification.DataKeys[e.Row.RowIndex].Value.ToString());
        //            dtNotify = objTask.GetNotificationsByID(nid);


        //            if (dtNotify.Rows[0]["Type"].ToString() == "1")
        //            {
        //                ((Button)e.Row.FindControl("btnConfirm")).Visible = true;
        //                ((Button)e.Row.FindControl("btnReject")).Visible = true;
        //                ((Button)e.Row.FindControl("btnAssign")).Visible = false;
        //                ((LinkButton)e.Row.FindControl("btnDetails")).Visible = false;
        //                ((Button)e.Row.FindControl("btnClosed")).Visible = false;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = false;
        //            }
        //            if (dtNotify.Rows[0]["Type"].ToString() == "2")
        //            {
        //                ((Button)e.Row.FindControl("btnConfirm")).Visible = false;
        //                ((Button)e.Row.FindControl("btnReject")).Visible = false;
        //                ((Button)e.Row.FindControl("btnAssign")).Visible = true;
        //                ((Button)e.Row.FindControl("btnClosed")).Visible = false;
        //                ((LinkButton)e.Row.FindControl("btnDetails")).Visible = true;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = true;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataSource= objCommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataTextField= "EmployeeName";
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataValueField = "ID";
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).DataBind();

        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Items.Insert(0, new ListItem("--- Select Developer ---", "0"));
        //            }


        //            if (dtNotify.Rows[0]["Type"].ToString() == "3")
        //            {
        //                ((Button)e.Row.FindControl("btnConfirm")).Visible = false;
        //                ((Button)e.Row.FindControl("btnReject")).Visible = false;
        //                ((Button)e.Row.FindControl("btnAssign")).Visible = false;
        //                ((Button)e.Row.FindControl("btnClosed")).Visible = false;
        //                ((LinkButton)e.Row.FindControl("btnDetails")).Visible = true;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = false;
        //            }

        //            if (dtNotify.Rows[0]["Type"].ToString() == "4")
        //            {
        //                ((Button)e.Row.FindControl("btnConfirm")).Visible = false;
        //                ((Button)e.Row.FindControl("btnReject")).Visible = false;
        //                ((Button)e.Row.FindControl("btnAssign")).Visible = false;
        //                ((Button)e.Row.FindControl("btnClosed")).Visible = true;
        //                ((LinkButton)e.Row.FindControl("btnDetails")).Visible = true;
        //                ((DropDownList)e.Row.FindControl("ddlDeveloper")).Visible = false;
        //            }
        //        }
        //    }
        //    catch(Exception ex)
        //    {

        //    }
        //}

        //protected void GridNotification_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    try
        //    {
        //        if (e.CommandName == "Confirm")
        //        {
        //            int _IsConfirm = -1;
        //            int id = Convert.ToInt32(e.CommandArgument);
        //             _IsConfirm = objTask.ConfirmMOMNotification(id);
        //            if(_IsConfirm==-1)
        //            {
        //                lblmsg.Text = "Failed To Confirm";
        //                lblmsg.ForeColor = System.Drawing.Color.Red;
        //            }
        //            else
        //            {
        //                lblmsg.Text = "TimeSheet Added for Meeting";
        //                lblmsg.ForeColor = System.Drawing.Color.Green;
        //            }
        //        }

        //        if (e.CommandName == "Reject")
        //        {
        //            int _IsConfirm = -1;
        //            int id = Convert.ToInt32(e.CommandArgument);
        //            _IsConfirm = objTask.RejectMOMNotification(id);
        //            if (_IsConfirm == -1)
        //            {
        //                lblmsg.Text = "Failed to Reject";
        //                lblmsg.ForeColor = System.Drawing.Color.Red;
        //            }
        //            else
        //            {

        //                lblmsg.Text = "Rejected";
        //                lblmsg.ForeColor = System.Drawing.Color.Green;
        //                BindNotifications();
        //            }
        //        }

        //        if (e.CommandName == "Assign")
        //        {
        //            int _IsConfirm = -1;

        //            int rowIndex = Convert.ToInt32(e.CommandArgument);
        //            GridViewRow row = GridNotification.Rows[rowIndex];
        //            string developerID = (row.FindControl("ddlDeveloper") as DropDownList).SelectedValue;
        //            string id = (row.FindControl("lblID") as Label).Text;
        //            if (developerID == "0")
        //            {
        //                lblmsg.Text = "Failed-Please Select Developer ";
        //                lblmsg.ForeColor = System.Drawing.Color.Red;
        //            }
        //            else
        //            {
        //                _IsConfirm = objTask.AssignBug(Convert.ToInt32(id), developerID);
        //                if (_IsConfirm == -1)
        //                {
        //                    lblmsg.Text = "Failed To Assign";
        //                    lblmsg.ForeColor = System.Drawing.Color.Red;
        //                }
        //                else
        //                {

        //                    lblmsg.Text = "Bug Assigned";
        //                    lblmsg.ForeColor = System.Drawing.Color.Green;
        //                    BindNotifications();
        //                }
        //            }
        //        }

        //        if (e.CommandName == "Details")
        //        {
        //            int id = Convert.ToInt32(e.CommandArgument);
        //            Session["BugID"] = id.ToString();
        //            Response.Redirect("ViewBugDetails.aspx");
        //        }

        //        if (e.CommandName == "Close")
        //        {
        //            int _IsClosed = -1;

        //            int id = Convert.ToInt32(e.CommandArgument);

        //            _IsClosed = objTask.CloseBug(Convert.ToInt32(id));
        //                if (_IsClosed == -1)
        //                {
        //                    lblmsg.Text = "Failed To Close";
        //                    lblmsg.ForeColor = System.Drawing.Color.Red;
        //                }
        //                else
        //                {

        //                    lblmsg.Text = "Bug Closed";
        //                    lblmsg.ForeColor = System.Drawing.Color.Green;
        //                    BindNotifications();
        //                }

        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}

        protected void GridNotificationMOM_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Clear();
            GridNotificationMOM.PageIndex = e.NewPageIndex;
            BindNotificationMOM();
        }

        protected void GridNotificationMOM_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState1"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr1"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr1"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr1"] = "Asc";
                }
                GridNotificationMOM.DataSource = dtrslt;
                GridNotificationMOM.DataBind();
            }
        }

        protected void GridNotificationMOM_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Clear();
            //try
            //{
            //    if (e.CommandName == "Confirm")
            //    {
            //        int _IsConfirm = -1;
            //        int id = Convert.ToInt32(e.CommandArgument);
            //        _IsConfirm = objTask.ConfirmMOMNotification(id);
            //        if (_IsConfirm == -1)
            //        {
            //            lblmsg1.Text = "Failed To Confirm";
            //            lblmsg1.ForeColor = System.Drawing.Color.Red;
            //        }
            //        else
            //        {
            //            lblmsg1.Text = "TimeSheet Added for Meeting";
            //            lblmsg1.ForeColor = System.Drawing.Color.Green;
            //        }
            //    }

            //    if (e.CommandName == "Reject")
            //    {
            //        int _IsConfirm = -1;
            //        int id = Convert.ToInt32(e.CommandArgument);
            //        _IsConfirm = objTask.RejectMOMNotification(id);
            //        if (_IsConfirm == -1)
            //        {
            //            lblmsg1.Text = "Failed to Reject";
            //            lblmsg1.ForeColor = System.Drawing.Color.Red;
            //        }
            //        else
            //        {

            //            lblmsg1.Text = "Rejected";
            //            lblmsg1.ForeColor = System.Drawing.Color.Green;
            //            BindNotificationMOM();
            //        }
            //    }

            //}
            //catch (Exception ex)
            //{

            //}
        }


        protected void GirdNotificationAssign_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Clear();
            GirdNotificationAssign.PageIndex = e.NewPageIndex;
            BindNotificationAssign();
        }

        protected void GirdNotificationAssign_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState2"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr2"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr2"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr2"] = "Asc";
                }
                GirdNotificationAssign.DataSource = dtrslt;
                GirdNotificationAssign.DataBind();
            }
        }


        protected void GirdNotificationAssign_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Clear();
            //  try
            // {
            //if (e.CommandName == "Assign")
            //{
            //    int _IsConfirm = -1;

            //    int rowIndex = Convert.ToInt32(e.CommandArgument);
            //    GridViewRow row = GirdNotificationAssign.Rows[rowIndex];
            //    string developerID = (row.FindControl("ddlDeveloper") as DropDownList).SelectedValue;
            //    string id = (row.FindControl("lblID") as Label).Text;
            //    string bugid = (row.FindControl("lblBugID") as Label).Text;
            //    if (developerID == "0")
            //    {
            //        lblmsg2.Text = "Failed-Please Select Developer ";
            //        lblmsg2.ForeColor = System.Drawing.Color.Red;
            //    }
            //    else
            //    {
            //        _IsConfirm = objTask.AssignBug(Convert.ToInt32(id), developerID);
            //        if (_IsConfirm == -1)
            //        {
            //            lblmsg2.Text = "Failed To Assign";
            //            lblmsg2.ForeColor = System.Drawing.Color.Red;
            //        }
            //        else
            //        {

            //            lblmsg2.Text = "Bug Assigned";
            //            lblmsg2.ForeColor = System.Drawing.Color.Green;
            //            objCommon.SendMailAssignBug(bugid);
            //            BindNotificationAssign();
            //        }
            //    }
            //  }


            //if (e.CommandName == "Details")
            //{
            //    int id = Convert.ToInt32(e.CommandArgument);
            //    Session["BugID"] = id.ToString();
            //    Response.Redirect("ViewBugDetails.aspx");
            //}
            // }
            // catch (Exception ex)
            // {

            // }
        }


        protected void GirdNotificationBug_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Clear();
            GirdNotificationBug.PageIndex = e.NewPageIndex;
            BindNotificationBug();
        }

        protected void GirdNotificationBug_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState3"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr3"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr3"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr3"] = "Asc";
                }
                GirdNotificationBug.DataSource = dtrslt;
                GirdNotificationBug.DataBind();
            }
        }

        protected void GridNotificationSolvedBug_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Clear();
            GridNotificationSolvedBug.PageIndex = e.NewPageIndex;
            BindNotificationSolvedBug();
        }

        protected void GridNotificationSolvedBug_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState4"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr4"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr4"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr4"] = "Asc";
                }
                GridNotificationSolvedBug.DataSource = dtrslt;
                GridNotificationSolvedBug.DataBind();
            }
        }

        protected void GridNotificationSolvedBug_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Clear();
            //try
            //{
            //    if (e.CommandName == "Close")
            //    {
            //        int _IsClosed = -1;

            //        int id = Convert.ToInt32(e.CommandArgument);

            //        _IsClosed = objTask.CloseBug(Convert.ToInt32(id));
            //        if (_IsClosed == -1)
            //        {
            //            lblmsg4.Text = "Failed To Close";
            //            lblmsg4.ForeColor = System.Drawing.Color.Red;
            //        }
            //        else
            //        {

            //            lblmsg4.Text = "Bug Closed";
            //            lblmsg4.ForeColor = System.Drawing.Color.Green;
            //            BindNotificationSolvedBug();
            //        }

            //    }

            if (e.CommandName == "Reopen")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Session["BugIDReopen"] = id.ToString();
                Response.Redirect("~/AddBug.aspx?BugIDReopen=" + objCommon.Encrypt(Session["BugIDReopen"].ToString()));
               // Response.Redirect("AddBug.aspx");
            }


            //        //if (e.CommandName == "Details")
            //        //{
            //        //    int id = Convert.ToInt32(e.CommandArgument);
            //        //    Session["BugID"] = id.ToString();
            //        //    Response.Redirect("ViewBugDetails.aspx");
            //        //}
            //    }
            //catch (Exception ex)
            //{

            //}
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int _IsConfirm = -1;
            foreach (GridViewRow row in GridNotificationMOM.Rows)
            {
                if ((row.FindControl("chkSelect") as CheckBox).Checked)
                {
                    
                    int cid = Convert.ToInt32(GridNotificationMOM.DataKeys[row.RowIndex].Values[0].ToString());
                    _IsConfirm = objTask.ConfirmMOMNotification(cid);
                    if (_IsConfirm == -1)
                    {
                        lblmsg1.Text = "Failed To Confirm";
                        lblmsg1.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblmsg1.Text = "TimeSheet Added for Meeting";
                        lblmsg1.ForeColor = System.Drawing.Color.Green;
                       
                    }
                }
               
            }

            BindNotificationMOM();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int _IsConfirm = -1;
            foreach (GridViewRow row in GridNotificationMOM.Rows)
            {
                if ((row.FindControl("chkSelect") as CheckBox).Checked)
                {
                    int cid = Convert.ToInt32(GridNotificationMOM.DataKeys[row.RowIndex].Values[0].ToString());
                    _IsConfirm = objTask.RejectMOMNotification(cid);
                    if (_IsConfirm == -1)
                    {
                        lblmsg1.Text = "Failed to Reject";
                        lblmsg1.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblmsg1.Text = "Rejected";
                        lblmsg1.ForeColor = System.Drawing.Color.Green;
                       
                    }


                }
            }
            BindNotificationMOM();
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            try
            {
                int _IsConfirm = -1;
                foreach (GridViewRow row in GirdNotificationAssign.Rows)
                {
                    if ((row.FindControl("chkSelect") as CheckBox).Checked)
                    {

                        int cid = Convert.ToInt32(GirdNotificationAssign.DataKeys[row.RowIndex].Values[0].ToString());
                        string bugid = (row.FindControl("lblBugID") as Label).Text;
                        string developerID = ddlDeveloper.SelectedValue;
                        if (developerID == "0")
                        {
                            lblmsg2.Text = "Failed-Please Select Developer ";
                            lblmsg2.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            _IsConfirm = objTask.AssignBug(Convert.ToInt32(cid), developerID);
                            if (_IsConfirm == -1)
                            {
                                lblmsg2.Text = "Failed To Assign";
                                lblmsg2.ForeColor = System.Drawing.Color.Red;
                            }
                            else
                            {

                                lblmsg2.Text = "Bug Assigned";
                                lblmsg2.ForeColor = System.Drawing.Color.Green;
                                objCommon.SendMailAssignBug(bugid);
                                  
                            }
                        }
                    }
                   
                }
                BindNotificationAssign();
            }

            catch (Exception ex)
            {

            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {
                int count = 0;
                int _IsClosed = -1;
              
                foreach (GridViewRow row in GridNotificationSolvedBug.Rows)
                {
                    if ((row.FindControl("chkSelect") as CheckBox).Checked)
                    {
                        count = 1;
                        int cid = Convert.ToInt32(GridNotificationSolvedBug.DataKeys[row.RowIndex].Values[0].ToString());
                        _IsClosed = objTask.CloseBug(Convert.ToInt32(cid));
                        if (_IsClosed == -1)
                        {
                            lblmsg4.Text = "Failed To Close";
                            lblmsg4.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg4.Text = "Bug Closed";
                            lblmsg4.ForeColor = System.Drawing.Color.Green;
                            
                        }
                    }

                }
                if(count==0)
                {
                    lblmsg4.Text = "Please Select a Bug to Close";
                }
                BindNotificationSolvedBug();
            }
            catch (Exception ex)
            {

            }
        }

        protected void GirdNotificationBug_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                

                //if (e.CommandName == "Details")
                //{
                //    int id = Convert.ToInt32(e.CommandArgument);
                //    Session["BugID"] = id.ToString();
                //    Response.Redirect("ViewBugDetails.aspx");
                //}
            }
            catch (Exception ex)
            {

            }
        }

        protected void lnkDetails_Command(object sender, CommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Details")
                {
                    int bugID = Convert.ToInt32(e.CommandArgument);
                    DataSet dtBug = new DataSet();

                    dtBug = objTask.GetBugDetailsByID(Convert.ToInt32(bugID));
                    if (dtBug.Tables[0] != null)
                    {
                        lbltxtDetails.Text = dtBug.Tables[0].Rows[0]["BugDetails"].ToString();


                        //int id = Convert.ToInt32(e.CommandArgument);
                        //lblPmeLoanID.Text = id.ToString();

                        ModalPopupExtender1.Show();
                    }
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        public void Clear()
        {
            lblmsg1.Text = "";
            lblmsg2.Text = "";
            lblmsg4.Text = "";
            lblmsg3.Text = "";
            lblmsg5.Text = "";
        }

        protected void chckchanged(object sender, EventArgs e)

        {

            CheckBox chckheader = (CheckBox)GirdNotificationAssign.HeaderRow.FindControl("CheckBoxall");

            foreach (GridViewRow row in GirdNotificationAssign.Rows)

            {

                CheckBox chckrw = (CheckBox)row.FindControl("chkSelect");

                if (chckheader.Checked == true)

                {
                    chckrw.Checked = true;
                }
                else

                {
                    chckrw.Checked = false;
                }

            }

        }

        protected void chckchangedClose(object sender, EventArgs e)

        {

            CheckBox chckheader = (CheckBox)GridNotificationSolvedBug.HeaderRow.FindControl("CheckBoxall");

            foreach (GridViewRow row in GridNotificationSolvedBug.Rows)

            {

                CheckBox chckrw = (CheckBox)row.FindControl("chkSelect");

                if (chckheader.Checked == true)

                {
                    chckrw.Checked = true;
                }
                else

                {
                    chckrw.Checked = false;
                }

            }

        }

        protected void btnDetails_Command(object sender, CommandEventArgs e)
        {
            try
            {


                if (e.CommandName == "Details")
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    Session["MOMID"] = id.ToString();
                    Response.Redirect("ViewMOMDetails.aspx");
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnCloseTask_Click(object sender, EventArgs e)
        {
            try
            {

                int _IsClosed = -1;

                foreach (GridViewRow row in GridNotificationSolvedTask.Rows)
                {
                    if ((row.FindControl("chkSelect") as CheckBox).Checked)
                    {

                        int cid = Convert.ToInt32(GridNotificationSolvedTask.DataKeys[row.RowIndex].Values[0].ToString());
                        _IsClosed = objTask.CloseTask(Convert.ToInt32(cid));
                        if (_IsClosed == -1)
                        {
                            lblmsg5.Text = "Failed To Close";
                            lblmsg5.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg5.Text = "Task Closed";
                            lblmsg5.ForeColor = System.Drawing.Color.Green;

                        }
                    }

                }
                BindNotificationSolvedTask();
            }
            catch (Exception ex)
            {

            }
        }

        protected void chckchangedCloseTask(object sender, EventArgs e)

        {

            CheckBox chckheader = (CheckBox)GridNotificationSolvedTask.HeaderRow.FindControl("CheckBoxall");

            foreach (GridViewRow row in GridNotificationSolvedTask.Rows)

            {

                CheckBox chckrw = (CheckBox)row.FindControl("chkSelect");

                if (chckheader.Checked == true)

                {
                    chckrw.Checked = true;
                }
                else

                {
                    chckrw.Checked = false;
                }

            }

        }

        protected void GridNotificationSolvedTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Clear();
            GridNotificationSolvedTask.PageIndex = e.NewPageIndex;
            BindNotificationSolvedTask();
        }

        protected void GridNotificationSolvedTask_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState5"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr5"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr5"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr5"] = "Asc";
                }
                GridNotificationSolvedTask.DataSource = dtrslt;
                GridNotificationSolvedTask.DataBind();
            }
        }

        protected void GridNotificationSolvedTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Reopen")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Session["TaskIDReopen"] = id.ToString();
                Response.Redirect("AssignTask.aspx?TaskIDReopen=" + objCommon.Encrypt(Session["TaskIDReopen"].ToString()));
            }
        }

        protected void btnDetailsTask_Command(object sender, CommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Details")
                {
                    int assignedtaskID = Convert.ToInt32(e.CommandArgument);
                    DataTable dtTask = new DataTable();

                    dtTask = objTask.GetAssignedTaskDetailsByID(Convert.ToInt32(assignedtaskID));
                    if (dtTask != null)
                    {
                        lbltxtDetails.Text = dtTask.Rows[0]["TaskDetails"].ToString();


                        //int id = Convert.ToInt32(e.CommandArgument);
                        //lblPmeLoanID.Text = id.ToString();

                        ModalPopupExtender1.Show();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            if (ddlProjectName.SelectedIndex != 0)
            {
                string sqr = "Select N.* from Notification N inner join Bug B on N.BugID=B.ID " +
                "where LoginID=" + Session["LoginID"].ToString() +" and N.ISActive=1 and Type=4 and B.ProjectID= " + ddlProjectName.SelectedValue + "  order by NotificationDateTime desc";
            

            dt = objGeneral.GetDatasetByCommand(sqr);
            GridNotificationSolvedBug.DataSource = dt;
            GridNotificationSolvedBug.DataBind();
            count4.Text = "Number of Notifications =" + dt.Rows.Count;
            if (dt.Rows.Count == 0)
            {
                btnClose.Visible = false;

            }
            else
            {
                btnClose.Visible = true;

            }
            ViewState["dirState4"] = dt;
            ViewState["sortdr4"] = "Asc";
            }
        }
    }
}