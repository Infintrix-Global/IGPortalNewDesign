using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace IG_Portal.BAL_Classes
{
    public class BAL_Task
    {
        General objGeneral = new General();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();


        public int UpdateProjectDetails(ProjectDetails objProjectDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@APKLink", objProjectDetails.APKLink);
                objGeneral.AddParameterWithValueToSQLCommand("@APKPassword", objProjectDetails.APKPassword);
                objGeneral.AddParameterWithValueToSQLCommand("@APKUserName", objProjectDetails.APKUserName);
                objGeneral.AddParameterWithValueToSQLCommand("@APLiveLink", objProjectDetails.APLiveLink);
                objGeneral.AddParameterWithValueToSQLCommand("@APLivePassword", objProjectDetails.APLivePassword);
                objGeneral.AddParameterWithValueToSQLCommand("@APLiveUsername", objProjectDetails.APLiveUsername);
                objGeneral.AddParameterWithValueToSQLCommand("@APUATLink", objProjectDetails.APUATLink);
                objGeneral.AddParameterWithValueToSQLCommand("@APUATPassword", objProjectDetails.APUATPassword);
                objGeneral.AddParameterWithValueToSQLCommand("@APUATUsername", objProjectDetails.APUATUsername);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectDescription", objProjectDetails.ProjectDescription);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", objProjectDetails.ProjectID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectManager", objProjectDetails.ProjectManager);
                objGeneral.AddParameterWithValueToSQLCommand("@WebsiteLink", objProjectDetails.WebsiteLink);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UpdateProjectDetails");


            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public DataTable AutoFillProjectDetails(int pid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", pid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectDetailsByProjectID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int AddScreenShot(string ProjectID, string imgname)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);
                objGeneral.AddParameterWithValueToSQLCommand("@Imgname", imgname);


                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddScreenshot");


            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddBugScreenShot(int BugID, string imgname)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral1 = new General();
                objGeneral1.AddParameterWithValueToSQLCommand("@BugID", BugID);
                objGeneral1.AddParameterWithValueToSQLCommand("@Imgname", imgname);


                _isInserted = objGeneral1.GetExecuteNonQueryByCommand_SP("SP_AddBugScreenshot");


            }

            catch (Exception ex)
            {
                throw (ex);
            }
            return _isInserted;
        }

        public int Add_TimeSheet(TimeSheetDetails objTimeSheetDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objTimeSheetDetails.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objTimeSheetDetails.ProjectName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskCategory", objTimeSheetDetails.TaskCategory);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", objTimeSheetDetails.TaskName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objTimeSheetDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskDetails", objTimeSheetDetails.TaskDetails);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", objTimeSheetDetails.Status);
                objGeneral.AddParameterWithValueToSQLCommand("@WorkDate", objTimeSheetDetails.WorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@StartTime", objTimeSheetDetails.StartTime);
                objGeneral.AddParameterWithValueToSQLCommand("@EndTime", objTimeSheetDetails.EndTime);
                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objTimeSheetDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objTimeSheetDetails.Mode);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddTimesheet");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int Add_Bugs(BugDetails objBugDetails)
        {
            int _isInserted = -1;
            try
            {

                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objBugDetails.ProjectName);
                objGeneral.AddParameterWithValueToSQLCommand("@PageName", objBugDetails.PageName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskType", objBugDetails.TaskType);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objBugDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@BugDetails", objBugDetails.Details);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", objBugDetails.Status);
                objGeneral.AddParameterWithValueToSQLCommand("@WorkDate", objBugDetails.WorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@Priority", objBugDetails.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@SuggestedBy", objBugDetails.SuggestedBy);
                objGeneral.AddParameterWithValueToSQLCommand("@CrossCheckedBy", objBugDetails.CrossCheckedBy);
                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objBugDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objBugDetails.Mode);


                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddBugs");


            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int UpdateBug(BugDetails objBugDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objBugDetails.ProjectName);
                objGeneral.AddParameterWithValueToSQLCommand("@PageName", objBugDetails.PageName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskType", objBugDetails.TaskType);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objBugDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@BugDetails", objBugDetails.Details);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", objBugDetails.Status);
                objGeneral.AddParameterWithValueToSQLCommand("@WorkDate", objBugDetails.WorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@Priority", objBugDetails.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@SuggestedBy", objBugDetails.SuggestedBy);
                objGeneral.AddParameterWithValueToSQLCommand("@CrossCheckedBy", objBugDetails.CrossCheckedBy);
                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objBugDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objBugDetails.Mode);
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", objBugDetails.BugID);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_UpdateBugs");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int ReopenBug(BugDetails objBugDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objBugDetails.ProjectName);
                objGeneral.AddParameterWithValueToSQLCommand("@PageName", objBugDetails.PageName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskType", objBugDetails.TaskType);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objBugDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@BugDetails", objBugDetails.Details);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", objBugDetails.Status);
                objGeneral.AddParameterWithValueToSQLCommand("@WorkDate", objBugDetails.WorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@Priority", objBugDetails.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@SuggestedBy", objBugDetails.SuggestedBy);
                objGeneral.AddParameterWithValueToSQLCommand("@CrossCheckedBy", objBugDetails.CrossCheckedBy);
                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objBugDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objBugDetails.Mode);
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", objBugDetails.BugID);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_ReopenBugs");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int RemoveTimeSheet(int TID)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", TID);
                _isDeleted = objGeneral.GetExecuteScalarByCommand_SP("SP_RemoveTimeSheet");
            }
            catch (Exception ex)
            {

            }
            return _isDeleted;
        }

        public int UpdateTimeSheet(TimeSheetDetails objTimeSheetDetails)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objTimeSheetDetails.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objTimeSheetDetails.ProjectName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskCategory", objTimeSheetDetails.TaskCategory);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", objTimeSheetDetails.TaskName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objTimeSheetDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskDetails", objTimeSheetDetails.TaskDetails);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", objTimeSheetDetails.Status);
                objGeneral.AddParameterWithValueToSQLCommand("@WorkDate", objTimeSheetDetails.WorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@StartTime", objTimeSheetDetails.StartTime);
                objGeneral.AddParameterWithValueToSQLCommand("@EndTime", objTimeSheetDetails.EndTime);
                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objTimeSheetDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objTimeSheetDetails.Mode);
                objGeneral.AddParameterWithValueToSQLCommand("@ID", objTimeSheetDetails.TimeSheetID);

                _isDeleted = objGeneral.GetExecuteScalarByCommand_SP("SP_UpdateTimeSheet");
            }
            catch (Exception ex)
            {

            }
            return _isDeleted;
        }

        public DataTable AutoFillTimeSheet(int tid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", tid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTimeSheetByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int Add_Leave(Leave objLeaveApplication)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objLeaveApplication.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Reason", objLeaveApplication.Reason);
                objGeneral.AddParameterWithValueToSQLCommand("@FromDate", Convert.ToDateTime(objLeaveApplication.FromDate).ToString("dd/MMM/yyyy"));
                objGeneral.AddParameterWithValueToSQLCommand("@ToDate", Convert.ToDateTime(objLeaveApplication.ToDate).ToString("dd/MMM/yyyy"));
                objGeneral.AddParameterWithValueToSQLCommand("@LeaveType", objLeaveApplication.LeaveType);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", objLeaveApplication.Status);
                objGeneral.AddParameterWithValueToSQLCommand("@ApplicationDate", Convert.ToDateTime(objLeaveApplication.ApplicationDate));
                objGeneral.AddParameterWithValueToSQLCommand("@Days", objLeaveApplication.Days);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddLeave");

            }

            catch (Exception ex)
            {
                General.ErrorMessage(ex.StackTrace + ex.Message);
            }
            return _isInserted;
        }

        public DataTable GetEmployeeByID(int eid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", eid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataSet GetLeaveDetailsByEmployee(string eid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", eid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetLeaveByEmployeeID");
            }
            catch (Exception ex)
            {
            }
            return ds;
        }

        public DataTable GetLeaveDetailsByLeaveID(int lid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", lid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetLeaveDetailsByLeaveID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int ApproveLeave(int lid)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LeaveID", lid);

                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_ApproveLeave");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

        public int RejectLeave(int lid)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LeaveID", lid);

                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_RejectLeave");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

        public DataTable GetPendingLeaveByManager(string mid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ManagerID", mid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetPendingLeaveByManager");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }


        public DataTable GetTaskDetailsByEmployee(int eid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", eid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTaskDetailsByEmployee");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskDetailsByDate(int companyID, string FromDate, string ToDate)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@FromDate", FromDate);
                objGeneral.AddParameterWithValueToSQLCommand("@ToDate", ToDate);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTaskDetailsByDate");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskDetailsAllEmployee()
        {
            try
            {

                General objGeneral = new General();


                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTaskDetailsAllEmployee");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataSet GetMOM()
        {
            try
            {

                General objGeneral = new General();


                ds = objGeneral.GetDatasetByCommand_SP("SP_GetMOM");
            }
            catch (Exception ex)
            {
            }
            return ds;
        }

        public DataSet GetBug()
        {
            try
            {

                General objGeneral = new General();


                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBug");
            }
            catch (Exception ex)
            {
            }
            return ds;

        }

        public int AddMOMPoints(DataTable dt, int MOMid)

        {
            int _isInserted = -1;
            try
            {


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    // SqlCommand com = new SqlCommand("INSERT INTO Material(Visitorid,MaterialType,MaterialNo,VisitingCategory) VALUES(@vid,@mtype,@mno,@vcid));
                    objGeneral.ClearParameters();
                    objGeneral.AddParameterWithValueToSQLCommand("@MOMID", MOMid);

                    objGeneral.AddParameterWithValueToSQLCommand("@MeetingPoint", dt.Rows[i]["Meeting Point"].ToString());
                    objGeneral.AddParameterWithValueToSQLCommand("@Status", dt.Rows[i]["Status"].ToString());

                    _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddMOMPoints");
                }
            }
            catch (Exception ex)
            {

            }
            return _isInserted;


        }

        public int AddMOMAttendee(DataTable dt, int MOMid,string MeetingInitiatorID)
        {
            int _isInserted = -1;
            try
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    objGeneral.ClearParameters();
                    objGeneral.AddParameterWithValueToSQLCommand("@MOMID", MOMid);
                    objGeneral.AddParameterWithValueToSQLCommand("@MeetingInitiatorID", MeetingInitiatorID);
                    objGeneral.AddParameterWithValueToSQLCommand("@AttendeeID", dt.Rows[i]["Attendee"].ToString());
                    _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddMOMAttendee");
                }
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public DataTable GetMOMDetailsByID(int id)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", id);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetMOMDetailsByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable SearchTask(string query)
        {
            try
            {

                General objGeneral = new General();


                dt = objGeneral.GetDatasetByCommand(query);
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable SearchBug(string query)
        {
            try
            {

                General objGeneral = new General();


                dt = objGeneral.GetDatasetByCommand(query);
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetMonthlyHoursSpent(int companyID, string Month, string Year)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@Month", Month);
                objGeneral.AddParameterWithValueToSQLCommand("@Year", Year);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetMonthlyHoursSpent");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetMonthlyProjectHoursSpent(int companyID, string Month, string EmployeeID, string ProjectID, string Year)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@Month", Month);
                objGeneral.AddParameterWithValueToSQLCommand("@Year", Year);
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", Convert.ToInt32(EmployeeID));
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", Convert.ToInt32(ProjectID));
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetMonthlyProjectHoursSpent");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetMonthlyProjectTaskHoursSpent(int companyID, string Month, string EmployeeID, string ProjectID, string TaskID, string Year)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@Year", Year);
                objGeneral.AddParameterWithValueToSQLCommand("@Month", Month);
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", Convert.ToInt32(EmployeeID));
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", Convert.ToInt32(ProjectID));
                objGeneral.AddParameterWithValueToSQLCommand("@TaskID", Convert.ToInt32(TaskID));
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetMonthlyProjectTaskHoursSpent");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetMonthlyHoursSpentByEmployeeToTotalHour(int companyID, string Month, string EmployeeID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@CompanyID", companyID);
                objGeneral.AddParameterWithValueToSQLCommand("@Month", Month);
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", Convert.ToInt32(EmployeeID));

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetMonthlyHoursSpentByEmployeeToTotalHour");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetIncompleteTimeSheet()
        {
            try
            {
                General objGeneral = new General();

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetIncompleteTimeSheet");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetMeetingPoints(int MOMID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@MOMID", MOMID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetMeetingPointByMOMID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetBugScreenshots(int BugID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", BugID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBugScreenShotByBugID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int ConfirmMOMNotification(int id)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", id);

                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_ConfirmMOMNotification");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

        public int RejectMOMNotification(int id)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", id);

                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_RejectMOMNotification");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

        public int AssignBug(int id,string developerID)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@NotificationID", id);
                objGeneral.AddParameterWithValueToSQLCommand("@DeveloperID", developerID);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AssignBugNotification");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

        public int RemoveBug(int Bugid,string loginID)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", Bugid);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", loginID);
                _isDeleted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_RemoveBug");
            }
            catch (Exception ex)
            {

            }
            return _isDeleted;
        }


        public int CloseBug(int NotificationID)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@NotificationID", NotificationID);
                _isDeleted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_CloseBug");
            }
            catch (Exception ex)
            {

            }
            return _isDeleted;
        }

        public DataTable GetBugHistroy(string bugID)
        {
            
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", bugID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBugHistory");
            }
            catch (Exception ex)
            {

            }
            return ds.Tables[0];
        }

        public DataTable AutoFillBug(int bugID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", bugID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBugByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataSet GetBugDetailsByID(int bugID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", bugID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBugDetailsByID");
            }
            catch (Exception ex)
            {
            }
            return ds;
        }

        public DataSet GetNotifications(string empid)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", empid);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetNotificationsByLoginID");
            }
            catch (Exception ex)
            {
            }
            return ds;
        }

        public DataTable GetNotificationsByID(int nid)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@NotificationID", nid);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetNotificationsByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetBugDetailsAddBugMail(int bugID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", bugID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBugDetailsAddBugMail");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }


        public DataTable GetBugDetailsAssignBugMail(string bugID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", bugID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBugDetailsAssignBugMail");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTimeSheetHoursForBarGraph(string date)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Date", date);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", 1);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAdminDashBoardDetails");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetAdminDashBoardProjectBug()
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Date", DateTime.Now.ToString());
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", 2);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAdminDashBoardDetails");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetAdminDashBoardMOM()
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Date", DateTime.Now.ToString());
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", 3);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAdminDashBoardDetails");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int AssignProject(int EmpID, string ProjectID)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", EmpID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AssignProject");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }
    }
}