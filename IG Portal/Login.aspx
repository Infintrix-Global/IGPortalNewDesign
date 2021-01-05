﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IG_Portal.Index" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html lang="en" class="theme__new no__sidebar">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description" content="An internal system for InfintrixGlobal.">
    <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template,">
    <title>InfintrixGlobal - Portal</title>

    <!-- Favicons-->
    <link rel="icon" href="images/favicon/favicon-32x32.png" sizes="32x32" />
    <!-- Favicons-->
    <link rel="apple-touch-icon-precomposed" href="images/favicon/apple-touch-icon-152x152.png" />
    <!-- For iPhone -->
    <meta name="msapplication-TileColor" content="#00bcd4" />
    <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png" />
    <!-- For Windows Phone -->


    <!-- CORE CSS-->
    <link href="css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <!-- CSS for full screen (Layout-2)-->
    <link href="css/layouts/style-fullscreen.css" type="text/css" rel="stylesheet" media="screen,projection" />


    <!-- Custome CSS-->
    <link href="css/custom/bootstrap-utilities.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/custom/Icustom.css" type="text/css" rel="stylesheet" media="screen,projection" />


    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <link href="js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="js/plugins/magnific-popup/magnific-popup.css" type="text/css" rel="stylesheet" media="screen,projection" />


     <style>
       
        .modalBackground {
           
        }

        .modalPopUp {
			position: fixed;
    left: 0;
    right: 0;
    background-color: #fafafa;
    padding: 0;
    max-height: 70%;
    width: 55%;
    margin: auto;
    overflow-y: auto;
    border-radius: 2px;
             z-index: 1003; display: block; opacity: 1; transform: scaleX(1); top: 10%;
        }
         .modalPopUp .modal-content {
             padding: 24px;
         }
    </style>

</head>

