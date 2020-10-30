using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Threading.Tasks;
using IG_Portal.Common;


namespace IG_Portal
{
    [ServiceContract]
    public  interface IIGPortalSaleService
    {
        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "GetEnquirySourceMaster", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        Master GetEnquirySourceMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "GetTechnologyMaster", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        Master GetTechnologyMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "GetEnquiryStatusMaster", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        Master GetEnquiryStatusMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "GetEnquiryForMaster", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        Master GetEnquiryForMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "CountryMaster", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        Master CountryMaster();


        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "StateMaster", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        Master StateMaster(string CountryID);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "CityMaster", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        Master CityMaster(string StateID);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "InsertLead", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest)]
        InsertData InsertLead(string FirstName, string LastName,  string Date, string Email, string Mobile, string Location, int City, int State, int Country, string CompanyName, string CompanyType,  string EnquirySource, string Website, string Interest, string Status, string Technology, string PrefferedTechnology, string Remarks, string[] EnquiryFor,int Mode);

    }
}
