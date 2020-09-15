using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class LeadDetails : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindCountry();
                BindEnquirySource();
                BindEnquiryFor();
                BindStatus();
                BindTechnology();
            }
        }

        public void BindStatus()
        {
            ddlStatus.DataSource = objCommon.GetEnquiryStatusMaster();
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";
            ddlStatus.DataBind();

            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }

        public void BindTechnology()
        {
            ddlTechnology.DataSource = objCommon.GetTechnologyMaster();
            ddlTechnology.DataTextField = "TechnologyName";
            ddlTechnology.DataValueField = "ID";
            ddlTechnology.DataBind();

            ddlTechnology.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }
        public void BindEnquirySource()
        {
            ddlEnquirySource.DataSource = objCommon.GetEnquirySourceMaster();
            ddlEnquirySource.DataTextField = "SourceName";
            ddlEnquirySource.DataValueField = "ID";
            ddlEnquirySource.DataBind();

            ddlEnquirySource.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }

        public void BindEnquiryFor()
        {
            chkEnquiryFor.DataSource = objCommon.ProjectTypeMaster();
            chkEnquiryFor.DataTextField = "ProjectType";
            chkEnquiryFor.DataValueField = "ID";
            chkEnquiryFor.DataBind();
           

        }
        public void BindCountry()
        {
            ddlCountry.DataSource = objCommon.CountryMaster();
            ddlCountry.DataTextField = "CountryName";
            ddlCountry.DataValueField = "ID";
            ddlCountry.DataBind();

            ddlCountry.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }

        public void BindState()
        {

            string Couid = "";

            if (ddlCountry.SelectedValue == "")
            {
                Couid = "0";

            }
            else
            {
                Couid = ddlCountry.SelectedValue;

            }



            ddlState.DataSource = objCommon.StateMaster(Convert.ToInt32(Couid));
            ddlState.DataTextField = "StateName";
            ddlState.DataValueField = "StateID";
            ddlState.DataBind();

            ddlState.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }
        public void BindCity()
        {
            string sid = "";

            if (ddlState.SelectedValue == "")
            {
                sid = "0";

            }
            else
            {
                sid = ddlState.SelectedValue;

            }

            ddlCity.DataSource = objCommon.CityMaster(Convert.ToInt32(sid));
            ddlCity.DataTextField = "CityName";
            ddlCity.DataValueField = "CityID";
            ddlCity.DataBind();

            ddlCity.Items.Insert(0, new ListItem("--- Select ---", "0"));
        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindState();
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCity();
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkEnquiryFor.Items.Count > 0)
                {
                    int _isInserted = -1;
                    Lead_Details objLead = new Lead_Details()
                    {
                        FirstName = txtName.Text,
                        LastName = txtLastName.Text,
                        Mobile = txtMobile.Text,
                        Email = txtEmail.Text,
                        CountryID = Convert.ToInt32(ddlCountry.SelectedValue),
                        StateID = Convert.ToInt32(ddlState.SelectedValue),
                        CityID = Convert.ToInt32(ddlCity.SelectedValue),
                        Location = txtLocation.Text,
                        CompanyName = txtCompanyName.Text,
                        CompanyType = txtCompanyType.Text,
                        EnquiryDate = Convert.ToDateTime(txtEnquiryDate.Text),
                        WebsiteURL = txtWebsite.Text,
                        EnquirySource = ddlEnquirySource.SelectedValue,
                        Technology = radTechnology.SelectedValue,
                        Remarks = txtRemark.Text,

                        Interest = radInterest.SelectedValue,
                        Status = ddlStatus.SelectedValue,

                    };
                    if (radTechnology.SelectedValue == "Yes")
                    {
                        if (ddlTechnology.SelectedItem.Text == "Other")
                        {
                            objLead.PrefferedTechnology = txtTechnology.Text;
                            objLead.Mode = 2;
                        }
                        else
                        {
                            reqtxtTechnology.Enabled = false;
                            objLead.PrefferedTechnology = ddlTechnology.SelectedValue;
                            objLead.Mode = 1;
                        }

                    }
                    else
                    {
                        reqdddlTechnology.Enabled = false;
                        reqtxtTechnology.Enabled = false;
                        objLead.PrefferedTechnology = "";
                        objLead.Mode = 1;
                    }

                    _isInserted = objCommon.AddLeadDetails(objLead);

                    if (_isInserted == -1)
                    {

                        lblmsg.Text = "Failed to Add Lead";
                        lblmsg.ForeColor = System.Drawing.Color.Red;

                    }

                    else
                    {
                        foreach (ListItem item in chkEnquiryFor.Items)
                        {
                            if (item.Selected)
                            {
                                objCommon.AddLeadEnquiry(item.Value, _isInserted);
                            }
                        }
                        lblmsg.Text = "Lead Added ";
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                    }
                }
                

                btclear_Click(sender, e);
            }
            catch (Exception ex)
            {
                
            }
        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtLastName.Text = "";
            txtLocation.Text = "";
            txtMobile.Text = "";
            ddlStatus.SelectedValue = "0";
            txtEnquiryDate.Text = "";
            BindCountry();
            ddlCountry.SelectedValue = "1";
            BindState();
            ddlState.SelectedValue = "2";
            BindCity();
            ddlCity.SelectedValue = "34";
            txtEmail.Text = "";

            txtCompanyName.Text = "";
            txtCompanyType.Text = "";
            
            txtWebsite.Text = "";
            radTechnology.SelectedValue = "No";
            radTechnology_SelectedIndexChanged(sender,e);
            reqdddlTechnology.Enabled = true;
            txtTechnology.Visible = false;
            txtTechnology.Text = "";
            ddlTechnology.SelectedValue="0";
            txtRemark.Text = "";
          
            ddlEnquirySource.SelectedValue = "0";
            chkEnquiryFor.Items.Clear();
            BindEnquiryFor();
           radInterest.SelectedValue = "3";
            
           

            
        }

        protected void radTechnology_SelectedIndexChanged(object sender, EventArgs e)
        {
           
                if (radTechnology.SelectedValue == "Yes")
                {

                lblTechnologyType.Visible = true;
                ddlTechnology.Visible = true;
                txtTechnology.Visible = false;
                  
                }
                else if (radTechnology.SelectedValue == "No")
                {
                lblTechnologyType.Visible = false;
                ddlTechnology.Visible = false;
                txtTechnology.Visible = false;
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
    }
}