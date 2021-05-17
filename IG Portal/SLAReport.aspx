<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="SLAReport.aspx.cs" Inherits="IG_Portal.SLAReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Total Working Hours</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Hours Spent By Employee</a></div>
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
             <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Fill up the Details
                                        <i class="fas fa-arrow-down"></i>
                                    </h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Month Name </label>
                                        
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
                              <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Employee Name</label>
                            <asp:DropDownList ID="ddlEmployeeName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static"  >
                            </asp:DropDownList>
                    </div>
                    </div>
                    <div class="form-group row">
                         <div class="col-sm-4"></div>
                         <div class="col-sm-2">
                                <asp:Button ID="btSearch" runat="server" Text="Search" class="btn btn-outline-success" ClientIDMode="Static" OnClick="btSearch_Click" ValidationGroup="vt" CausesValidation="true" style="width:150px"/>
                            </div>
                        <div class="col-sm-2">   
                             <asp:Button ID="btclear" runat="server" Text="Clear" ClientIDMode="Static" OnClick="btclear_Click" class="btn btn-outline-info" style="width:150px"/>
                        </div>
                        </div>
                    </div>
                        </div>
                                    </div>
                                    </div>
                <!-- BEGIN SAMPLE FORM PORTLET-->
                <div class="section-body">

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Employee Report Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                     <div style="overflow-x:auto;width:100%">
                                    <h5>
                                     <asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                   <div class="col m12" align="right">
                                        <button class="btn btn-outline-primary" runat="server" onserverclick="btnExport_Click"  id="btExport"><i class="fa fa-download"></i>&nbsp;Export</button>
                                        <%--<asp:Button ID="btnExport" Text="Export To Excel" runat="server" OnClick="btnExport_Click" /></div>--%>
                                    </div>
                                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                                  <asp:GridView ID="GridTask" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        class="table table-bordered" OnSorting="GridTask_Sorting" AllowSorting="true" 
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
           

</asp:Content>
