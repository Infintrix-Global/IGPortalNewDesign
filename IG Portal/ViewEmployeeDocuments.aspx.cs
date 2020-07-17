using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Data;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class ViewEmployeeDocuments : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeDocuments();
            }
        }


        public void BindEmployeeDocuments()
        {
            DataTable dt = new DataTable();
            dt = objTask.GetEmployeeDocuments(Convert.ToInt32(Session["EmployeeID"].ToString()));
            GridDocument.DataSource = dt;
            GridDocument.DataBind();
            count.Text = "Number of Documents =" + dt.Rows.Count;
        }

        protected void GridDocument_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Upload")
            {
                int rowIndex = int.Parse(e.CommandArgument.ToString().Trim());

                // ID of the Current Row
                String DocID = GridDocument.DataKeys[rowIndex].Values["DocumentID"].ToString().Trim();

                //File Upload Instance of the Current Row
                FileUpload fileUpload = (FileUpload)GridDocument.Rows[rowIndex].FindControl("FileupDocs");
                string[] validFileTypes = { "jpeg", "png", "jpg", "pdf"};
                string filename = "", newfile = "";
                if (!fileUpload.HasFile)
                {
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select a file.');", true);
                    fileUpload.Focus();
                }
                string aa = fileUpload.FileName;
                string ext = System.IO.Path.GetExtension(fileUpload.PostedFile.FileName).ToLower();
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

                    if (fileUpload.HasFile)
                    {

                        filename = Server.MapPath(fileUpload.FileName);
                        newfile = fileUpload.PostedFile.FileName;
                        //                filecontent = System.IO.File.ReadAllText(filename);
                        FileInfo fi = new FileInfo(newfile);

                        // check folder exist or not
                        if (!System.IO.Directory.Exists(@"~\EmployeeDocuments"))
                        {
                            try
                            {
                                string Imgname = Session["EmployeeID"].ToString() + "_DocID" + ext;

                                string path = Server.MapPath(@"~\EmployeeDocuments\");
                                System.IO.Directory.CreateDirectory(path);
                                fileUpload.SaveAs(path + @"\" + Imgname);



                                lblmsg.Text = Imgname;

                                int _isInserted = objTask.AddEmployeeDocument(Session["EmployeeID"].ToString(), DocID, Imgname);
                               
                                if (_isInserted >0)
                                {

                                    lblmsg.Text = "Document successfully uploaded";
                                }
                                else
                                {
                                    lblmsg.Text = "Document Cheque uploading failed";
                                }

                            }
                            catch (Exception ex)
                            {
                                lblmsg.Text = "Not able to create new directory";
                            }

                        }
                    }
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select valid file.');", true);
                }

            }

            if (e.CommandName == "Download")
            {
                string rname = (e.CommandArgument).ToString();
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/EmployeeDocuments/") + e.CommandArgument);
                Response.End();
            }
        }

        protected void GridDocument_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    string uid = (e.Row.FindControl("lnkDwnld") as LinkButton).Text;
                    if (uid == "")
                    {
                        (e.Row.FindControl("lnkDwnld") as LinkButton).Visible = false;
                    }
                    else
                    {
                        (e.Row.FindControl("FileupDocs") as FileUpload).Visible = false;
                        (e.Row.FindControl("btnsubmit") as Button).Visible = false;


                    }
                }
            }
            catch (Exception ex)
            {

            }
        }


        
    }
}