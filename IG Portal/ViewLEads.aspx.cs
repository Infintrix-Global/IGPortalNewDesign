using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class ViewLEads : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindLeads();
                BindEnquirySource();
                BindEnquiryFor();
                BindStatus();
            }
        }

        public void BindLeads()
        {
            DataTable dtLead;

            dtLead = objTask.GetLead();
            GridLead.DataSource = dtLead;
            GridLead.DataBind();
            count.Text = "Number of Leads =" + dtLead.Rows.Count;
            ViewState["dirState"] = dtLead;
            ViewState["sortdr"] = "Asc";
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
                ddlEnquiryFor.DataSource = objCommon.ProjectTypeMaster();
                ddlEnquiryFor.DataTextField = "ProjectType";
                ddlEnquiryFor.DataValueField = "ID";
                ddlEnquiryFor.DataBind();
            ddlEnquiryFor.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }

        public void BindStatus()
        {
            ddlStatus.DataSource = objCommon.GetEnquiryStatusMaster();
            ddlStatus.DataTextField = "StatusName";
            ddlStatus.DataValueField = "ID";
            ddlStatus.DataBind();

            ddlStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));

        }


        protected void ddlEnquirySource_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btclear_Click(object sender, EventArgs e)
        {
            ddlStatus.SelectedIndex = 0;
            ddlEnquirySource.SelectedIndex = 0;
            ddlEnquiryFor.SelectedIndex = 0;
            txtToDate.Text = "";
            txtFromDate.Text = "";
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuery = "";
                string strQuery1 = ""; string strQuery2 = "";
                string strQueryfinal1 = ""; string strQueryfinal2 = ""; string strQueryfinal = "";
                DataTable dtSearch1;

                strQuery = "Select * from (select LeadID,EnquiryFor=Stuff " +
                    "  ((   select distinct ',' + PTM.PRojectType  from LEadEnquiry LE inner join PRojectTypeMaster PTM on PTm.ID=LE.EnquiryFor " +
                    " WHERE MA.LEadID=LE.LEadID  for xml path('')  ),1,1,'') from LEadEnquiry MA ";

                strQuery1 = "(Select LD.*,ESm.SourceName,C.CountryName,S.StateName,CT.CityName,TM.TechnologyName,EQSM.StatusName from LeadDetails LD inner join EnquirySourceMaster ESM" +
                    " on LD.EnquirySource=ESM.ID inner join Country C on C.ID=LD.Country inner join State S on S.ID=LD.State inner join City CT on CT.ID=LD.City" +
                    " inner join TechnologyMaster TM on TM.ID=LD.PreferredTechnology inner join EnquiryStatusMaster EQSM on EQSM.ID=LD.EnquiryStatus where LD.IsPreferredTechnology='Yes' and LD.IsActive=1";

                strQuery2 = "(Select LD.*,ESm.SourceName,C.CountryName,S.StateName,CT.CityName,TM.TechnologyName,EQSM.StatusName from LeadDetails LD inner join EnquirySourceMaster ESM" +
                    " on LD.EnquirySource=ESM.ID inner join Country C on C.ID=LD.Country inner join State S on S.ID=LD.State inner join City CT on CT.ID=LD.City" +
                    " inner join TechnologyMaster TM on TM.ID=LD.PreferredTechnology inner join EnquiryStatusMaster EQSM on EQSM.ID=LD.EnquiryStatus where LD.IsPreferredTechnology='Yes' and LD.IsActive=1";

                if (ddlEnquiryFor.SelectedIndex > 0)
                {
                    strQuery += " where MA.EnquiryFor ='" + ddlEnquiryFor.SelectedValue + "'";
                    
                }
                if (ddlEnquirySource.SelectedIndex > 0)
                {
                    strQuery1 += " and LE.EnquirySource ='" + ddlEnquirySource.SelectedValue + "'";
                    strQuery2 += " and LE.EnquirySource ='" + ddlEnquirySource.SelectedValue + "'";
                }

                if (ddlStatus.SelectedIndex > 0)
                {
                    strQuery1 += " and LD.EnquiryStatus ='" + ddlStatus.SelectedValue + "'";
                    strQuery2 += " and LD.EnquiryStatus ='" + ddlStatus.SelectedValue + "'";
                }
                if (txtToDate.Text != "" && txtFromDate.Text != "")
                {
                    strQuery1 += " and LD.EnquiryDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                    strQuery2 += " and LD.EnquiryDate between '" + txtFromDate.Text + "'  and  '" + txtToDate.Text + "'";
                }

                strQuery += " group by MA.LEadID)  T1 inner join";
                strQuery1 += " ) T2 on T1.LEadID=T2.ID";
                strQuery2 += " ) T2 on T1.LEadID=T2.ID";
               
                strQueryfinal1 = strQuery + strQuery1;
                strQueryfinal2 = strQuery + strQuery2;
                strQueryfinal = strQueryfinal1 + " union " + strQueryfinal2;
                dtSearch1 = objTask.SearchLead(strQueryfinal);
                GridFillSearch();

                void GridFillSearch()
                {
                    if (dtSearch1 != null)
                    {
                        //DataTable dtSearch = dtSearch1.CopyToDataTable();
                        GridLead.DataSource = dtSearch1;
                        GridLead.DataBind();

                        count.Text = "Number of Leads= " + (dtSearch1.Rows.Count).ToString();
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        GridLead.DataSource = dt;
                        GridLead.DataBind();

                        count.Text = "Number of Leads= 0";
                    }
                    ViewState["dirState"] = dtSearch1;
                    ViewState["sortdr"] = "Asc";


                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void GridLead_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridLead.PageIndex = e.NewPageIndex;
            
            btSearch_Click(sender, e);
        }

        protected void GridLead_Sorting(object sender, GridViewSortEventArgs e)
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
                GridLead.DataSource = dtrslt;
                GridLead.DataBind();
            }
        }
    }
}