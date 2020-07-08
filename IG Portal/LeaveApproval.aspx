<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="LeaveApproval.aspx.cs" Inherits="IG_Portal.LeaveApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">

           <%-- <div class="page-bar">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="AdminDashBoard.aspx">Home</a>
                        <i class="fa fa-angle-right"></i>


                        <a href="LeaveApplication.aspx">Leave Approval Applications</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>--%>
            <!-- BEGIN FORM-->


            <div class="form-body">

                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Leave Approval Application" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                        <asp:Label ID="lblmsg" runat="server"></asp:Label>

                        <div class="portlet light ">

                            <div class="row">
                                <div class="col m12">
                                    <div class="portlet light ">
                                        <div class="row">
                                            <div class="col m12">
                                                  <asp:Label runat="server" Text="" ID="count"></asp:Label>
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
                                                            GridLines="None" OnRowCommand="GridLeave_RowCommand"
                                                            ShowHeaderWhenEmpty="True" Width="100%" OnPageIndexChanging="GridLeave_PageIndexChanging" PageSize="10">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Application Date" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveApplicationDate">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("LeaveApplicationDate")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Employee Name" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Leave type" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveName">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("LeaveName")  %>'></asp:Label>
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

                                                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnApprove" runat="server" CssClass="btn" Text="Approve" CommandName="Approve" CommandArgument='<%# Eval("ID")  %>'></asp:Button>
                                                                        <asp:Button ID="btnReject" runat="server" CssClass="btn" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("ID")  %>'></asp:Button>
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

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>

    </div>
</asp:Content>
