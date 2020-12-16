using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

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
                objGeneral.AddParameterWithValueToSQLCommand("@StartDate", objProjectDetails.StartDate);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UpdateProjectDetails");


            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddProjectDeliveryDetails(ProjectDeliveryDetails objProjectDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", objProjectDetails.ProjectID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectType", objProjectDetails.ProjectType);
                objGeneral.AddParameterWithValueToSQLCommand("@AMC", objProjectDetails.AMC);
                objGeneral.AddParameterWithValueToSQLCommand("@Cost", objProjectDetails.Cost);
                objGeneral.AddParameterWithValueToSQLCommand("@Technology", objProjectDetails.Technology);
                objGeneral.AddParameterWithValueToSQLCommand("@FreeSupport", objProjectDetails.FreeSupport);
                objGeneral.AddParameterWithValueToSQLCommand("@WorkingDays", objProjectDetails.WorkingDays);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objProjectDetails.Mode);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddProjectDeliveryDetails");


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

        public DataSet AutoFillProjectDeliveryDetails(int pid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", pid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectDeliveryDetailsByProjectID");
            }
            catch (Exception ex)
            {
            }
            return ds;
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

        public int AddScope(string ProjectID, string imgname)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", ProjectID);
                objGeneral.AddParameterWithValueToSQLCommand("@Imgname", imgname);


                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddScope");


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

        public int AddEventGallery(string EventID, string imgname)
        {
            int _isInserted = -1;
            try
            {
                General objGeneral1 = new General();
                objGeneral1.AddParameterWithValueToSQLCommand("@EventID", EventID);
                objGeneral1.AddParameterWithValueToSQLCommand("@Imgname", imgname);


                _isInserted = objGeneral1.GetExecuteNonQueryByCommand_SP("SP_AddEventGallery");


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
                objGeneral.AddParameterWithValueToSQLCommand("@AssignedTask", objTimeSheetDetails.AssignedTaskID);
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddTimesheet");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int Add_AssignTask(TaskAssignDetails objTaskAssignDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objTaskAssignDetails.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objTaskAssignDetails.ProjectName);
               // objGeneral.AddParameterWithValueToSQLCommand("@Priority", objTaskAssignDetails.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", objTaskAssignDetails.TaskName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objTaskAssignDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskDetails", objTaskAssignDetails.TaskDetails);
              //  objGeneral.AddParameterWithValueToSQLCommand("@AssignTo", objTaskAssignDetails.AssignTo);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkDate", objTaskAssignDetails.EstimatedWorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkTime", objTaskAssignDetails.EstimatedWorkTime);
                
                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objTaskAssignDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objTaskAssignDetails.Mode);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddAssignTask");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }


        public int AddAsset(Asset_Details objAssetDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@CustomerID", objAssetDetails.CustomerID);
                objGeneral.AddParameterWithValueToSQLCommand("@AssetName", objAssetDetails.AssetName);
                objGeneral.AddParameterWithValueToSQLCommand("@AssetNo", objAssetDetails.AssetNo);
                objGeneral.AddParameterWithValueToSQLCommand("@AssetSerialNum", objAssetDetails.AssetSerialNum);
                objGeneral.AddParameterWithValueToSQLCommand("@SupportSDate", objAssetDetails.SupportSDate);
                objGeneral.AddParameterWithValueToSQLCommand("@SupportEDate", objAssetDetails.SupportEDate);
               

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddAsset");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }


        public DataTable GetAssetDetailsbyID(string assetID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("AssetID", assetID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAssetDetailsByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable CheckAppliedLeave(string LoginID, string fromDate, string ToDate)
        {
            try { 
            objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
            objGeneral.AddParameterWithValueToSQLCommand("@FromDate", fromDate);
            objGeneral.AddParameterWithValueToSQLCommand("@ToDate", ToDate);
            ds = objGeneral.GetDatasetByCommand_SP("SP_CheckAppliedLeave");
        }
            catch(Exception ex)
            {

            }
            return ds.Tables[0];
        }

        public int AssignTask(TaskAssignDetails objTaskAssignDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objTaskAssignDetails.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objTaskAssignDetails.ProjectName);
              //  objGeneral.AddParameterWithValueToSQLCommand("@Priority", objTaskAssignDetails.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", objTaskAssignDetails.TaskName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objTaskAssignDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskDetails", objTaskAssignDetails.TaskDetails);
                objGeneral.AddParameterWithValueToSQLCommand("@AssignTo", objTaskAssignDetails.AssignTo);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkDate", objTaskAssignDetails.EstimatedWorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkTime", objTaskAssignDetails.EstimatedWorkTime);

                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objTaskAssignDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objTaskAssignDetails.Mode);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddAssignTaskDeveloper");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int ReopenTask(TaskAssignDetails objTaskAssignDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@AssignTaskID", objTaskAssignDetails.AssignTaskID);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objTaskAssignDetails.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objTaskAssignDetails.ProjectName);
                //  objGeneral.AddParameterWithValueToSQLCommand("@Priority", objTaskAssignDetails.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", objTaskAssignDetails.TaskName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objTaskAssignDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskDetails", objTaskAssignDetails.TaskDetails);
                objGeneral.AddParameterWithValueToSQLCommand("@AssignTo", objTaskAssignDetails.AssignTo);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkDate", objTaskAssignDetails.EstimatedWorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkTime", objTaskAssignDetails.EstimatedWorkTime);

                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objTaskAssignDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objTaskAssignDetails.Mode);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_ReopenTask");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int UpdateTask(TaskAssignDetails objTaskAssignDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objTaskAssignDetails.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objTaskAssignDetails.ProjectName);
                // objGeneral.AddParameterWithValueToSQLCommand("@Priority", objTaskAssignDetails.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", objTaskAssignDetails.TaskName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objTaskAssignDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskDetails", objTaskAssignDetails.TaskDetails);
                //  objGeneral.AddParameterWithValueToSQLCommand("@AssignTo", objTaskAssignDetails.AssignTo);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkDate", objTaskAssignDetails.EstimatedWorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkTime", objTaskAssignDetails.EstimatedWorkTime);

                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objTaskAssignDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objTaskAssignDetails.Mode);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UpdateTask");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }



        public int UpdateAssignTask(TaskAssignDetails objTaskAssignDetails)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@AssignTaskID", objTaskAssignDetails.AssignTaskID);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objTaskAssignDetails.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objTaskAssignDetails.ProjectName);
                //  objGeneral.AddParameterWithValueToSQLCommand("@Priority", objTaskAssignDetails.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskName", objTaskAssignDetails.TaskName);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskTitle", objTaskAssignDetails.TaskTitle);
                objGeneral.AddParameterWithValueToSQLCommand("@TaskDetails", objTaskAssignDetails.TaskDetails);
                objGeneral.AddParameterWithValueToSQLCommand("@AssignTo", objTaskAssignDetails.AssignTo);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkDate", objTaskAssignDetails.EstimatedWorkDate);
                objGeneral.AddParameterWithValueToSQLCommand("@EstimatedWorkTime", objTaskAssignDetails.EstimatedWorkTime);

                objGeneral.AddParameterWithValueToSQLCommand("@Comment", objTaskAssignDetails.Comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", objTaskAssignDetails.Mode);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UpdateAssignTask");

            }

            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public DataTable GetAllTask()
        {
            try
            {

                General objGeneral = new General();
                

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAllTask");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetAllTaskByEmployee(string empID)
        {
            try
            {

                General objGeneral = new General();
                
                objGeneral.AddParameterWithValueToSQLCommand("EmployeeID", empID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAllTaskByEmployee");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetApprovedTaskForQA(string empID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("EmployeeID", empID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetApprovedTaskForQA");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskToPrioritize(string EmpID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("EmployeeID", EmpID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTaskToPrioritize");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int AssignTask(int id, string developerID)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@AssignedTaskID", id);
                objGeneral.AddParameterWithValueToSQLCommand("@DeveloperID", developerID);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AssignTask");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
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

        public int AssignBug(BugDetails objBugDetails)
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
                objGeneral.AddParameterWithValueToSQLCommand("@AssignTo", objBugDetails.AssignTo);

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddAssignBugs");


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

        public int UpdateAssignBug(BugDetails objBugDetails)
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
                objGeneral.AddParameterWithValueToSQLCommand("@AssignTo", objBugDetails.AssignTo);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_UpdateAssignBugs");

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

        public int ReopenAssignBug(BugDetails objBugDetails)
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
                objGeneral.AddParameterWithValueToSQLCommand("@AssignTo", objBugDetails.AssignTo);
                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_ReopenAssignBugs");

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

        public DataTable AutoFillTimeSheetForBug(int bid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@BugID", bid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBugByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable AutoFillTimeSheetForTask(int tid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@TaskAssignID", tid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAssignedtaskByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int AddSupport(SupportDetails objSupport)
            {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objSupport.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Details", objSupport.Details);
                objGeneral.AddParameterWithValueToSQLCommand("@FileName", objSupport.FileName);
                objGeneral.AddParameterWithValueToSQLCommand("@IssueIn", objSupport.IssueIn);
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectName", objSupport.ProjectName);
                objGeneral.AddParameterWithValueToSQLCommand("@IssueType", objSupport.IssueType);

                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddSupport");

            }

            catch (Exception ex)
            {
                //General.ErrorMessage(ex.StackTrace + ex.Message);
            }
            return _isInserted;
        }

        public int AddInfraSupport(InfraSupportDetails objSupport)
        {
            int _isInserted = -1;
            try
            {
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", objSupport.LoginID);
                objGeneral.AddParameterWithValueToSQLCommand("@Details", objSupport.Details);
                objGeneral.AddParameterWithValueToSQLCommand("@Priority", objSupport.Priority);
                objGeneral.AddParameterWithValueToSQLCommand("@AssetID", objSupport.AssetID);
            
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddInfraSupport");

            }

            catch (Exception ex)
            {
                //General.ErrorMessage(ex.StackTrace + ex.Message);
            }
            return _isInserted;
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

                _isInserted = objGeneral.GetExecuteScalarByCommand_SP("SP_AddLeave");

            }

            catch (Exception ex)
            {
               // General.ErrorMessage(ex.StackTrace + ex.Message);
            }
            return _isInserted;
        }

        public int AddLeaveDetails(GridView dt, int LeaveID)

        {
            int _isInserted = -1;
            try
            {


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    // SqlCommand com = new SqlCommand("INSERT INTO Material(Visitorid,MaterialType,MaterialNo,VisitingCategory) VALUES(@vid,@mtype,@mno,@vcid));
                    objGeneral.ClearParameters();
                    objGeneral.AddParameterWithValueToSQLCommand("@LeaveID", LeaveID);

                    objGeneral.AddParameterWithValueToSQLCommand("@Date", Convert.ToDateTime(((Label)dt.Rows[i].FindControl("lblDate")).Text).ToString("dd/MMM/yyyy"));
                    objGeneral.AddParameterWithValueToSQLCommand("@AppliedLeave", ((RadioButtonList)dt.Rows[i].FindControl("radLeave")).SelectedValue);
                    
                    _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddLeaveDetails");
                }
            }
            catch (Exception ex)
            {

            }
            return _isInserted;


        }

        public DataTable GetLeaveDateDetailsByLeaveID(int lid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LeaveID", lid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetLeaveDateDetailsByLeaveID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
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

        public DataTable GetProjectStatusReportbyProjectID(int projectID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectID", projectID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectStatusReportbyProjectID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetNewsDetailsByID(string NewsID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@NewsID", NewsID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetNewsDetailsByID");      

            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataSet GetEventDetailsByID(string EventID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EventID", EventID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEventDetailsByID");

            }
            catch (Exception ex)
            {
            }
            return ds;
        }

        public int RemoveNews(int NewsID)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@NewsID", NewsID);

                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_RemoveNews");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

        public int RemoveEvent(int EventID)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EventID", EventID);

                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_RemoveEvent");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }


        public DataTable GetRoleByLoginID(string mob)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", mob);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetRoleByLoginID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetDepartmentByEmployee(int eid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", eid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetDepartmentByEmployee");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataSet GetLeaveDetailsByEmployee(string eid, string mode)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ID", eid);
                objGeneral.AddParameterWithValueToSQLCommand("@mode", mode);
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


        public int ApproveLeaveManager(string leaveid,string Comment)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LeaveID", leaveid);
                objGeneral.AddParameterWithValueToSQLCommand("@ManagerComment", Comment);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_ApproveLeaveManager");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

        public int ApproveLeaveHR(string leaveid, string Comment)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LeaveID", leaveid);
                objGeneral.AddParameterWithValueToSQLCommand("@HRComment", Comment);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_ApproveLeaveHR");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }


        public int ApproveLeaveDetailsManager(string ldid,string Approvedstatus)
            {
                int _isUpdated = -1;
                try
                {

                    General objGeneral = new General();
                    objGeneral.AddParameterWithValueToSQLCommand("@LeaveDetailsID", ldid);
                    objGeneral.AddParameterWithValueToSQLCommand("@ApprovedLeave", Approvedstatus);
                    _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_ApproveLeaveDetailsManager");
                }
                catch (Exception ex)
                {
                }
                return _isUpdated;
            }

        public int ApproveLeaveDetailsHR(string ldid, string Approvedstatus)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LeaveDetailsID", ldid);
                objGeneral.AddParameterWithValueToSQLCommand("@ApprovedLeave", Approvedstatus);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_ApproveLeaveDetailsHR");
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

        public DataTable GetPendingLeaveByHR(string hrid)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@HRID", hrid);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetPendingLeaveByHR");
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

        public DataSet GetMOM(string LoginID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetMOM");
            }
            catch (Exception ex)
            {
            }
            return ds;
        }

        public DataSet GetEditMOMDetails(int MOMID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@MOMID", MOMID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEditMOMDetails");
            }
            catch (Exception ex)
            {
            }
            return ds;
        }

        public DataSet GetBug(string LoginID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBug");
            }
            catch (Exception ex)
            {
            }
            return ds;

        }

        public DataTable GetLead()
        {
            try
            {
                General objGeneral = new General();
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetLeads");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }


        public DataTable GetProjectStatusReport()
        {
            try
            {
                General objGeneral = new General();
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectStatusReport");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable GetProjectTaskReport(string LoginID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetProjectTaskReport");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }
        public DataTable GetSupportTickets()
        {
            try
            {

                General objGeneral = new General();


                ds = objGeneral.GetDatasetByCommand_SP("SP_GetSupportTickets");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable GetInfraSupportTickets()
        {
            try
            {

                General objGeneral = new General();


                ds = objGeneral.GetDatasetByCommand_SP("SP_GetInfraSupportTickets");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable GetSupportTicketsByClient(string ClientID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@ClientID", ClientID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetSupportTicketsByClients");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable GetInfraSupportTicketsByEngineer(string EngineerID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@EngineerID", EngineerID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetInfraSupportTicketsByEngineer");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public DataTable GetSupportTicketsByInfraClient(string ClientID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@ClientID", ClientID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetInfraSupportTicketsByClients");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];

        }

        public int AddSupportComment(string comment, string status, string supportid,string LoginID)
        {
            int _isInserted = -1;
            try
            {
                
                    objGeneral.ClearParameters();
                    objGeneral.AddParameterWithValueToSQLCommand("@Comment", comment);
                    objGeneral.AddParameterWithValueToSQLCommand("@Status", status);
                    objGeneral.AddParameterWithValueToSQLCommand("@SupportID", supportid);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddSupportComment");
                
            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddInfraSupportComment(string comment, string status, string supportid, string LoginID)
        {
            int _isInserted = -1;
            try
            {

                objGeneral.ClearParameters();
                objGeneral.AddParameterWithValueToSQLCommand("@Comment", comment);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", status);
                objGeneral.AddParameterWithValueToSQLCommand("@SupportID", supportid);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddInfraSupportComment");

            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }

        public int AddInfraWorkLog(string details,string Starttime,string endtime,string status,  string supportid, string LoginID)
        {
            int _isInserted = -1;
            try
            {

                objGeneral.ClearParameters();
                objGeneral.AddParameterWithValueToSQLCommand("@Details", details);
                objGeneral.AddParameterWithValueToSQLCommand("@StartTime", Starttime);
                objGeneral.AddParameterWithValueToSQLCommand("@EndTime", endtime);
                objGeneral.AddParameterWithValueToSQLCommand("@Status", status);
                objGeneral.AddParameterWithValueToSQLCommand("@SupportID", supportid);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddInfraWorkLog");

            }
            catch (Exception ex)
            {

            }
            return _isInserted;
        }
        public DataSet GetBugForEmployee(string devID)
        {
            try
            {

                General objGeneral = new General();

                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", devID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetBugForEmployee");
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

        public int ClearOldPoints( int MOMid)

        {
            int _isInserted = -1;
            try
            {
                    objGeneral.AddParameterWithValueToSQLCommand("@MOMID", MOMid);

                    _isInserted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_ClearOldPoints");
                
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

        public DataSet GetMOMDetailsByID(int id)
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
            return ds;
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

        public DataTable SearchLead(string query)
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

        public DataTable CheckMOMAccepted(int MOMID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@MOMID", MOMID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_CheckMOMAccepted");
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

        public int AssignInfraTicket(int id, string EngineerID,string LoginID)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@InfraTicketID", id);
                objGeneral.AddParameterWithValueToSQLCommand("@EngineerID", EngineerID);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", LoginID);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AssignInfraTicket");
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

        public int RemoveTask(int TaskID)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@TaskID", TaskID);
            
                _isDeleted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_RemoveTask");
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

        public DataTable GetSupportHistroy(string supportID)
        {

            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@SupportID", supportID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetSupportHistory");
            }
            catch (Exception ex)
            {

            }
            return ds.Tables[0];
        }

        public DataTable GetInfraSupportHistory(string supportID)
        {

            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@SupportID", supportID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetInfraSupportHistory");
            }
            catch (Exception ex)
            {

            }
            return ds.Tables[0];
        }

        public DataTable GetInfraWorkLog(string supportID)
        {

            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@SupportID", supportID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetInfraWorkLog");
            }
            catch (Exception ex)
            {

            }
            return ds.Tables[0];
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

       

        public DataTable GetAssignedTaskDetailsByID(int assignedTaskID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@TaskAssignID", assignedTaskID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAssignedtaskByID");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int CloseTask(int NotificationID)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@NotificationID", NotificationID);
                _isDeleted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_CloseTask");
            }
            catch (Exception ex)
            {

            }
            return _isDeleted;
        }



        public int UpdatePriorityTask(int TaskAssignID,string Priority)
        {
            int _isDeleted = -1;
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@TaskAssignID", TaskAssignID);
                objGeneral.AddParameterWithValueToSQLCommand("@Priority", Priority);
                _isDeleted = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UpdatePriorityTask");
            }
            catch (Exception ex)
            {

            }
            return _isDeleted;
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

        public DataTable GetTaskDetailsAssignTaskMail(string taskID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@TaskID", taskID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTaskDetailsAssignTaskMail");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetTaskDetailsCompletedTaskMail(string taskID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@TaskID", taskID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTaskDetailsCompletedTaskMail");
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

        public DataTable GetTimeSheetHoursForBarGraphForManager(string date,string ManagerID)
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Date", date);
                objGeneral.AddParameterWithValueToSQLCommand("@LoginID", ManagerID);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetTimeSheetHoursForBarGraphForManager");
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
                objGeneral.AddParameterWithValueToSQLCommand("@Date", DateTime.Now);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", 2);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAdminDashBoardDetails");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetAdminDashBoardProjectCompletedBug()
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Date", DateTime.Now);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", 4);
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
                objGeneral.AddParameterWithValueToSQLCommand("@Date", DateTime.Now);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", 3);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAdminDashBoardDetails");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetAdminDashBoardEmployeeBug()
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Date", DateTime.Now);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", 6);
                ds = objGeneral.GetDatasetByCommand_SP("SP_GetAdminDashBoardDetails");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public DataTable GetAdminDashBoardEmployeeCompletedBug()
        {
            try
            {
                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@Date", DateTime.Now);
                objGeneral.AddParameterWithValueToSQLCommand("@Mode", 5);
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

        public int UnAssignProject(int pmid)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ProjectMapID", pmid);
                
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_UnAssignProject");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

        public DataTable GetEmployeeDocumentStatus(int companyID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@ComapnyID", companyID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeDocumentStatus");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }


        public DataTable GetEmployeeDocuments(int employeeID)
        {
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", employeeID);

                ds = objGeneral.GetDatasetByCommand_SP("SP_GetEmployeeDocuments");
            }
            catch (Exception ex)
            {
            }
            return ds.Tables[0];
        }

        public int AddEmployeeDocument(string EmpID, string DocID,string imgName)
        {
            int _isUpdated = -1;
            try
            {

                General objGeneral = new General();
                objGeneral.AddParameterWithValueToSQLCommand("@EmployeeID", EmpID);
                objGeneral.AddParameterWithValueToSQLCommand("@DocumentID", DocID);
                objGeneral.AddParameterWithValueToSQLCommand("@FileName", imgName);
                _isUpdated = objGeneral.GetExecuteNonQueryByCommand_SP("SP_AddEmployeeDocument");
            }
            catch (Exception ex)
            {
            }
            return _isUpdated;
        }

    }
}