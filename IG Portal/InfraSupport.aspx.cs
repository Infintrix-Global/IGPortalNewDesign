using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class InfraSupport : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindAssetMaster();
            }
        }

        public void BindAssetMaster()
        {
            ddlAssetName.DataSource = objcommon.GetAssetMasterbyCustomer(Convert.ToInt32(Session["LoginID"].ToString()));
            ddlAssetName.DataTextField = "AssetName";
            ddlAssetName.DataValueField = "ID";
            ddlAssetName.DataBind();
            ddlAssetName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void btnAssetNext_Click(object sender, EventArgs e)
        {
            Details.Visible = true;
            Asset.Visible = false;
        }

        protected void btnDetailsPrev_Click(object sender, EventArgs e)
        {

            Details.Visible = false;
            Asset.Visible = true;
        }

        protected void btnDetailsNext_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;
            InfraSupportDetails objSupportDetails = new InfraSupportDetails()
            {
                Details = CKEditor1.Text,
              Priority=radPriority.SelectedValue,
                AssetID = ddlAssetName.SelectedValue,
                LoginID = Session["LoginID"].ToString(),

            };
           
            _isInserted = objTask.AddInfraSupport(objSupportDetails);

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
                Response.Redirect("~/ViewInfraSupportTicket.aspx");

            }
        }


        public void Clear()
        {
            CKEditor1.Text = "";
            ddlAssetName.SelectedIndex = 0;
            lbldetails.Text = "";
        }
        protected void ddlAssetName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlAssetName.SelectedIndex!=0)
            {
                DataTable dt = objTask.GetAssetDetailsbyID(ddlAssetName.SelectedValue);
                StringBuilder sb = new StringBuilder();
                sb.AppendLine("Asset Name:" + dt.Rows[0]["AssetName"].ToString());
                sb.AppendLine("Asset Number:" + dt.Rows[0]["AssetNummber"].ToString());
                sb.AppendLine("Serial Number:" + dt.Rows[0]["AssetSerialNo"].ToString());
                lbldetails.Text = sb.ToString().Replace(Environment.NewLine, "<br />");
                //lbldetails.Text = "Asset Name:" + dt.Rows[0]["AssetName"].ToString() + "/n";
               // lbldetails.Text += "Asset Number:" + dt.Rows[0]["AssetNummber"].ToString();
               // lbldetails.Text += "Serial Number:" + dt.Rows[0]["AssetSerialNo"].ToString();

            }
            
        }
    }
}