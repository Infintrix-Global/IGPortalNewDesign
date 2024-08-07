﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddMOM.aspx.cs" Inherits="IG_Portal.AddMOM" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function DateTimeValidation(sender, args) {
            var start = document.getElementById("<%=txtFromTime.ClientID %>").value;
            var end = document.getElementById("<%=txtToTime.ClientID %>").value;
            var date1 = new Date();
            var startTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + start);

            var endTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + end);


            if (startTime >= endTime) {
                args.IsValid = false;
            }

        }



    </script>


    <style type="text/css">
        .pnlpoint {
            margin: 10px;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 400px;
            height: 200px;
            border: 3px solid #0DA9D0;
        }


        .block1 {
            height: 100px;
            width: 470px;
            border: 1px solid aliceblue;
            overflow-y: scroll;
        }

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
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "images/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "images/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Mom Details</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="Admindashboard.html"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="AddMOM.aspx">Add MOM Details</a></div>
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
    
   <div class="section-body">
                          <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>MOM Details
                                                <i class="fas fa-arrow-down"></i></h4>
                                            <h4> <asp:Button ID="btnAddNew" runat="server" Text="Add MOM Details" OnClick="btnAddNew_Click" class="btn btn-outline-info" style="margin-left:700px;width:150px;background-color:blue;color:white"></asp:Button></h4>
                                        </div>
                                            
                <div id="meetingType" runat="server" visible="false">
                    <div class="card-body">
                                            <div class="form-group row">
                                            <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Meeting Type</label>
                                            <asp:DropDownList ID="ddlMeetingType" runat="server" TabIndex="1" OnSelectedIndexChanged="ddlMeetingType_SelectedIndexChanged"
                                        AutoPostBack="true" class="form-control">
                                    </asp:DropDownList>
                                    </div>
                                    </div>
                    </div>
                    </div>
               
                <div id="addMOM" runat="server" visible="false">
                    <div class="card-body">
                                            <div class="form-group row">
                                            <div class=" col-sm-12 form-group">
                                            <h4 style="text-align:center"><asp:Label ID="lblMtype" runat="server" class="col-sm-12 col-form-label"></asp:Label></h4>
                                                
                    <br />
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                       </div>
                                 <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                   <label class="col-sm-6 col-form-label">Meeting Date</label>
                                  <asp:TextBox ID="txtDateTime" runat="server" class="form-control" placeholder="Enter Date " TabIndex="1" TextMode="Date"></asp:TextBox>
                                    <span class="help-block">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDateTime" ErrorMessage="Please Enter Date Time" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                    </span>
                                    </div>
                                 <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                   <label class="col-sm-6 col-form-label">From Time</label>
                                  <asp:TextBox ID="txtFromTime" runat="server" class="form-control" placeholder="Enter Date " TabIndex="2" TextMode="Time"></asp:TextBox>
                                    <span class="help-block">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFromTime" ErrorMessage="Please Enter From Time" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                    </span>
                                </div>
                               <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                   <label class="col-sm-6 col-form-label">To Time</label>
                                <asp:TextBox ID="txtToTime" runat="server" class="form-control" placeholder="Enter Date " TabIndex="3" TextMode="Time"></asp:TextBox>
                                    <span class="help-block">
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please enter end time after the start time"
                                            ForeColor="Red" ControlToValidate="txtToTime" Display="Dynamic" ClientValidationFunction="DateTimeValidation" ValidationGroup="at"></asp:CustomValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtToTime" ErrorMessage="Please Enter To Time" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                    </span>
                                </div>
                                                </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-group row">
                                 <div class=" col-sm-6 form-group" style="margin-top:-40px">
                                   <label class="col-sm-12 col-form-label">Meeting Initiator</label>
                                <asp:DropDownList ID="ddlMeetingInitiator" runat="server" placeholder=""
                                                ClientIDMode="Static" TabIndex="4" class="form-control">
                                            </asp:DropDownList>
                                            <span class="help-block">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlMeetingInitiator" ValidationGroup="e" InitialValue="0"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Meeting Initiator" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </span>
                                       
                                </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-40px">
                                   <label class="col-sm-12 col-form-label">Meeting Place</label>
                                    <asp:DropDownList ID="ddlMeetingPlace" runat="server" placeholder=""
                                                TabIndex="5" AutoPostBack="true" OnSelectedIndexChanged="ddlMeetingPlace_SelectedIndexChanged" class="form-control">
                                            </asp:DropDownList>
                                            <span class="help-block">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlMeetingPlace" ValidationGroup="e" InitialValue="0"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Meeting Place" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </span>
                                        </div>
                                       
                                    <div class=" col-sm-6 form-group" style="margin-top:-40px">
                                      `<asp:TextBox ID="txtMeetingPlace" class="form-control" TabIndex="6" Visible="false" runat="server"></asp:TextBox>
                                            <span class="help-block">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtMeetingPlace"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Meeting Place " ForeColor="Red"></asp:RequiredFieldValidator>
                                            </span>
                                       </div>

                                </div>
                                <div class="form-group row">
                                <div class=" col-sm-6 form-group" style="margin-top:-70px" id="divClient" runat="server">
                                     <label class="col-sm-12 col-form-label">Client Name</label>
                                   <asp:TextBox ID="txtClientName" runat="server" class="form-control" placeholder="" TabIndex="7"></asp:TextBox>
                                            <span class="help-block">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtClientName" ErrorMessage="Please Enter Client Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                            </span>
                                        </div>
                                    <div id="divProject" runat="server" class=" col-sm-6 form-group" style="margin-top:-70px">
                                     <label class="col-sm-6 col-form-label">Project Name</label>
                                  
                                          <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                                TabIndex="8" AutoPostBack="true" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" class="form-control">
                                            </asp:DropDownList>
                                            <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="e" InitialValue="0"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </span>
                                           </div>
                                 <div class=" col-sm-6 form-group" style="margin-top:-50px">
                                   <label class="col-sm-6 col-form-label">Attendees</label>
                                  
                                    <div class="block1">
                                                <asp:ListBox ID="lstAttendees" runat="server" Visible="false" SelectionMode="Multiple" AppendDataBoundItems="true" CssClass="form-control"></asp:ListBox>

                                                <asp:CheckBoxList ID="chkAttendees" RepeatLayout="OrderedList" runat="server" TabIndex="9" />
                                            </div>
                                        
                                </div>
                                    <div class=" col-sm-12 form-group">
                                   <label class="col-sm-12 col-form-label">Agenda</label>
                                  
                                         <asp:TextBox ID="txtAgenda" class="form-control" placeholder="" TabIndex="10" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            <span class="help-block">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAgenda" ValidationGroup="e"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Agenda" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </span>
                                     </div>
                            <br />
                                    </div>
                            <asp:Panel ID="PanelPoints" runat="server">
                                <br />
                               <div class="form-group row" style="margin-top:-60px">
                                <div class=" col-sm-6 form-group">
                                   <label class="col-sm-6 col-form-label">Meeting Points </label>
                                  
                                            <asp:TextBox ID="txtMeetingPoint" class="form-control" placeholder="" TabIndex="11" runat="server"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtMeetingPoint" ValidationGroup="md"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Meeting Point" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            
                                        </div>
                                   <div class=" col-sm-4 form-group">
                                   <label class="col-sm-4 col-form-label">Status</label>
                                    <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="12" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredStatus" runat="server" ControlToValidate="ddlStatus" ValidationGroup="md" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Status" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            
                                    </div>
                                 <div class=" col-sm-2 form-group" style="margin-top:40px">
                                   <asp:Button ID="btnMeetingPoint" OnClick="btnMeetingPoint_Click" class="btn btn-outline-primary" runat="server" Text="Add" TabIndex="13" ValidationGroup="md" />
                                    </div>
                                    <asp:Panel ID="pnlPoints" runat="server" CssClass="pnlpoint">
                                        <asp:GridView runat="server" ID="GridMeetingPoint" AutoGenerateColumns="false" class="table table-bordered" AllowPaging="true"
                                            GridLines="None" CaptionAlign="NotSet" Width="901px" ForeColor="Black"
                                            OnRowDeleting="GridMeetingPoint_RowDeleting" OnRowDataBound="GridMeetingPoint_RowDataBound">
                                            <Columns>

                                                <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="5%"/>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <span class="auto-style1">
                                                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label></span>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Meeting Point" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <span class="auto-style1">
                                                            <asp:Label ID="lblMeetingPoint" runat="server" Text='<%# Bind("[Meeting Point]")  %>'></asp:Label></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <span class="auto-style1">
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("[Status]")  %>'></asp:Label></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </asp:Panel>
                            <br />
                            <div class="form-group row" style="margin-top:-60px">
                                <div class=" col-sm-6 form-group">
                               <asp:FileUpload ID="FileUpReciept" runat="server" TabIndex="14" class="form-control"/>
                                </div>

                                <div class="col m2">
                                    <%-- <asp:Button ID="btnReciept" class="btn" ClientIDMode="Static" CausesValidation="False"
                            runat="server" Text="Upload Document" OnClick="btnReciept_Click" TabIndex="5" />--%>
                                    <asp:Label ID="Label1" runat="server" Text="(Format supported:jpeg,png,jpg,bmp,gif,pdf,doc,docx)" ForeColor="Red"></asp:Label>
                                </div>

                                <div class="col m1">
                                    <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
                                </div>
                            </div>
                               <div class="form-group row" style="margin-top:-20px">
                                    <div class="col-sm-4"></div>
                                <div class=" col-sm-6 form-group">
                                        <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="15" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" style="width:150px"/>
                                        <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="16" class="btn btn-outline-info" ClientIDMode="Static" OnClick="btclear_Click" style="width:150px"/>

                                    </div>
                                </div>

                            </div>
                                

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
</div>
                       

                <br />
                <div id="viewMOM" runat="server">
                    <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="overflow-x:auto;width:100%">
                                    <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                        <asp:GridView ID="GridMOM" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            class="table table-bordered" AllowSorting="true" OnPageIndexChanging="GridMOM_PageIndexChanging"
                                            GridLines="None" OnSorting="GridMOM_Sorting" PageSize="10" OnRowCommand="GridMOM_RowCommand"
                                            ShowHeaderWhenEmpty="True" Width="100%" OnRowDataBound="GridMOM_RowDataBound" DataKeyNames="ID">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="20%" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Meeting Date" HeaderStyle-CssClass="autostyle2" SortExpression="MeetingDate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("MeetingDate","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("MeetingTypeName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Initiator" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("Initiator")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Place" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label21" runat="server" Text='<%# Eval("MeetingPlaceName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="From Time" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("FromTime")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="To Time" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("ToTime")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Meeting Period" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("MeetingTime")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Client Name" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("ClientName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("PName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Attendees">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("AttendeeList")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Download File" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkDownload" runat="server" CausesValidation="False" CommandArgument='<%# Eval("File") %>'
                                                            CommandName="Download" Text='<%# Eval("File") %>' ForeColor="LightBlue" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Meeting Points " HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <img alt="" style="cursor: pointer" src="images/plus.png" />
                                                        
                                                         <asp:Panel ID="Panel1" runat="server" Style="display: none">
                                                            <asp:GridView ID="gvmp" runat="server" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Points">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label18" runat="server" Text='<%#  Eval("MeetingPoint")  %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Status ">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label8" runat="server" Text='<%#  Eval("Status")  %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                                        </asp:Panel>
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="EditMOM" AlternateText="edit" ToolTip="edit" Visible="false" class="btn btn-primary"><i class="fas fa-edit"></i></asp:LinkButton>
                                                        <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="RemoveMOM" ImageUrl="~/images/delete.png" AlternateText="delete" ToolTip="delete" Visible="false" OnClientClick="return confirm('Are you sure you want to delete this MOM?');"></asp:ImageButton>

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
                        </div>
                        </div>
                              </div>
      
                    </div>
               

</asp:Content>
