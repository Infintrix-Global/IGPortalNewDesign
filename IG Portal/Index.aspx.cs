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

    public partial class Index : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDashBoard();
                dlEvent.ItemCommand += new DataListCommandEventHandler(dlEvent_ItemCommand);
            }
        }

        public void BindDashBoard()
        {

            DataSet dtDashBoard = objCommon.GetIndexPageDetails("0");
            /*Birthday */
            dlBirthday.DataSource = dtDashBoard.Tables[0];
            dlBirthday.DataBind();
          

            /*News */
            dlNews.DataSource = dtDashBoard.Tables[1];
            dlNews.DataBind();

            /* Event */
            dlEvent.DataSource = dtDashBoard.Tables[2];
            dlEvent.DataBind();

            /*Work Aniversery  */
            dlWorkAniversery.DataSource = dtDashBoard.Tables[3];
            dlWorkAniversery.DataBind();

            /* Department */
            DataTable dtDepartment = objCommon.GetDepartmentMaster();
            dlDepartment.DataSource = dtDepartment;
            dlDepartment.DataBind();
            //for (int i = 0; i < dtDepartment.Rows.Count; i++)
            //{
            //    DataTable dtDepEmp = objCommon.GetEmployeeListByDepartment(dtDepartment.Rows[i]["ID"].ToString());
            //    (dlDepartment.FindControl("dlDepartEmp") as DataList).DataSource = dtDepEmp;
            //    (dlDepartment.FindControl("dlDepartEmp") as DataList).DataBind();
            //}

        
            /*Holiday */
            dlHoliday.DataSource = dtDashBoard.Tables[4];
            dlHoliday.DataBind();

        }


        protected void dlEventEmp_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label label = e.Item.FindControl("lblImage") as Label;
                    if (label.Text != "")
                    {
                        (e.Item.FindControl("imgProfile") as Image).ImageUrl = @"~\EmployeeProfile\" + label.Text;
                    }
                    else
                    {
                        (e.Item.FindControl("imgProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                        //(e.Item.FindControl("ImageProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }


        protected void dlDepartment_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label label = e.Item.FindControl("lblID") as Label;
                    DataTable dtDepEmp = objCommon.GetEmployeeListByDepartment(label.Text);
                    DataList innerDataList = e.Item.FindControl("dlDepartEmp") as DataList;
                    innerDataList.DataSource = dtDepEmp;
                    innerDataList.DataBind();
                    //for (int i = 0; i < dtDepEmp.Rows.Count; i++)
                    //{
                    //    if (dtDepEmp.Rows[i]["Photo"].ToString() != "")
                    //    {
                    //        DataList dlOrders = e.Item.FindControl("dlDepartEmp") as DataList;
                    //        (dlOrders.FindControl("ImageProfile") as Image).ImageUrl = @"~\EmployeeProfile\" + dtDepEmp.Rows[i]["Photo"].ToString();
                    //    }
                    //    else
                    //    {
                    //        DataList dlOrders = e.Item.FindControl("dlDepartEmp") as DataList;
                    //        (dlOrders.FindControl("ImageProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                    //        //(e.Item.FindControl("ImageProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                    //    }
                    //}
                    //(DataList)(e.Item.FindControl("dlDepartEmp") as DataList).DataSource = dtDepEmp;
                    //(e.Item.FindControl("dlDepartEmp") as DataList).DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void dlBirthday_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label label = e.Item.FindControl("lblImage") as Label;
                    if (label.Text != "")
                    {
                        (e.Item.FindControl("imgProfile") as Image).ImageUrl = @"~\EmployeeProfile\" + label.Text;
                    }
                    else
                    {
                        (e.Item.FindControl("imgProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                        //(e.Item.FindControl("ImageProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void dlDepartEmp_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label label = e.Item.FindControl("lblImage") as Label;
                    if (label.Text != "")
                    {
                        (e.Item.FindControl("imgProfile") as Image).ImageUrl = @"~\EmployeeProfile\" + label.Text;
                    }
                    else
                    {
                        (e.Item.FindControl("imgProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                        //(e.Item.FindControl("ImageProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            LoginEntity _LoginEntity = new LoginEntity();
            _LoginEntity.UserName = txtUserName.Text;
            _LoginEntity.Password = objCommon.Encrypt(txtPassword.Text.Trim());

            BAL_Login _ballogin = new BAL_Login();
            DataTable _dtLogin = _ballogin.getLoginDetails(_LoginEntity);


            if (Convert.ToInt32(_dtLogin.Rows[0][0].ToString()) == -1)
            {

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Login", "alert('Enter Correct User Name or Password')", true);
            }
            else
            {
                string x = txtimgcode.Text;
                string y = Session["CaptchaImageText"].ToString();
                if (txtimgcode.Text == Session["CaptchaImageText"].ToString())
                {
                    //lblmsg.Text = "Excellent.......";
                    //if (CheckBoxRemember.Checked)
                    //{
                    //    Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                    //    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    //}
                    //else
                    //{
                    //    Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                    //    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                    //}
                    //Response.Cookies["UserName"].Value = txtUserName.Text.Trim();
                    //Response.Cookies["Password"].Value = txtPassword.Text.Trim();
                    Session["LoginID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                    Session["CompanyID"] = int.Parse(_dtLogin.Rows[0]["CompanyID"].ToString());
                    Session["Role"] = _dtLogin.Rows[0]["RoleID"].ToString();
                    Session["Mobile"] = _dtLogin.Rows[0]["EmployeeID"].ToString();

                    Session["EmployeeName"] = _dtLogin.Rows[0]["EmployeeName"].ToString();
                    /*admin */
                    if (_dtLogin.Rows[0]["RoleID"].ToString() == "2" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/Notifications.aspx");
                    }
                    /*manager */
                    if (_dtLogin.Rows[0]["RoleID"].ToString() == "4" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/ManagerDashBoardWM.aspx");
                    }
                    /*consultant */
                    if (_dtLogin.Rows[0]["RoleID"].ToString() == "7" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/Notifications.aspx");
                    }
                    /*employee */
                    else if (_dtLogin.Rows[0]["RoleID"].ToString() == "1" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/EmployeeDashBoardWM.aspx");

                    }
                    /*client */
                    else if (_dtLogin.Rows[0]["RoleID"].ToString() == "8" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/ClientDashBoard.aspx");

                    }
                    /*support */
                    else if (_dtLogin.Rows[0]["RoleID"].ToString() == "9" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/SupportDashBoard.aspx");

                    }
                    /*HR  */
                    if (_dtLogin.Rows[0]["RoleID"].ToString() == "10" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/Notifications.aspx");
                    }
                    /* Sales*/
                    if (_dtLogin.Rows[0]["RoleID"].ToString() == "11" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/Notifications.aspx");
                    }

                    /* QA*/
                    if (_dtLogin.Rows[0]["RoleID"].ToString() == "12" && _dtLogin.Rows[0]["CompanyID"].ToString() == "2")
                    {
                        Session["EmployeeID"] = int.Parse(_dtLogin.Rows[0]["ID"].ToString());
                        Response.Redirect("~/QADashBoard.aspx");
                    }
                }
                else
                {
                    lblmsg.Text = "image code is not valid.";
                }
                this.txtimgcode.Text = "";


            }
        }

        protected void dlEvent_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "View")
                {
                    DataTable dtDepEmp = objCommon.GetEmployeeListByEvent(e.CommandArgument.ToString());
                    dlEventEmp.DataSource = dtDepEmp;
                    dlEventEmp.DataBind();
                }
            }
            catch(Exception ex)
            {

            }
        }

        

        protected void dlNews_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ReadMore")
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                    DataTable AllData = new DataTable();
                    AllData = objTask.GetNewsDetailsByID(id.ToString());
                    lblTitle.Text = AllData.Rows[0]["Title"].ToString();
                    lbldes.Text = AllData.Rows[0]["Description"].ToString();
                 
                    ModalPopupExtender1.Show();
                  
                }
            }
            catch (Exception ex)
            {

                }
            }

        protected void dlNews_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label label = e.Item.FindControl("lblNewsDes") as Label;
                    if (label.Text != "")
                    {
                        System.Text.RegularExpressions.Regex rx = new System.Text.RegularExpressions.Regex("<[^>]*>");
                        label.Text = rx.Replace(label.Text, "");

                        (e.Item.FindControl("lblSDes") as Label).Text = label.Text.Substring(0, 50);
                    }
                    

                         }
            }
            catch (Exception ex)
            {

            }
        }

        protected void dlWorkAniversery_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label label = e.Item.FindControl("lblImage") as Label;
                    if (label.Text != "")
                    {
                        (e.Item.FindControl("imgProfile") as Image).ImageUrl = @"~\EmployeeProfile\" + label.Text;
                    }
                    else
                    {
                        (e.Item.FindControl("imgProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                        //(e.Item.FindControl("ImageProfile") as Image).ImageUrl = @"~\EmployeeProfile\no-photo.jpg";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}