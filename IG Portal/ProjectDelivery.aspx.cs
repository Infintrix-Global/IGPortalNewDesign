using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;
using System.Data;

namespace IG_Portal
{
    public partial class ProjectDelivery : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjectMaster();
                BindTechnology();
                BindProjectDeliveryMaster();
            }
        }

        public void BindTechnology()
        {
            ddlTechnology.DataSource = objcommon.GetTechnologyMaster();
            ddlTechnology.DataTextField = "TechnologyName";
            ddlTechnology.DataValueField = "ID";
            ddlTechnology.DataBind();

            ddlTechnology.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }

        public void BindProjectDeliveryMaster()
        {
            chkProjectType.DataSource = objcommon.ProjectDeliveryTypeMaster();
            chkProjectType.DataTextField = "ProjectDeliveryType";
            chkProjectType.DataValueField = "ID";
            chkProjectType.DataBind();


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
            string[] validFileTypes = { "doc", "pdf", "docx" };

            var count = 0;
            foreach (HttpPostedFile uploadedFile in FileUpScope.PostedFiles)
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

                    if (!System.IO.Directory.Exists(@"~\Scope"))
                    {
                        try
                        {
                            string Imgname = ddlProjectName.SelectedItem.Text + "_" + fn;

                            string path = Server.MapPath(@"~\Scope\");
                            System.IO.Directory.CreateDirectory(path);

                            _isInserted = objTask.AddScope(ddlProjectName.SelectedValue, Imgname);
                            uploadedFile.SaveAs(path + @"\" + Imgname);
                            count++;
                        }
                        catch (Exception ex)
                        {
                            lblReciept.Text = "Error: " + ex.Message;
                        }
                    }
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select valid file.');", true);
                }


            }

            lblReciept.Text = count + " files uploaded";
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;

            try
            {
                ProjectDeliveryDetails objProjectDetails = new ProjectDeliveryDetails()
                {
                    ProjectID = ddlProjectName.SelectedValue,
                    
                    
                    AMC = txtAMC.Text,
                    FreeSupport = txtFreeSupport.Text,
                    Cost = txtCost.Text,
                    WorkingDays = txtWorkingDays.Text,
                  
                };
                if (ddlTechnology.SelectedItem.Text == "Other")
                {
                    objProjectDetails.Technology = txtTechnology.Text;
                    objProjectDetails.Mode = 2;
                }
                else
                {
                    reqtxtTechnology.Enabled = false;
                    objProjectDetails.Technology = ddlTechnology.SelectedValue;
                    objProjectDetails.Mode = 1;
                }
                string name = "";
                for (int i = 0; i < chkProjectType.Items.Count; i++)
                {
                    if (chkProjectType.Items[i].Selected)
                    {
                        name += chkProjectType.Items[i].Text + ",";
                      
                    }
                }
                name.Remove(name.Length - 1, 1);
                objProjectDetails.ProjectType = name;
            _isInserted = objTask.AddProjectDeliveryDetails(objProjectDetails);
                if (_isInserted == -1)
                {
                    lblMessage.Text = "Failed to Add Project Details";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {

                    lblMessage.Text = "Project Details Updated";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    foreach (ListItem item in chkProjectType.Items)
                    {
                        if (item.Selected)
                        {
                            objcommon.AddProjectDeliveryType(Convert.ToInt32(ddlProjectName.SelectedValue), item.Value);
                        }
                    }
                    Clear();
                }
            }

            catch (Exception ex)
            {

            }
        }


        public void Clear()
        {
            ddlProjectName.SelectedIndex = 0;
            txtAMC.Text = "";
            txtCost.Text = "";
            txtWorkingDays.Text = "";
            txtFreeSupport.Text = "";
            ddlTechnology.SelectedIndex = 0;
        }

        protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProjectIndexChanged();
        }

        public void ddlProjectIndexChanged()
        {
            if (ddlProjectName.SelectedIndex != 0)
            {
                DataSet dtobjProjectDetails = new DataSet();
                dtobjProjectDetails = objTask.AutoFillProjectDeliveryDetails(Convert.ToInt32(ddlProjectName.SelectedValue));
                if (dtobjProjectDetails.Tables[0].Rows.Count > 0)
                {
                    ddlTechnology.SelectedValue = dtobjProjectDetails.Tables[0].Rows[0]["Technology"].ToString();
                    txtWorkingDays.Text = dtobjProjectDetails.Tables[0].Rows[0]["WorkingDays"].ToString();
                    txtFreeSupport.Text = dtobjProjectDetails.Tables[0].Rows[0]["FreeSupport"].ToString();
                    txtAMC.Text = dtobjProjectDetails.Tables[0].Rows[0]["AMC"].ToString();
                    txtCost.Text = dtobjProjectDetails.Tables[0].Rows[0]["Costing"].ToString();
                    foreach (DataRow dr in dtobjProjectDetails.Tables[1].Rows)
                    {
                        foreach (ListItem item in chkProjectType.Items)
                        {
                            if (item.Value == dr["DeliveryTypeID"].ToString())
                                item.Selected = true;
                        }
                        //chkDepartment.SelectedValue = dr["DepartmentID"].ToString();
                    }
                    if (dtobjProjectDetails.Tables[2].Rows.Count > 0)
                    {
                        GridScope.DataSource = dtobjProjectDetails.Tables[2];
                        GridScope.DataBind();
                        Scope.Visible = true;
                    }
                }

            }
        }

        protected void ddlTechnology_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTechnology.SelectedItem.Text == "Other")
            {
                txtTechnology.Visible = true;

            }

            else
            {
                txtTechnology.Visible = false;
            }
        }

        protected void GridScope_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try { 
            if (e.CommandName == "Download")
            {
                string rname = (e.CommandArgument).ToString();
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "filename=" + rname);
                Response.TransmitFile(Server.MapPath("~/Scope/") + rname);
                Response.End();
            }
                if (e.CommandName == "Remove")

                {
                    int eid = Convert.ToInt32(e.CommandArgument);
                   
                    objcommon.RemoveScope(eid);
                    ddlProjectIndexChanged();
                }
            }
            catch (Exception ex)
            {
                
            }
}
    }
}