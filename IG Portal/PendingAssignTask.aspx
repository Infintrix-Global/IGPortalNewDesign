<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="PendingAssignTask.aspx.cs" Inherits="IG_Portal.PendingAssignTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">

            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Pending Task" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                 <asp:UpdatePanel ID="upTask" runat="server">
                    <ContentTemplate>

                 <asp:Label runat="server" Text="" ID="lblmsg"></asp:Label>
                 <div class="row">
                    <div class=" col m3">
                        <div class="form-group">
                            <label>Employee Name</label>
                            <asp:DropdownList ID="ddlempName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static"></asp:DropdownList>


                        </div>
                    </div>

                    <div class=" col m3">
                        <div class="form-group">
                            <label>Project</label>
                            <asp:DropdownList ID="ddlProjectName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static"></asp:DropdownList>


                        </div>
                    </div>

                      <div class=" col m3">
                        <div class="form-group">
                            <label> Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static">
                                <asp:ListItem Text="Not Assigned" Value="1"></asp:ListItem>
                                 <asp:ListItem Text="Assigned" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="Both" Value="3"></asp:ListItem>
                            </asp:DropDownList>


                        </div>
                    </div>

                     <div class=" col m3">
                        <div class="form-group">
                            <label> Status</label>
                            <asp:DropDownList ID="ddlTaskStatus" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static">
                               
                            </asp:DropDownList>


                        </div>
                    </div>

                     <div class="clearfix"></div>
                     <div class="row" align="center">

                    <div class="col m12">
                        <div class="form-group form-md-line-input ">


                                <asp:Button ID="btSearch" runat="server" Text="Search" class="btn" ClientIDMode="Static" OnClick="btSearch_Click" UseSubmitBehavior="false" />
                                 <asp:Button ID="btclear" runat="server" Text="Clear"  class="btn blue" ClientIDMode="Static" OnClick="btclear_Click" />

                        </div>
                    </div>
                    <div class="col m2">
                        <div class="form-group form-md-line-input ">

                          

                        </div>
                    </div>
                     </div>
                </div>

                  <div class="row">
                                <div class=" col m12">
                                    <div class="portlet light ">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                         <asp:Panel ID="panel1" runat="server" Height="100%" Width="100%" ScrollBars="Both">
                                        <div class="portlet-body">
                                                <div class="table-scrollable table-scrollable-borderless">
                                                <asp:GridView ID="GridAssignTask" runat="server" AutoGenerateColumns="False"
                                                    class="striped" OnPageIndexChanging="GridAssignTask_PageIndexChanging"
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
                </div>
            </div>
         </div>

</asp:Content>
