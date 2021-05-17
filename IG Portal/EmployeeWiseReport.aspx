<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeWiseReport.aspx.cs" Inherits="IG_Portal.EmployeeWiseReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Employee Wise Report</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Employee Report Details</a></div>
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
    
          
                  <asp:UpdatePanel ID="upTask" runat="server">
                    <ContentTemplate>

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
                               <label class="col-sm-6 col-form-label">Employee Name </label>
                                     <asp:DropDownList ID="ddlEmployeeName" runat="server" class="form-control" placeholder=""
                                OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                          </div>
                                    </div>
                                <div class="form-group row" style="margin-top:-30px">
                               <div class=" col-sm-4 form-group">
                               <label class="col-sm-5 col-form-label">Project Name </label>
                                    <asp:DropDownList ID="ddlProjectName" runat="server" class="form-control" placeholder="" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    </div>
                              <div class=" col-sm-4 form-group">
                               <label class="col-sm-4 col-form-label">Task Type </label>
                              <asp:DropDownList ID="ddlTaskType" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static">
                                    </asp:DropDownList>
                            </div>
                                <div class=" col-sm-4 form-group">
                               <label class="col-sm-4 col-form-label">Task Title </label>
                                <asp:DropDownList ID="ddlTaskTitle" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static">
                                    </asp:DropDownList>
                                                    </div>
                                   
                            </div>
                                 <div class="form-group row" style="margin-top:-30px">
                               <div class=" col-sm-4 form-group">
                               <label class="col-sm-5 col-form-label">Status</label>
                               <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static">
                                    </asp:DropDownList>
                                                    </div>
                              <div class=" col-sm-4 form-group">
                               <label class="col-sm-5 col-form-label">From Date</label>
                              <asp:TextBox ID="txtFromDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" OnTextChanged="txtFromDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                    <span class="help-block">
                                    <asp:RequiredFieldValidator ID="requiredFromDate" runat="server" ControlToValidate="txtFromDate" ValidationGroup="vt"
                                        SetFocusOnError="true" ErrorMessage="Enter From Date" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                                                        </span>
                                </div> <div class=" col-sm-4 form-group">
                               <label class="col-sm-5 col-form-label">To Date</label>
                             <asp:TextBox ID="txtToDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" OnTextChanged="txtToDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                    <span class="help-block">
                                    <asp:RequiredFieldValidator ID="requiredToDate" runat="server" ControlToValidate="txtToDate" ValidationGroup="vt"
                                        SetFocusOnError="true" ErrorMessage="Enter To Date" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                                                        </span>
                            
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
                                    <h5> <asp:Label runat="server" Text="" ID="count"></asp:Label>&nbsp;&nbsp;
                                         <asp:Label runat="server" Text="" ID="tottime"></asp:Label></h5>
                                    <div class="col m12" align="right">
                                      <button class="btn btn-outline-primary" style="" runat="server" onserverclick="btnExport_Click" visible="false" id="btExport"><i class="fa fa-download"></i>&nbsp;Export</button>
                                        <%--<asp:Button ID="btnExport" Text="Export To Excel" runat="server" OnClick="btnExport_Click" /></div>--%>
                                   </div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                               <asp:GridView ID="GridTask" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        class="table table-bordered" OnSorting="GridTask_Sorting" AllowSorting="true" 
                                                        GridLines="None"
                                                        ShowHeaderWhenEmpty="True" Width="100%" OnPageIndexChanging="GridTask_PageIndexChanging" PageSize="20">
                                                        <Columns>
                                                           
                                                            <asp:TemplateField HeaderText="Sr. No."  HeaderStyle-CssClass="autostyle2" ItemStyle-Width="2%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                    <asp:Label ID="lblLoginID" runat="server" Text='<%# Eval("LoginID")  %>' Visible="false"></asp:Label>
                                                                      <asp:Label ID="lblTID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Employee Name" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Task Type" HeaderStyle-CssClass="autostyle2" SortExpression="TaskName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("TaskName")   %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Task Title" HeaderStyle-CssClass="autostyle2" SortExpression="TaskTitle">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("TaskTitle")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Task Details" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTaskDetail" runat="server" Text='<%# Eval("TaskDetails")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                                 <EditItemTemplate>
                                                    <asp:TextBox ID="txtTaskDetail" runat="server"  Text='<%# Eval("TaskDetails")  %>' ></asp:TextBox>
                                                </EditItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Work Date" ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2" SortExpression="WorkDate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWorkDate" runat="server" Text='<%# Eval("WorkDate","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Start Time" HeaderStyle-CssClass="autostyle2" SortExpression="StartTime">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("StartTime")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="End Time" HeaderStyle-CssClass="autostyle2" SortExpression="EndTime">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("EndTime")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Time Spent" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("TimePeriod")  %>' ></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" SortExpression="StatusName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("StatusName")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Comment" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("Comment")  %>'></asp:Label>
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

                      </ContentTemplate>
                </asp:UpdatePanel>
                </div>
            </div>
            </div>
       
</asp:Content>
