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
    public partial class temp : System.Web.UI.Page
    {
        DataSet dtNotifications = new DataSet();
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //BindNotifications();
                BindNotificationMOM();
                
            }
        }

        public void BindNotificationMOM()
        {
            dtNotifications = objTask.GetNotifications(Session["LoginID"].ToString());
            GridNotificationMOM.DataSource = dtNotifications.Tables[0];
            GridNotificationMOM.DataBind();
            count1.Text = "Number of Notifications =" + dtNotifications.Tables[0].Rows.Count;
            ViewState["dirState1"] = dtNotifications.Tables[0];
            ViewState["sortdr1"] = "Asc";
        }

        protected void GridNotificationMOM_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
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
            try
            {
                if (e.CommandName == "Confirm")
                {
                    int _IsConfirm = -1;
                    int id = Convert.ToInt32(e.CommandArgument);
                    _IsConfirm = objTask.ConfirmMOMNotification(id);
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

                if (e.CommandName == "Reject")
                {
                    int _IsConfirm = -1;
                    int id = Convert.ToInt32(e.CommandArgument);
                    _IsConfirm = objTask.RejectMOMNotification(id);
                    if (_IsConfirm == -1)
                    {
                        lblmsg1.Text = "Failed to Reject";
                        lblmsg1.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblmsg1.Text = "Rejected";
                        lblmsg1.ForeColor = System.Drawing.Color.Green;
                        BindNotificationMOM();
                    }
                }

            }
            catch (Exception ex)
            {

            }
        }

    }
}