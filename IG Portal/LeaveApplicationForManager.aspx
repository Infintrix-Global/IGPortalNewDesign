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

                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

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

                                    <div class="row">
                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Leave Type </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlLeaveType" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1" AutoPostBack="true">
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

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        From  Date
                                                    </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date" TabIndex="3" OnTextChanged="txtFromDate_TextChanged" AutoPostBack="true"></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtFromDate" ErrorMessage="Please Enter From Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        To Date
                                                    </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="Date" TabIndex="3"></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtToDate" ErrorMessage="Please Enter To Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>



                                    </div>

                                    <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="8" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" OnClientClick="this.disabled='true';"></asp:Button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="clearfix"></div>

                        <div class="portlet light ">

                            <div class="row">
                                <div class="col m12">
                                    <div id="empLeave" runat="server" visible="false">
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
                                        

                                        <br />
                                        <div class="clearfix"></div>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="portlet-body">
                                                    <div class="table-scrollable">
                                                        <asp:GridView ID="GridLeave" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            class="striped" OnSorting="GridLeave_Sorting" AllowSorting="true"
                                                            GridLines="None"
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

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>

    </div>
</asp:Content>
