<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="SLAReport.aspx.cs" Inherits="IG_Portal.SLAReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Hours Spent By Employee/Total Working Hours" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
                <!-- END PAGE HEADER-->



                <div class="row">

                    <div class=" col m3">
                        <div class="form-group">
                            <label>Month Name</label>
                            <asp:DropDownList ID="ddlMonthName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" OnSelectedIndexChanged="ddlMonthName_SelectedIndexChanged" AutoPostBack="true">
                               
                                <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                <asp:ListItem Text="April" Value="4"></asp:ListItem>
                                <asp:ListItem Text="May" Value="5"></asp:ListItem>
                                <asp:ListItem Text="June" Value="6"></asp:ListItem>
                                <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                <asp:ListItem Text="December" Value="12"></asp:ListItem>
                               

                            </asp:DropDownList>


                        </div>
                    </div>

                      <div class=" col m3">
                        <div class="form-group">
                            <label>Employee Name</label>
                            <asp:DropDownList ID="ddlEmployeeName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static"  >
                            </asp:DropDownList>

                        </div>
                    </div>
                    
                    <div class="col m3">
                        <div class="form-group form-md-line-input ">

                            <asp:Button ID="btclear" runat="server" Text="Clear" ClientIDMode="Static" OnClick="btclear_Click" class="btn" />
                        </div>
                    </div>

                    <div class="col m3">
                        <div class="form-group form-md-line-input ">
                            <asp:Button ID="btSearch" runat="server" Text="Search" class="btn" ClientIDMode="Static" OnClick="btSearch_Click" ValidationGroup="vt" CausesValidation="true" />
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
         
                
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
                                 
                                    <div class="col m2">
                                        <button class="btn" runat="server" onserverclick="btnExport_Click"  id="btExport"><i class="fa fa-download"></i>Export</button>
                                        <%--<asp:Button ID="btnExport" Text="Export To Excel" runat="server" OnClick="btnExport_Click" /></div>--%>
                                    </div>
                                    <br />
                                    <div class="clearfix"></div>
                                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="portlet-body">
                                                <div class="table-scrollable">
                                                    <asp:GridView ID="GridTask" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        class="striped" OnSorting="GridTask_Sorting" AllowSorting="true" 
                                                        GridLines="None"
                                                        ShowHeaderWhenEmpty="True" Width="100%" OnPageIndexChanging="GridTask_PageIndexChanging" PageSize="20">
                                                        <Columns>
                                                           
                                                            <asp:TemplateField HeaderText="Sr. No."  HeaderStyle-CssClass="autostyle2" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                    <asp:Label ID="lblLoginID" runat="server" Text='<%# Eval("LoginID")  %>' Visible="false"></asp:Label>
                                                                     
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                                 <asp:TemplateField HeaderText="Month Name" HeaderStyle-CssClass="autostyle2" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("MonthName")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Employee Name" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                       

                                                            <asp:TemplateField HeaderText="Total Working  Hours" HeaderStyle-CssClass="autostyle2" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("TotalWorkingHours")   %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Total  Hours Spent" HeaderStyle-CssClass="autostyle2" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("TotalHoursSpent")   %>'></asp:Label>
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
                                            </div>
                                     
                                </div>
                           
                        </div>

                    </div>


                </div>
            </div>
            </div>
        </div>

</asp:Content>
