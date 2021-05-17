using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class PortalMaster : System.Web.UI.MasterPage
    {
        BAL_Task objTask = new BAL_Task();
        int displayrank_menu;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["LoginID"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginID"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                if (Session["LoginID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    DataTable dtRole = objTask.GetRoleByLoginID(Session["LoginID"].ToString());
                    if (dtRole.Rows.Count > 1)
                    {
                      //    ddlRole.Visible = true;
                       // BindRole(dtRole);
                    }
                    DataTable AllData = objTask.GetEmployeeByID(Convert.ToInt32(Session["LoginID"].ToString()));

                    //empName.Text = "Welcome "; // + AllData.Rows[0]["EmployeeName"].ToString();
                   
               
                    if (Session["Role"].ToString() == "2" && Session["CompanyID"].ToString() == "2")
                    {
                       // admin.Visible = true;
                        //lblAdminName.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapAdminWM";
                        //SiteMapPath1.DataBind();
                    }
                    else if (Session["Role"].ToString() == "1" && Session["CompanyID"].ToString() == "2")
                    {
                       // emp.Visible = true;
                       // lblEmpName.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapEmployeeWM";
                        //SiteMapPath1.DataBind();
                    }
                    else if (Session["Role"].ToString() == "4" && Session["CompanyID"].ToString() == "2")
                    {
                       // manager.Visible = true;
                       // lblManagerName.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapManagerWM";
                       // SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "7" && Session["CompanyID"].ToString() == "2")
                    {
                    //    consultant.Visible = true;
                     //   lblConsultant.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapConsultantWM";
                        //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "8" && Session["CompanyID"].ToString() == "2")
                    {
                       // Client.Visible = true;
                       // lblClient.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapClientWM";
                        //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "9" && Session["CompanyID"].ToString() == "2")
                    {
                        //Support.Visible = true;
                        //lblSupport.Text = AllData.Rows[0]["EmployeeName"].ToString();
                         //SiteMapPath1.SiteMapProvider = "SiteMapSupport";
                         //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "10" && Session["CompanyID"].ToString() == "2")
                    {
                        //HR.Visible = true;
                        //lblHRName.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapHR";
                        //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "11" && Session["CompanyID"].ToString() == "2")
                    {
                        //Sales.Visible = true;
                        //lblSales.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapSales";
                        //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "12" && Session["CompanyID"].ToString() == "2")
                    {
                        //qa.Visible = true;
                        //lblQA.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapQA";
                        //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "13" && Session["CompanyID"].ToString() == "2")
                    {
                     //   InfraClient.Visible = true;
                       // lblInfraClient.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapQA";
                        //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "14" && Session["CompanyID"].ToString() == "2")
                    {
                       // InfraSupport.Visible = true;
                       // lblInfraSupport.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapQA";
                        //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "15" && Session["CompanyID"].ToString() == "2")
                    {
                     //   Engineer.Visible = true;
                       // lblEngineer.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapQA";
                        //SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "16" && Session["CompanyID"].ToString() == "2")
                    {
                       // consultantmanager.Visible = true;
                       // lblConsultantManager.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        //SiteMapPath1.SiteMapProvider = "SiteMapConsultantManager";
                       // SiteMapPath1.DataBind();
                    }
                }

            }

        }

      
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx", false);
        }

        protected void lnkchangepassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ChangePassword.aspx", false);
        }

        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
           
           
            //Session["Role"] = ddlRole.SelectedValue;
           
            CheckRole();
        }

        public void BindRole(DataTable dt)
        {
           // ddlRole.DataSource = dt;
           // ddlRole.DataTextField = "RoleName";
           // ddlRole.DataValueField = "ID";
           // ddlRole.DataBind();
           // ddlRole.SelectedValue = Session["Role"].ToString();
        }

        public void CheckRole()
        {
            if (Session["Role"].ToString() == "2" && Session["CompanyID"].ToString() == "2")
            {
              //  Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/Notifications.aspx");
            }
            /*manager */
            if (Session["Role"].ToString() == "4" && Session["CompanyID"].ToString() == "2")
            {
               // Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/ManagerDashBoardWM.aspx");
            }
            /*consultant */
            if (Session["Role"].ToString() == "7" && Session["CompanyID"].ToString() == "2")
            {
               // Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/Notifications.aspx");
            }
            /*employee */
            else if (Session["Role"].ToString() == "1" && Session["CompanyID"].ToString() == "2")
            {
              //  Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/EmployeeDashBoardWM.aspx");

            }
            /*client */
            else if (Session["Role"].ToString() == "8" && Session["CompanyID"].ToString() == "2")
            {
              //  Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/ClientDashBoard.aspx");

            }
            /*support */
            else if (Session["Role"].ToString() == "9" && Session["CompanyID"].ToString() == "2")
            {
               // Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/SupportDashBoard.aspx");

            }
            /*HR  */
            if (Session["Role"].ToString() == "10" && Session["CompanyID"].ToString() == "2")
            {
             //   Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/Notifications.aspx");
            }
            /* Sales*/
            if (Session["Role"].ToString() == "11" && Session["CompanyID"].ToString() == "2")
            {
              //  Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/Notifications.aspx");
            }

            /* QA*/
            if (Session["Role"].ToString() == "12" && Session["CompanyID"].ToString() == "2")
            {
               // Session["EmployeeID"] = int.Parse(Session["ID"].ToString());
                Response.Redirect("~/QADashBoard.aspx");
            }
        }
    }
}