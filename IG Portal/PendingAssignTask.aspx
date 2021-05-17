<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="PendingAssignTask.aspx.cs" Inherits="IG_Portal.PendingAssignTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    
    
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                 <asp:UpdatePanel ID="upTask" runat="server">
                    <ContentTemplate>
                     <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Assign Task</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="Admindashboard.html"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="PendingAssignTask.aspx">Assign Task Details</a></div>
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
    
    
                 <asp:Label runat="server" Text="" ID="lblmsg"></asp:Label>
                           <div class="section-body">
                          <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                         <h4>Fill up the Details
                                                <i class="fas fa-arrow-down"></i></h4> 
                                        </div>
                                            <div class="card-body">
                                            <div class="form-group row">
                                            <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Employee Name</label>
                                   
                                                <asp:DropdownList ID="ddlempName" runat="server" class="form-control" placeholder=""
                                                    ClientIDMode="Static"></asp:DropdownList>
                                                </div>
                                               <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Project</label>
                                   
                                                <asp:DropdownList ID="ddlProjectName" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static"></asp:DropdownList>
                                        </div>
                              <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Assign Status</label>
                                         
                              <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static">
                                <asp:ListItem Text="Not Assigned" Value="1"></asp:ListItem>
                                 <asp:ListItem Text="Assigned" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="Both" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                            </div>
                           <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Work Status</label>
                              
                           <asp:DropDownList ID="ddlTaskStatus" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static">
                               
                            </asp:DropDownList>
                            </div>
                          
                    </div>
                          <div class="form-group row" style="margin-top:-30px">
                                                            <div class="col-sm-4"></div>
                                                            <div class=" col-sm-6">
                                 <asp:Button ID="btSearch" runat="server" Text="Search" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btSearch_Click" UseSubmitBehavior="false" style="width:150px"/>
                                 <asp:Button ID="btclear" runat="server" Text="Clear"  class="btn btn-outline-info" ClientIDMode="Static" OnClick="btclear_Click" style="width:150px;margin-left:20px"/>
                     </div>
                    </div>
                  
                     </div>
                </div>

                  <div class="section-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Task Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <div style="overflow-x:auto;width:100%">
                             
                                    <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                                <asp:GridView ID="GridAssignTask" runat="server" AutoGenerateColumns="False"
                                                    class="table table-bordered" OnPageIndexChanging="GridAssignTask_PageIndexChanging"
                                                    GridLines="None" AllowPaging="true" OnSorting="GridAssignTask_Sorting"
                                                    PageSize="10"  OnRowDataBound="GridAssignTask_RowDataBound"
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
                                                                <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Eval("CreatedBy")  %>' Visible="false"></asp:Label>
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
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Task Name" HeaderStyle-CssClass="autostyle2" SortExpression="TaskName">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("TaskName")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Task Title" HeaderStyle-CssClass="autostyle2" SortExpression="TaskTitle">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("TaskTitle")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Task Details" HeaderStyle-CssClass="autostyle2" SortExpression="TaskDetails">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TaskDetails")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                          <asp:TemplateField HeaderText="Estimated Start Date" HeaderStyle-CssClass="autostyle2" SortExpression="EstimatedWorkDate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("EstimatedWorkDate")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                          <asp:TemplateField HeaderText="Estimated Hours" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("EstiamtedWorkTime")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Priority" HeaderStyle-CssClass="autostyle2" SortExpression="Priority">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Priority")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Developer" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDeveloper" runat="server" Text='<%# Eval("AssignTo")  %>'  Visible="false"></asp:Label>
                                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                               <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2"  >
                                                        <ItemTemplate>
                                                            <asp:DropdownList ID="ddlDeveloper" runat="server"     ></asp:DropdownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                              <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2" >
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnAssign" runat="server"  Text="Assign"  OnClientClick="return GetApproveConfirmation();"  CommandArgument='<%# Container.DataItemIndex  %>' CommandName="Assign" ></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                         <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="lnkEdit" Text="Edit" runat="server" CommandName="Edit" Visible="false" CommandArgument='<%# Eval("ID")  %>' ImageUrl="~/images/edit.png" AlternateText="edit" ToolTip="edit"  />
                                                                </ItemTemplate>
                                                                <%--<EditItemTemplate>
                                                                    <asp:LinkButton Text="Update" runat="server" OnClick="OnUpdate" ForeColor="SlateBlue" />
                                                                    <asp:LinkButton Text="Cancel" runat="server" OnClick="OnCancel" ForeColor="CadetBlue" />
                                                                </EditItemTemplate>--%>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Remove" ImageUrl="~/images/delete.png" AlternateText="delete" ToolTip="delete" Visible="false" OnClientClick="return GetApproveConfirmation();" ></asp:ImageButton>
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
</asp:Panel>
                                    </div>
                                </div>

                            </div>
</ContentTemplate>
                     </asp:UpdatePanel>
               

</asp:Content>
