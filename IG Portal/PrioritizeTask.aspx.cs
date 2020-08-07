using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using IG_Portal.BAL_Classes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class PrioritizeTask : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindEmployeeMaster();
                BindGridTask();
            }
        }

        protected void ddlempName_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            BindGridTask();
        }

        public void BindEmployeeMaster()
        {
            ddlempName.DataSource = objcommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlempName.DataTextField = "EmployeeName";
            ddlempName.DataValueField = "ID";

            ddlempName.DataBind();
            ddlempName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindGridTask()
        {
            DataTable dtTaskDetails;

            dtTaskDetails = objTask.GetTaskToPrioritize(ddlempName.SelectedValue);
            GridAssignTask.DataSource = dtTaskDetails;
            GridAssignTask.DataBind();
            count.Text = "Number of Tasks= " + dtTaskDetails.Rows.Count;
            ViewState["dirState"] = dtTaskDetails;
            ViewState["sortdr"] = "Asc";


        }

       

        protected void GridAssignTask_Sorting(object sender, GridViewSortEventArgs e)
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
                GridAssignTask.DataSource = dtrslt;
                GridAssignTask.DataBind();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                int _IsPriority = -1;

                foreach (GridViewRow row in GridAssignTask.Rows)
                {
                   

                        int cid = Convert.ToInt32(GridAssignTask.DataKeys[row.RowIndex].Values[0].ToString());
                    string priority=  (row.FindControl("txtPriority") as TextBox).Text;
                    _IsPriority = objTask.UpdatePriorityTask(Convert.ToInt32(cid),priority);
                        if (_IsPriority == -1)
                        {
                            lblmsg.Text = "Failed To Prioritze task";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg.Text = "Task Prioritize";
                            lblmsg.ForeColor = System.Drawing.Color.Green;

                        }
                    

                }
                BindGridTask();
            }
            catch (Exception ex)
            {

            }
        }
    }
}