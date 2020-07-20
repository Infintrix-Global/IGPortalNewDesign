<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewTask.aspx.cs" Inherits="IG_Portal.ViewTask" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
          
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="View TimeSheet" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                  <div class="row" align="right">
                    <asp:LinkButton ID="lnkAddTS" runat="server" Text="Click Here to Add TimeSheet"  OnClick="lnkAddTS_Click" Font-Size="Medium"></asp:LinkButton>
                </div>
                <br />
                <!-- END PAGE HEADER-->

                <div class="row">

                    <div class=" col m3">
                        <div class="form-group">
                            <label>Employee Name</label>
                            <asp:DropDownList ID="ddlEmployeeName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>

                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
                <asp:UpdatePanel ID="upTask" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class=" col m2 ">
                                <div class="form-group">
                                    <label>Project Name </label>
                                    <asp:DropDownList ID="ddlProjectName" runat="server" class="form-control" placeholder=""  AutoPostBack="true"
                                        ClientIDMode="Static" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged">
                                    </asp:DropDownList>


                                </div>
                            </div>

                             <div class=" col m2 ">
                                <div class="form-group">
                                    <label>Task Category </label>
                                    <asp:DropDownList ID="ddlTaskCategory" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" OnSelectedIndexChanged="ddlTaskCategory_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>


                                </div>
                            </div>

                            <div class=" col m2 ">
                                <div class="form-group">
                                    <label>Task Type </label>
                                    <asp:DropDownList ID="ddlTaskType" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static">
                                    </asp:DropDownList>


                                </div>
                            </div>

                            <div class=" col m2 ">
                                <div class="form-group">
                                    <label>Task Title </label>
                                    <asp:DropDownList ID="ddlTaskTitle" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static">
                                    </asp:DropDownList>


                                </div>
                            </div>

                            <div class=" col m2 ">
                                <div class="form-group">
                                    <label>Status</label>
                                    <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static">
                                    </asp:DropDownList>


                                </div>
                            </div>


                            <div class=" col m2">
                                <div class="form-group">
                                    <label>From Date</label>
                                    <asp:TextBox ID="txtFromDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" OnTextChanged="txtFromDate_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requiredFromDate" runat="server" ControlToValidate="txtFromDate" ValidationGroup="vt"
                                        SetFocusOnError="true" ErrorMessage="Enter From Date" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class=" col m2">
                                <div class="form-group">
                                    <label>To Date</label>
                                    <asp:TextBox ID="txtToDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" OnTextChanged="txtToDate_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requiredToDate" runat="server" ControlToValidate="txtToDate" ValidationGroup="vt"
                                        SetFocusOnError="true" ErrorMessage="Enter To Date" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="row" align="center">


                    <div class="col m6">
                        <div class="form-group form-md-line-input ">

                            <asp:Button ID="btclear" runat="server" Text="Clear" ClientIDMode="Static" OnClick="btclear_Click" class="btn" />
                        </div>
                    </div>
                    <div class="col m2">
                        <div class="form-group form-md-line-input ">
                            <asp:Button ID="btSearch" runat="server" Text="Search" class="btn" ClientIDMode="Static" OnClick="btSearch_Click" ValidationGroup="vt" CausesValidation="true" />
                        </div>
                    </div>
                </div>


                <div class="clearfix"></div>

                <br />
                <!-- BEGIN SAMPLE FORM PORTLET-->
                <div class="portlet light ">

                    <div class="row">
                        <div class="col m12">
                            <div class="portlet light ">

                                <div class="row">
                                    <div class=" col m5">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    </div>
                                    <div class=" col m5">
                                        <asp:Label runat="server" Text="" ID="tottime"></asp:Label>
                                    </div>
                                    <div class="col m2">
                                        <button class="btn" runat="server" onserverclick="btnExport_Click" visible="false" id="btExport"><i class="fa fa-download"></i>Export</button>
                                        <%--<asp:Button ID="btnExport" Text="Export To Excel" runat="server" OnClick="btnExport_Click" /></div>--%>
                                    </div>
                                    <br />
                                    <div class="clearfix"></div>
                                   <asp:Panel ID="panel1" runat="server" Height="100%" Width="100%" ScrollBars="Both">
                                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="portlet-body">
                                                
                                                <div class="table-scrollable table-scrollable-borderless">
                                                    <asp:GridView ID="GridTask" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        class="table table-hover table-light" OnSorting="GridTask_Sorting" AllowSorting="true" 
                                                        GridLines="None" OnRowCommand="GridTask_RowCommand" OnRowDataBound="GridTask_RowDataBound"
                                                        ShowHeaderWhenEmpty="True" Width="100%" OnPageIndexChanging="GridTask_PageIndexChanging" PageSize="10">
                                                        <Columns>
                                                           
                                                            <asp:TemplateField HeaderText="Sr. No."  HeaderStyle-CssClass="autostyle2" ItemStyle-Width="0.01%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>" CssClass="font-timesheet"></asp:Label>
                                                                    <asp:Label ID="lblLoginID" runat="server" Text='<%# Eval("LoginID")  %>' Visible="false"></asp:Label>
                                                                      <asp:Label ID="lblTID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Employee Name" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeName")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProjectName")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Task Category" HeaderStyle-CssClass="autostyle2" SortExpression="TaskCategoryName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("TaskCategory")   %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Task Type" HeaderStyle-CssClass="autostyle2" SortExpression="TaskName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("TaskName")   %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Task Title" HeaderStyle-CssClass="autostyle2" SortExpression="TaskTitle">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("TaskTitle")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Task Details" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTaskDetail" runat="server" Text='<%# Eval("TaskDetails")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                                 <EditItemTemplate>
                                                    <asp:TextBox ID="txtTaskDetail" runat="server"  Text='<%# Eval("TaskDetails")  %>' CssClass="font-timesheet"></asp:TextBox>
                                                </EditItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Work Date" ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2" SortExpression="WorkDate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWorkDate" runat="server" Text='<%# Eval("WorkDate","{0:dd/MMM/yy}")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Start Time" HeaderStyle-CssClass="autostyle2" SortExpression="StartTime">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("StartTime")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="End Time" HeaderStyle-CssClass="autostyle2" SortExpression="EndTime">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("EndTime")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Time Spent" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("TimePeriod")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" SortExpression="StatusName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("StatusName")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Comment" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("Comment")  %>' CssClass="font-timesheet"></asp:Label>
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
                                                                    <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Delete" ImageUrl="~/images/delete.png" AlternateText="delete" ToolTip="delete" Visible="false" OnClientClick="return confirm('Are you sure you want to remove this timesheet entry?');"></asp:ImageButton>
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
                                            </ContentTemplate>
                                       </asp:UpdatePanel>
                                        </asp:Panel>
                                            </div>
                                      
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
        </div>
</asp:Content>
