<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="LeaveApplicationForManager.aspx.cs" Inherits="IG_Portal.LeaveApplictationForManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
      
            <!-- BEGIN FORM-->


            <div class="form-body">

                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Leave Of Employee" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

               <%-- <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>--%>

                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                      <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    <div class="row">
                                         <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Employee Name</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlEmployee" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlEmployee" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Employee Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                     <div id="AddNew" runat="server" visible="false">
                    <div class="row" align="center">
                            <asp:Button ID="btnAddNew" runat="server" TabIndex="1" ClientIDMode="Static" Text="Add New" class="btn" CausesValidation="true" OnClick="btnAddNew_Click"  UseSubmitBehavior="false" ></asp:Button>
                    </div>
                </div>

             <div  id="newLeave" runat="server" visible="false">

                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                    <div class="row">
                                        <div class="col m2">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Leave Type </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlLeaveType" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredLeaveType" runat="server" ControlToValidate="ddlLeaveType" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Leave Type" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>


                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Reason</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtReason" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="2">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredReason" runat="server" ControlToValidate="txtReason" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Reason" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>

                                            </div>
                                        </div>

                                        <div class="col m2">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        From  Date
                                                    </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date" TabIndex="3"  OnTextChanged="txtFromDate_TextChanged"  AutoPostBack="true"   ></asp:TextBox>
                                               <%-- <asp:CompareValidator ID="rgvStartDate" runat="server" ErrorMessage="Only Previous 3 days are allowed" Operator="GreaterThanEqual"
                 ValidationGroup="at" ControlToValidate="txtFromDate"  ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:CompareValidator>--%>
                                                <asp:RequiredFieldValidator ID="requiredSDate" runat="server" ControlToValidate="txtFromDate" ErrorMessage="Please Enter From Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col m2">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        To Date
                                                    </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="Date" TabIndex="4"></asp:TextBox>
                                              <%--  <asp:CompareValidator ID="rgvEndDate" runat="server" ErrorMessage="End Date should be after Start Date" Operator="GreaterThanEqual"
                 ValidationGroup="at" ControlToValidate="txtToDate" ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:CompareValidator>--%>
                                                <asp:RequiredFieldValidator ID="requiredEDate" runat="server" ControlToValidate="txtToDate" ErrorMessage="Please Enter To Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col m2">
                                          <asp:Button ID="btnDetails" runat="server" TabIndex="5" ClientIDMode="Static" Text="GO" class="btn" CausesValidation="true" OnClick="btnDetails_Click" ValidationGroup="at" UseSubmitBehavior="false" ></asp:Button>
                                            </div>

                                    </div>

                                    <div class="row" align="center">
                                        
                                    </div>

                                    <div id="divDetails" runat="server" visible="false">

                                    <div class="row">
                                        <div class="col m12">
                                             <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="Label2"></asp:Label>
                            <div class="portlet-body">
                                 <div class="table-scrollable table-scrollable-borderless">
                                    <asp:GridView ID="GridLeaveDay" runat="server"  AutoGenerateColumns="False"
                                        class="striped" 
                                        GridLines="None"
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("[Date]")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                     <asp:RadioButtonList ID="radLeave" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="radLeave_SelectedIndexChanged">
                                                                         
                                                                         <asp:ListItem Text="Half Day" Value="0.5" >  </asp:ListItem>
                                                                         <asp:ListItem Text="Full Day" Value="1" Selected="true"></asp:ListItem>
                                                                     </asp:RadioButtonList>
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

                                     <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="7" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" OnClientClick="this.disabled='true';"></asp:Button>
                                    </div>
                                        </div>
                                </div>
                            </div>

                        </div>

                 </div>

                        <div class="clearfix"></div>


                <div id="LeaveNumbers" runat="server" visible="false" >
                        <div class="portlet light ">

                            <div class="row">
                                <div class="col m12">
                                    <div class="portlet light ">
                                        <div class="row">
                                            <div class="col m4">
                                                <asp:Label runat="server" Text="Total PL= " ID="lbltpl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblctpl"></asp:Label>
                                        </div>
                                            <div class="col m4">
                                                <asp:Label runat="server" Text="Approved PL= " ID="lblapl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblcapl"></asp:Label>
                                        </div>
                                            <div class="col m4">
                                                <asp:Label runat="server" Text="Remaining PL= " ID="lblrpl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblcrpl"></asp:Label>
                                        </div>
                                            </div>
                                         <div class="row">
                                            <div class="col m4">
                                                <asp:Label runat="server" Text="Total SL= " ID="lbltsl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblctsl"></asp:Label>
                                        </div>
                                            <div class="col m4">
                                                <asp:Label runat="server" Text="Approved SL= " ID="lblasl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblcasl"></asp:Label>
                                        </div>
                                            <div class="col m4">
                                                <asp:Label runat="server" Text="Remaining SL= " ID="lblrsl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblcrsl"></asp:Label>
                                        </div>
                                            </div>
                                        
                                       <div class=" col m2">
                        <div class="form-group">
                            <label> Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"
                                >
                                <asp:ListItem Text="UnApproved" Value="1" Selected="True"></asp:ListItem>
                                 <asp:ListItem Text="Approved" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="Both" Value="3"></asp:ListItem>
                            </asp:DropDownList>


                        </div>
                    </div>

                                        <br />
                                        <div class="clearfix"></div>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                  <asp:Label runat="server" Text="" ID="Label3"></asp:Label>
                                                <div class="portlet-body">
                                                    <div class="table-scrollable">
                                                        <asp:GridView ID="GridLeave" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            class="striped" OnSorting="GridLeave_Sorting" AllowSorting="true"
                                                            GridLines="None" OnRowDataBound="GridLeave_RowDataBound" DataKeyNames="ID"
                                                            ShowHeaderWhenEmpty="True" Width="100%" OnPageIndexChanging="GridLeave_PageIndexChanging" PageSize="10">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Leave type" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveName">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("LeaveName")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="From Date" HeaderStyle-CssClass="autostyle2" SortExpression="FromDate">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("FromDate","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="To Date" HeaderStyle-CssClass="autostyle2" SortExpression="ToDate">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("ToDate","{0:dd/MMM/yy}")   %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Reason" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Reason")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveStatus">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("LeaveStatus")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Manager Comment" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveStatus">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("MangerComment")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="HR Comment" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveStatus">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("HRComment")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                                <asp:TemplateField HeaderText="Details" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <img alt="" style="cursor: pointer" src="images/plus.png" />
                                                                <asp:Panel ID="Panel1" runat="server" Style="display: none">
                                                                    <asp:GridView ID="gvmp" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid" OnRowDataBound="gvmp_RowDataBound">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Application Date">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label18" runat="server" Text='<%#  Eval("LeaveApplicationDate","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Applied Leave ">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblApplied" runat="server" Text='<%#  Eval("LeaveApplied")  %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblAppliedLeave" runat="server" ></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                             <asp:TemplateField HeaderText="Approved Leave ">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblApproved" runat="server" Text='<%#  Eval("LeaveApproved")  %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblApprovedLeave" runat="server" ></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </asp:Panel>
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
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                        </div>

                  <%--  </ContentTemplate>
                </asp:UpdatePanel>--%>
            </div>

        </div>

    </div>
</asp:Content>
