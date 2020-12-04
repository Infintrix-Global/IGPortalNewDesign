using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class ViewBug : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //BindBugs();
                BindProjectMaster();
                BindTaskMaster();
                BindBugStatusMaster();
                CheckRole();
                //BindDeveloperMaster();
                BindSearch();
                btSearch_Click(sender, e);
            }
            lblMessage.Text = "";
        }

        public void BindSearch()
        {

            string pid = Session["TSBProjectID"] as String;
            List<ListItem> sid = Session["TSBStatusID"] as List<ListItem>;
            string prid = Session["TSBPriorityID"] as String;
            string tid = Session["TSBTaskID"] as String;
            string pageid = Session["TSBPageNumber"] as String;
            if (!string.IsNullOrEmpty(pid))
            {
                ddlProjectName.SelectedValue = Session["TSBProjectID"].ToString();
            }
            if(sid !=null)
           if (sid.Count>0)
            {
                List<ListItem> name = (List<ListItem>)Session["TSBStatusID"];

                foreach (ListItem li in name)
                {
                    foreach (ListItem item in chkStatus.Items)
                    {
                        if (item.Value == li.Value)
                            item.Selected = true;
                    }
                   
                }
                //ddlStatus.SelectedValue = Session["TSBStatusID"].ToString();
            }
            if (!string.IsNullOrEmpty(prid))
            {
                ddlPriority.SelectedValue = Session["TSBPriorityID"].ToString();
            }
            if (!string.IsNullOrEmpty(tid))
            {
                ddlTaskType.SelectedValue = Session["TSBTaskID"].ToString();
            }
            if(!string.IsNullOrEmpty(pageid))
            {
                GridBug.PageIndex= Convert.ToInt32(Session["TSBPageNumber"]);
            }
        }

        public void CheckRole()
        {
            //DataTable AllData = objTask.GetEmployeeByID(Convert.ToInt32(Session["LoginID"].ToString()));
            if (Session["Role"] is null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                DataTable dtCheckRights = objCommon.GetRoleRights(Session["Role"].ToString(), 15);
                if (dtCheckRights.Rows[0]["IsPrintAllowed"] is true)
                {
                    //if (Session["Role"].ToString() == "2")
                    //{
                    //    BindDeveloperMaster();
                    //    //ddlDeveloper.SelectedValue = Session["LoginID"].ToString();
                    //    ddlDeveloper.Enabled = true;
                    //    BindBugs();
                    //    // BindEmployeeTask(ddlEmployeeName.SelectedValue);
                    //}
                    //else if (Session["Role"].ToString() == "4")
                    //{
                    //    BindDeveloperMaster();
                    //    //ddlDeveloper.SelectedValue = Session["LoginID"].ToString();
                    //    ddlDeveloper.Enabled = true;
                    //    BindBugs();
                    //    //  BindEmployeeTask(ddlEmployeeName.SelectedValue);
                    //}

                    BindDeveloperMaster();
                        ddlDeveloper.SelectedValue = Session["LoginID"].ToString();
                        ddlDeveloper.Enabled = true;
                        BindBugs();
                }
                else if (dtCheckRights.Rows[0]["IsPrintAllowed"] is false)
                {
                    BindDeveloperMaster();
                    ddlDeveloper.SelectedValue = Session["LoginID"].ToString();
                    ddlDeveloper.Enabled = false;
                    BindBugsForEmployee(ddlDeveloper.SelectedValue);
                }

            }
        }

        public void CheckRoleProjectWise()
        {
            //DataTable AllData = objTask.GetEmployeeByID(Convert.ToInt32(Session["LoginID"].ToString()));
            if (Session["Role"] is null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                DataTable dtCheckRights = objCommon.GetRoleRights(Session["Role"].ToString(), 15);
                if (dtCheckRights.Rows[0]["IsPrintAllowed"] is true)
                {
                    //if (Session["Role"].ToString() == "2")
                    //{
                    //    BindDeveoperMasterByProject(ddlProjectName.SelectedValue);
                    //   // ddlDeveloper.SelectedValue = Session["LoginID"].ToString();
                    //    ddlDeveloper.Enabled = true;
                    //    // BindEmployeeTask(ddlEmployeeName.SelectedValue);
                    //}
                    //else if (Session["Role"].ToString() == "4")
                    //{
                    //    BindDeveoperMasterByProject(ddlProjectName.SelectedValue);
                    //   // ddlDeveloper.SelectedValue = Session["LoginID"].ToString();
                    //    ddlDeveloper.Enabled = true;
                    //    //  BindEmployeeTask(ddlEmployeeName.SelectedValue);
                    //}
                    BindDeveloperMaster();
                    ddlDeveloper.SelectedValue = Session["LoginID"].ToString();
                    ddlDeveloper.Enabled = true;
                    BindBugs();
                }
                else if (dtCheckRights.Rows[0]["IsPrintAllowed"] is false)
                {
                    BindDeveloperMaster();
                    ddlDeveloper.SelectedValue = Session["LoginID"].ToString();
                    ddlDeveloper.Enabled = false;

                }

            }
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objCommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";
            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindDeveloperMaster()
        {
            ddlDeveloper.DataSource = objCommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlDeveloper.DataTextField = "EmployeeName";
            ddlDeveloper.DataValueField = "ID";
            ddlDeveloper.DataBind();
            ddlDeveloper.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindDeveoperMasterByProject(string projectid)
        {
            ddlDeveloper.DataSource = objCommon.GetEmployeeMasterByProjectForBug(Convert.ToInt32(projectid));
            ddlDeveloper.DataTextField = "EmployeeName";
            ddlDeveloper.DataValueField = "ID";
            ddlDeveloper.DataBind();
            ddlDeveloper.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindTaskMaster()
        {
            ddlTaskType.DataSource = objCommon.GetBugsTaskMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlTaskType.DataTextField = "TaskName";
            ddlTaskType.DataValueField = "ID";

            ddlTaskType.DataBind();
            ddlTaskType.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindBugStatusMaster()
        {
            chkStatus.DataSource = objCommon.GetBugStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            chkStatus.DataTextField = "StatusName";
            chkStatus.DataValueField = "ID";

            chkStatus.DataBind();
           // chkStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));

            
        }

        

        protected void GridBug_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridBug.PageIndex = e.NewPageIndex;
            Session["TSBPageNumber"] = e.NewPageIndex;
            btSearch_Click(sender, e);
        }

        public void BindBugs()
        {
            DataSet dtBug;

            dtBug = objTask.GetBug(Session["LoginID"].ToString());
            GridBug.DataSource = dtBug.Tables[0];
            GridBug.DataBind();
            count.Text = "Number of Bugs =" + dtBug.Tables[0].Rows.Count;
            ViewState["dirState"] = dtBug;
            ViewState["sortdr"] = "Asc";
        }

        public void BindBugsForEmployee(string devID)
        {
            DataSet dtBug;

            dtBug = objTask.GetBugForEmployee(devID);
            GridBug.DataSource = dtBug.Tables[0];
            GridBug.DataBind();
            count.Text = "Number of Bugs =" + dtBug.Tables[0].Rows.Count;
            ViewState["dirState"] = dtBug;
            ViewState["sortdr"] = "Asc";
        }

        protected void GridBug_Sorting(object sender, GridViewSortEventArgs e)
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
                GridBug.DataSource = dtrslt;
                GridBug.DataBind();
            }
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            ddlProjectName.SelectedIndex = 0;
            ddlTaskType.SelectedIndex = 0;
            // ddlStatus.SelectedIndex = 0;
            chkStatus.ClearSelection();
            txtStatus.Text = "";
            txtWorkDate.Text = "";
            ddlPriority.SelectedIndex = 0;
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuery = "";
                string strQuery1 = "";
                string strQueryfinal = "";
                DataTable dtSearch1;

                strQuery = "(Select B.*,PM.ProjectName,BTM.TaskName,TTM.TaskTitle,PGM.PageName,SBM.SuggestedName,SM.StatusName,L.EmployeeName as CrossCheckedByName,'' as DeveloperName from Bug B" +
                             " inner join ProjectMaster PM on PM.ID=B.ProjectID " +
                         "inner join BugsTaskMaster BTM on BTM.ID = B.TaskTypeID inner join TaskTitleMaster TTM on TTM.ID = B.TaskTitleID " +
                         "inner join Login L on L.ID = B.CrossCheckedBy " +
                 "inner join PageMaster PGM on PGM.ID = B.PageID inner join SuggestedByMaster SBM on SBM.ID = B.SuggestedBy " +
                 "inner join BugStatusMaster SM on SM.ID = B.Status where B.ProjectID in (Select ProjectID from ProjectEmployeeMap where LoginID=" +
                  Session["LoginID"].ToString() +") and B.IsActive = 1 and B.Developer is null";

                strQuery1 = "(Select B.*,PM.ProjectName,BTM.TaskName,TTM.TaskTitle,PGM.PageName,SBM.SuggestedName,SM.StatusName,L.EmployeeName as CrossCheckedByName,L2.EmployeeName as DeveloperName from Bug B" +
                             " inner join ProjectMaster PM on PM.ID=B.ProjectID " +
                         "inner join BugsTaskMaster BTM on BTM.ID = B.TaskTypeID inner join TaskTitleMaster TTM on TTM.ID = B.TaskTitleID " +
                         "inner join Login L on L.ID = B.CrossCheckedBy inner join Login L2 on L2.ID=B.Developer " +
                 "inner join PageMaster PGM on PGM.ID = B.PageID inner join SuggestedByMaster SBM on SBM.ID = B.SuggestedBy " +
                 "inner join BugStatusMaster SM on SM.ID = B.Status where B.ProjectID in (Select ProjectID from ProjectEmployeeMap where LoginID=" +
                  Session["LoginID"].ToString() + ") and B.IsActive = 1 and B.Developer is not null";

                if (ddlProjectName.SelectedIndex > 0)
                {
                    strQuery += " and B.ProjectID ='" + ddlProjectName.SelectedValue + "'";
                    strQuery1 += " and B.ProjectID ='" + ddlProjectName.SelectedValue + "'";
                }
                if(ddlDeveloper.SelectedIndex>0)
                {
                    strQuery += " and B.Developer ='" + ddlDeveloper.SelectedValue + "'";
                    strQuery1 += " and B.Developer ='" + ddlDeveloper.SelectedValue + "'";
                }
                if (ddlTaskType.SelectedIndex > 0)
                {
                    strQuery += " and B.TaskTypeID ='" + ddlTaskType.SelectedValue + "'";
                    strQuery1 += " and B.TaskTypeID ='" + ddlTaskType.SelectedValue + "'";

                }
                //if (chkStatus. > 0)
                int c = 0;
                string x = "";
                foreach (ListItem i in chkStatus.Items)
                {
                    if (i.Selected)
                    {
                        c = 1;
                        x += i.Value + ",";
                    }
                }
                
                if (c>0)
                {
                    string chkSelected = x.Remove(x.Length - 1, 1);
                    strQuery += " and B.Status in (" + chkSelected + ")";
                    strQuery1 += " and B.Status in (" + chkSelected + ")";
                }
                if (ddlPriority.SelectedIndex > 0)
                {
                    strQuery += " and B.Priority ='" + ddlPriority.SelectedValue + "'";
                    strQuery1 += " and B.Priority ='" + ddlPriority.SelectedValue + "'";
                }
                if (txtWorkDate.Text != "")
                {
                    strQuery += " and B.WorkDate = '" + txtWorkDate.Text + "'";
                    strQuery1 += " and B.WorkDate = '" + txtWorkDate.Text + "'";
                }
                strQuery += ") union ";
                strQuery1 += ") order by B.WorkDate desc";
                strQueryfinal = strQuery + strQuery1;
                dtSearch1 = objTask.SearchBug(strQueryfinal);
                GridFillSearch();

                void GridFillSearch()
                {
                    if (dtSearch1 != null)
                    {
                        //DataTable dtSearch = dtSearch1.CopyToDataTable();
                        GridBug.DataSource = dtSearch1;
                        GridBug.DataBind();

                        count.Text = "Number of Bugs= " + (dtSearch1.Rows.Count).ToString();
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        GridBug.DataSource = dt;
                        GridBug.DataBind();

                        count.Text = "Number of Bugs= 0";
                    }
                    ViewState["dirState"] = dtSearch1;
                    ViewState["sortdr"] = "Asc";


                }
            }
            catch(Exception ex)
            {

            }

        }

        protected void GridBug_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int vid = Convert.ToInt32(GridBug.DataKeys[e.Row.RowIndex].Value.ToString());
                GridView gvBugScreenshot = e.Row.FindControl("gvbs") as GridView;
                gvBugScreenshot.DataSource = objTask.GetBugScreenshots(vid);
                gvBugScreenshot.DataBind();

                if(gvBugScreenshot.Rows.Count==0)
                {
                    e.Row.FindControl("img").Visible = false;
                }
                else
                {
                    e.Row.FindControl("img").Visible = true;
                }


                if (((Label)e.Row.FindControl("lblCrossCheckedBy")).Text == Session["LoginID"].ToString() )
                {
                    ((ImageButton)e.Row.FindControl("imgDelete")).Visible = true;
                    ((ImageButton)e.Row.FindControl("lnkEdit")).Visible = true;
                }
                else
                {
                    ((ImageButton)e.Row.FindControl("imgDelete")).Visible = false;
                    ((ImageButton)e.Row.FindControl("lnkEdit")).Visible = false;
                }

                if( (((Label)e.Row.FindControl("lblDeveloperID")).Text == Session["LoginID"].ToString())  )
                {
                    if ((((Label)e.Row.FindControl("lblStatus")).Text == "3") || (((Label)e.Row.FindControl("lblStatus")).Text == "6") || (((Label)e.Row.FindControl("lblStatus")).Text == "8"))
                    {
                        ((LinkButton)e.Row.FindControl("lnkAddTS")).Visible = false;
                    }
                    else
                    {
                        ((LinkButton)e.Row.FindControl("lnkAddTS")).Visible =true ;

                    }
                }
                else
                {
                    ((LinkButton)e.Row.FindControl("lnkAddTS")).Visible = false;
                    
                }

            }
        }

        protected void GridBug_RowCommand(object sender, GridViewCommandEventArgs e)
        {
          
                if (e.CommandName == "Download")
                {
                    string rname = (e.CommandArgument).ToString();
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
                    Response.TransmitFile(Server.MapPath("~/BugsScreenshot/") + e.CommandArgument);
                    Response.End();
                }

                if (e.CommandName == "Remove")
                {
                    int _isDeleted = -1;
                    int bid = Convert.ToInt32(e.CommandArgument);
                    _isDeleted=objTask.RemoveBug(bid,Session["LoginID"].ToString());
                    if (_isDeleted == -1)
                    {
                        lblMessage.Text = "Failed to delete Bug";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblMessage.Text = "Bug deleted ";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        BindBugs();
                    }
                   

                }

                if (e.CommandName == "Edit")
                {
                    int bid = Convert.ToInt32(e.CommandArgument);
                   // Session["BugID"] = bid.ToString();
                Response.Redirect("~/AddBug.aspx?BugID=" + objCommon.Encrypt(bid.ToString()));
                //Response.Redirect("~/AddBug.aspx");
                }

                if (e.CommandName == "ViewHistory")
                {
                    int bid = Convert.ToInt32(e.CommandArgument);
                    Session["BugHistoryID"] = bid.ToString();
                    Response.Redirect("~/BugHistory.aspx");
                }

            if (e.CommandName == "AddTS")
            {
                int bid = Convert.ToInt32(e.CommandArgument);
                Session["AddTSBugID"] = bid.ToString();
                Session["TSBProjectID"] = ddlProjectName.SelectedValue;
                //Session["TSBStatusID"] = ddlStatus.SelectedValue;
                Session["TSBPriorityID"] = ddlPriority.SelectedValue;
                Session["TSBTaskID"] = ddlTaskType.SelectedValue;
                List<ListItem> selectItems = new List<ListItem>();

                foreach (ListItem item in chkStatus.Items)
                {
                    if (item.Selected)
                        selectItems.Add(item);
                }

                Session.Add("TSBStatusID", selectItems);
                //string url = "~/AddTimeSheet.aspx?AddTSBugID=" + objCommon.Encrypt(Session["AddTSBugID"].ToString());
                //StringBuilder sb = new StringBuilder();
                //sb.Append("<script type = 'text/javascript'>");
                //sb.Append("window.open('");
                //sb.Append(url);
                //sb.Append("');");
                //sb.Append("</script>");
                //ClientScript.RegisterStartupScript(this.GetType(),
                //        "script", sb.ToString());
                Response.Redirect("~/AddTimeSheet.aspx?AddTSBugID=" + objCommon.Encrypt(Session["AddTSBugID"].ToString()));
            }
            //}
            //catch(Exception ex)
            //{

            //}
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProjectName.SelectedIndex != 0)
            {
                CheckRoleProjectWise();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            string FileName;
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.Charset = "";
                if (ddlProjectName.SelectedIndex > 0)
                {
                    FileName = "BugList-" + ddlProjectName.SelectedItem.Text + DateTime.Now + ".xls";
                }
                else
                {
                    FileName = "BugList-" + DateTime.Now + ".xls";
                }
                using (StringWriter sw = new StringWriter())
                {
                    HtmlTextWriter hw = new HtmlTextWriter(sw);

                    //To Export all pages
                    GridBug.AllowPaging = false;
                    GridBug.AllowSorting = false;
                    this.btSearch_Click(sender, e);

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
                    GridBug.GridLines = GridLines.Both;

                    GridBug.HeaderStyle.Font.Bold = true;
                    GridBug.RenderControl(hw);
                    Response.Write(sw.ToString());

                    Response.End();


                }

            }
            catch (Exception ex)
            {
                // General.ErrorMessage(ex.StackTrace + ex.Message);

            }
        }

        protected void chkStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string name = "";



            for (int i = 0; i < chkStatus.Items.Count; i++)
            {
                if (chkStatus.Items[i].Selected)
                {
                    name += chkStatus.Items[i].Text + ",";
                 //   lID += chkStatus.Items[i].Value + ",";
                }
            }
            txtStatus.Text = name;
        }
    }
}