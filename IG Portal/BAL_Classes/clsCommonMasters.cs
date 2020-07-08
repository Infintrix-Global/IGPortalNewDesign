using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;

using System.Web.Mail;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public class clsCommonMasters
    {

        DataSet ds = new DataSet();
        General objGeneral = new General();
        BAL_Task objTask = new BAL_Task();
        //DataSet ds = new DataSet();
        private string strQuery = string.Empty;

        public string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        public string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }

        public void SendMail(string Email, string Username, string Password)
        {
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                       // any address where the email will be sending
                                                       // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";

                var toAddress = Email;

                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "Your UserName and Password For IG-Portal";
                string body = "Dear ," + "\n";

                body += "Your UserName and passward For IG-Portal :" + "\n";
                body += "UserName : " + Username + " " + "\n\n";
                body += "Passward : " + Password + " " + "\n\n";
                body += "Thank you!" + "\n";
                body += "Warm Regards," + "\n";

                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 50000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailLeaveApplication( Leave objLeaveApplication)
        {
            DataTable dtEmpDetails;
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                       // any address where the email will be sending
                                                       // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";
               dtEmpDetails=  objTask.GetEmployeeByID(objLeaveApplication.LoginID);

                var toAddress = dtEmpDetails.Rows[0]["ManagerEmail"].ToString().Trim();
                var empName = dtEmpDetails.Rows[0]["EmployeeName"].ToString();
                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "Leave Application";
                string body = "Dear," + "\n";
                if (objLeaveApplication.Days == "1")
                {
                    body += empName + " has requested for leave on " + Convert.ToDateTime(objLeaveApplication.FromDate).ToString("dd MMM yyyy") + "."+ "\n";
                    
                }
                else
                {
                    body += empName + " has requested for leave from " + Convert.ToDateTime(objLeaveApplication.FromDate).ToString("dd MMM yyyy") + " to" + Convert.ToDateTime(objLeaveApplication.ToDate).ToString("dd MMM yyyy") +"."+ "\n";
                   
                }
                body += "Reason For Leave : " + objLeaveApplication.Reason + "." + "\n\n";

                body += "Thank you" + "\n";
                body += "Warm Regards" + "\n";
                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 50000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailLeaveApproval(int lid,string status)
        {
            DataTable dtLeaveDetails;
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                       // any address where the email will be sending
                                                       // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";
                dtLeaveDetails = objTask.GetLeaveDetailsByLeaveID(lid);

                var toAddress = dtLeaveDetails.Rows[0]["Email"].ToString().Trim();
                var empName = dtLeaveDetails.Rows[0]["EmployeeName"].ToString();
                
                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "Response to Leave Application";
                string body = "Dear " ;
                body += empName + "," + "\n\n";
                if (status == "2")
                {
                    if (dtLeaveDetails.Rows[0]["NumberOFDays"].ToString() == "1")
                    {
                        body += "Your Application for Leave on " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["FromDate"].ToString()).ToString("dd MMM yyyy") + " has been Approved." + "\n\n";

                    }
                    else
                    {
                        body += "Your Application for Leave from " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["FromDate"].ToString()).ToString("dd MMM yyyy") + " to " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["ToDate"].ToString()).ToString("dd MMM yyyy") + " has been Approved." + "\n\n";

                    }
                }

                if (status == "3")
                {
                    if (dtLeaveDetails.Rows[0]["NumberOFDays"].ToString() == "1")
                    {
                        body += "Your Application for Leave on " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["FromDate"].ToString()).ToString("dd MMM yyyy") + " has been Rejected." + "\n\n";
                        
                    }
                    else
                    {
                        body += "Your Application for Leave from " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["FromDate"].ToString()).ToString("dd MMM yyyy") + " to " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["ToDate"].ToString()).ToString("dd MMM yyyy") + " has been Rejected." + "\n\n";
                        
                    }
                }
                body += "Thank you" + "\n";
                body += "Warm Regards" + "\n";
                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 50000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailForgotPassword(string Email)
        {
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                       // any address where the email will be sending
                                                       // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";

                var toAddress = Email;

                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "OTP For IG-Portal";
                string[] saAllowedCharacters = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };

                string sRandomOTP = GenerateRandomOTP(6, saAllowedCharacters);
                string body = "Dear ," + "\n";

                body += "Your OTP for IG-Portal is  :" + sRandomOTP + "\n";

                body += "Thank you!" + "\n";
                body += "Warm Regards," + "\n";

                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    
                    smtp.UseDefaultCredentials = false;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 50000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
                UpdateOTP(Email, sRandomOTP);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailIncompleteTimeSheet(string Email)
        {
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                           // any address where the email will be sending
                                                           // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";

                var toAddress = Email;

                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "Incomplete Timesheet  ";
                
                string body = "Dear ," + "\n";

                body += "Your Timesheet is incomplete for "  + DateTime.Now.AddDays(-1).ToShortDateString() + "\n";

                body += "Thank you!" + "\n";
                body += "Warm Regards," + "\n";

                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;

                    smtp.UseDefaultCredentials = false;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 50000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
               
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendEmailMOM(string ToEmail,string CC,DataTable dtMOM)
        {
            try
            {

                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                       // any address where the email will be sending
                                                       // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";

                var toAddress = ToEmail;

                //Password of your gmail address
                const string fromPassword = "admin@1234";

                System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(fromAddress, toAddress);
                
                    mm.Subject = "MOM for " + dtMOM.Rows[0]["ProjectName"] + "- " + Convert.ToDateTime(dtMOM.Rows[0]["MeetingDate"]).ToString("dd/MMM/yyyy");
                    string body = "Dear ," + "\n";
                   
                    body += "Attendees of Meeting :" + dtMOM.Rows[0]["Attendees"] + "\n";
                    body += "Agenda : " + "\n";
                    body += dtMOM.Rows[0]["Agenda"] + "\n";

                    body += "Thank you!" + "\n";
                    body += "Warm Regards" + "\n";
                    mm.Body = body;
                    
                    string FileName = Path.GetFileName(dtMOM.Rows[0]["File"].ToString());
                    mm.Attachments.Add(new Attachment(@"~\MOM\" + FileName));
                  
                    
                    mm.IsBodyHtml = false;
                    // Passing the values and make a email formate to display
                    string subject = "MOM for " + dtMOM.Rows[0]["ProjectName"] + "- " + Convert.ToDateTime(dtMOM.Rows[0]["Meeting Date"]).ToString("dd/MMM/yyyy");



                    // smtp settings
                    var smtp = new System.Net.Mail.SmtpClient();
                    {
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.EnableSsl = true;

                        smtp.UseDefaultCredentials = false;
                        smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                        smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                        smtp.Timeout = 50000;
                    }
                    // Passing values to smtp object
                    smtp.Send(mm);
                }
               
            
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailBug(string sub, int bugID)
        {
            DataTable dtBugDetails;
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                           // any address where the email will be sending
                                                           // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";
                dtBugDetails = objTask.GetBugDetailsAddBugMail(bugID);

                var toAddress = dtBugDetails.Rows[0]["Email"].ToString().Trim();
                var empName = dtBugDetails.Rows[0]["EmployeeName"].ToString();

                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = sub + " in " + dtBugDetails.Rows[0]["ProjectName"].ToString(); ;
                string body = "Dear ";
                body += empName + "," + "\n\n";
                body +="Details of bug:-" + "\n\n";
                body += dtBugDetails.Rows[0]["BugDetailsDetails"].ToString() + "\n\n";


                body += "Thank you" + "\n";
                body += "Warm Regards" + "\n";
                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 50000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailAssignBug(string bugID)
        {
            DataTable dtBugDetails;
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                           // any address where the email will be sending
                                                           // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";
                dtBugDetails = objTask.GetBugDetailsAssignBugMail(bugID);

                var toAddress = dtBugDetails.Rows[0]["Email"].ToString().Trim();
                var empName = dtBugDetails.Rows[0]["EmployeeName"].ToString();

                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "Bug Assigned in " + dtBugDetails.Rows[0]["ProjectName"].ToString(); ;
                string body = "Dear ";
                body += empName + "," + "\n\n";
                body += "Details of bug:-" + "\n\n";
                body += dtBugDetails.Rows[0]["BugDetails"].ToString() + "\n\n";


                body += "Thank you" + "\n";
                body += "Warm Regards" + "\n";
                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 50000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        private string GenerateRandomOTP(int iOTPLength, string[] saAllowedCharacters)

        {

            string sOTP = String.Empty;

            string sTempChars = String.Empty;

            Random rand = new Random();

            for (int i = 0; i < iOTPLength; i++)

            {

                int p = rand.Next(0, saAllowedCharacters.Length);

                sTempChars = saAllowedCharacters[rand.Next(0, saAllowedCharacters.Length)];

                sOTP += sTempChars;

            }

            return sOTP;

        }

        public DataTable CheckEmailExists(string email)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Email", email);

                ds = objGeneral.GetDatasetByCommand_SP("SP_CheckEmaiLExists");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable CheckCurrentPassword(string mob, string password)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Mobile", mob);
                objGeneral.AddParameterWithValueToSQLCommand("@Password", password);
                ds = objGeneral.GetDatasetByCommand_SP("SP_CheckCurrentPassword");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public int UpdatePassword(string email, string password)
        {
            int _isUpdated = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Email", email);
                objGeneral.AddParameterWithValueToSQLCommand("@Password", password);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UpdatePasswordByEmail");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;

        }

        public int ChangePassword(string mobile, string password)
        {
            int _isUpdated = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Mobile", mobile);
                objGeneral.AddParameterWithValueToSQLCommand("@Password", password);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UpdatePasswordByMobile");
            }
            catch (Exception ex)
            {

            }
            return _isUpdated;

        }

        public int UpdateOTP(string email, string otp)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Email", email);
                objGeneral.AddParameterWithValueToSQLCommand("@OTP", otp);
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UpdateOTP");
            }
            catch (Exception ex)
            {
            }
            return _isInserted;

        }

        public DataTable VerifyOTP(string email, string otp)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Email", email);
                objGeneral.AddParameterWithValueToSQLCommand("@OTP", otp);
                ds = objGeneral.GetDatasetByCommand_SP("SP_VerifyOTP");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable GetProjectMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 1);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetUnAssignedProjectByEmployee(int EmployeeID)
        {
            try
            {

                General objGeneral = new General();
               
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", EmployeeID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetUnAssignedProjectByEmployee");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskCategory(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 14);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetProjectManager(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 13);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetProjectMasterByEmployeeDate(int employeeID, string FromDate, string ToDate)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", employeeID);
                objGeneral.AddParameterWithValueToSQLCommand("@FromDate", FromDate);
                objGeneral.AddParameterWithValueToSQLCommand("@ToDate", ToDate);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectMasterByEmployeeDate");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetProjectMasterByEmployeeMonthYear(int employeeID,string Month,string Year)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", employeeID);
                objGeneral.AddParameterWithValueToSQLCommand("@Year", Year);
                objGeneral.AddParameterWithValueToSQLCommand("@Month", Month);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectMasterByEmployeeMonthYear");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetProjectMasterByDate(int companyID, string FromDate, string ToDate)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@FromDate", FromDate);
                objGeneral.AddParameterWithValueToSQLCommand("@ToDate", ToDate);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectMasterByDate");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 2);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskMasterByProjectEmployeeMonthYear(int projectID, int employeeID, string Month, string Year)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", employeeID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                objGeneral.AddParameterWithValueToSQLCommand("@Year", Year);
                objGeneral.AddParameterWithValueToSQLCommand("@Month", Month);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTaskMasterByProjectEmployeeMonthYear");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetBugsTaskMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 7);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskTitleByProject(string ProjectID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);

                ds = objGeneral.GetDatasetByCommand_SP("GET_TaskTitleByProject");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEmployeeMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 3);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEmployeeMasterByProjectForBug(int projectID)
        {
            try
            {

                General objGeneral = new General();
               
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeMasterByProjectForBug");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEmployeeMasterManagement()
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 12);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", 0);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEmployeeMasterByDate(int companyID,string FromDate,string ToDate)
        {
            try
            {

                General objGeneral = new General();
                
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@FromDate", FromDate);
                objGeneral.AddParameterWithValueToSQLCommand("@ToDate", ToDate);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeMasterByDate");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEmployeeMasterByProjectDate(int projectID, string FromDate, string ToDate)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                objGeneral.AddParameterWithValueToSQLCommand("@FromDate", FromDate);
                objGeneral.AddParameterWithValueToSQLCommand("@ToDate", ToDate);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeMasterByProjectDate");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetRole()
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 4);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", 0);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetMeetingPlace()
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 10);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", 0);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetMeetingType()
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 11);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", 0);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetStatusMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 5);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetBugStatusMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 15);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetYearFromTimeSheet(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 9);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }


        public DataTable GetSuggestedByMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 8);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetLeaveMaster()
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 6);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", 0);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEmployeeMasterbyManager(string managerID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ManagerID", managerID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeMasterByManager");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskTitleMaster(string projectID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);

                ds = objGeneral.GetDatasetByCommand_SP("GET_TaskTitleByProject");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskTitleMasterForBug(string projectID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);

                ds = objGeneral.GetDatasetByCommand_SP("GET_TaskTitleByProjectForBug");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetPageTitleMaster(string projectID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);

                ds = objGeneral.GetDatasetByCommand_SP("GET_PageTitleByProject");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskTitleForTimeSheet(string EmployeeID, string projectID, string TaskID, int Mode)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", EmployeeID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskID", TaskID);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", Mode);
                ds = objGeneral.GetDatasetByCommand_SP("SP_TaskTitleForTimeSheet");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int AddProject(string companyID,string pName)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", pName);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddProject");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddTaskName(string companyID, string tName)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", tName);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddTask");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

     

        public int AddPage(string companyID, string projectID, string pName)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                objGeneral.AddParameterWithValueToSQLCommand("@PageName", pName);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddPage");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddEmployee(Employee objEmployee)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", objEmployee.CompanyID);
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeCode", objEmployee.EmployeeCode);
                objGeneral.AddParameterWithValueToSQLCommand("@Mobile", objEmployee.Mobile);
                objGeneral.AddParameterWithValueToSQLCommand("@Name", objEmployee.Name);
                objGeneral.AddParameterWithValueToSQLCommand("@Email", objEmployee.Email);
                objGeneral.AddParameterWithValueToSQLCommand("@Password", objEmployee.Password);
                objGeneral.AddParameterWithValueToSQLCommand("@Role", objEmployee.Role);
                objGeneral.AddParameterWithValueToSQLCommand("@DOB", objEmployee.DOB);
                objGeneral.AddParameterWithValueToSQLCommand("@JoinDate", objEmployee.JoinDate);
                objGeneral.AddParameterWithValueToSQLCommand("@Address", objEmployee.Address);
                objGeneral.AddParameterWithValueToSQLCommand("@Manager", objEmployee.Manager);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddEmployee");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddClientDetails(ClientDetails objClient)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", objClient.CompanyID);
                objGeneral.AddParameterWithValueToSQLCommand("@Mobile", objClient.Mobile);
                objGeneral.AddParameterWithValueToSQLCommand("@Name", objClient.Name);
                objGeneral.AddParameterWithValueToSQLCommand("@Email", objClient.Email);
               
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddClientDetails");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public DataTable GetClientList(int CompanyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", CompanyID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetClientList");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int UpdateEmployee(Employee objEmployee,int mode)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", objEmployee.EmployeeID);
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeCode", objEmployee.EmployeeCode);
                objGeneral.AddParameterWithValueToSQLCommand("@Mobile", objEmployee.Mobile);
                objGeneral.AddParameterWithValueToSQLCommand("@Name", objEmployee.Name);
                objGeneral.AddParameterWithValueToSQLCommand("@Email", objEmployee.Email);
                objGeneral.AddParameterWithValueToSQLCommand("@Role", objEmployee.Role);
                objGeneral.AddParameterWithValueToSQLCommand("@DOB", objEmployee.DOB);
                objGeneral.AddParameterWithValueToSQLCommand("@JoinDate", objEmployee.JoinDate);
                objGeneral.AddParameterWithValueToSQLCommand("@Address", objEmployee.Address);
                objGeneral.AddParameterWithValueToSQLCommand("@Manager", objEmployee.Manager);
                objGeneral.AddParameterWithValueToSQLCommand("@Password", objEmployee.Password);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", mode);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_UpdateEmployee");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int RemoveEmployee(int employeeID)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", employeeID);
                _isDeleted = objGeneral.GetExecuteScalarByCommand_SP("SP_RemoveEmployee");
            }
            catch (Exception ex)
            {

            }
            return _isDeleted;
        }

        public int AddMOM(MOM objMOM)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
               // objGeneral.AddParameterWithValueToSQLCommand("@Attendees", objMOM.Attendees);
                objGeneral.AddParameterWithValueToSQLCommand("@Agenda", objMOM.Agenda);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objMOM.ProjectName);
                objGeneral.AddParameterWithValueToSQLCommand("@ClientName", objMOM.ClientName);
                objGeneral.AddParameterWithValueToSQLCommand("@MeetingDate",Convert.ToDateTime(objMOM.MeetingDate).ToString("dd/MMM/yyyy"));
                objGeneral.AddParameterWithValueToSQLCommand("@FromTime", Convert.ToDateTime(objMOM.FromTime).ToShortTimeString());
                objGeneral.AddParameterWithValueToSQLCommand("@ToTime", Convert.ToDateTime(objMOM.ToTime).ToShortTimeString());
                objGeneral.AddParameterWithValueToSQLCommand("@Document", objMOM.Document);
                objGeneral.AddParameterWithValueToSQLCommand("@MeetingInitiator", objMOM.MeetingInitiator);
                objGeneral.AddParameterWithValueToSQLCommand("@MeetingPlace", objMOM.MeetingPlace);
                objGeneral.AddParameterWithValueToSQLCommand("@MeetingType", objMOM.MeetingType);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objMOM.Mode);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddMOM");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return _isInserted;
        }

        public DataTable GetRoleRights(string role,int menuID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Role", role);
                objGeneral.AddParameterWithValueToSQLCommand("@MenuID", menuID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetRoleRights");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }
    }

}
[Serializable]
public class LoginEntity
{
    public string UserName { get; set; }
    public string Password { get; set; }


}

