<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="LeaveApplication.aspx.cs" Inherits="IG_Portal.LeaveApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
       <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "images/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "images/plus.png");
            $(this).closest("tr").next().remove();
        });
       </script>
     <style type="text/css">
        .rb1 input[type="radio"]
{
   margin-left: 10px;
   margin-right: 3px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Apply for Leaves</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Leave Details</a></div>
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


            

             <div  id="newLeave" runat="server" visible="false">

                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="card">
                                  <div class="card-header">
                                    <h4>Add Leave</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Leave Type</label>
                                 <asp:DropDownList ID="ddlLeaveType" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredLeaveType" runat="server" ControlToValidate="ddlLeaveType" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Leave Type" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                   
                                        </div>
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Reason</label>
                                     <asp:TextBox ID="txtReason" runat="server" placeholder="" CssClass="form-control"
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="2">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredReason" runat="server" ControlToValidate="txtReason" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Reason" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                   
                                        </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-20px;">
                               <label class="col-sm-6 col-form-label">From  Date</label>
                                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date" TabIndex="3"  OnTextChanged="txtFromDate_TextChanged"  AutoPostBack="true"   ></asp:TextBox>
                                               <%-- <asp:CompareValidator ID="rgvStartDate" runat="server" ErrorMessage="Only Previous 3 days are allowed" Operator="GreaterThanEqual"
                 ValidationGroup="at" ControlToValidate="txtFromDate"  ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:CompareValidator>--%>
                                                <asp:RequiredFieldValidator ID="requiredSDate" runat="server" ControlToValidate="txtFromDate" ErrorMessage="Please Enter From Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                                <div class=" col-sm-6 form-group" style="margin-top:-20px">
                               <label class="col-sm-6 col-form-label"> To Date</label>
                                 <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="Date" TabIndex="4"></asp:TextBox>
                                              <%--  <asp:CompareValidator ID="rgvEndDate" runat="server" ErrorMessage="End Date should be after Start Date" Operator="GreaterThanEqual"
                 ValidationGroup="at" ControlToValidate="txtToDate" ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:CompareValidator>--%>
                                                <asp:RequiredFieldValidator ID="requiredEDate" runat="server" ControlToValidate="txtToDate" ErrorMessage="Please Enter To Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                                 
                                               </div>

                                        </div>
                                    <div class="form-group row" style="margin-top:-30px">
                         <div class="col-sm-5"></div>
                         <div class="col-sm-2">
                                <asp:Button ID="btnDetails" runat="server" TabIndex="5" ClientIDMode="Static" Text="GO" class="btn btn-outline-info" CausesValidation="true" OnClick="btnDetails_Click" ValidationGroup="at" UseSubmitBehavior="false" style="width:150px"></asp:Button>
                                            </div>
                                        </div>

                                    <div id="divDetails" runat="server" visible="false">
                                    <div class="row" style="margin-left:10px;margin-right:10px">
                                         <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Leave Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <h5>
                                  <asp:Label runat="server" Text="" ID="Label2"></asp:Label></h5>
                                <div style="overflow-x:auto;width:100%">
                              
                                        <asp:GridView ID="GridLeaveDay" runat="server"  AutoGenerateColumns="False"
                                        class="table table-bordered" 
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
                                                                     <asp:RadioButtonList ID="radLeave" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="radLeave_SelectedIndexChanged" CssClass="form-control rb1">
                                                                         
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
                                        <div class="col-sm-5">
                                <asp:Button ID="btnsubmit" runat="server" TabIndex="7" ClientIDMode="Static" Text="Submit" class="btn btn-outline-primary" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" style="width:200px"></asp:Button>
                                    </div>
                                        </div>
                                </div>
                                        </div>
                                    </div>
                                </div>
                 </div>
    </div>
                                </div>
                 </div>
                 <div id="LeaveNumbers" runat="server" >
                     <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                  <div id="AddNew" runat="server">
                           <h4><asp:Button ID="btnAddNew" runat="server" TabIndex="1" ClientIDMode="Static" Text="Add New Leave" class="btn btn-outline-info" CausesValidation="true" OnClick="btnAddNew_Click"  UseSubmitBehavior="false" style="width:200px"></asp:Button></h4>
                                </div>
                                </div>
                                    <div class="card-body">
                                        <div class="row">
                                   <div class="col-lg-4 col-md-6 col-sm-6 col-12" style="margin-top20px">
                                        <div class="card card-statistic-1" style="background-color:#F0FFFF">
                                            <div class="card-icon-square card-icon-bg-green">
                                                <i class="fas fa-hiking"></i>
                                            </div>
                                            <div class="card-wrap">
                                                    <div class="padding-20">
                                                            <div class="text-right">
                                                                    <h6 class="font-light mb-0">
                                                                        <i class="ti-arrow-up text-success"></i>
                                                <asp:Label runat="server" Text="Total PL= " ID="lbltpl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblctpl"></asp:Label>
                                                                        </h6>
                                                                <h6>
                                                                    <asp:Label runat="server" Text="Total SL= " ID="lbltsl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblctsl"></asp:Label>
                                                                </h6>
                                                                </div>
                                                    </div>
                                            </div>
                                        </div>
                                        </div>
                                           <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="card card-statistic-1" style="background-color:#FFEFD5">
                            <div class="card-icon-square card-icon-bg-orange">
                                    <i class="fas fa-hiking"></i>
                            </div>
                            <div class="card-wrap">
                                    <div class="padding-20">
                                            <div class="text-right">
                                                     <h6 class="font-light mb-0">
                                                        <i class="ti-arrow-up text-success"></i>
                                                <asp:Label runat="server" Text="Approved PL= " ID="lblapl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblcapl"></asp:Label>
                                                         </h6>
                                                <h6>
                                                    <asp:Label runat="server" Text="Approved SL= " ID="lblasl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblcasl"></asp:Label>
                                                </h6>
                                        </div>
                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                <div class="card card-statistic-1" style="background-color:#E6E6FA">
                                    <div class="card-icon-square card-icon-bg-purple">
                                            <i class="fas fa-hiking"></i>
                                    </div>
                                    <div class="card-wrap">
                                            <div class="padding-20">
                                                    <div class="text-right">
                                                             <h6 class="font-light mb-0">
                                                                <i class="ti-arrow-up text-success"></i>
                                        <asp:Label runat="server" Text="Remaining PL= " ID="lblrpl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblcrpl"></asp:Label>
                                                                 </h6>
                                                        <h6>
                                                            <asp:Label runat="server" Text="Remaining SL= " ID="lblrsl"></asp:Label>
                                                <asp:Label runat="server" Text="" ID="lblcrsl"></asp:Label>
                                                        </h6>
                                        </div>
                                            </div>
                                         </div>
                                    </div>
                                    </div>
                                        </div>
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Status</label>
                                   <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"
                                >
                                <asp:ListItem Text="UnApproved" Value="1" Selected="True"></asp:ListItem>
                                 <asp:ListItem Text="Approved" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="Both" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                                </div>
                            <div class=" col-sm-6">
                                <asp:Button ID="btSearch" runat="server" Text="Search" CssClass="btn btn-outline-info"  ClientIDMode="Static" OnClick="btSearch_Click" UseSubmitBehavior="false" style="margin-top:45px;width:150px"/>
                            </div>
                            </div>

                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="section-body">

                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="card">
                                                    <div class="card-header">
                                                    <h4>Leave Details
                                                    <i class="fas fa-arrow-down"></i></h4>
                                                    </div>
                                                    <div class="card-body">
                                                    <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                                       <div style="overflow-x:auto;width:100%">
                                                        <asp:GridView ID="GridLeave" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            class="table table-bordered" OnSorting="GridLeave_Sorting" AllowSorting="true"
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

                                                                 <asp:TemplateField HeaderText="Applied Days" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("AppliedDays")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Approved Days" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("ApprovedDays")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveStatus">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("LeaveStatus")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Manager Comment" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveStatus">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("ManagerComment")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="HR Comment" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveStatus">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("HRComment")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                                <asp:TemplateField HeaderText="Details" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <img alt="" style="cursor: pointer" src="images/plus.png" />
                                                                <asp:Panel ID="Panel1" runat="server" Style="display: none">
                                                                    <asp:GridView ID="gvmp" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowDataBound="gvmp_RowDataBound">
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
                        
</asp:Content>
