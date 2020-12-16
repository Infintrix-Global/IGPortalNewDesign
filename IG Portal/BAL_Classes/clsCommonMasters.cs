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
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;
using MailMessage = System.Net.Mail.MailMessage;

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
            byte[] cipherBytes = Convert.FromBase64String(cipherText.Replace(" ", "+"));
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

        public void SendMailLeaveApplication( Leave objLeaveApplication, string leavetype)
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
                string body = "Dear HR/Manager," + "\n";
                body +=  "I have applied " + leavetype + ".";

                if (objLeaveApplication.Days == "1")
                {
                    body +=  "I request you to consider my leave application on " + Convert.ToDateTime(objLeaveApplication.FromDate).ToString("dd MMM yyyy") + "."+ "\n";
                    
                }
                else
                {
                    body +=  "I request you to consider my leave application " + Convert.ToDateTime(objLeaveApplication.FromDate).ToString("dd MMM yyyy") + " to" + Convert.ToDateTime(objLeaveApplication.ToDate).ToString("dd MMM yyyy") +"."+ "\n";
                   
                }
                body += "Reason For Leave : " + objLeaveApplication.Reason + "." + "\n\n";

                body += "Yours Sincerely," + "\n";
                body += empName + "\n";
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

                MailMessage mail = new MailMessage();
                mail.To.Add(toAddress);
                mail.To.Add("hr@infintrixglobal.com");
                //mail.To.Add
                mail.From = new MailAddress(fromAddress);
                mail.Subject = subject;
                mail.Body = body;
               // mail.CC.Add("");
                // Passing values to smtp object
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailLeaveApproval(string lid,string comment)
        {
            DataTable dtLeaveDetails;
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                       // any address where the email will be sending
                                                       // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";
                dtLeaveDetails = objTask.GetLeaveDetailsByLeaveID(Convert.ToInt32(lid));

                var toAddress = dtLeaveDetails.Rows[0]["Email"].ToString().Trim();
                var empName = dtLeaveDetails.Rows[0]["EmployeeName"].ToString();
                
                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "Response to Leave Application";
                string body = "Dear "  ;
                body += empName + "," + "\n\n";
               
                    if (dtLeaveDetails.Rows[0]["NumberOFDays"].ToString() == "1")
                    {
                        body += "Your Application for Leave on " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["FromDate"].ToString()).ToString("dd MMM yyyy") + " has been processed. " + "\n\n";
                    body += "HR Comments-" + comment+ "\n\n";
                    body += " Please check your portal for complete details" + "\n\n";

                    }
                    else
                    {
                        body += "Your Application for Leave from " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["FromDate"].ToString()).ToString("dd MMM yyyy") + " to " + Convert.ToDateTime(dtLeaveDetails.Rows[0]["ToDate"].ToString()).ToString("dd MMM yyyy") + " has been processed." + "\n\n";
                    body += "HR Comments-" + comment + "\n\n";
                    body += " Please check your portal for complete details" + "\n\n";
                }
              

              
                body += "Thanks" + "\n";
                body += "HR" + "\n";
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

        public void SendMailAssignTask(string taskID)
        {
            DataTable dtTaskDetails;
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                           // any address where the email will be sending
                                                           // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";
                dtTaskDetails = objTask.GetTaskDetailsAssignTaskMail(taskID);

                var toAddress = dtTaskDetails.Rows[0]["Email"].ToString().Trim();
                var empName = dtTaskDetails.Rows[0]["EmployeeName"].ToString();

                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "Task Assigned in " + dtTaskDetails.Rows[0]["Pname"].ToString(); ;
                string body = "Dear ";
                body += empName + "," + "\n\n";
                body += "Details of Task:-" + "\n\n";
                body += dtTaskDetails.Rows[0]["TaskDetails"].ToString() + "\n\n";


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

        public void SendMailTaskCompleted(string taskID)
        {
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            DataTable dtTaskDetails;
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                           // any address where the email will be sending
                                                           // var toAddress = "mehulrana1901@gmail.com,urvi.gandhi@infintrixglobal.com,nidhi.mehta@infintrixglobal.com,bhavin.gandhi@infintrixglobal.com,mehul.rana@infintrixglobal.com,naimisha.rohit@infintrixglobal.com";
                dtTaskDetails = objTask.GetTaskDetailsCompletedTaskMail(taskID);

                var toAddress = dtTaskDetails.Rows[0]["Email"].ToString().Trim();
                var empName = dtTaskDetails.Rows[0]["EmployeeName"].ToString();

                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "Task Completed in " + dtTaskDetails.Rows[0]["Pname"].ToString(); ;
                string body = "Dear ";
                body += empName + "," + "\n\n";
                body += "Details of Task:-" + "\n\n";
                body += dtTaskDetails.Rows[0]["TaskDetails"].ToString() + "\n\n";


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
                mailMessage.From = new MailAddress(fromAddress);
                mailMessage.To.Add(new MailAddress(toAddress));
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.CC.Add(new MailAddress("urvi.gandhi@infintrixglobal.com"));
                mailMessage.CC.Add(new MailAddress("ankit.shah@infintrixglobal.com"));
                // Passing values to smtp object

                // Passing values to smtp object
                smtp.Send(mailMessage);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailBugSolved(int bugID)
        {
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
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
                string subject = "Bug Solved in " + dtBugDetails.Rows[0]["ProjectName"].ToString(); ;
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
                mailMessage.From = new MailAddress(fromAddress);
                mailMessage.To.Add(new MailAddress(toAddress));
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.CC.Add(new MailAddress("urvi.gandhi@infintrixglobal.com"));
                mailMessage.CC.Add(new MailAddress("ankit.shah@infintrixglobal.com"));
                // Passing values to smtp object
                smtp.Send(mailMessage);
            }
            catch (Exception ex)
            {
                General.ErrorMessage(ex.Message + ex.StackTrace);
            }
        }

        public void SendMailMOM(DataTable dtMeetingpoint,DataTable dtAttendee, string date, string frtime, string totime, string agenda,string meetingtype,string meetingplace, string meetingInitiator)
        {

            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            DataTable dtEmpDetails;
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = "igportalmail@gmail.com";//"infintrix.world@gmail.com";
                                                           // any address where the email will be sending
                for (int i = 0; i < dtAttendee.Rows.Count; i++)
                {
                    dtEmpDetails = objTask.GetEmployeeByID(Convert.ToInt32(dtAttendee.Rows[i]["Attendee"].ToString()));
                    mailMessage.To.Add(new MailAddress(dtEmpDetails.Rows[0]["Email"].ToString()));
                }
                dtEmpDetails = objTask.GetEmployeeByID(Convert.ToInt32(meetingInitiator));
                mailMessage.To.Add(new MailAddress(dtEmpDetails.Rows[0]["Email"].ToString()));

                //string htmlTableStart = "<table style=\"border-collapse:collapse; text-align:center;\" >";
                //string htmlTableEnd = "</table>";
                //string htmlTrStart = "<tr style=\"color:#555555;\">";
                //string htmlTrEnd = "</tr>";
                //string htmlTdStart = "<td style=\" border-color:#5c87b2; border-style:solid; border-width:thin; padding: 5px;\">";
                //string htmlTdEnd = "</td>";


                //Password of your gmail address
                const string fromPassword = "admin@1234";
                // Passing the values and make a email formate to display
                string subject = "MOM of " + meetingtype + " on " + Convert.ToDateTime(date).ToString("dd/MMM/yy"); 
                string body = "Details of the Meeting :- ";
                body += "Date: " + Convert.ToDateTime(date).ToString("dd/MMM/yy") +  "\n\n";
                body += "From Time: " + Convert.ToDateTime(frtime).ToString("hh:mm tt") + "\n\n";
                body += "To Time: " + Convert.ToDateTime(totime).ToString("hh:mm tt") + "\n\n";
                body += "Agenda: " + agenda + "\n\n";
                body += "Meeting Points:-" + "\n\n";

               
                for (int i = 0; i <= dtMeetingpoint.Rows.Count - 1; i++)
                {
                   
                    body +=   dtMeetingpoint.Rows[i]["Meeting Point"].ToString() + " : "; //adding meeting point  
                    body +=  dtMeetingpoint.Rows[i]["Status"].ToString()  +"\n\n"; //adding status  
                    

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
                mailMessage.From = new MailAddress(fromAddress);
             //   mailMessage.To.Add(new MailAddress(toAddress));
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                smtp.Send(mailMessage);
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

        public DataTable CityMaster(int StateId)
        {
            try
            {

                General objGeneral = new General();
               
                objGeneral.AddParameterWithValueToSQLCommand("@stateID", StateId);
                
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetCityMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable CountryMaster()
        {
            try
            {

                General objGeneral = new General();
               
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetCountryMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable StateMaster(int Countryid)
        {
            try
            {

                General objGeneral = new General();
                
                objGeneral.AddParameterWithValueToSQLCommand("@Countryid", Countryid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetStateMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable GetEnquirySourceMaster()
        {
            try
            {

                General objGeneral = new General();
               
                ds = objGeneral.GetDatasetByCommand_SP("SP_EnquirySourceMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTechnologyMaster()
        {
            try
            {

                General objGeneral = new General();

                ds = objGeneral.GetDatasetByCommand_SP("SP_TechnologyMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEnquiryStatusMaster()
        {
            try
            {

                General objGeneral = new General();

                ds = objGeneral.GetDatasetByCommand_SP("SP_EnquiryStatusMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable ProjectTypeMaster()
        {
            try
            {

                General objGeneral = new General();

                ds = objGeneral.GetDatasetByCommand_SP("SP_ProjectTypeMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable ProjectDeliveryTypeMaster()
        {
            try
            {

                General objGeneral = new General();

                ds = objGeneral.GetDatasetByCommand_SP("SP_ProjectDeliveryTypeMaster");
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

        public DataTable GetHolidayMaster(string year)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@year", year);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetHolidayMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetDepartmentMaster()
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 20);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", 0);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEmployeeListByDepartment(string DepartmentID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@DepartmentID", DepartmentID);
                
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeListByDepartment");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEmployeeListByEvent(string EventID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EventID", EventID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeListByEvent");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

      

        public int AddEmployeeDepartment(int employeeID,string DepartmentID)
        {
            int _isInserted = -1;
            try
            {
               
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@DepartmentID", DepartmentID);
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", employeeID);
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddEmployeeDepartment");
            }
            catch (Exception ex)
            {
            }
            return _isInserted;
        }

        public int AddProjectDeliveryType(int projectID, string DeliveryTypeID)
        {
            int _isInserted = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                objGeneral.AddParameterWithValueToSQLCommand("@DeliveryTypeID", DeliveryTypeID);
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddProjectDeliveryTypeMap");
            }
            catch (Exception ex)
            {
            }
            return _isInserted;
        }

        public int AddEmployeeRole(int employeeID, string RoleID)
        {
            int _isInserted = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@RoleID", RoleID);
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", employeeID);
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddEmployeeRole");
            }
            catch (Exception ex)
            {
            }
            return _isInserted;
        }

        public DataTable GetProjectMasterByEmployee(int loginID)
        {
            try
            {

                General objGeneral = new General();
            
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", loginID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectMasterByEmployeeForTimeSheet");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }


        public DataTable GetAssetMasterbyCustomer(int loginID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", loginID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAssetMasterByCustomer");
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

        public DataTable GetAssignedProjectByEmployee(int EmployeeID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", EmployeeID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAssignedProjectByEmployee");
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
        public DataTable GetTaskMasterByLoginID(int loginID)
        {
            try
            {

                General objGeneral = new General();
                
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", loginID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTaskMasterByLoginID");
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
         /* Roles except CLient */
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

        public DataTable GetEngineerMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 24);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetAllEmployeeList()
        {
            try
            {

                General objGeneral = new General();
               
                
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAllEmployeeList");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }


        public DataTable GetEmployeeStatus( )
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 21);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", 0);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetClientMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 19);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetInfraClientMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 23);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        /* All Roles  */
        public DataTable GetLoginMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 17);
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

        public DataTable GetEmployeeMasterByProject(string projectID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeMasterByProject");
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

        public DataTable GetSupportStatusMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 18);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_Common");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetInitialBugStatusMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 16);
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

        public DataTable GetYearFromHolidayMaster(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@mode", 22);
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

        public DataTable GetNewsMaster()
        {
            try
            {

                General objGeneral = new General();
               
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetNewsMaster");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetEventMaster()
        {
            try
            {

                General objGeneral = new General();

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEventMaster");
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

        public DataTable GetTaskTitleMasterForAddBug(string projectID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);

                ds = objGeneral.GetDatasetByCommand_SP("GET_TaskTitleByProjectForAddBug");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskTitleMasterForBug(string projectID,string LoginID,int mode)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", mode);
                ds = objGeneral.GetDatasetByCommand_SP("GET_TaskTitleByProjectForBug");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskTitleMasterForAssignedTask(string projectID, string LoginID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                ds = objGeneral.GetDatasetByCommand_SP("GET_TaskTitleByProjectForAssignedTask");
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

        public DataTable SearchProject(string ProjectName)
        {
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", ProjectName);
              
                ds = objGeneral.GetDatasetByCommand_SP("SP_SearchProject");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable SearchTask(string TaskName,string departmentID)
        {
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", TaskName);
                objGeneral.AddParameterWithValueToSQLCommand("@DepartmentID", departmentID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_SearchTaskMaster");
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

        public int RemoveProject(string ProjectID)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);
               

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_RemoveProject");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int UpdateProject(string ProjectID,string ProjectName)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", ProjectName);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_EditProject");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int UpdateTask(string TaskID, string TaskName)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@TaskID", TaskID);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", TaskName);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_EditTask");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int RemoveTask(string TaskID)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@TaskID", TaskID);


                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_RemoveTaskMaster");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddHoliday(string holidayName,string description, string date,string LoginID)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@HolidayName", holidayName);
                objGeneral.AddParameterWithValueToSQLCommand("@Description", description);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Date", Convert.ToDateTime(date).ToString("dd/MMM/yyyy"));
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddHoliday");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddDepartment( string dName)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
               
                objGeneral.AddParameterWithValueToSQLCommand("@DepartmentName", dName);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddDepartment");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddNews(string LoginID,string type,string date,string title,string Description)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Type", type);
                objGeneral.AddParameterWithValueToSQLCommand("@Date", Convert.ToDateTime(date).ToString("dd/MMM/yyyy"));
                objGeneral.AddParameterWithValueToSQLCommand("@Title", title);
                objGeneral.AddParameterWithValueToSQLCommand("@Description", Description);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddNews");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddEvent(string LoginID,  string date,string location, string title, string Description)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Location", location);
                objGeneral.AddParameterWithValueToSQLCommand("@Date", Convert.ToDateTime(date).ToString("dd/MMM/yyyy"));
                objGeneral.AddParameterWithValueToSQLCommand("@Title", title);
                objGeneral.AddParameterWithValueToSQLCommand("@Description", Description);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddEvent");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int UpdateEvent(string LoginID, string date, string location, string title, string Description,string EventID)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Location", location);
                objGeneral.AddParameterWithValueToSQLCommand("@Date", Convert.ToDateTime(date).ToString("dd/MMM/yyyy"));
                objGeneral.AddParameterWithValueToSQLCommand("@Title", title);
                objGeneral.AddParameterWithValueToSQLCommand("@Description", Description);
                objGeneral.AddParameterWithValueToSQLCommand("@EventID", EventID);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_UpdateEvent");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddEmployeeEvent(int EventID, string AttendeeID)

        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EventID", EventID);
                    objGeneral.AddParameterWithValueToSQLCommand("@AttendeeID", AttendeeID);
                  
                    _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddEmployeeEvent");
                
            }
            catch (Exception ex)
            {

            }
            return _isInserted;


        }


        public int UpdateNews(string LoginID, string type, string date, string title, string Description,string NewsID)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Type", type);
                objGeneral.AddParameterWithValueToSQLCommand("@Date", Convert.ToDateTime(date).ToString("dd/MMM/yyyy"));
                objGeneral.AddParameterWithValueToSQLCommand("@Title", title);
                objGeneral.AddParameterWithValueToSQLCommand("@Description", Description);
                objGeneral.AddParameterWithValueToSQLCommand("@NewsID", NewsID);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_UpdateNews");
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddTaskName(string companyID, string tName,string departmentID)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", tName);
                objGeneral.AddParameterWithValueToSQLCommand("@DepartmentID", departmentID);
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
               // objGeneral.AddParameterWithValueToSQLCommand("@Role", objEmployee.Role);
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
                objGeneral.AddParameterWithValueToSQLCommand("@Location", objClient.Location);
                objGeneral.AddParameterWithValueToSQLCommand("@Password", objClient.Password);
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
               // objGeneral.AddParameterWithValueToSQLCommand("@Role", objEmployee.Role);
                objGeneral.AddParameterWithValueToSQLCommand("@DOB", objEmployee.DOB);
                objGeneral.AddParameterWithValueToSQLCommand("@JoinDate", objEmployee.JoinDate);
                objGeneral.AddParameterWithValueToSQLCommand("@Address", objEmployee.Address);
                objGeneral.AddParameterWithValueToSQLCommand("@Manager", objEmployee.Manager);
                objGeneral.AddParameterWithValueToSQLCommand("@Password", objEmployee.Password);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", mode);
                objGeneral.AddParameterWithValueToSQLCommand("@LastDay", objEmployee.LastDay);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", objEmployee.Status);
                objGeneral.AddParameterWithValueToSQLCommand("@Photo", objEmployee.Photo);
                objGeneral.AddParameterWithValueToSQLCommand("@LinkedIn", objEmployee.LinkedIn);
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

        public int RemoveMOM(int MOMID)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@MOMID", MOMID);
                _isDeleted = objGeneral.GetExecuteScalarByCommand_SP("SP_RemoveMOM");
            }
            catch (Exception ex)
            {

            }
            return _isDeleted;
        }

        public int RemoveScope(int ScopeID)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ScopeID", ScopeID);
                _isDeleted = objGeneral.GetExecuteScalarByCommand_SP("SP_RemoveScope");
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

        public int GetPendingBugCount(string LoginID, string mode)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
              
                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
               
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_GetEmployeeDashBoardDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return _isInserted;
        }
        public int GetPendingTaskCount(string LoginID, string mode)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_GetEmployeeDashBoardDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return _isInserted;
        }

        public int GetManagerDashBoardCount(string LoginID, string mode, string ProjectID)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_GetManagerDashBoardDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return _isInserted;
        }

        public DataTable GetManagerDashBoardDataList(string LoginID, string mode, string ProjectID)
        {
            
            try
            {
                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetManagerDashBoardDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return ds.Tables[0];
        }

        public DataSet GetIndexPageDetails(string mode)
        {

            try
            {
                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
                
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetIndexPageDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return ds;
        }


        public DataTable GetQADashBoardDetails(string LoginID, string mode, string ProjectID,string FromDate,string ToDate)
        {

            try
            {
                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);
                objGeneral.AddParameterWithValueToSQLCommand("@FromDate", Convert.ToDateTime(FromDate));
                objGeneral.AddParameterWithValueToSQLCommand("@ToDate", Convert.ToDateTime(ToDate));
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetQADashBoardDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return ds.Tables[0];
        }


        public DataTable GetTimeSheetHoursForBarGraphByEmployee(string LoginID, string mode)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeDashBoardDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return ds.Tables[0];
        }

        public DataTable GetAssignedTaskListByEmployee(string LoginID, string mode)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeDashBoardDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return ds.Tables[0];
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

        public int AddLeadDetails(Lead_Details objLead)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral = new General();
                 objGeneral.AddParameterWithValueToSQLCommand("@FirstName", objLead.FirstName);
                objGeneral.AddParameterWithValueToSQLCommand("@LastName", objLead.LastName);
                objGeneral.AddParameterWithValueToSQLCommand("@Mobile", objLead.Mobile);
                objGeneral.AddParameterWithValueToSQLCommand("@Email", objLead.Email);
                objGeneral.AddParameterWithValueToSQLCommand("@EnquiryDate", Convert.ToDateTime(objLead.EnquiryDate).ToString("dd/MMM/yyyy"));
                objGeneral.AddParameterWithValueToSQLCommand("@CountryID", objLead.CountryID);
                objGeneral.AddParameterWithValueToSQLCommand("@StateID", objLead.StateID);
                objGeneral.AddParameterWithValueToSQLCommand("@CityID", objLead.CityID);
                objGeneral.AddParameterWithValueToSQLCommand("@Location", objLead.Location);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyName", objLead.CompanyName);
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyType", objLead.CompanyType);
                objGeneral.AddParameterWithValueToSQLCommand("@WebsiteURL", objLead.WebsiteURL);
               
                objGeneral.AddParameterWithValueToSQLCommand("@EnquirySource", objLead.EnquirySource);
                objGeneral.AddParameterWithValueToSQLCommand("@Technology", objLead.Technology);
                objGeneral.AddParameterWithValueToSQLCommand("@PrefferedTechnology", objLead.PrefferedTechnology);
                objGeneral.AddParameterWithValueToSQLCommand("@Remarks", objLead.Remarks);
                objGeneral.AddParameterWithValueToSQLCommand("@Interest", objLead.Interest);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", objLead.Status);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objLead.Mode);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddLeadDetails");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return _isInserted;
        }

        public int AddLeadEnquiry(string enquiryFor, int LeadID)
        {
            int _isInserted = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EnquiryFor", enquiryFor);
                objGeneral.AddParameterWithValueToSQLCommand("@LeadID", LeadID);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddLeadEnquiry");
            }
            catch (Exception ex)
            {
            }
            return _isInserted;
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

    public string StartDate { get; set; }

}

public class ProjectDeliveryDetails
{
    public string ProjectID { get; set; }
    public string Scope { get; set; }
    public string Technology { get; set; }
    public string ProjectType { get; set; }
    public string FreeSupport { get; set; }
    public string AMC { get; set; }
    public string WorkingDays { get; set; }
    public string Cost { get; set; }

    public int Mode { get; set; }


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

    public string AssignedTaskID { get; set; }

}


public class TaskAssignDetails
{
   public int AssignTaskID { get; set; }
    public int LoginID { get; set; }
    public string ProjectName { get; set; }
   
    public string TaskName { get; set; }
    public string TaskTitle { get; set; }
    public string TaskDetails { get; set; }
    public string EstimatedWorkDate { get; set; }
    public string EstimatedWorkTime { get; set; }
   
    public string Priority { get; set; }
    public string AssignTo { get; set; }
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
    public string Status { get; set; }
    public string LastDay { get; set; }
    public string Photo { get; set; }
    public string LinkedIn { get; set; }
}


public class ClientDetails
{
    public int CompanyID { get; set; }
    public string Mobile { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string Location { get; set; }

    public string Password { get; set; }
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

    public string AssignTo { get; set; }
    public int Mode { get; set; }
}

public class SupportDetails
{
   
    public string ProjectName { get; set; }
    public string IssueType { get; set; }
    public string Details { get; set; }
    public string IssueIn { get; set; }
    public string LoginID { get; set; }
    public string FileName { get; set; }
   
    public string Status { get; set; }
    public string Comment { get; set; }
   
   
}


public class InfraSupportDetails
{

    public string AssetID { get; set; }
   
    public string Details { get; set; }
    
    public string LoginID { get; set; }
    public string FileName { get; set; }

    public string Status { get; set; }
    public string Comment { get; set; }

    public string Priority { get; set; }

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

    public string PrefferedTechnology{ get; set; }

    public string Remarks { get; set; }

    public int Mode { get; set; }

}

public class Asset_Details
{
    public string CustomerID { get; set; }
    public string AssetNo { get; set; }

    public string AssetName { get; set; }
    public string AssetSerialNum { get; set; }
    public string SupportSDate { get; set; }
    public string SupportEDate { get; set; }
}


