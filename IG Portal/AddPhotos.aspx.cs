using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class AddPhotos : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindEventMaster();
            }
        }

        public void BindEventMaster()
        {
            ddlEvent.DataSource = objcommon.GetEventMaster();
            ddlEvent.DataTextField = "Title";
            ddlEvent.DataValueField = "ID";
            ddlEvent.DataBind();
           
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            Upload(ddlEvent.SelectedValue);
        }

        public void Upload(string eventID)
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

                    if (!System.IO.Directory.Exists(@"~\EventGallery"))
                    {
                        try
                        {
                            string Imgname = uploadedFile.FileName;

                            string path = Server.MapPath(@"~\EventGallery\");
                            System.IO.Directory.CreateDirectory(path);

                            _isInserted = objTask.AddEventGallery(eventID, Imgname);
                            uploadedFile.SaveAs(path + @"\" + Imgname);
                            count++;
                        }
                        catch (Exception ex)
                        {
                           
                        }
                    }
                }


            }

            lblReciept.Text = count + " files uploaded";
        }
    }
}