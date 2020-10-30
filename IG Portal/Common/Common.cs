using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.IO;
using System.Data;

namespace IG_Portal.Common
{
    public class Common
    {
    }

    public class A_File_Upload
    {
        public string Fname { get; set; }

        public string Fext { get; set; }
    }


    public class UploadRequest : IDisposable
    {
        [MessageHeader(MustUnderstand = true)]
        public string fileName { get; set; }

        [MessageBodyMember(Order = 1)]
        public Stream Stream { get; set; }

        public int userid { get; set; }

        public string documentType { get; set; }
        public void Dispose()
        {
            if (Stream == null)
            {
                return;
            }

            Stream.Close();
            Stream = null;
        }
    }

   public class Master
    {
        public List<MasterData> data { get; set; }
        public string message { get; set; }
        public string status { get; set; }

    }
    public class MasterData
    {
        public string Name { get; set; }
        public string ID { get; set; }
    }

    public class InsertData
    {
        public string message { get; set; }
        public string status { get; set; }
        public string data { get; set; }
    }


    public class Lead_Details
    {
        public DateTime EnquiryDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string CompanyName { get; set; }
        public string CompanyType { get; set; }
        public string Gender { get; set; } 
        public long CountryID { get; set; }
        public long StateID { get; set; }
        public long CityID { get; set; }
        public string EnquiryFor { get; set; }
        public string EnquirySource { get; set; }
        public string Location { get; set; }
        public string WebsiteURL { get; set; }
        public string Interest { get; set; }
        public string Status { get; set; }

        public string Technology { get; set; }

        public string PrefferedTechnology { get; set; }

        public string Remarks { get; set; }

        public int Mode { get; set; }

    }


}