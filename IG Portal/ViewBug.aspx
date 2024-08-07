﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewBug.aspx.cs" Inherits="IG_Portal.ViewBug" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
     <script type="text/javascript">
  function GetApproveConfirmation()
  {
      var reply = confirm("Are You Sure you want to remove this bug entry?");
      if(reply)
      {
         return true;
      }
      else
      {
         return false;
      }
         }

         function GetAddTSConfirmation() {
             var reply = confirm("Are You Sure you want to add this bug in TimeSheet?");
             if (reply) {
                 target = '_blank';
                 return true;

             }
             else {
                 return false;
             }
         }

         
     </script>
   <style>
        .block1 {
            height: 100px;
            width: 200px;
            border: 1px solid aliceblue;
            overflow-y: scroll;
            
        }
        .panel{
            top:250px;
        }
    </style>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>View Bug</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">View Bug Deatils</a></div>
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
            
  <asp:Label ID="lblMessage" runat="server"></asp:Label>
                 <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>
                          <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>View Bug</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Project Name </label>
                                <asp:DropDownList ID="ddlProjectName" runat="server" class="form-control" placeholder="" 
                                         OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                        </div>
                                  <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Developer Name </label>
                                    <asp:DropDownList ID="ddlDeveloper" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static"  >
                                    </asp:DropDownList>
                                    </div>
                                    <div class=" col-sm-6 form-group">
                                    <label class="col-sm-6 col-form-label">Task Type</label>
                                    <asp:DropDownList ID="ddlTaskType" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static" >
                                    </asp:DropDownList>
                                    </div>
                                     <div class=" col-sm-6 form-group">
                                    <label class="col-sm-6 col-form-label">Status</label>
                                      <asp:TextBox ID="txtStatus" class="form-control " placeholder="Select Status" runat="server" autocomplete="off"></asp:TextBox>
                                                                            <asp:PopupControlExtender ID="PopupControlExtender1" runat="server"
                                                                                Enabled="True" ExtenderControlID="" TargetControlID="txtStatus" PopupControlID="Panel8"
                                                                                OffsetY="22">
                                                                            </asp:PopupControlExtender>

 

                                                                            <asp:Panel ID="Panel8" Height="200px" Width="220px"  CssClass="panel"
                                                                                BorderWidth="2px" Direction="LeftToRight" ScrollBars="Auto" runat="server">
                                                                                 <asp:CheckBoxList ID="chkStatus" runat="server" BackColor="White" Height="200px" Width="220px"
                                                                                    DataTextField="holiday_name" DataValueField="holiday_name" AutoPostBack="True"   RepeatLayout="UnorderedList" 
                                                                                     OnSelectedIndexChanged="chkStatus_SelectedIndexChanged">
                                                                                </asp:CheckBoxList>

 

                                                                     </asp:Panel>
                                        </div>


                    <%--            <div class="col m2">
                                            <div class="form-group">
                                                    <label>Status </label>
                                             <%--   <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" >
                                                </asp:DropDownList>
                                                  <div class="block1" id="chkDept" runat="server">
                                                <asp:CheckBoxList id="chkStatus" runat="server" RepeatLayout="OrderedList"></asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>--%>
                                    <div class=" col-sm-6 form-group">
                                    <label class="col-sm-6 col-form-label">Priority</label>
                                    <asp:DropDownList ID="ddlPriority" runat="server" placeholder=""
                                                    ClientIDMode="Static" CssClass="form-control" >
                                                     <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="High Priority" Value="High Priority" ></asp:ListItem>
                                                    <asp:ListItem Text="Medium Priority" Value="Medium Priority"></asp:ListItem>
                                                    <asp:ListItem Text="Low Priority" Value="Low Priority"></asp:ListItem>
                                                </asp:DropDownList>
                                                
                                        </div>
                                    <div class=" col-sm-6 form-group">
                                    <label class="col-sm-6 col-form-label">Work Date</label>
                                   <asp:TextBox ID="txtWorkDate" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static" TextMode="Date" ></asp:TextBox>
                                 </div>
                                   
                    </div>
                                </div>
                                    </div></div>
                              </div>
                             
                <br />

                         </ContentTemplate>
                     </asp:UpdatePanel>    
                        <div class="form-group row" style="margin-top:-95px">
                        <div class="col-sm-4"></div>
                            <div class="col-sm-4">
                        <asp:Button ID="btSearch" runat="server" Text="Search" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btSearch_Click"  CausesValidation="true" style="width:130px;"/>
                            <asp:Button ID="btclear" runat="server" Text="Clear" ClientIDMode="Static" OnClick="btclear_Click" class="btn btn-outline-info" style="width:130px;"/>
                        </div>
                    </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                
                         <div class="section-body">

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                               <h4><asp:Label runat="server" Text="Click on Sr.No. to view history" Font-Size="Small" ID="lblHistory"></asp:Label></h4>
                                <i class="fas fa-arrow-down"></i>
                                </div>
                                    <div class="card-body">
                                <h5>
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    </h5>
                                        <div style="overflow-x:auto;width:100%">
                                             <div class="col m12" align="right">
                                     
                                        <button class="btn btn-outline-primary" runat="server" onserverclick="btnExport_Click"  id="btExport"><i class="fa fa-download"></i>&nbsp;Export</button></div>
                                        <%--<asp:Button ID="btnExport" Text="Export To Excel" runat="server" OnClick="btnExport_Click" /></div>--%>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="GridBug" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            class="table table-bordered" AllowSorting="true" OnPageIndexChanging="GridBug_PageIndexChanging"
                                            GridLines="None" OnSorting="GridBug_Sorting" PageSize="10"  DataKeyNames="ID"
                                            ShowHeaderWhenEmpty="True" Width="100%"  OnRowDataBound="GridBug_RowDataBound" OnRowCommand="GridBug_RowCommand" >
                                            <Columns>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="5px" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkHistory" runat="server" Text="<%#Container.DataItemIndex + 1%>" CommandName="ViewHistory" CommandArgument='<%# Eval("ID")  %>' ForeColor="Blue" CssClass="font-timesheet" ToolTip="View History"></asp:LinkButton>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                          <asp:Label ID="lblCrossCheckedBy" runat="server" Text='<%# Eval("CrossCheckedBy")  %>' Visible="false"></asp:Label>
                                                         <asp:Label ID="lblDeveloperID" runat="server" Text='<%# Eval("Developer")  %>' Visible="false"></asp:Label>
                                                         <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status")  %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("ProjectName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Task Type" HeaderStyle-CssClass="autostyle2" SortExpression="TaskType">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("TaskName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Task Title" HeaderStyle-CssClass="autostyle2" SortExpression="TaskTitle">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("TaskTitle")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Page Name" HeaderStyle-CssClass="autostyle2" SortExpression="PageName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("PageName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Priority" HeaderStyle-CssClass="autostyle2" SortExpression="Priority" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Priority")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Bug Details" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("BugDetails")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 

                                                <asp:TemplateField HeaderText="Work Date" HeaderStyle-CssClass="autostyle2" SortExpression="WorkDate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("WorkDate","{0:dd/MMM/yy}")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Cross Checked By" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label25" runat="server" Text='<%# Eval("CrossCheckedByName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Developer" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label35" runat="server" Text='<%# Eval("DeveloperName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("StatusName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                
                                                <asp:TemplateField HeaderText="Comment" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Comment")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                           <asp:TemplateField HeaderText="Images" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <img alt="" style="cursor: pointer" src="images/plus.png" runat="server" id="img" />
                                                                <asp:Panel ID="Panel1" runat="server" Style="display: none">
                                                                    <asp:GridView ID="gvbs" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label24" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Images">
                                                                                <ItemTemplate>
                                                                                     <asp:LinkButton ID="lnkDownload" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ImageName") %>'
                                                            CommandName="Download" Text='<%# Eval("ImageName") %>' ForeColor="LightBlue" />
                                                                                   
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </asp:Panel>
                                                            </ItemTemplate>
                                                     
                                                </asp:TemplateField>

  <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CommandName="Edit" Visible="false" CommandArgument='<%# Eval("ID")  %>' AlternateText="edit" ToolTip="edit" class="btn btn-primary"><i class="fas fa-edit"></i></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <%--<EditItemTemplate>
                                                                    <asp:LinkButton Text="Update" runat="server" OnClick="OnUpdate" ForeColor="SlateBlue" />
                                                                    <asp:LinkButton Text="Cancel" runat="server" OnClick="OnCancel" ForeColor="CadetBlue" />
                                                                </EditItemTemplate>--%>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Remove" AlternateText="delete" ToolTip="delete" Visible="false" OnClientClick="return GetApproveConfirmation();" class="btn" style="background-color: green;color:white"><i class="fas fa-trash-alt" style="color:white"></i></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkAddTS" runat="server" CommandArgument='<%# Eval("ID")  %>' Text="Add TS" CommandName="AddTS"  Visible="false" OnClientClick="return GetAddTSConfirmation();"  ></asp:LinkButton>
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
                                            </ContentTemplate>
                                              </asp:UpdatePanel>
                                         </asp:Panel>
                                </div>

                            </div>
                        </div>

                    </div>

                    </ContentTemplate>
                     </asp:UpdatePanel>     
           
    
</asp:Content>
