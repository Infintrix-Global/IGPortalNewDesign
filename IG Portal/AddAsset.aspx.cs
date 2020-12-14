using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class AddAsset : System.Web.UI.Page
    {
        clsCommonMasters objcommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomerMaster();
            }

            }

        public void BindCustomerMaster()
        {

            ddlCustomerName.DataSource = objcommon.GetInfraClientMaster(Convert.ToInt32(Session["CompanyID"].ToString()));
            ddlCustomerName.DataTextField = "EmployeeName";
            ddlCustomerName.DataValueField = "ID";
            ddlCustomerName.DataBind();
            ddlCustomerName.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int _isInserted = -1;


            try
            {
                Asset_Details objAssetDetails = new Asset_Details()
                {
                    CustomerID = ddlCustomerName.SelectedValue,
                    AssetName = txtAssetName.Text,
                    AssetSerialNum = txtSerialNum.Text,
                    AssetNo = txtAssetNo.Text,
                    SupportSDate = txtSDate.Text,//(Convert.ToDateTime(txtSDate.Text)).ToString("dd MMM yyyy"),
                    SupportEDate =  txtEDate.Text //(Convert.ToDateTime(txtEDate.Text)).ToString("dd MMM yyyy"),



                };
                _isInserted = objTask.AddAsset(objAssetDetails);

                if (_isInserted == -1)
                {
                    lblMessage.Text = "Failed to Add Asset";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {

                    lblMessage.Text = "Asset Added";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                  
                    Clear();


                }
            }
            catch(Exception ex)
            {

            }
            }
        public void Clear()
        {
            txtAssetName.Text = "";
            txtSerialNum.Text = "";
                txtAssetNo.Text = "";
            txtSDate.Text = "";
            txtEDate.Text = "";
        }
           
    }
}