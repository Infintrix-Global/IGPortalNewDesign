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
    public partial class EmployeeProfile : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtCheckRights = objCommon.GetRoleRights(Session["Role"].ToString(), 7);
                if (dtCheckRights.Rows[0]["IsEditAllowed"] is true)
                {
                    btnEdit.Visible = true;
                }

                else if (dtCheckRights.Rows[0]["IsEditAllowed"] is false)
                {
                    btnEdit.Visible = false;
                }

                if(Session["EmployeeID"].ToString() == Session["LoginID"].ToString())
                {
                    btnEdit.Visible = true;
                }
                //if (Session["Role"].ToString() == "2" && Session["EmployeeID"]!=Session["LoginID"])
                //{
                //    btnEdit.Visible = false;
                //   // pbAdmin.Visible = true;
                //   // pbEmployee.Visible = false;
                //}
                //else if (Session["Role"].ToString() == "4" && Session["EmployeeID"] != Session["LoginID"])
                //{
                //    btnEdit.Visible = false;
                //    // pbAdmin.Visible = true;
                //    // pbEmployee.Visible = false;
                //}
                //else if (Session["Role"].ToString() == "1"  )
                //{
                //  //  pbEmployee.Visible = true;
                //  //  pbAdmin.Visible = false;
                //}
                
                string eid = Session["EmployeeID"].ToString() ;
                int x = Convert.ToInt32(eid);
               
                bindEmployeeProfile(x);
                
            }
        }

       

        public void bindEmployeeProfile(int eid)
        {
            try
            {
                DataTable dt1 = objTask.GetEmployeeByID(eid);

                if (dt1.Rows.Count > 0)
                {
                    lblEmpCode.Text = dt1.Rows[0]["EmployeeCode"].ToString();
                    lblName.Text = dt1.Rows[0]["EmployeeName"].ToString();
                    lblAddress.Text = dt1.Rows[0]["Address"].ToString() ;
                    lblMobileNo.Text = dt1.Rows[0]["EmployeeID"].ToString();
                    lblEmail.Text = dt1.Rows[0]["Email"].ToString();
                    if(dt1.Rows[0]["DOB"].ToString() != "")
                        {
                        lblDOB.Text = Convert.ToDateTime(dt1.Rows[0]["DOB"].ToString()).ToString("dd-MMM-yyyy");
                    }
                    if (dt1.Rows[0]["JoiningDate"].ToString() != "")
                    {
                        lblJoinDate.Text = Convert.ToDateTime(dt1.Rows[0]["JoiningDate"].ToString()).ToString("dd-MMM-yyyy");
                    }
                    lnkLinkedIn.Text = dt1.Rows[0]["LinkedIn"].ToString();
                    lblRole.Text = dt1.Rows[0]["Roles"].ToString();
                  lblManager.Text = dt1.Rows[0]["ManagerName"].ToString();
                    lblDepartment.Text = dt1.Rows[0]["Department"].ToString();
                    lblStatus.Text= dt1.Rows[0]["StatusName"].ToString();
                    if(dt1.Rows[0]["Status"].ToString()=="4")
                    {
                        LastDay.Visible = true;
                        lblLastDay.Text= Convert.ToDateTime(dt1.Rows[0]["LastWorkingDay"].ToString()).ToString("dd-MMM-yyyy");
                    }
                    else
                    {
                        LastDay.Visible = false;
                    }
                    if(dt1.Rows[0]["Photo"].ToString() !="")
                    {
                        //ImagePhoto11.ImageUrl = "~/VisitorProfile/" + dt1.Rows[0]["ProfileImage"].ToString();
                        ImagePhoto.ImageUrl = "~/EmployeeProfile/"+ dt1.Rows[0]["Photo"].ToString();
                    }
                    else
                    {
                        ImagePhoto.ImageUrl = "~/EmployeeProfile/no-photo.jpg";
                    }
                    
                }
                
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditProfile.aspx");
        }

        protected void lnkLinkedIn_Click(object sender, EventArgs e)
        {
            Response.Redirect(lnkLinkedIn.Text);
        }
    }
}