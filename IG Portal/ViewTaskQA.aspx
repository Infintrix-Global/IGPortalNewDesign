<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewTaskQA.aspx.cs" Inherits="IG_Portal.ViewTaskQA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">

            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">View Task</h4>
                    <%--<asp:Label ID="lbltitle" runat="server" Text="View Task" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />

                 <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                 <asp:Label runat="server" Text="" ID="lblmsg"></asp:Label>
                 <div class="row">
                   
                    <div class=" col m3">
                        <div class="input-field col m4"> 											
											<div class="select-wrapper initialized">
                          
                            <asp:DropdownList ID="ddlProjectName" runat="server" class="form-control" placeholder=""
                                OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true"></asp:DropdownList>
</div>
                              <label>Project</label>
                        </div>
                    </div>

                     
                    </div>
                     

                    <div class="col m6">
                        <div class="form-group form-md-line-input ">

                          
                                <asp:Button ID="btSearch" runat="server" Text="Search" class="btn " ClientIDMode="Static" OnClick="btSearch_Click" UseSubmitBehavior="false" />
                            <asp:Button ID="btclear" runat="server" Text="Clear"  class="btn blue" ClientIDMode="Static" OnClick="btclear_Click" />

                        </div>
                    </div>
                    <div class="col m2">
                        <div class="form-group form-md-line-input ">

                           

                        </div>
                    </div>

                </div>
      <div class="row">
                                <div class=" col m12">
                                    <div class="portlet light ">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                        <div class="portlet-body">
                                            <div class="table-scrollable">
                                                <asp:GridView ID="GridAssignTask" runat="server" AutoGenerateColumns="False"
                                                    class="striped" OnPageIndexChanging="GridAssignTask_PageIndexChanging"
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

                                                      

                                                          <asp:TemplateField HeaderText="Developer" HeaderStyle-CssClass="autostyle2" SortExpression="Priority">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("EmployeeName")  %>' CssClass="font-timesheet"></asp:Label>
                                                               <%--  <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status")  %>' Visible="false"></asp:Label>
                                                                 <asp:Label ID="lblAssignTo" runat="server" Text='<%# Eval("AssignTo")  %>' Visible="false"></asp:Label>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                          <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkAddBug" runat="server" CommandArgument='<%# Eval("ID")  %>' Text="Add Bug" CommandName="AddBug" ForeColor="LightBlue"   OnClientClick="return GetAddBugConfirmation();" CssClass="font-timesheet"></asp:LinkButton>
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
