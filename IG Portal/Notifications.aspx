<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="IG_Portal.Notifications" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function GetApproveConfirmation() {
            var reply = confirm("Are You Sure ?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }

        function GetConfirmation() {
            var reply = confirm("Do you really want to Confirm this MOM ?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }

        function GetRejectConfirmation() {
            var reply = confirm("Do you really want to Reject this MOM ?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }

        function GetCloseConfirmation() {
            var reply = confirm("Do you really want to CLOSE this bug ?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }

        function GetCloseTaskConfirmation() {
            var reply = confirm("Do you really want to CLOSE this task ?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }

        function GetReopenConfirmation() {
            var reply = confirm("Do you really want to REOPEN this bug?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }

        function GetReopenTaskConfirmation() {
            var reply = confirm("Do you really want to REOPEN this task?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
            width: 100%; /* Full width */
            height: 100%;
            overflow:auto
        }

        .modalPopup {
            background-color: #fefefe;
            width: 600px;
            overflow: auto;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            margin-left:200px;
            border: 1px solid #888;
  
  
        }
        /* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #e8f4f8;
  color: black;
  }

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #e8f4f8;
  color: white;
}
    </style>

    <style type="text/css">
        .ajax__tab_xp .ajax__tab_header {
            font-family: arial;
            font-size: 14px !important;
            background: #fff;
            border-bottom: 0px solid #ccc !important;
        }


        .ajax__tab_xp .ajax__tab_default .ajax__tab_header {
            white-space: normal;
            height: 29px !important;
        }

        .ajax__tab_xp .ajax__tab_xp .ajax__tab_header .ajax__tab_outer {
            background: none;
        }

        .ajax__tab_xp .ajax__tab_header .ajax__tab_outer {
            padding-right: 18px;
            background: none !important;
            height: 46px !important;
        }


        .ajax__tab_xp .ajax__tab_header .ajax__tab_tab {
            height: 43px !important;
            padding: 10px 10px !important;
            background: none !important;
        }

        .ajax__tab_xp .ajax__tab_header .ajax__tab_inner {
            padding-left: 4px;
            background: none !important;
        }

        .ajax__tab_xp .ajax__tab_header .ajax__tab_tab {
            background: none !important;
        }


        .ajax__tab_xp .ajax__tab_tab a:hover {
            background-color: #22bfed !important;
            color: #ffffff !important;
        }

        .ajax__tab_xp .ajax__tab_tab a:active {
            background-color: #22bfed !important;
            color: #ffffff !important;
        }


        .ajax__tab_xp .ajax__tab_active ajax__tab_hover {
            background: #22bfed !important;
            background: -moz-linear-gradient(left, #22bfed 0%, #4ca76d 100%) !important;
            background: -webkit-linear-gradient(left, #22bfed 0%, #4ca76d 100%) !important;
            background: linear-gradient(to right, #22bfed 0%, #4ca76d 100%) !important;
            color: #ffffff !important;
        }

        .ajax__tab_xp .ajax__tab_header {
            font-family: arial;
            font-size: 14px;
            background: #fff;
            border-bottom: 0px solid #ccc !important;
        }

        

        .portlet-title {
            margin-left: 125px;
        }



        .form-control {
            Width: 75%;
        }

        .autostyle2 {
            color: #c5484d;
        }

        .pagination {
            display: inline-block;
        }

            .pagination a {
                color: black;
                font: bold;
                float: left;
                padding: 8px 8px;
                text-decoration: none;
            }
    </style>


    <style>
        [type="checkbox"]:not(:checked), [type="checkbox"]:checked {
            position: absolute;
            left: 50px;
            visibility: visible
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Notification Details</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#">Notifications</a></div>
</div>
</div>
</div>
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-chart float-right">
<div class="breadcrumb-chart m-l-50">
<div class="float-right">
<div class="icon m-b-10">
<div class="chart header-bar">
<canvas width="49" height="40" ></canvas>
</div>
</div>
</div>
<div class="float-right m-r-5 m-l-10 m-t-1">
<div class="chart-info">
<span>$10,415</span>
<p>Last Week</p>
</div>
</div>
</div>

<div class="breadcrumb-chart m-l-50">
<div class="float-right">
<div class="icon m-b-10">
<div class="chart header-bar2">
<canvas width="49" height="40" ></canvas>
</div>
</div>
</div>
<div class="float-right m-r-5 m-l-10 m-t-1">
<div class="chart-info">
<span>$22,128</span>
<p>Last Month</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
    
    <!-- BEGIN FORM-->
    <div class="row">
              <div class="col-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-header">
                    <h4>My Notifications</h4>
                    </div>
                  <div class="padding-20">
                <asp:TabContainer ID="tabcontainer1" runat="server" ActiveTabIndex="0">

                    <asp:TabPanel ID="NotificationMOM" runat="server" HeaderText="MOM" TabIndex="0" class="nav-link active">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upNotificationMOM" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblmsg1" runat="server"></asp:Label>
                                        <div class="row" style="margin-left:5px">
                                        <div class="card">
                                            <div class="card-header">
                                                Actions to be performed
                                            </div>
                                            <div class="card-body">
                                        <asp:Button ID="btnConfirm" runat="server" OnClientClick="return GetConfirmation();" OnClick="btnConfirm_Click" Text="Confirm" class="btn btn-icon icon-left btn-outline-info"/>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnReject" runat="server" OnClientClick="return GetRejectConfirmation();"  OnClick="btnReject_Click" Text="Reject" class="btn btn-icon icon-left btn-outline-primary" />
                                       </div>
                                                </div>
                                        </div>
                                    <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="overflow-x:auto;width:100%">
                        
                                       <h6 style="color: steelblue"><asp:Label runat="server" Text="" ID="count1"></asp:Label></h6>
                                                       <asp:GridView ID="GridNotificationMOM" runat="server" AutoGenerateColumns="False"
                                                            class="table table-bordered" OnPageIndexChanging="GridNotificationMOM_PageIndexChanging"
                                                            GridLines="None" AllowPaging="true" OnSorting="GridNotificationMOM_Sorting"
                                                            PageSize="10"
                                                            ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GridNotificationMOM_RowCommand" DataKeyNames="ID">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Select" HeaderStyle-CssClass="autostyle2" ItemStyle-Width="5%">
                                                                    <ItemTemplate>
                                                                    <%--    <input type="checkbox" id="chkSelect" runat="server" />
                                                                        <label for="chkSelect"></label>--%>
                                                                        <asp:CheckBox runat="server" ID="chkSelect" ></asp:CheckBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Type")  %>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="DateTime" HeaderStyle-CssClass="autostyle2" SortExpression="NotificationDateTime">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("NotificationDateTime")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Message" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Messsage")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                   <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btnDetails" runat="server" OnCommand="btnDetails_Command" CommandArgument='<%# Eval("MOMID")  %>' CommandName="Details" class="btn btn-icon icon-left btn-outline-info"><i class="far fa-edit"></i>Details</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                            </Columns>

                                                            <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                                                            <PagerSettings Mode="NumericFirstLast" />
                                                            <EmptyDataTemplate>
                                                                No Record Available
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>



                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </ContentTemplate>
                    </asp:TabPanel>



                    <asp:TabPanel ID="NotificationAssign" runat="server" HeaderText="Bug Assignment" TabIndex="1" class="nav-link" data-toggle="tab">

                        <ContentTemplate>

                            <asp:Label ID="lblmsg2" runat="server"></asp:Label>
                            <div class="row">
                                <div class="col m3">
                                    <asp:Button ID="btnAssign" runat="server" OnClick="btnAssign_Click" Text="Assign" class="btn" />

                                </div>
                                <div class="col m4">
                                    <asp:DropDownList ID="ddlDeveloper" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                             <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="overflow-x:auto;width:100%">
                        
                                       <h6 style="color: steelblue"><asp:Label runat="server" Text="" ID="count2"></asp:Label></h6>
                                               <asp:GridView ID="GirdNotificationAssign" runat="server" AutoGenerateColumns="False"
                                                    class="table table-bordered" OnPageIndexChanging="GirdNotificationAssign_PageIndexChanging"
                                                    GridLines="None" AllowPaging="true" OnSorting="GirdNotificationAssign_Sorting"
                                                    PageSize="10"
                                                    ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GirdNotificationAssign_RowCommand" DataKeyNames="ID">
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="Select" HeaderStyle-CssClass="autostyle2" ItemStyle-Width="5%">
                                                            <HeaderTemplate>  
                                                    <asp:CheckBox ID="CheckBoxall" AutoPostBack="true" onCheckedChanged="chckchanged" runat="server" /> </HeaderTemplate>  
                                                            <ItemTemplate>
                                                               <%-- <input type="checkbox" id="chkSelect" runat="server" />
                                                                <label for="chkSelect"></label>--%>
                                                                <asp:CheckBox runat="server" ID="chkSelect"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Type")  %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                                 <asp:Label ID="lblBugID" runat="server" Text='<%# Eval("BugID")  %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="DateTime" HeaderStyle-CssClass="autostyle2" SortExpression="NotificationDateTime">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("NotificationDateTime")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Message" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Messsage")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <%-- <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2" >
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnConfirm" runat="server"  Text="Confirm" Visible="false" OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Confirm"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                               <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnReject" runat="server"  Text="Reject" Visible="false"  OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Reject"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                               <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2"  >
                                                        <ItemTemplate>
                                                            <asp:DropdownList ID="ddlDeveloper" runat="server"   Visible="false"   ></asp:DropdownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                              <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnAssign" runat="server"  Text="Assign" Visible="false" OnClientClick="return GetApproveConfirmation();"  CommandArgument='<%# Container.DataItemIndex  %>' CommandName="Assign"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                        <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btnDetails" runat="server" Text="Details" OnCommand="lnkDetails_Command" CommandArgument='<%# Eval("BugID")  %>' CommandName="Details" class="btn btn-icon icon-left btn-outline-info"><i class="far fa-edit"></i>Details</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <%-- <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2" >
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnClosed" runat="server"  Text="Close" Visible="false" OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Close"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    </Columns>

                                                    <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                                                    <PagerSettings Mode="NumericFirstLast" />
                                                    <EmptyDataTemplate>
                                                        No Record Available
                                                    </EmptyDataTemplate>
                                                </asp:GridView>



                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>



                        </ContentTemplate>
                    </asp:TabPanel>


                    <asp:TabPanel ID="NotificationBug" runat="server" HeaderText="Assigned Bug List" TabIndex="2" data-toggle="tab" class="nav-link">

                        <ContentTemplate>

                            <asp:Label ID="lblmsg3" runat="server"></asp:Label>
                            <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="overflow-x:auto;width:100%">
                        
                                       <h6 style="color: steelblue">
                               <asp:Label runat="server" Text="" ID="count3"></asp:Label></h6>
                                              <asp:GridView ID="GirdNotificationBug" runat="server" AutoGenerateColumns="False"
                                                    class="table table-bordered" OnPageIndexChanging="GirdNotificationBug_PageIndexChanging"
                                                    GridLines="None" AllowPaging="true" OnSorting="GirdNotificationBug_Sorting"
                                                    PageSize="10" OnRowCommand="GirdNotificationBug_RowCommand"
                                                    ShowHeaderWhenEmpty="True" Width="100%" DataKeyNames="ID">
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Type")  %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="DateTime" HeaderStyle-CssClass="autostyle2" SortExpression="NotificationDateTime">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("NotificationDateTime")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Message" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Messsage")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>



                                                        <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btnDetails" runat="server" Text="Details" OnCommand="lnkDetails_Command" CommandArgument='<%# Eval("BugID")  %>' CommandName="Details" class="btn btn-icon icon-left btn-outline-info"><i class="far fa-edit"></i>Details</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                    </Columns>

                                                    <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                                                    <PagerSettings Mode="NumericFirstLast" />
                                                    <EmptyDataTemplate>
                                                        No Record Available
                                                    </EmptyDataTemplate>
                                                </asp:GridView>



                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>


                        </ContentTemplate>
                    </asp:TabPanel>


                    <asp:TabPanel ID="NotificationSolvedBug" runat="server" HeaderText="Bug(Close/Reopen)" TabIndex="3"  class="nav-link">

                        <ContentTemplate>
                          
                            <asp:Label ID="lblmsg4" runat="server"></asp:Label>
                            <div class="row" style="margin-left:5px">
                                  <div class="card">
                                      <div class="card-body">
                                 <asp:DropDownList ID="ddlProjectName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                 </div>
                                      </div>
                                <div class="card">
                                    <div class="card-body">
                                      <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" OnClientClick="return GetCloseConfirmation();" Text="Close" class="btn btn-outline-info"/>
                                      </div>
                                      </div>
                                </div>
                           <div class="row" style="margin-top:10px">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="overflow-x:auto;width:100%">
                        
                                       <h6 style="color: steelblue">
                                          <asp:Label runat="server" Text="" ID="count4"></asp:Label></h6>
                                          <asp:GridView ID="GridNotificationSolvedBug" runat="server" AutoGenerateColumns="False"
                                                    class="table table-bordered" OnPageIndexChanging="GridNotificationSolvedBug_PageIndexChanging"
                                                    GridLines="None" AllowPaging="true" OnSorting="GridNotificationSolvedBug_Sorting"
                                                    PageSize="10" OnRowCommand="GridNotificationSolvedBug_RowCommand"
                                                    ShowHeaderWhenEmpty="True" Width="100%" DataKeyNames="ID">
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="Select" HeaderStyle-CssClass="autostyle2" ItemStyle-Width="5%">
                                                             <HeaderTemplate>  
                                                    <asp:CheckBox ID="CheckBoxall" AutoPostBack="true" onCheckedChanged="chckchangedClose" runat="server" /> </HeaderTemplate>  
                                                            <ItemTemplate>
                                                               <%-- <div>
                                                                    <input type="checkbox" id="chk" class="filled-in">
                                                                    <label for="chk" id="lblchk" runat="server">1</label>
                                                                </div>--%>

                                                                 <asp:CheckBox runat="server"  ID="chkSelect" ></asp:CheckBox>
                                                                <%--   <input type="checkbox" id="chkSelect" runat="server" />
                                                                         <label for="chkSelect">1</label>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Sr. No."  HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Type")  %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblBugID" runat="server" Text='<%# Eval("BugID")  %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="DateTime" HeaderStyle-CssClass="autostyle2" SortExpression="NotificationDateTime">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("NotificationDateTime")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Message" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Messsage")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <%-- <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnConfirm" runat="server" Text="Confirm" Visible="false" OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Confirm"></asp:Button>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnReject" runat="server" Text="Reject" Visible="false" OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Reject"></asp:Button>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:DropDownList ID="ddlDeveloper" runat="server" Visible="false"></asp:DropDownList>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnAssign" runat="server" Text="Assign" Visible="false" OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Container.DataItemIndex  %>' CommandName="Assign"></asp:Button>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>--%>

                                                        <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btnDetails" runat="server" Text="Details" OnCommand="lnkDetails_Command" CommandArgument='<%# Eval("BugID")  %>' CommandName="Details" class="btn btn-icon icon-left btn-outline-info">Details</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <%--  <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnClosed" runat="server" Text="Close"  OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Close"></asp:Button>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>--%>

                                                        <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Button ID="btnReopen" runat="server" Text="Reopen" CommandArgument='<%# Eval("BugID") %>' OnClientClick="return GetReopenConfirmation();" CommandName="Reopen" class="btn btn-icon icon-left btn-outline-primary"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                    </Columns>

                                                    <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                                                    <PagerSettings Mode="NumericFirstLast" />
                                                    <EmptyDataTemplate>
                                                        No Record Available
                                                    </EmptyDataTemplate>
                                                </asp:GridView>


                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            </div>

                           
                        </ContentTemplate>
                    </asp:TabPanel>


               


                  <asp:TabPanel ID="NotificationSolvedTask" runat="server" HeaderText="Task(Close/Reopen)" TabIndex="4" class="nav-link" data-toggle="tab">

                        <ContentTemplate>

                            <asp:Label ID="lblmsg5" runat="server"></asp:Label>
                            <div class="row">
                                <asp:Button ID="btnCloseTask" runat="server" OnClick="btnCloseTask_Click" OnClientClick="return GetCloseTaskConfirmation();" Text="Close" class="btn"  />

                            </div>
                    <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="overflow-x:auto;width:100%">
                        
                                       <h6 style="color: steelblue">
                                       
                            <asp:Label runat="server" Text="" ID="count5"></asp:Label></h6>
                                              <asp:GridView ID="GridNotificationSolvedTask" runat="server" AutoGenerateColumns="False"
                                                    class="table table-bordered" OnPageIndexChanging="GridNotificationSolvedTask_PageIndexChanging"
                                                    GridLines="None" AllowPaging="true" OnSorting="GridNotificationSolvedTask_Sorting"
                                                    PageSize="10" OnRowCommand="GridNotificationSolvedTask_RowCommand"
                                                    ShowHeaderWhenEmpty="True" Width="100%" DataKeyNames="ID">
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="Select" HeaderStyle-CssClass="autostyle2" ItemStyle-Width="5%">
                                                             <HeaderTemplate>  
                                                    <asp:CheckBox ID="CheckBoxall" AutoPostBack="true" onCheckedChanged="chckchangedCloseTask" runat="server" /> </HeaderTemplate>  
                                                            <ItemTemplate>
                                                               <%-- <div>
                                                                    <input type="checkbox" id="chk" class="filled-in">
                                                                    <label for="chk" id="lblchk" runat="server">1</label>
                                                                </div>--%>

                                                                 <asp:CheckBox runat="server"  ID="chkSelect" ></asp:CheckBox>
                                                                <%--   <input type="checkbox" id="chkSelect" runat="server" />
                                                                         <label for="chkSelect">1</label>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Type")  %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblBugID" runat="server" Text='<%# Eval("AssignedTaskID")  %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="DateTime" HeaderStyle-CssClass="autostyle2" SortExpression="NotificationDateTime">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("NotificationDateTime")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Message" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Messsage")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                       

                                                        <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btnDetailsTask" runat="server" Text="Details" OnCommand="btnDetailsTask_Command" CommandArgument='<%# Eval("AssignedTaskID")  %>' CommandName="Details" class="btn btn-icon icon-left btn-outline-info"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                       <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Button ID="btnReopen" runat="server" Text="Reopen" CommandArgument='<%# Eval("AssignedTaskID") %>' OnClientClick="return GetReopenTaskConfirmation();" CommandName="Reopen" class="btn btn-icon icon-left btn-outline-primary"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                       

                                                    </Columns>

                                                    <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                                                    <PagerSettings Mode="NumericFirstLast" />
                                                    <EmptyDataTemplate>
                                                        No Record Available
                                                    </EmptyDataTemplate>
                                                </asp:GridView>


                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>



                        </ContentTemplate>
                    </asp:TabPanel>


                </asp:TabContainer>
            </div>


            <asp:Button ID="btnShow" runat="server" Text="" Visible="true" Style="display: none" />
            <!-- ModalPopupExtender -->
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlpp" TargetControlID="btnShow"
                CancelControlID="Vpbtncancel" BackgroundCssClass="modalBackground" />

            <asp:Panel ID="pnlpp" runat="server" Style="display: none">

                <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup">
                    <div class="modal-header">
                       <h2><asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label></h2>
                       </div>
                    <div class="modal-body">
                               <h5><asp:Label ID="lbltxtDetails" runat="server"> </asp:Label></h5>
                    </div>
                    <div class="modal-footer">
                       <asp:Button ID="Vpbtncancel" CausesValidation="false" runat="server" Text="Cancel " Visible="true" class="btn btn-primary"/>
                   
                        </div>
                </asp:Panel>
                    
            </asp:Panel>

        </div>
    </div>
</asp:Content>
