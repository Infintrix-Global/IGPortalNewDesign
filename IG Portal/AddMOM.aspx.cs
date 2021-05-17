using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class AddMOM : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        string EditMOMID;

        public static DataTable dtMeetingPoint = new DataTable()
        { Columns = { "Meeting Point", "Status" } };

        public static DataTable dtAttendee = new DataTable()
        { Columns = { "Attendee" } };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMeetingType();
                BindMeetingInitiator();
                BindMeetingPlace();
                BindProjectMaster();
                BindStatusMaster();
                CheckRole();
                BindMOM();
            }
        }

        public void CheckRole()
        {
            DataTable dtCheckRights = objCommon.GetRoleRights(Session["Role"].ToString(), 2);
            if (dtCheckRights.Rows[0]["IsInsertAllowed"] is true)
            {
                btnAddNew.Visible = true;
            }
            else
            {
                btnAddNew.Visible = false;
            }
        }

        public void BindEmployeeMaster()
        {


            chkAttendees.DataSource = objCommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            chkAttendees.DataTextField = "EmployeeName";
            chkAttendees.DataValueField = "ID";
            chkAttendees.DataBind();

        }

        public void BindEmployeeMasterBoardMeeting()
        {


            chkAttendees.DataSource = objCommon.GetEmployeeMasterManagement();
            chkAttendees.DataTextField = "EmployeeName";
            chkAttendees.DataValueField = "ID";
            chkAttendees.DataBind();

        }

        public void BindEmployeeMasterByProject()
        {


            chkAttendees.DataSource = objCommon.GetEmployeeMasterByProject(ddlProjectName.SelectedValue);
            chkAttendees.DataTextField = "EmployeeName";
            chkAttendees.DataValueField = "ID";
            chkAttendees.DataBind();

        }

        public void BindMeetingInitiator()
        {


            ddlMeetingInitiator.DataSource = objCommon.GetEmployeeMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlMeetingInitiator.DataTextField = "EmployeeName";
            ddlMeetingInitiator.DataValueField = "ID";
            ddlMeetingInitiator.DataBind();
            ddlMeetingInitiator.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objCommon.GetProjectMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";
            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindStatusMaster()
        {
            ddlStatus.DataSource = objCommon.GetStatusMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";

            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindMeetingPlace()
        {
            ddlMeetingPlace.DataSource = objCommon.GetMeetingPlace();
            ddlMeetingPlace.DataTextField = "MeetingPlace";
            ddlMeetingPlace.DataValueField = "ID";

            ddlMeetingPlace.DataBind();
            ddlMeetingPlace.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindMeetingType()
        {
            ddlMeetingType.DataSource = objCommon.GetMeetingType();
            ddlMeetingType.DataTextField = "MeetingType";
            ddlMeetingType.DataValueField = "ID";

            ddlMeetingType.DataBind();
            ddlMeetingType.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            EditMOMID = Session["EditMOM"] as string;
            try
            {
                int _isInserted = -1;
                MOM objMOM = new MOM()
                {
                    Agenda = txtAgenda.Text,
                    MeetingDate = txtDateTime.Text,
                    FromTime = txtFromTime.Text,
                    ToTime = txtToTime.Text,
                    MeetingInitiator=ddlMeetingInitiator.SelectedValue,
                    
                    MeetingType=ddlMeetingType.SelectedValue
                };
                if (ddlMeetingPlace.SelectedItem.Text == "Other")
                {
                    objMOM.MeetingPlace = txtMeetingPlace.Text;
                    objMOM.Mode = 2;
                }
                else
                {
                    objMOM.MeetingPlace = ddlMeetingPlace.SelectedValue;
                    objMOM.Mode = 1;
                }


                if (FileUpReciept.HasFile)
                {
                    objMOM.Document = FileUpReciept.PostedFile.FileName;
                }
                else
                {
                    objMOM.Document = "";
                }
                if (divClient.Visible == true)
                {
                    objMOM.ClientName = txtClientName.Text;
                }
                else
                {
                    objMOM.ClientName = "";
                }

                if (divProject.Visible == true)
                {
                    objMOM.ProjectName = ddlProjectName.SelectedValue;
                }
                else
                {
                    objMOM.ProjectName = "";
                }
                foreach (ListItem item in chkAttendees.Items)
                {
                    if (item.Selected)
                    {
                        dtAttendee.Rows.Add(item.Value);
                    }
                }

                if (EditMOMID is null)
                {
                    _isInserted = objCommon.AddMOM(objMOM);

                    if (_isInserted == -1)
                    {

                        lblmsg.Text = "Failed to Add MOM";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }

                    else
                    {
                        // lblmsg.Text = "MOM Added ";
                        objTask.AddMOMPoints(dtMeetingPoint, _isInserted);
                        if (FileUpReciept.HasFile)
                        {
                            UploadReciept();
                        }
                        objTask.AddMOMAttendee(dtAttendee, _isInserted, ddlMeetingInitiator.SelectedValue);
                        objCommon.SendMailMOM(dtMeetingPoint, dtAttendee, txtDateTime.Text, txtFromTime.Text, txtToTime.Text, txtAgenda.Text, ddlMeetingType.SelectedItem.Text, ddlMeetingPlace.SelectedItem.Text,ddlMeetingInitiator.SelectedValue);
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                        btnAddNew.Visible = true;
                        addMOM.Visible = false;
                        viewMOM.Visible = true;

                        BindMOM();
                        btclear_Click(sender, e);
                    }
                }
                else
                {
                    objTask.ClearOldPoints(Convert.ToInt32(EditMOMID));
                   objTask.AddMOMPoints(dtMeetingPoint, Convert.ToInt32(EditMOMID));
                    Session["EditMOMID"] = null;
                    btnAddNew.Visible = true;
                    addMOM.Visible = false;
                    viewMOM.Visible = true;
                    BindMOM();
                    btclear_Click(sender, e);

                }
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace + ex.Message);
            }

        }


        protected void btclear_Click(object sender, EventArgs e)
        {
            txtDateTime.Text = "";
            txtToTime.Text = "";
            txtFromTime.Text = "";
            //txtAttendees.Text = "";
            chkAttendees.ClearSelection();
            txtClientName.Text = "";
            ddlProjectName.SelectedValue = "0";
            FileUpReciept.Attributes.Clear();
            txtAgenda.Text = "";
            txtMeetingPlace.Text = "";
            ddlMeetingInitiator.SelectedValue = "0";
            ddlMeetingType.SelectedIndex = 0;
            dtMeetingPoint.Clear();
            dtAttendee.Rows.Clear();
        }

        protected void btnReciept_Click(object sender, EventArgs e)
        {
            UploadReciept();
        }

        public void UploadReciept()
        {

            string filename = "", newfile = "";
            string[] validFileTypes = { "jpeg", "png", "jpg", "bmp", "gif", "pdf", "docx", "doc" ,"txt" ,"ppt", "pptx"};

            if (!FileUpReciept.HasFile)
            {
                this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select a file.');", true);
                FileUpReciept.Focus();
            }

            string aa = FileUpReciept.FileName;
            string ext = System.IO.Path.GetExtension(FileUpReciept.PostedFile.FileName).ToLower();
            bool isValidFile = false;
            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (isValidFile == true)
            {

                if (FileUpReciept.HasFile)
                {

                    filename = Server.MapPath(FileUpReciept.FileName);
                    newfile = FileUpReciept.PostedFile.FileName;
                    //                filecontent = System.IO.File.ReadAllText(filename);
                    FileInfo fi = new FileInfo(newfile);

                    // check folder exist or not
                    if (!System.IO.Directory.Exists(@"~\MOM"))
                    {
                        try
                        {
                            string Imgname = txtDateTime.Text + txtToTime.Text;

                            string path = Server.MapPath(@"~\MOM\");
                            System.IO.Directory.CreateDirectory(path);
                            FileUpReciept.SaveAs(path + newfile);

                            lblReciept.Text = filename;

                        }
                        catch (Exception ex)
                        {
                            lblReciept.Text = "Not able to create new directory";
                        }

                    }
                }
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select valid file.');", true);
            }



        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            btnAddNew.Visible = false;
            meetingType.Visible = true;
            viewMOM.Visible = false;
        }

        protected void GridMOM_Sorting(object sender, GridViewSortEventArgs e)
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
                GridMOM.DataSource = dtrslt;
                GridMOM.DataBind();
            }
        }

        protected void GridMOM_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridMOM.PageIndex = e.NewPageIndex;
            BindMOM();
        }

        public void BindMOM()
        {
            DataSet dtMOM;

            dtMOM = objTask.GetMOM(Session["LoginID"].ToString());
            GridMOM.DataSource = dtMOM.Tables[0];
            GridMOM.DataBind();
            count.Text = "Number of MOM =" + dtMOM.Tables[0].Rows.Count;
            ViewState["dirState"] = dtMOM;
            ViewState["sortdr"] = "Asc";
        }

        protected void GridMOM_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                string rname = (e.CommandArgument).ToString();
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/MOM/") + e.CommandArgument);
                Response.End();
            }
            if(e.CommandName=="RemoveMOM")
            {
                int mid = Convert.ToInt32(e.CommandArgument);
             
                objCommon.RemoveMOM(mid);
                BindMOM();
            }

            if(e.CommandName=="EditMOM")
            {
                int mid = Convert.ToInt32(e.CommandArgument);
                DataSet dtEdit = objTask.GetEditMOMDetails(mid);
                Session["EditMOM"] = mid.ToString();
                ddlMeetingType_SelectedIndexChanged(dtEdit);
            }
        }



        protected void btnMeetingPoint_Click(object sender, EventArgs e)
        {
           
            try
            {

                dtMeetingPoint.Rows.Add(txtMeetingPoint.Text, ddlStatus.SelectedItem.Text);

                GridMeetingPoint.DataSource = dtMeetingPoint;
                GridMeetingPoint.DataBind();
                txtMeetingPoint.Text = "";

                ddlStatus.SelectedIndex = 0;
               

            }
            catch (Exception ex)
            {

            }
        }


        protected void GridMeetingPoint_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                dtMeetingPoint.Rows.RemoveAt(e.RowIndex);
                GridMeetingPoint.DataSource = dtMeetingPoint;
                GridMeetingPoint.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void GridMeetingPoint_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridMeetingPoint.EditIndex)
            {
                (e.Row.Cells[0].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this record?');";
            }
        }

        protected void GridMOM_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dtMOMAccepted = new DataTable();
                int vid = Convert.ToInt32(GridMOM.DataKeys[e.Row.RowIndex].Value.ToString());
                GridView gvMeetingPoint = e.Row.FindControl("gvmp") as GridView;
                gvMeetingPoint.DataSource = objTask.GetMeetingPoints(vid);
                gvMeetingPoint.DataBind();

                DataTable dtCheckRights = objCommon.GetRoleRights(Session["Role"].ToString(), 2);
                if (dtCheckRights.Rows[0]["IsEditAllowed"] is true)
                {
                    (e.Row.FindControl("imgEdit") as LinkButton).Visible=true;
                }
                else
                {
                    (e.Row.FindControl("imgEdit") as ImageButton).Visible = false;
                }
                if (dtCheckRights.Rows[0]["IsDeleteAllowed"] is true)
                {
                    dtMOMAccepted = objTask.CheckMOMAccepted(vid);
                    if (dtMOMAccepted.Rows.Count > 0)
                    {
                        (e.Row.FindControl("imgDelete") as ImageButton).Visible = false;
                    }
                    else
                    {
                        (e.Row.FindControl("imgDelete") as ImageButton).Visible = true;
                    }
                }
                else
                {
                    (e.Row.FindControl("imgDelete") as ImageButton).Visible = false;
                }

            }
        }

        protected void ddlMeetingType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMeetingType.SelectedValue != "0")
            {
                addMOM.Visible = true;
                lblMtype.Text = ddlMeetingType.SelectedItem.Text;
                meetingType.Visible = false;
                if (ddlMeetingType.SelectedValue == "1")
                {
                    divClient.Visible = false;
                    divProject.Visible = true;
                    BindEmployeeMaster();
                }
                if (ddlMeetingType.SelectedValue == "2")
                {
                    divClient.Visible = true;
                    divProject.Visible = true;
                    BindEmployeeMaster();
                }
                if (ddlMeetingType.SelectedValue == "3")
                {
                    divClient.Visible = true;
                    divProject.Visible = false;
                    BindEmployeeMaster();
                }
                if (ddlMeetingType.SelectedValue == "4")
                {
                    divProject.Visible = false;
                    divClient.Visible = false;
                    BindEmployeeMasterBoardMeeting();
                }

                if (ddlMeetingType.SelectedValue == "5")
                {
                    divProject.Visible = true;
                    divClient.Visible = false;
                   // BindEmployeeMasterBoardMeeting();
                }

            }
        }

        public void ddlMeetingType_SelectedIndexChanged(DataSet dtEdit)
        {
            viewMOM.Visible = false;
            btnAddNew.Visible = false;
            ddlMeetingType.SelectedValue = dtEdit.Tables[0].Rows[0]["MeetingType"].ToString();
            if (ddlMeetingType.SelectedValue != "0")
            {
                addMOM.Visible = true;
                lblMtype.Text = ddlMeetingType.SelectedItem.Text;
                meetingType.Visible = false;
                if (ddlMeetingType.SelectedValue == "1")
                {
                    divClient.Visible = false;
                    divProject.Visible = true;
                    BindEmployeeMaster();
                    ddlProjectName.SelectedValue= dtEdit.Tables[0].Rows[0]["ProjectName"].ToString();
                    //ddlProjectName.Enabled = false;
                }
                if (ddlMeetingType.SelectedValue == "2")
                {
                    divClient.Visible = true;
                    divProject.Visible = true;
                    BindEmployeeMaster();
                    ddlProjectName.SelectedValue = dtEdit.Tables[0].Rows[0]["ProjectName"].ToString();
                    txtClientName.Text = dtEdit.Tables[0].Rows[0]["ClientName"].ToString();
                   // ddlProjectName.Enabled = false;
                    txtClientName.Enabled = false;
                }
                if (ddlMeetingType.SelectedValue == "3")
                {
                    divClient.Visible = true;
                    divProject.Visible = false;
                    BindEmployeeMaster();
                    txtClientName.Text = dtEdit.Tables[0].Rows[0]["ClientName"].ToString();
                    txtClientName.Enabled = false;
                }
                if (ddlMeetingType.SelectedValue == "4")
                {
                    divProject.Visible = false;
                    divClient.Visible = false;
                    BindEmployeeMasterBoardMeeting();
                }

                if (ddlMeetingType.SelectedValue == "5")
                {
                    divProject.Visible = true;
                    divClient.Visible = false;
                    ddlProjectName.SelectedValue = dtEdit.Tables[0].Rows[0]["ProjectName"].ToString();
                   // ddlProjectName.Enabled = false;
                    BindEmployeeMasterByProject();
                    // BindEmployeeMasterBoardMeeting();
                }
                AutoFillMOM(dtEdit);

            }
        }

        protected void ddlMeetingPlace_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMeetingPlace.SelectedItem.Text == "Other")
            {
                txtMeetingPlace.Visible = true;
            }

            else
            {
                txtMeetingPlace.Visible = false;
            }
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlMeetingType.SelectedValue=="5")
            {
                BindEmployeeMasterByProject();
            }
        }

        public void AutoFillMOM(DataSet dtEdit)
        {
            txtDateTime.Text= Convert.ToDateTime(dtEdit.Tables[0].Rows[0]["MeetingDate"].ToString()).ToString("yyyy-MM-dd");
            txtFromTime.Text = dtEdit.Tables[0].Rows[0]["FromTime"].ToString();
            txtToTime.Text = dtEdit.Tables[0].Rows[0]["ToTime"].ToString();
            ddlMeetingInitiator.SelectedValue= dtEdit.Tables[0].Rows[0]["MeetingInitiator"].ToString();
            ddlMeetingPlace.SelectedValue= dtEdit.Tables[0].Rows[0]["MeetingPlace"].ToString();
            txtAgenda.Text= dtEdit.Tables[0].Rows[0]["Agenda"].ToString();
            
            for (int i=0;i<dtEdit.Tables[2].Rows.Count;i++) 
            {
                dtMeetingPoint.Rows.Add(dtEdit.Tables[2].Rows[i]["MeetingPoint"].ToString(), dtEdit.Tables[2].Rows[i]["Status"].ToString());

                GridMeetingPoint.DataSource = dtMeetingPoint;
                GridMeetingPoint.DataBind();
                txtMeetingPoint.Text = "";

                ddlStatus.SelectedIndex = 0;
            }
            foreach (DataRow dr in dtEdit.Tables[1].Rows)
            {
                foreach (ListItem item in chkAttendees.Items)
                {
                    if (item.Value == dr["AttendeeID"].ToString())
                        item.Selected = true;
                }
                
            }
          // txtDateTime.Enabled = false;
           // txtFromTime.Enabled = false;
           // txtToTime.Enabled = false;
          //  ddlMeetingInitiator.Enabled = false;
          //  ddlMeetingPlace.Enabled = false;
          //  txtAgenda.Enabled = false;
           // chkAttendees.Enabled = false;

        }
    }
}