<body>
    
    <div id="loader-wrapper">
        <div id="loader"></div>
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
    <!-- End Page Loading -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START HEADER -->
    <header id="header" class="page-topbar navbar-sticky">
        <!-- start header nav-->
        <nav>
            <div class="nav-wrapper d-flex align-items-center">
                <ul>
                    <li>
                        <h1 class="logo-wrapper">
                            <a href="index.html" class="brand-logo darken-1">
                                <img src="images/infintrixgloabal-logo.png" alt="InfintrixGlobal">
                            </a>
                            <span class="logo-text">InfintrixGlobal</span>
                        </h1>
                    </li>
                </ul>

                <ul class="hide-on-med-and-down d-flex align-items-center ml-auto">
                    <li>
                        <a class="btn waves-effect waves-light modal-trigger" href="#login__modal">Login</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="waves-effect waves-block waves-light toggle-fullscreen">
                            <span class="mdi-action-settings-overscan"></span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- end header nav-->
    </header>
    <!-- END HEADER -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->
    <form  runat="server" defaultbutton="Button1">
         <asp:ToolkitScriptManager ID="ScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <!-- START MAIN -->
    <div id="main">
        <!-- START WRAPPER -->
        <div class="wrapper">
            <div class="container">

                <!-- First Row -->
                <div class="row d-flex flex-wrap">
                    <div class="col s12 l4 order-1 order-lg-0">
                        <div id="birthdays_card" class="card card-separate">
                            <div class="card-header">
                                <div class="card-title d-flex justify-content-between">
                                    <h2>Upcoming Birthdays</h2>
                                </div>
                            </div>

                            <div class="card-content">
                                <div class="card-content-wrapper card-content-scroll pscontainer">
                                    <div class="collection collection-cards">
                                        <asp:DataList ID="dlBirthday" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemDataBound="dlBirthday_ItemDataBound">

                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle BackColor="#EFF3FB" />
                                            <ItemTemplate>
                                                <div class="row-no-gutters">

                                                    <div class="collection-item">
                                                         <asp:Label ID="lblImage" runat="server" Text='<%# Eval("Photo")  %>' Visible="false"></asp:Label>
                                                        <asp:Image runat="server" ID="imgProfile" Width="140" Height="140" alt="avatar" class="circle" ImageUrl="~\EmployeeProfile\no-photo.jpg" />
                                                        <div class="collection-detail">
                                                            <h4>
                                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label></h4>

                                                            <div class="collection-subtext d-flex flex-wrap">
                                                                <div class="collection-cards--footer">
                                                                    <span class="badge new relative">
                                                                        <asp:Label ID="lblBday" runat="server" Text='<%# Eval("day") +"  "+  Eval("month")  %>'></asp:Label>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>


                                            </ItemTemplate>

                                            <AlternatingItemStyle BackColor="White" />


                                            <FooterTemplate>
                                                <asp:Label Visible='<%#bool.Parse((dlBirthday.Items.Count==0).ToString())%>' runat="server"
                                                    ID="lblNoRecord" Text="No Birthdays This Week!"></asp:Label>
                                            </FooterTemplate>
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataList>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col s12 l4 order-1 order-lg-0">
                        <div id="anniversary_card" class="card card-separate">
                            <div class="card-header">
                                <div class="card-title d-flex justify-content-between">
                                    <h2>Work Anniversary</h2>
                                </div>
                            </div>

                            <div class="card-content">
                                <div class="card-content-wrapper card-content-scroll pscontainer">
                                    <div class="collection collection-cards">
        <asp:DataList ID="dlWorkAniversery" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemDataBound="dlWorkAniversery_ItemDataBound">

                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle BackColor="#EFF3FB" />
                                            <ItemTemplate>
                                                <div class="row-no-gutters">

                                                    <div class="collection-item">
                                                         <asp:Label ID="lblImage" runat="server" Text='<%# Eval("Photo")  %>' Visible="false"></asp:Label>
                                                        <asp:Image runat="server" ID="imgProfile" Width="140" Height="140" alt="avatar" class="circle" ImageUrl="~\EmployeeProfile\no-photo.jpg" />
                                                        <div class="collection-detail">
                                                            <h4>
                                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label></h4>

                                                            <div class="collection-subtext d-flex flex-wrap">
                                                                <div class="collection-cards--footer">
                                                                    <span class="badge new relative">
                                                                        <asp:Label ID="lblBday" runat="server" Text='<%# Eval("day") +"  "+  Eval("month")  %>'></asp:Label>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>


                                            </ItemTemplate>

                                            <AlternatingItemStyle BackColor="White" />


                                            <FooterTemplate>
                                                <asp:Label Visible='<%#bool.Parse((dlBirthday.Items.Count==0).ToString())%>' runat="server"
                                                    ID="lblNoRecord" Text="No Work Aniversery This Week!"></asp:Label>
                                            </FooterTemplate>
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataList>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col s12 l4">
                        <div id="quicklinks_card" class="card card-separate">
                            <div class="card-header">
                                <div class="card-title d-flex justify-content-between">
                                    <h2>Quick Links</h2>
                                </div>
                            </div>

                            <div class="card-content">
                                <div class="card-content-wrapper card-content-scroll pscontainer">
                                    <ul class="quick__links d-flex flex-wrap align-items-center justify-content-evenly m-0">
                                        <li>
                                            <a class="quick__links-mail light-blue darken-2" href="https://outlook.com" title="Mails" target="_blank">
                                                <i class="mdi-communication-email"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="quick__links-teams purple darken-1" href="https://teams.microsoft.com" title="Teams" target="_blank">
                                                <img src="images/microsoft-teams-svg.png" width="40" alt="Teams">
                                            </a>
                                        </li>
                                        <li>
                                            <a class="quick__links-web cyan darken-2" href="http://infintrixglobal.com" title="Website" target="_blank">
                                                <i class="mdi-social-public"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Second Row -->
                <asp:UpdatePanel ID="up2" runat="server">
                    <ContentTemplate>
                <div class="row d-flex flex-wrap">

                    <!--Our Employees STARTS-->
                    <div class="col s12 col-md-12 l4">
                        <div id="employees_card" class="card card-separate">
                            <div class="card-header">
                                <div class="card-title d-flex justify-content-between">
                                    <h2>Our Employees</h2>
                                </div>
                            </div>

                            <div class="card-content">
                                <div class="card-content-wrapper pscontainer">

                                    <asp:DataList ID="dlDepartment" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemDataBound="dlDepartment_ItemDataBound">

                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemStyle BackColor="#EFF3FB" />
                                        <ItemTemplate>
                                            

                                                <ul class="collapsible collapsible-accordion collapsible-border">
                                                    <li class="bold active">
                                                        <h3 class="collapsible-header active waves-effect waves-cyan">
                                                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")   %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblDepartmentName" runat="server" Text='<%# Eval("DepartmentName")   %>'></asp:Label>

                                                        </h3>
                                                        <div class="collapsible-body">
                                                            <div class="collection collection-avatar">
                                                                <asp:DataList ID="dlDepartEmp" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemDataBound="dlDepartEmp_ItemDataBound">

                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <ItemStyle BackColor="#EFF3FB" />
                                                                    <ItemTemplate>
                                                                        <div class="row-no-gutters">



                                                                            <div class="collection-item">
                                                                                <asp:Image runat="server" ID="imgProfile" Width="140" Height="140" alt="avatar" class="circle"  />
                                                                                 <asp:Label ID="lblImage" runat="server" Text='<%# Eval("Photo")  %>' Visible="false"></asp:Label>
                                                                                <div class="collection-detail">
                                                                                    <h4>
                                                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label></h4>


                                                                                    <div class="collection-subtext d-flex flex-wrap">
                                                                                        <div class="w-100 mail__link">
                                                                                            <a>
                                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Email")  %>'></asp:Label>
                                                                                            </a>
                                                                                        </div>
                                                                                        <%--<span class="badge relative mt-1">Treasurer</span>--%>
                                                                                    </div>
                                                                                </div>
                                                                            </div>


                                                                        </div>


                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </div>
                                                        </div>
                                                    </li>


                                                </ul>

                                            
                                        </ItemTemplate>

                                        
                                        <FooterTemplate>
                                            <asp:Label Visible='<%#bool.Parse((dlNews.Items.Count==0).ToString())%>' runat="server"
                                                ID="lblNoRecord" Text="No Record Found!"></asp:Label>
                                        </FooterTemplate>
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataList>
                                              
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Our Employees ENDS -->

                    <div class="col s12 l8">
                        <div class="row d-flex flex-wrap">
                            <!-- Event STARTS -->
                            <div class="col s12 l6">
                                <div id="newslist_card" class="card card-separate">
                                    <div class="card-header">
                                        <div class="card-title d-flex justify-content-between">
                                            <h2>Events</h2>
                                        </div>
                                    </div>

                                    <div class="card-content">
                                        <div class="card-content-wrapper card-content-scroll pscontainer">
                                            <div class="collection collection-cards">
                                                <asp:DataList ID="dlEvent" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemCommand="dlEvent_ItemCommand" >

                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle BackColor="#EFF3FB" />
                                                    <ItemTemplate>
                                                        <div class="row-no-gutters">

                                                            <div class="collection-item">
                                                                <span class="circle collection-media d-flex align-items-center primary-bg">
                                                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")   %>'  Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblEventDate" runat="server" Text='<%# Eval("day") +"  "+  Eval("month")  %>'></asp:Label>
                                                                </span>

                                                                <div class="collection-detail">
                                                                    <h4>
                                                                        <asp:Label ID="lblEventTitle" runat="server" Text='<%# Eval("Title")  %>'></asp:Label></h4>

                                                                    <div class="collection-subtext d-flex flex-wrap">
                                                                        <p class="w-100">
                                                                            <asp:Label ID="lblEventDes" runat="server" Text='<%# Eval("Description")  %>'></asp:Label></p>

                                                                        <div class="collection-cards--footer mt-1">
                                                                            <span class="badge relative mt-1"><i class="mdi-communication-location-on"></i>
                                                                                <asp:Label ID="lblEventLocation" runat="server" Text='<%# Eval("Location")  %>'></asp:Label></span>

                                                                           <span class="badge relative mt-1 new activator"><i class="mdi-social-people"></i>
                                                                                <asp:LinkButton ID="lblAttendeeCount" runat="server" Text='<%# Eval("EmployeeCount")  %>' ForeColor="White" CommandName="View" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton></span>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </ItemTemplate>

                                                    <AlternatingItemStyle BackColor="White" />


                                                    <FooterTemplate>
                                                        <asp:Label Visible='<%#bool.Parse((dlEvent.Items.Count==0).ToString())%>' runat="server"
                                                            ID="lblNoRecord" Text="No Record Found!"></asp:Label>
                                                    </FooterTemplate>
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataList>



                                            </div>
                                        </div>
                                    </div>
                                 
                                    <!-- Event Attendees Common Card Reveal -->
                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4">Event Attendees <i class="mdi-navigation-close right"></i></span>

                                        <!-- Dynamic Load Attendees Data-->
                                        <div class="collection collection-avatar collection-attendees">
                                            <asp:DataList ID="dlEventEmp" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemDataBound="dlEventEmp_ItemDataBound">

                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle BackColor="#EFF3FB" />
                                                <ItemTemplate>
                                                    <div class="row-no-gutters">

                                                        <div class="collection-item">
                                                            <asp:Label ID="lblImage" runat="server" Text='<%# Eval("Photo")  %>' Visible="false"></asp:Label>
                                                        <asp:Image runat="server" ID="imgProfile" Width="128" Height="128" alt="avatar" class="circle" ImageUrl="~\EmployeeProfile\no-photo.jpg" />

                                                            <div class="collection-detail">
                                                                <h4>
                                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label></h4>

                                                                <div class="collection-subtext d-flex flex-wrap">
                                                                    <div class="w-100 mail__link">
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Email")  %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>





                                        </div>
                                    </div>

                                       
                                </div>
                            </div>
                            <!-- Event ENDS -->


                            

                            <!-- New Announcements STARTS -->
                            <div class="col s12 l6">
                                <div id="eventslist_card" class="card card-separate">
                                    <%-- <asp:UpdatePanel ID="up2" runat="server">
                    <ContentTemplate>--%>
                                    <div class="card-header">
                                        <div class="card-title d-flex justify-content-between">
                                            <h2>News/Announcements</h2>
                                        </div>
                                    </div>

                                    <div class="card-content">
                                        <div class="card-content-wrapper card-content-scroll pscontainer">
                                            <div class="collection collection-cards">

                                                <asp:DataList ID="dlNews" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemCommand="dlNews_ItemCommand" OnItemDataBound="dlNews_ItemDataBound">

                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle BackColor="#EFF3FB" />
                                                    <ItemTemplate>
                                                        <div class="row-no-gutters">

                                                            <div class="collection-item">
                                                                <span class="circle collection-media d-flex align-items-center primary-bg">
                                                                    <asp:Label ID="lblNewsDate" runat="server" Text='<%# Eval("day") +"  "+  Eval("month")  %>'></asp:Label>
                                                                </span>

                                                                <div class="collection-detail">
                                                                    <h4>
                                                                        <asp:Label ID="lblNewsTitle" runat="server" Text='<%# Eval("Title")  %>'></asp:Label></h4>

                                                                    <div class="collection-subtext d-flex flex-wrap">
                                                                        <p class="w-100">
                                                                            <asp:Label ID="lblNewsDes" runat="server" Text='<%# Eval("Description")  %>' Visible="false"></asp:Label>
                                                                         <asp:Label ID="lblSDes" runat="server" ></asp:Label></p>
                                                                        <div class="collection-cards--footer mt-1">
                                                                            <a class="modal-trigger d-flex mt-2" ><asp:LinkButton ID="lnkRmore" runat="server" CommandName="ReadMore" Text="Read More" CommandArgument='<%# Eval("ID")  %>'></asp:LinkButton> <i class="mdi-hardware-keyboard-arrow-right ml-1"></i></a>
                                                                        </div>
                                                                        <%--   <div class="collection-cards--footer mt-1">
                                                                <span class="badge relative mt-1"><i class="mdi-communication-location-on"></i> Mumbai, India</span>
                                                                <a href="#news_02" class="modal-trigger">
                                                                    <span class="badge relative mt-1 new"><i class="mdi-social-people"></i> 3</span>
                                                                </a>
                                                            </div>--%>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>


                                                    </ItemTemplate>

                                                    <AlternatingItemStyle BackColor="White" />


                                                    <FooterTemplate>
                                                        <asp:Label Visible='<%#bool.Parse((dlNews.Items.Count==0).ToString())%>' runat="server"
                                                            ID="lblNoRecord" Text="No Record Found!"></asp:Label>
                                                    </FooterTemplate>
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataList>


                                            </div>
                                        </div>
                                    </div>

                    <%--     </ContentTemplate>
    </asp:UpdatePanel>--%>
                                </div>
                            </div>
                            <!-- New Announcements ENDS -->
                        </div>
                    </div>

                </div>

            <asp:Button ID="btnShow" runat="server" Text="" Visible="true" Style="display: none" />

    <!-- ModalPopupExtender -->
    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
        CancelControlID="Vpbtncancel" BackgroundCssClass="modalBackground" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" Style="display: none">
                <asp:Panel ID="Panel2" runat="server"  CssClass="modalPopUp">
                 
                    
 <div class="modal-content">
            <span class="modal__close modal-action modal-close mdi-navigation-close" id="Vpbtncancel" runat="server"></span>

            <h5 class="mt-0 mb-3"><asp:Label ID="lblTitle" runat="server"></asp:Label></h5>

            <div class="event__details">
                <p><asp:Label ID="lbldes" runat="server"></asp:Label></p>

              
            </div>
        </div>
                            </div>
                           
                        </div>
                    
                </asp:Panel>
                <div class="row" align="center">
                  
                    <asp:Button ID="btnClose" runat="server" Text="Close" Visible="false" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

   </ContentTemplate>
    </asp:UpdatePanel>
                        
                <!-- Third Row -->
                <div class="row d-flex flex-wrap">
                    <div class="col s12 l8 order-1 order-lg-0">
                        <div id="ourgallery_card" class="card card-separate">
                            <div class="card-header">
                                <div class="card-title d-flex justify-content-between">
                                    <h2>Our Gallery</h2>
                                </div>
                            </div>

                            <div class="card-content">
                                <div class="card-content-wrapper card-content-scroll pscontainer">
                                    <div class="masonry-gallery-wrapper">
                                        <div class="popup-gallery">
                                            <div class="gallary-sizer"></div>
                                            <div class="gallary-item"><a href="images/our-gallery/1.jpg" title="The Cleaner">
                                                <img src="images/our-gallery/1.jpg"></a></div>
                                            <div class="gallary-item"><a href="images/our-gallery/2.jpg" title="Winter Dance">
                                                <img src="images/our-gallery/2.jpg"></a></div>
                                            <div class="gallary-item"><a href="images/our-gallery/3.jpg" title="The Uninvited Guest">
                                                <img src="images/our-gallery/3.jpg"></a></div>
                                            <div class="gallary-item"><a href="images/our-gallery/4.jpg" title="Oh no, not again!">
                                                <img src="images/our-gallery/4.jpg"></a></div>
                                            <div class="gallary-item"><a href="images/our-gallery/5.jpg" title="Swan Lake">
                                                <img src="images/our-gallery/5.jpg"></a></div>
                                            <div class="gallary-item"><a href="images/our-gallery/6.jpg" title="The Shake">
                                                <img src="images/our-gallery/6.jpg"></a></div>
                                            <div class="gallary-item"><a href="images/our-gallery/7.jpg" title="Who's that, mommy?">
                                                <img src="images/our-gallery/7.jpg"></a></div>
                                            <div class="gallary-item"><a href="images/our-gallery/8.jpg" title="Who's that, mommy?">
                                                <img src="images/our-gallery/8.jpg"></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col s12 l4">
                        <div id="holiday_card" class="card card-separate">
                            <div class="card-header">
                                <div class="card-title d-flex justify-content-between">
                                    <h2>Holidays of Month</h2>
                                </div>
                            </div>

                            <div class="card-content">
                                <div class="card-content-wrapper card-content-scroll pscontainer">
                                    <ul class="collection collection-cards">
                                        
                                                <asp:DataList ID="dlHoliday" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemCommand="dlNews_ItemCommand" OnItemDataBound="dlNews_ItemDataBound">

                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle BackColor="#EFF3FB" />
                                                    <ItemTemplate>
                                                        <div class="row-no-gutters">

                                                            <div class="collection-item">
                                                               <strong>
                                                                    <asp:Label ID="lblHolidayName" runat="server" Text='<%# Eval("HolidayName")   %>'></asp:Label>
                                                                </strong>-<asp:Label ID="lblHolidayDate" runat="server" Text='<%# Eval("HolidayDate","{0:dd/MMM/yy}")   %>'></asp:Label>

                                                            </div>

                                                        </div>
                                                    </ItemTemplate>

                                                


                                                    <FooterTemplate>
                                                        <asp:Label Visible='<%#bool.Parse((dlNews.Items.Count==0).ToString())%>' runat="server"
                                                            ID="lblNoRecord" Text="No Record Found!"></asp:Label>
                                                    </FooterTemplate>
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataList>
                                       <%-- <li class="collection-item"><strong>Diwali</strong> - 13th Nov, 2020</li>
                                        <li class="collection-item"><strong>Diwali</strong>- 14th Nov, 2020</li>
                                        <li class="collection-item"><strong>Diwali</strong> - 15th Nov, 2020</li>
                                        <li class="collection-item"><strong>New Year</strong>- 16th Nov, 2020</li>--%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- END WRAPPER -->

    </div>
    <!-- END MAIN -->

       

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START FOOTER -->
    <footer class="page-footer">
    </footer>
    <!-- END FOOTER -->

    <!-- Login Modal -->
    <div id="login__modal" class="modal">

        <div class="modal-content">

            <span class="modal__close modal-action modal-close mdi-navigation-close"></span>

            <!-- Login Code Copied from Live Portal -->
          <%--  <form  runat="server"  id="ctl01" class="login__form">--%>

                <!-- Hidden ASPNET Input Fields -->
             <%--   <div class="aspNetHidden">
                    <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                    <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
                    <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="H16L02I5WvK3WCf9aGRWozqikK+0XseHM/ckuBhPt+3XPqZMUcAB8P2c/LxlV60WwmX6EGdPtoF2zc/E2HTNJEsRGb/hYpWussVkfyMqEWAXNIdyTH0sUXyJQPEmvkskvpDUQ4y7Pqd6j1fXBupTd7sygSI=" />
                </div>--%>

            <%--    <script type="text/javascript">
                    //<![CDATA[
                    var theForm = document.forms['ctl01'];
                    if (!theForm) {
                        theForm = document.ctl01;
                    }
                    function __doPostBack(eventTarget, eventArgument) {
                        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                            theForm.__EVENTTARGET.value = eventTarget;
                            theForm.__EVENTARGUMENT.value = eventArgument;
                            theForm.submit();
                        }
                    }
                    //]]>
                </script>--%>

                <script src="/IGPortal/WebResource.axd?d=pynGkmcFUV13He1Qd6_TZOs-0YV1w0QOgAWjWhnw3DJuDaxDQB1Lgnwre3-mkCUKb3PsFA2&amp;t=637118431340000000" type="text/javascript"></script>


                <script src="/IGPortal/WebResource.axd?d=x2nkrMJGXkMELz33nwnakPjhgT2szP-OdKKLiL8fFPkBwRaeY1jMIlK5WS19fYnRMhCnAPWDEwHZPxSgMZL7rNOL4Aw1&amp;t=637118431340000000" type="text/javascript"></script>

                <%--<script type="text/javascript">
                    //<![CDATA[
                    function WebForm_OnSubmit() {
                        if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
                        return true;
                    }
                    //]]>
                </script>--%>

                <!-- Hidden ASPNET Input Fields -->
               <%-- <div class="aspNetHidden">
                    <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="807AECF7" />
                    <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="daSoW/o7Wzbl6S/OhACDZuQh7UICBbqVEwKpE1sHg9R1oaF8+MEUMMVMWwryyNrmmiaXZeu/A7AvjRRX6bTUQso8wqG2fBwx0wsqCXTZROm6pBpeF/fA4x9wnkFd+HQJbEn//I1vQ+lWSEpNXKLpcjgjP31I0WoxZUxjI6S0SkgtiMJS6p7xortcBk31Zw/Nn6rZJw==" />
                </div>--%>

                <!-- Input Fields STARTS -->
                <div class="row">
                    <div class="col s12 center">
                        <img src="images/infintrixgloabal-portal.png" width="368" height="368" alt="InfintrixGlobal" class="circle responsive-img valign profile-image-login">
                        <p class="center secondary-txt login-form-text">InfintrixGlobal Portal</p>
                    </div>
                </div>
                 <asp:Label ID="lblmsg" runat="server" Font-Bold="True" 
	ForeColor="Red" Text=""></asp:Label>
                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="mdi-social-person-outline prefix"></i>
                      <%--  <input name="txtUserName" runat="server" type="text" id="txtUserName" placeholder="Username" class="form-control"/>--%>
                          <asp:TextBox ID="txtUserName" runat="server"  placeholder="Username"  class="form-control"></asp:TextBox>
                        <span class="input__message input__message-error">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName"
                                                            SetFocusOnError="true" ErrorMessage="Please Enter User Name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </span>
                        <%--<span class="input__message input__message-error" id="RequiredFieldValidator1">Please Enter User Name</span>--%>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="mdi-action-lock-outline prefix"></i>
                         <asp:TextBox ID="txtPassword" TextMode ="Password" placeholder="Password" runat="server"  class="form-control"></asp:TextBox>
                         <span class="input__message input__message-error">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword"
                                                            SetFocusOnError="true" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                             </span>
                        <%--<input name="txtPassword" type="password" id="txtPassword" placeholder="Password" runat="server"  class="form-control" />--%>
                       <%-- <span class="input__message input__message-error" id="RequiredFieldValidator2">Please Enter Password</span>--%>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s6">
                        <i class="mdi-action-cached prefix"></i>
                        <asp:TextBox ID="txtimgcode" runat="server" autocomplete="off"></asp:TextBox>
                       <%-- <input name="txtimgcode" type="text" runat="server" id="txtimgcode" autocomplete="off" />--%>
                    </div>
                    <div class="input-field captcha__field col s6">
                      <%--  <img class="responsive-img" width="260" height="75" id="Image1" src="http://www.infintrixindia.com/IGPortal/CImage.aspx" />--%>
                        <asp:Image ID="Image1" class="responsive-img" width="260" height="75" runat="server" ImageUrl="~/CImage.aspx"/>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="input-field col s12">

                           <asp:Button ID="Button1"  class="btn waves-effect waves-light col s12" runat="server" Text="Login" OnClick="btnlogin_Click"  />

                      <%--  <input type="submit" runat="server"  name="btnlogin" value="Login" onclick="javascript: WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(& quot; btnlogin & quot;, & quot;& quot;, true, & quot;& quot;, & quot;& quot;, false, false))" id="btnlogin" class="btn waves-effect waves-light col s12" />--%>
                    </div>
                </div>

                <div class="login__footer text-center">
                    <a href="#">Forgot password ?</a>
                </div>
                <!-- Input Fields ENDS -->

               <%-- <script type="text/javascript">
                    //<![CDATA[
                    var Page_Validators = new Array(document.getElementById("RequiredFieldValidator1"), document.getElementById("RequiredFieldValidator2"));
                    //]]>
                </script>

                <script type="text/javascript">
                    //<![CDATA[
                    var RequiredFieldValidator1 = document.all ? document.all["RequiredFieldValidator1"] : document.getElementById("RequiredFieldValidator1");
                    RequiredFieldValidator1.controltovalidate = "txtUserName";
                    RequiredFieldValidator1.focusOnError = "t";
                    RequiredFieldValidator1.errormessage = "Please Enter User Name";
                    RequiredFieldValidator1.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                    RequiredFieldValidator1.initialvalue = "";
                    var RequiredFieldValidator2 = document.all ? document.all["RequiredFieldValidator2"] : document.getElementById("RequiredFieldValidator2");
                    RequiredFieldValidator2.controltovalidate = "txtPassword";
                    RequiredFieldValidator2.focusOnError = "t";
                    RequiredFieldValidator2.errormessage = "Please Enter Password";
                    RequiredFieldValidator2.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                    RequiredFieldValidator2.initialvalue = "";
                    //]]>
                </script>

                <script type="text/javascript">
                    //<![CDATA[
                    var Page_ValidationActive = false;
                    if (typeof (ValidatorOnLoad) == "function") {
                        ValidatorOnLoad();
                    }

                    function ValidatorOnSubmit() {
                        if (Page_ValidationActive) {
                            return ValidatorCommonOnSubmit();
                        }
                        else {
                            return true;
                        }
                    }
                    //]]>
                </script>--%>
           <%-- </form>--%>
        </div>
    </div>

    <!-- Attendees Modal -->

    <div id="news_02" class="modal">
        <div class="modal-content">
            <span class="modal__close modal-action modal-close mdi-navigation-close"></span>

            <h5 class="mt-0 mb-3">Event Attendees</h5>

            <div class="collection collection-avatar collection-attendees">

                <div class="collection-item">
                    <div class="collection-detail">
                        <h4>Phillip Anthropy</h4>
                    </div>
                </div>

                <div class="collection-item">

                    <div class="collection-detail">
                        <h4>Alex Smith</h4>


                        <div class="collection-subtext d-flex flex-wrap">
                            <div class="w-100 mail__link">
                                <a href="mailto:alex@infintrixgloabal.com">alex@infintrixgloabal.com
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="collection-item">
                    <img src="images/avatar-2.jpg" width="128" height="128" alt="avatar" class="circle">

                    <div class="collection-detail">
                        <h4>Bob Smith</h4>

                        <div class="collection-subtext d-flex flex-wrap">
                            <div class="w-100 mail__link">bob@infintrixgloabal.com</div>
                        </div>
                    </div>
                </div>

                <div class="collection-item">
                    <img src="images/avatar-3.jpg" width="128" height="128" alt="avatar" class="circle">

                    <div class="collection-detail">
                        <h4>Jane Smith</h4>

                        <div class="collection-subtext d-flex flex-wrap">
                            <div class="w-100 mail__link">janesmith@infintrixgloabal.com</div>
                            <span class="badge relative mt-1">C.A.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Event Modal -->

    <div id="event_01" class="modal">
        <div class="modal-content">
            <span class="modal__close modal-action modal-close mdi-navigation-close"></span>

            <h5 class="mt-0 mb-3">Lorem ipsum dolor sit amet, consecte tur adipiscing elit, consecte tur adipiscing elit</h5>

            <div class="event__details">
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa</p>

                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa Sed ut perspiciatis unde Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa</p>

                <img class="responsive-img" src="images/our-gallery/1.jpg" width="480" height="360" alt="Image" />
            </div>
        </div>
    </div>


         </form>
    <!-- ================================================
    Scripts
    ================================================ -->

    <!-- jQuery Library -->
    <script type="text/javascript" src="js/plugins/jquery-1.11.2.min.js"></script>
    <!--materialize js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

    <!-- masonry -->
    <script src="js/plugins/masonry.pkgd.min.js"></script>
    <!-- imagesloaded -->
    <script src="js/plugins/imagesloaded.pkgd.min.js"></script>
    <!-- magnific-popup -->
    <script type="text/javascript" src="js/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="js/plugins.min.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="js/custom-script.js"></script>

    <!-- Custom Scrollbar Initialization -->
    <script>
        /*
        if($(".pscontainer").length > 0 ) {
            $(".pscontainer").perfectScrollbar({
                suppressScrollX:!0,
                wheelSpeed: 0.3,
                wheelPropagation: true,
            });
        }
        */
    </script>

    <script type="text/javascript">
        /*
         * Masonry container for Gallery page
         */
        var $containerGallery = $(".masonry-gallery-wrapper");
        $containerGallery.imagesLoaded(function () {
            $containerGallery.masonry({
                itemSelector: '.gallary-item img',
                columnWidth: '.gallary-sizer',
                isFitWidth: true
            });
        });

        //popup-gallery
        $('.popup-gallery').magnificPopup({
            delegate: 'a',
            type: 'image',
            closeOnContentClick: true,
            fixedContentPos: true,
            tLoading: 'Loading image #%curr%...',
            mainClass: 'mfp-img-mobile mfp-no-margins mfp-with-zoom',
            gallery: {
                enabled: true,
                navigateByImgClick: true,
                preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
            },
            image: {
                verticalFit: true,
                tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
                titleSrc: function (item) {
                    return item.el.attr('title') + '<small>by Marsel Van Oosten</small>';
                },
                zoom: {
                    enabled: true,
                    duration: 300 // don't foget to change the duration also in CSS
                }
            }
        });
    </script>
</body>

</html>
