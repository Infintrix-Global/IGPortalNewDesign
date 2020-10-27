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
    public partial class AddProjectDetails : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjectMaster();
                BindProjectManager();
                ddlProjectName.SelectedValue = Session["ProjectID"].ToString();
                ddlProjectIndexChanged();
            }
        }

        public void BindProjectManager()
        {
            ddlProjectManager.DataSource = objcommon.GetProjectManager(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlProjectManager.DataTextField = "EmployeeName";
            ddlProjectManager.DataValueField = "ID";

            ddlProjectManager.DataBind();
            ddlProjectManager.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        public void BindProjectMaster()
        {
            ddlProjectName.DataSource = objcommon.GetProjectMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlProjectName.DataTextField = "ProjectName";
            ddlProjectName.DataValueField = "ID";

            ddlProjectName.DataBind();
            ddlProjectName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void btnFileUpload_Click(object sender, EventArgs e)
        {
            if (ddlProjectName.SelectedIndex != 0)

            {
                Upload();
            }
            else
            {
                lblMessage.Text = "Please select Project Name";
            }
        }

        public void Upload()
        {
            int _isInserted = -1;
            string[] validFileTypes = { "jpeg", "png", "jpg" };

            var count = 0;
            foreach (HttpPostedFile uploadedFile in FileUpReciept.PostedFiles)
            {
                string ext = System.IO.Path.GetExtension(uploadedFile.FileName).ToLower();
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
                    string fn = System.IO.Path.GetFileName(uploadedFile.FileName);

                    if (!System.IO.Directory.Exists(@"~\ScreenShot"))
                    {
                        try
                        {
                            string Imgname = ddlProjectName.SelectedItem.Text + "_" + fn;

                            string path = Server.MapPath(@"~\ScreenShot\");
                            System.IO.Directory.CreateDirectory(path);

                            _isInserted = objTask.AddScreenShot(ddlProjectName.SelectedValue, Imgname);
                            uploadedFile.SaveAs(path + @"\" + Imgname);
                            count++;
                        }
                        catch (Exception ex)
                        {
                            lblMessage.Text = "Error: " + ex.Message;
                        }
                    }
                }
               

            }

            lblMessage.Text = count + " files uploaded";
        }

     

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
           
            try
            {
                ProjectDetails objProjectDetails = new ProjectDetails()
                {
                    ProjectID=ddlProjectName.SelectedValue,
                    ProjectManager =ddlProjectManager.SelectedValue,
                    APKLink=txtAPKLink.Text,
                    APKUserName=txtAPKUsename.Text,
                    APKPassword=txtAPKPassword.Text,
                    APLiveLink=txtAPLiveLink.Text,
                    APLiveUsername=txtLiveUserName.Text,
                    APLivePassword=txtLivePasssword.Text,
                    APUATLink=txtAPUATLink.Text,
                    APUATPassword=txtUATPassword.Text,
                    APUATUsername=txtUATUserName.Text,
                    WebsiteLink=txtWebsiteLInk.Text,
                    ProjectDescription=txtProjectDesription.Text,
                    StartDate= (Convert.ToDateTime(txtDate.Text)).ToString("dd MMM yyyy")
                };
               
              
                   
                    _isInserted = objTask.UpdateProjectDetails(objProjectDetails);
                    if (_isInserted == -1)
                    {
                        lblMessage.Text = "Failed to Update Project Details";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        lblMessage.Text = "Project Details Updated";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        
                    }
            }

            catch (Exception ex)
            {

            }
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProjectIndexChanged();
        }

        public void ddlProjectIndexChanged()
        {
            if (ddlProjectName.SelectedIndex != 0)
            {
                DataTable dtobjProjectDetails = new DataTable();
                dtobjProjectDetails = objTask.AutoFillProjectDetails(Convert.ToInt32(ddlProjectName.SelectedValue));
                ddlProjectManager.SelectedValue = dtobjProjectDetails.Rows[0]["ProjectManager"].ToString();
                txtAPKLink.Text = dtobjProjectDetails.Rows[0]["APKLink"].ToString();
                txtAPKUsename.Text = dtobjProjectDetails.Rows[0]["APKUsername"].ToString();
                txtAPKPassword.Text = dtobjProjectDetails.Rows[0]["APKPassword"].ToString();
                txtAPLiveLink.Text = dtobjProjectDetails.Rows[0]["AdminPanelLiveLink"].ToString();
                txtLiveUserName.Text = dtobjProjectDetails.Rows[0]["AdminPanelLiveUsername"].ToString();
                txtLivePasssword.Text = dtobjProjectDetails.Rows[0]["AdminPanelLivePassword"].ToString();
                txtAPUATLink.Text = dtobjProjectDetails.Rows[0]["AdminPanelUATLink"].ToString();
                txtUATPassword.Text = dtobjProjectDetails.Rows[0]["AdminPanelUATPassword"].ToString();
                txtUATUserName.Text = dtobjProjectDetails.Rows[0]["AdminPanelUATUsername"].ToString();
                txtWebsiteLInk.Text = dtobjProjectDetails.Rows[0]["WebsiteLink"].ToString();
                txtProjectDesription.Text = dtobjProjectDetails.Rows[0]["ProjectDescription"].ToString();
                if (dtobjProjectDetails.Rows[0]["StartDate"].ToString() != "")
                {
                    txtDate.Text = Convert.ToDateTime(dtobjProjectDetails.Rows[0]["StartDate"].ToString()).ToString("yyyy-MM-dd");
                }
            }
        }

    }
}