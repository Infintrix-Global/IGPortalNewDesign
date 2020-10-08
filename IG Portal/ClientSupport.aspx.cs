using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class ClientSupport : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            FileUpReciept.Attributes["onchange"] = "UploadFile(this)";
            if (!IsPostBack)
            {
                BindProjectMaster();
            }
        }


        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMasterByEmployee(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";

            ddlProjectName.DataBind();

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            SupportDetails objSupportDetails = new SupportDetails()
            {
                Details = CKEditor1.Text,
                IssueIn = ddlIssueIn.SelectedValue,
                IssueType = ddlIssueType.SelectedValue,
                ProjectName = ddlProjectName.SelectedValue,
                LoginID = Session["LoginID"].ToString(),

            };
            if (lblReciept.Text !="")
            {
                objSupportDetails.FileName = lblReciept.Text;
            }

            else
            {
                objSupportDetails.FileName = "";
            }
           // Upload();
            _isInserted = objTask.AddSupport(objSupportDetails);

            if (_isInserted == -1)
            {
                lblMessage.Text = "Failed to Add Support Issue";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                lblMessage.Text = "Support Issue Added ";

                lblMessage.ForeColor = System.Drawing.Color.Green;

                Clear();

            }
        }

        public void Upload()
        {

            string filename = "", newfile = "";
            string[] validFileTypes = { "jpeg", "png", "jpg", "bmp", "gif", "pdf", "docx", "doc", "txt" };

            //if (!FileUpReciept.HasFile)
            //{
            //    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select a file.');", true);
            //    FileUpReciept.Focus();
            //}
            if (FileUpReciept.HasFile)
            {
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
                        if (!System.IO.Directory.Exists(@"~\Support"))
                        {
                            try
                            {
                                //string Imgname = txtDateTime.Text + txtToTime.Text;

                                string path = Server.MapPath(@"~\Support\");
                                System.IO.Directory.CreateDirectory(path);
                                FileUpReciept.SaveAs(path + newfile);

                                lblReciept.Text = newfile;

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


        }

        public void Clear()
        {
            ddlProjectName.SelectedIndex = 0;
            ddlIssueIn.SelectedIndex = 0;
            ddlIssueType.SelectedIndex = 0;
            CKEditor1.Text = "";
            FileUpReciept.Attributes.Clear();
        }

        protected void techHelp_Command(object sender, CommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "techHelp")
                {
                    ddlIssueType.SelectedValue = "Technical Help";
                    IssueType.Visible = false;
                    Project.Visible = true;
                }
                if (e.CommandName == "BnP")
                {
                    ddlIssueType.SelectedValue = "Billing & Payment";
                    IssueType.Visible = false;
                    Project.Visible = true;
                }
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace);
            }
        }

        protected void btnProjectNext_Click(object sender, EventArgs e)
        {
            Project.Visible = false;
            IssueIn.Visible = true;
        }
        protected void btnProjectPrev_Click(object sender, EventArgs e)
        {
            Project.Visible = false;
            IssueType.Visible = true;
          
        }

        protected void btnIssueInPrev_Click(object sender, EventArgs e)
        {
            IssueIn.Visible = false;
            Project.Visible = true;
        }

        protected void btnIssueInNext_Click(object sender, EventArgs e)
        {
            IssueIn.Visible = false;
            Details.Visible = true;
        }

        protected void btnDetailsPrev_Click(object sender, EventArgs e)
        {
            Details.Visible = false;
            IssueIn.Visible = true;
        }

        protected void btnDetailsNext_Click(object sender, EventArgs e)
        {
            Details.Visible = false;
            Upload();
            Summary.Visible = true;
            BindSummary();
        }

        public void BindSummary()
        {
            SIssueIn.Text = ddlIssueIn.SelectedValue;
            SIssueType.Text = ddlIssueType.SelectedValue;
            SProjectName.Text = ddlProjectName.SelectedItem.Text;
            SDetails.Text = CKEditor1.Text;
            if(lblReciept.Text!="")
            {
                image.Visible = true;
                Simage.ImageUrl = @"~\Support\" + lblReciept.Text;
            }
            else
            {
                image.Visible = false;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Details.Visible = true;
            Summary.Visible = false;
        }
    }
    }