public class ProjectDetails
{
    public string ProjectID { get; set; }
    public string ProjectDescription { get; set; }
    public string WebsiteLink { get; set; }
    public string APLiveUsername { get; set; }
    public string APLivePassword { get; set; }
    public string APLiveLink { get; set; }
    public string APUATLink { get; set; }
    public string APKUserName { get; set; }
    public string APKPassword { get; set; }
    public string APUATUsername { get; set; }
    public string APUATPassword { get; set; }
    public string APKLink { get; set; }
    public string ProjectManager { get; set; }

}

public class TimeSheetDetails
{
    public int TimeSheetID { get; set; }
    public int LoginID { get; set; }
    public string ProjectName { get; set; }
    public string TaskCategory { get; set; }
    public string TaskName { get; set; }
    public string TaskTitle { get; set; }
    public string TaskDetails { get; set; }
    public string WorkDate { get; set; }
    public string StartTime { get; set; }
    public string EndTime { get; set; }
    public string Status { get; set; }
    public string Comment { get; set; }
    public int Mode { get; set; }
}

public class Employee
{
    public int EmployeeID { get; set; }
    public int CompanyID { get; set; }
    public string EmployeeCode { get; set; }
    public string Mobile { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string Address { get; set; }
    public string DOB { get; set; }
    public string JoinDate { get; set; }
    public string Password { get; set; }
    public string Role { get; set; }
    public string Manager { get; set; }
}


public class ClientDetails
{
    public int CompanyID { get; set; }
    public string Mobile { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    
}


public class Leave
{
    public int LoginID { get; set; }
    public string ApplicationDate { get; set; }
    public string FromDate { get; set; }
    public string ToDate { get; set; }
    public string Reason { get; set; }
    public string LeaveType { get; set; }
    public string Status { get; set; }
    public string Days { get; set; }
}

public class MOM
{
    public int Mode { get; set; }
    public string MeetingType { get; set; }
    public string MeetingPlace { get; set; }
    public string MeetingInitiator { get; set; }
    public string MeetingDate { get; set; }
    public string FromTime { get; set; }
    public string ToTime { get; set; }
    public string ProjectName { get; set; }
    public string ClientName { get; set; }
    public string Attendees { get; set; }
    public string Agenda { get; set; }
    public string Document { get; set; }
}

public class BugDetails
{
    public int BugID { get; set; }
    public string ProjectName { get; set; }
    public string TaskTitle { get; set; }
    public string Details  { get; set; }
    public string WorkDate { get; set; }
    public string Priority { get; set; }
    public string SuggestedBy { get; set; }
    public string CrossCheckedBy { get; set; }
    public string Status { get; set; }
    public string Comment { get; set; }
    public string PageName { get; set; }
    public string TaskType { get; set; }
    public int Mode { get; set; }
}
    

