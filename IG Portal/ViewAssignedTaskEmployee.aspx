<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewAssignedTaskEmployee.aspx.cs" Inherits="IG_Portal.ViewAssignedTaskEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Assigned Tasks</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Task Details</a></div>
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
            
                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                 <asp:Label runat="server" Text="" ID="lblmsg"></asp:Label>
                 <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>View Task Details</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Project</label>
                                       <asp:DropdownList ID="ddlProjectName" runat="server" class="form-control" placeholder=""
                                OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true"></asp:DropdownList>
                                </div>
                             <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Status</label>
                              <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static">
                                <asp:ListItem Text="Pending" Value="1"></asp:ListItem>
                                 <asp:ListItem Text="Completed" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="Both" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                            </div>
                    </div>
                     <div class="form-group row">
                         <div class="col-sm-4"></div>
                         <div class="col-sm-2">
                         <asp:Button ID="btSearch" runat="server" Text="Search" class="btn btn-outline-success" ClientIDMode="Static" OnClick="btSearch_Click" UseSubmitBehavior="false" style="width:130px"/>
                           </div>
                         <div class="col-sm-2">
                             <asp:Button ID="btclear" runat="server" Text="Clear"  class="btn btn-outline-info" ClientIDMode="Static" OnClick="btclear_Click" style="width:130px"/>
                            </div>
                    </div>
                  

                </div>
                     </div>
                            <div class="row">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Task Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                    <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                     <div style="overflow-x:auto;width:100%">    
                                    <asp:GridView ID="GridAssignTask" runat="server" AutoGenerateColumns="False"
                                                    class="table table-bordered" OnPageIndexChanging="GridAssignTask_PageIndexChanging"
                                                    GridLines="None" AllowPaging="true" OnSorting="GridAssignTask_Sorting"
                                                    PageSize="10"   OnRowDataBound="GridAssignTask_RowDataBound" 
                                                    ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GridAssignTask_RowCommand" DataKeyNames="ID">
                                                    <Columns>

                                                      <%--  <asp:TemplateField HeaderText="Select" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                              
                                                                <asp:CheckBox runat="server" ID="chkSelect"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>

                                                        <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                               
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Task Added Date" ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2" SortExpression="TaskAddedDateTime">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWorkDate" runat="server" Text='<%# Eval("TaskAddedDateTime","{0:dd/MMM/yy}")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                         

                                                          <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("ProjectName")  %>' CssClass="font-timesheet"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Task Name" HeaderStyle-CssClass="autostyle2" SortExpression="TaskName">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("TaskName")  %>' CssClass="font-timesheet"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Task Title" HeaderStyle-CssClass="autostyle2" SortExpression="TaskTitle">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("TaskTitle")  %>' CssClass="font-timesheet"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Task Details" HeaderStyle-CssClass="autostyle2" SortExpression="TaskDetails">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TaskDetails")  %>' CssClass="font-timesheet"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Priority" HeaderStyle-CssClass="autostyle2" SortExpression="Priority">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Priority")  %>' CssClass="font-timesheet"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                          <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" SortExpression="Status">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("StatusName")  %>' CssClass="font-timesheet"></asp:Label>
                                                                 <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status")  %>' Visible="false"></asp:Label>
                                                                 <asp:Label ID="lblAssignTo" runat="server" Text='<%# Eval("AssignTo")  %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                          <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkAddTS" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="AddTS"  OnClientClick="return GetAddTSConfirmation();" CssClass="btn btn-success" style="width:130px"><i class="fas fa-clipboard-list"></i>&nbsp;Add TS</asp:LinkButton>
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
                </div>
            </div>
         </div>
</asp:Content>
