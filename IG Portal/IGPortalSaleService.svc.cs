using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Collections.Specialized;
using System.Text;
using System.Configuration;
using System.Web;
using System.Web.Hosting;
using System.Drawing.Imaging;
using System.Net;
using IG_Portal.Common;
using System.IO;
using System.Data;
using System.Text.RegularExpressions;
using IG_Portal.BAL_Classes;
using IG_Portal;

namespace IG_Portal
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IIGPortalSaleService
    {
        clsCommonMasters objclsCommon = new clsCommonMasters();
        CommonControl objCommonControl = new CommonControl();

        #region EnquirySource
        public Master GetEnquirySourceMaster()
        {
            Master enquirySource = new Master();

            try
            {

                List<MasterData> list = new List<MasterData>();
                MasterData objmd = null;
                NameValueCollection nv = new NameValueCollection();


                DataTable dt = objCommonControl.GetDataTable("SP_EnquirySourceMaster", nv);
                if (dt != null)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        objmd = new MasterData();
                        objmd.ID = dt.Rows[i]["ID"].ToString();
                        objmd.Name = dt.Rows[i]["SourceName"].ToString();


                        list.Add(objmd);
                    }
                    enquirySource.data = list;
                    enquirySource.message = "EnquirySourcelist";
                    enquirySource.status = "1";

                }
                else
                {
                    enquirySource.data = null;
                    enquirySource.message = "EnquirySourcelist empty";
                    enquirySource.status = "1";
                }
                return enquirySource;
            }
            catch (Exception ex)
            {
                enquirySource.data = null;
                enquirySource.message = "EnquirySourcelist empty";
                enquirySource.status = "1";
            }
            return enquirySource;
        }
        #endregion

        #region TechnologyMaster
        public Master GetTechnologyMaster()
        {
            Master technology = new Master();

            try
            {

                List<MasterData> list = new List<MasterData>();
                MasterData objmd = null;
                NameValueCollection nv = new NameValueCollection();

                DataTable dt = objCommonControl.GetDataTable("SP_TechnologyMaster", nv);
                if (dt != null)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        objmd = new MasterData();
                        objmd.ID = dt.Rows[i]["ID"].ToString();
                        objmd.Name = dt.Rows[i]["TechnologyName"].ToString();


                        list.Add(objmd);
                    }
                    technology.data = list;
                    technology.message = "Technolgylist";
                    technology.status = "1";

                }
                else
                {
                    technology.data = null;
                    technology.message = "Technolgylist empty";
                    technology.status = "1";
                }
                return technology;
            }
            catch (Exception ex)
            {
                technology.data = null;
                technology.message = "Technolgylist empty";
                technology.status = "1";
            }
            return technology;
        
    }
        #endregion

        #region EnquiryFor
        public Master GetEnquiryForMaster()
        {
            Master enquiryFor = new Master();

            try
            {

                List<MasterData> list = new List<MasterData>();
                MasterData objmd = null;
                NameValueCollection nv = new NameValueCollection();


                DataTable dt = objCommonControl.GetDataTable("SP_ProjectTypeMaster", nv);
                if (dt != null)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        objmd = new MasterData();
                        objmd.ID = dt.Rows[i]["ID"].ToString();
                        objmd.Name = dt.Rows[i]["ProjectType"].ToString();


                        list.Add(objmd);
                    }
                    enquiryFor.data = list;
                    enquiryFor.message = "EnquiryForlist";
                    enquiryFor.status = "1";

                }
                else
                {
                    enquiryFor.data = null;
                    enquiryFor.message = "EnquiryForlist empty";
                    enquiryFor.status = "1";
                }
                return enquiryFor;
            }
  
            catch(Exception ex)
            {
                enquiryFor.data = null;
                enquiryFor.message = "EnquiryForlist empty";
                enquiryFor.status = "1";
            }
            return enquiryFor;
        }
        #endregion

        #region EnquiryStatus
        public Master GetEnquiryStatusMaster()
        {
            Master enquiryFor = new Master();

            try
            {

                List<MasterData> list = new List<MasterData>();
                MasterData objmd = null;
                NameValueCollection nv = new NameValueCollection();


                DataTable dt = objCommonControl.GetDataTable("SP_EnquiryStatusMaster", nv);
                if (dt != null)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        objmd = new MasterData();
                        objmd.ID = dt.Rows[i]["ID"].ToString();
                        objmd.Name = dt.Rows[i]["StatusName"].ToString();


                        list.Add(objmd);
                    }
                    enquiryFor.data = list;
                    enquiryFor.message = "EnquiryStatuslist";
                    enquiryFor.status = "1";

                }
                else
                {
                    enquiryFor.data = null;
                    enquiryFor.message = "EnquiryStatuslist empty";
                    enquiryFor.status = "1";
                }
                return enquiryFor;
            }
            catch (Exception ex)
            {
                enquiryFor.data = null;
                enquiryFor.message = "EnquiryStatuslist empty";
                enquiryFor.status = "1";
            }
            return enquiryFor;
        }
        #endregion


        #region CountryMaster
        public Master CountryMaster()
        {
            Master countrylist = new Master();
            List<MasterData> list = new List<MasterData>();
            MasterData objmd = null;
            NameValueCollection nv = new NameValueCollection();
        
            DataTable dt = objCommonControl.GetDataTable("SP_GetCountryMaster", nv);
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    objmd = new MasterData();
                    objmd.ID = dt.Rows[i]["ID"].ToString();
                    objmd.Name = dt.Rows[i]["CountryName"].ToString();


                    list.Add(objmd);
                }
                countrylist.data = list;
                countrylist.message = "countrylist";
                countrylist.status = "1";

            }
            else
            {
                countrylist.data = null;
                countrylist.message = "countrylist empty";
                countrylist.status = "1";
            }
            return countrylist;
        }
        #endregion

        #region StateMaster
        public Master StateMaster(string CountryID)
        {
            Master statelist = new Master();
            List<MasterData> list = new List<MasterData>();
            MasterData objmd = null;
            NameValueCollection nv = new NameValueCollection();
            nv.Add("@CountryID", CountryID);

            DataTable dt = objCommonControl.GetDataTable("SP_GetStateMaster", nv);
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    objmd = new MasterData();
                    objmd.ID = dt.Rows[i]["StateID"].ToString();
                    objmd.Name = dt.Rows[i]["StateName"].ToString();


                    list.Add(objmd);
                }
                statelist.data = list;
                statelist.message = "statelist";
                statelist.status = "1";

            }
            else
            {
                statelist.data = null;
                statelist.message = "statelist empty";
                statelist.status = "1";
            }
            return statelist;
        }
        #endregion

        #region CityMaster
        public Master CityMaster(string StateID)
        {
            Master citylist = new Master();
            List<MasterData> list = new List<MasterData>();
            MasterData objmd = null;
            NameValueCollection nv = new NameValueCollection();
            nv.Add("@StateID", StateID);

            DataTable dt = objCommonControl.GetDataTable("SP_GetCityMaster", nv);
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    objmd = new MasterData();
                    objmd.ID = dt.Rows[i]["CityID"].ToString();
                    objmd.Name = dt.Rows[i]["CityName"].ToString();


                    list.Add(objmd);
                }
                citylist.data = list;
                citylist.message = "citylist";
                citylist.status = "1";

            }
            else
            {
                citylist.data = null;
                citylist.message = "citylist empty";
                citylist.status = "1";

            }
            return citylist;
        }
        #endregion

        #region AddLead
        public InsertData InsertLead(string FirstName, string LastName, string Date, string Email, string Mobile, string Location, int City, int State, int Country, string CompanyName, string CompanyType, string EnquirySource, string Website, string Interest, string Status, string Technology, string PrefferedTechnology, string Remarks, string[] EnquiryFor, int Mode)
        {
            NameValueCollection nv = new NameValueCollection();
            NameValueCollection nv1 = new NameValueCollection();
            long result = 0; long result1 = 0;
            InsertData CSU = new InsertData();
            //int DueDate = 0, Term= 0, BankID = 0, City = 0, State = 0, Country = 0;
            //string FirstName = "", LastName = "", DOB = "", Email = "", Mobile = "", Street = "", Address = "", Zipcode = "",  Amount = "", LoanType = "", BankBranch = "", BankAddress = "";
            try
            {
                DateTime dtz1 = DateTime.Parse(Date, objCommonControl.GetCurrentCulture());
            string strDate= (dtz1).ToString("yyyy-MM-dd");
            nv.Add("@FirstName", FirstName);
            nv.Add("@LastName", LastName);
            nv.Add("@Mobile", Mobile);
            nv.Add("@Email", Email);
            nv.Add("@EnquiryDate", strDate);
            nv.Add("@CountryID", Convert.ToString(Country));
            nv.Add("@StateID", Convert.ToString(State));
            nv.Add("@CityID", Convert.ToString(City));
            nv.Add("@Location", Location);
            nv.Add("@CompanyName", CompanyName);
            nv.Add("@CompanyType", CompanyType);
            nv.Add("@WebsiteURL", Website);

            nv.Add("@EnquirySource", EnquirySource);
            nv.Add("@Technology", Technology);
            nv.Add("@PrefferedTechnology", PrefferedTechnology);
            nv.Add("@Remarks", Remarks);
            nv.Add("@Interest", Interest);
            nv.Add("@Status", Status);
            nv.Add("@Mode", Convert.ToString(Mode));

            result = objCommonControl.GetDataExecuteScalerRetObj("SP_AddLeadDetails", nv);

            if (result > 0)
            {


                CSU.message = "Success";
                CSU.data = result.ToString();
                    for (int i = 0; i < EnquiryFor.Length; i++)
                    {
                        nv1.Add("@EnquiryFor", EnquiryFor[i]);
                        nv1.Add("@LeadID", result.ToString());
                        result1 = objCommonControl.GetDataExecuteScalerRetObj("SP_AddLeadEnquiry",nv1);
                    }
                    CSU.status = "1";
            }

            else
            {

                // FUR.message = "Fail";


                CSU.message = "Record  not inserted";
                CSU.data = null;
                CSU.status = "0";


            }

            return CSU;
            }

            catch (Exception ex)
            {



            }
            return CSU;
        }
        #endregion


    }
}
