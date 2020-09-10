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
                    DataTable AllData = objTask.GetEmployeeByID(Convert.ToInt32(Session["LoginID"].ToString()));

                    empName.Text = "Welcome " + AllData.Rows[0]["EmployeeName"].ToString();
                   
               
                    if (Session["Role"].ToString() == "2" && Session["CompanyID"].ToString() == "2")
                    {
                        admin.Visible = true;
                        lblAdminName.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        SiteMapPath1.SiteMapProvider = "SiteMapAdminWM";
                        SiteMapPath1.DataBind();
                    }
                    else if (Session["Role"].ToString() == "1" && Session["CompanyID"].ToString() == "2")
                    {
                        emp.Visible = true;
                        lblEmpName.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        SiteMapPath1.SiteMapProvider = "SiteMapEmployeeWM";
                        SiteMapPath1.DataBind();
                    }
                    else if (Session["Role"].ToString() == "4" && Session["CompanyID"].ToString() == "2")
                    {
                        manager.Visible = true;
                        lblManagerName.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        SiteMapPath1.SiteMapProvider = "SiteMapManagerWM";
                        SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "7" && Session["CompanyID"].ToString() == "2")
                    {
                        consultant.Visible = true;
                        lblConsultant.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        SiteMapPath1.SiteMapProvider = "SiteMapConsultantWM";
                        SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "8" && Session["CompanyID"].ToString() == "2")
                    {
                        Client.Visible = true;
                        lblClient.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        SiteMapPath1.SiteMapProvider = "SiteMapClientWM";
                        SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "9" && Session["CompanyID"].ToString() == "2")
                    {
                        Support.Visible = true;
                        lblSupport.Text = AllData.Rows[0]["EmployeeName"].ToString();
                         SiteMapPath1.SiteMapProvider = "SiteMapSupport";
                         SiteMapPath1.DataBind();
                    }

                    else if (Session["Role"].ToString() == "10" && Session["CompanyID"].ToString() == "2")
                    {
                        HR.Visible = true;
                        lblHRName.Text = AllData.Rows[0]["EmployeeName"].ToString();
                        SiteMapPath1.SiteMapProvider = "SiteMapHR";
                        SiteMapPath1.DataBind();
                    }
                }

            }

        }

        //private void BindMenu()
        //{
        //    try
        //    {
        //        int iRoleId = Convert.ToInt32(Session["Role"].ToString());

        //        IEnumerable<MenuMaster_Tbl> ParentMenuID = MenuMasterBAL.GetParentMenuID();
        //        HtmlGenericControl ul;
        //        HtmlGenericControl li;
        //        AjaxControlToolkit.AccordionPane pn;
        //        string SelectedParentID = "0";
        //        int pnCount = 1;
        //        foreach (var item in ParentMenuID)
        //        {
        //            //Object ObjRoleWiseMenuAccess = MenuMasterBAL.GetRoleWiseMenu(Convert.ToInt32(item.ParentID),Convert.ToInt32(SessionUtilities.CurrentRoleId));
        //            TemplateBuilder head = new TemplateBuilder();
        //            pn = new AjaxControlToolkit.AccordionPane();
        //            pn.ID = item.MenuID.ToString(); //"AccordionPane_" + pnCount.ToString();
        //            pnCount++;


        //            //pn.ID = "AccordionPane" + item.MenuID;
        //            string sHeaderLink = "MenuSubMenu.aspx";
        //            string[] sSeperator = HttpContext.Current.Request.Url.AbsolutePath.Split('/');
        //            if (sSeperator.Count() == 3)
        //            {
        //                sHeaderLink = sHeaderLink.TrimStart('~');
        //            }
        //            else if (sSeperator.Count() == 4)
        //            {
        //                sHeaderLink = "../Dashboard/" + sHeaderLink.TrimStart('~');
        //            }
        //            //pn.HeaderContainer.Controls.Add(new LiteralControl("<a href=?Sel=" + mparnet.Navigation_URL + " onClick=javascript:gotopage('" + mparnet.Navigation_URL  + "');>" + mparnet.MenuText + "</a>"));
        //            //pn.HeaderContainer.Controls.Add(new LiteralControl("<a href=?Sel=" + mparnet.Navigation_URL + " onClick=javascript:gotopage('MenuSubmenu.aspx?Menu');>" + mparnet.MenuText + "</a>"));
        //            //pn.HeaderContainer.Controls.Add(new LiteralControl("<a href=?Sel=" + item.Navigation_URL + " onClick=javascript:getmenuheader('" + item.MenuID + "');>" + item.MenuText + "</a>"));
        //            pn.HeaderContainer.Controls.Add(new LiteralControl("<a>" + item.MenuText + "</a>"));
        //            // head.AppendLiteralString("<a href=?Sel=" + mparnet.Navigation_URL + " onClick='javascript:alert('" + mparnet.MenuText + "');'>" + mparnet.MenuText + "</a>");
        //            pn.Header = head;
        //            List<ParentMenuID> menulist = MenuMasterBAL.GetRoleWiseMenu(item.MenuID.ToString(), Convert.ToInt32(SessionUtilities.CurrentRoleId));
        //            if (menulist.Count > 0)
        //            {
        //                foreach (var menu in menulist)
        //                {
        //                    //if (menu.MenuText == "reportseparator")
        //                    //{
        //                    //    Label lbl = new Label();
        //                    //    lbl.Text = "Reports<hr/>";
        //                    //    lbl.ID = item.MenuID.ToString();
        //                    //    pn.ContentContainer.Controls.Add(lbl);
        //                    //}
        //                    //else if (menu.MenuText == "lockersepearator")
        //                    //{
        //                    //    Label lbl = new Label();
        //                    //    lbl.Text = "Locker Management<hr/>";
        //                    //    lbl.ID = item.MenuID.ToString();
        //                    //    pn.ContentContainer.Controls.Add(lbl);
        //                    //}

        //                    //else
        //                    //{

        //                    //TemplateBuilder content = new TemplateBuilder();
        //                    ul = new HtmlGenericControl("ul");
        //                    ul.Attributes.Add("class", "submenu");
        //                    li = new HtmlGenericControl("li");
        //                    //li.InnerHtml="<a href=?Sel=" + c.Navigation_URL + "class=accordionLink>" + c.MenuText + "</a>";
        //                    li.InnerHtml = "<a href=?Sel=" + menu.Navigation_URL + ">" + menu.MenuText + "</a>";
        //                    string sURL1 = HttpContext.Current.Request.Url.ToString();
        //                    string[] URLSegments = sURL1.Split('/');

        //                    string requestURL = URLSegments[URLSegments.Length - 1].ToString().ToLower();
        //                    if (!string.IsNullOrEmpty(requestURL) && menu.Navigation_URL.ToString().ToLower().Contains(requestURL))
        //                    {
        //                        SelectedParentID = menu.ParentID;
        //                        GetDisplayRank_Menu(menu.ParentID);
        //                        displayrank_menu = Convert.ToInt32(menu.ParentID);
        //                        //- -- select Displayrank from m enu where menuid=c.parentid
        //                    }
        //                    ul.Controls.Add(li);
        //                    pn.ContentContainer.Controls.Add(ul);
        //                    string CmpText = "#" + menu.MenuText + "#";
        //                    string RptText = "#" + menu.MenuText + "#";
        //                    if (MenuSeparatorText.Contains(CmpText))
        //                    {
        //                        Label lbl = new Label();
        //                        lbl.Text = "<hr/>";
        //                        lbl.ID = item.MenuID.ToString();
        //                        pn.ContentContainer.Controls.Add(lbl);
        //                    }
        //                    if (ReportSeparatorText.Contains(RptText))
        //                    {
        //                        Label lbl = new Label();
        //                        lbl.Text = "Reports<hr/>";
        //                        lbl.ID = item.MenuID.ToString();
        //                        pn.ContentContainer.Controls.Add(lbl);
        //                    }
        //                    //}
        //                }
        //                acrStatic.Panes.Add(pn);
        //                acrStatic.RequireOpenedPane = false;
        //                acrStatic.SuppressHeaderPostbacks = true;
        //                acrStatic.FramesPerSecond = 40;
        //                acrStatic.TransitionDuration = 250;
        //                //  acrStatic.SelectedIndex = 06;
        //                // string checkhidden = hdAccordionSelectedIndex.Value;
        //                // if(LabelIndex.Text!="" && LabelIndex.Text != null)
        //                // acrStatic.SelectedIndex =Convert.ToInt32( LabelIndex.Text);

        //                string sURL = HttpContext.Current.Request.Url.ToString();
        //                string[] URLSegments1 = sURL.Split('/');
        //                string requestURL1 = URLSegments1[URLSegments1.Length - 1].ToString().ToLower();

        //                if (requestURL1.ToLower().Contains("menusubmenu.aspx") && Request.QueryString["id"] != null)
        //                {
        //                    Session["ACCORDIONID"] = Convert.ToUInt32(Request.QueryString["id"].ToString());
        //                }
        //                else if (requestURL1 == "studentadmissionfrom.aspx" && IsPostBack)
        //                {
        //                    if (Session["ACCORDIONID"] != null && Session["ACCORDIONID"].ToString() != "0")
        //                    {
        //                        Session["ACCORDIONID"] = Convert.ToInt32(Session["ACCORDIONID"]);
        //                    }
        //                    else
        //                    {
        //                        Session["ACCORDIONID"] = "0";
        //                    }
        //                }
        //                else
        //                {

        //                    if (!string.IsNullOrEmpty(SelectedParentID) && int.Parse(SelectedParentID) > 0)
        //                    {
        //                        Session["ACCORDIONID"] = displayrank_menu;
        //                        //
        //                    }
        //                }
        //                int drank = Convert.ToInt32(Session["ACCORDIONID"]);
        //                if (drank == 0)
        //                {
        //                    acrStatic.SelectedIndex = -1;//drank;

        //                }
        //                else
        //                {
        //                    for (int i = 0; i < acrStatic.Panes.Count; i++)
        //                    {
        //                        if (acrStatic.Panes[i].ID.ToString() == Session["ACCORDIONID"].ToString())
        //                            acrStatic.SelectedIndex = i;
        //                    }
        //                    //if (drank == 1)
        //                    //{
        //                    //    acrStatic.SelectedIndex = 0;
        //                    //}
        //                    //else
        //                    //{
        //                    //    //acrStatic.SelectedIndex = Convert.ToInt32(Session["ACCORDIONID"]) - 2;

        //                    //    acrStatic.SelectedIndex =Convert.ToInt32(Session["ACCORDIONID"]);
        //                    //}
        //                }

        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        //   throw;
        //    }

        //}

        //public int GetDisplayRank_Menu(string Parentid)
        //{

        //    List<MenuMaster_Tbl> displayrank = MenuMasterBAL.GetDisplayRank(Parentid);
        //    if ((displayrank.Count > 0))
        //    {
        //        for (int i = 0; i < displayrank.Count; i++)
        //        {
        //            displayrank_menu = displayrank[i].DisplayRank;
        //        }
        //    }
        //    return displayrank_menu;
        //}

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx", false);
        }

        protected void lnkchangepassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ChangePassword.aspx", false);
        }
    }
}