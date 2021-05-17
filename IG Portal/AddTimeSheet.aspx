<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddTimeSheet.aspx.cs" Inherits="IG_Portal.AddTasks" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
           
            <!-- BEGIN FORM-->

            <script>

                $(function () {

                    $("#ddlProjectName").customselect();
                    search: true;
                    hoveropen: false;


                    $("#ddlTaskType").customselect();
                    search: true;
                    hoveropen: false;
                });
            </script>
            <script type="text/javascript">
                function DateTimeValidation(sender, args) {
                    var start = document.getElementById("<%=txtStartTime.ClientID %>").value;
        var end = document.getElementById("<%=txtEndTime.ClientID %>").value;
                    var date1 = new Date();
                    var startTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + start);

                    var endTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + end);


                    if (startTime >= endTime) {
                        args.IsValid = false;
                    }

                }

                function DateTime12Validation(sender, args) {
                    var start = document.getElementById("<%=txtStartTime.ClientID %>").value;
                     var end = document.getElementById("<%=txtEndTime.ClientID %>").value;
                     var date1 = new Date();
                     var startTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + start);

                     var endTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + end);


                    var diff = (endTime.getTime() - startTime.getTime()) / 1000;
                    diff /= (60 * 60);
                    
                    if(diff>12) {
                         args.IsValid = false;
                     }

                 }
            </script>

            
  <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Timesheet</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="Admindashboard.html"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="AddTimeSheet.aspx">Timesheet Details</a></div>
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
               <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate> 
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                     <div class="section-body">
                          <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Add Timesheet Details
                                                <i class="fas fa-arrow-down"></i></h4>
                                        </div>
                                            <div class="card-body">
                                            <div class="form-group row">
                                            <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Project Name</label>
                                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder="" AutoPostBack="true"
                                                    TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                                <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Task Category</label>
                                                <asp:DropDownList ID="ddlTaskCategory" runat="server" placeholder=""  AutoPostBack="true"
                                                     TabIndex="2" OnSelectedIndexChanged="ddlTaskCategory_SelectedIndexChanged" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlTaskCategory" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Task Category" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                    </div>
                                             <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                <label class="col-sm-6 col-form-label">Task Type</label>
                                               <asp:DropDownList ID="ddlTaskType" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="3" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskType" runat="server" ControlToValidate="ddlTaskType" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Type" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                <label class="col-sm-6 col-form-label">Task Title</label>
                                                <asp:DropDownList ID="ddlTaskTitle" runat="server" placeholder=""
                                                    TabIndex="4" OnSelectedIndexChanged="ddlTaskTitle_SelectedIndexChanged" AutoPostBack="true" class="form-control">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlAssignTask" runat="server" placeholder="" Visible="false"
                                                    ClientIDMode="Static" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskTitle" runat="server" ControlToValidate="ddlTaskTitle" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                <asp:TextBox ID="txtTaskTitle" class="form-control" placeholder="Enter Task Title" TabIndex="4" Visible="false" runat="server"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredtxttitle" runat="server" ControlToValidate="txtTaskTitle" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title " ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                                </div>
                                       </ContentTemplate>
                    </asp:UpdatePanel>
                                             <div class=" col-sm-6 form-group" style="margin-top:-70px">
                                                  <label class="col-sm-6 col-form-label">Task Details</label>
                                                <asp:TextBox ID="txtTaskDescription" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" class="form-control">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskDescription" runat="server" ControlToValidate="txtTaskDescription" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Description" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                   </div>
                                                 <div class=" col-sm-6 form-group" style="margin-top:-150px;margin-left:500px">
                                                  <label class="col-sm-6 col-form-label">Date</label>
                                             <asp:TextBox ID="txtDate"  ClientIDMode="Static" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                                                <%-- <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendar.png" UseSubmitBehavior="false" OnClick="imgPopup_Click" runat="server" TabIndex="5" />
                                        <asp:Calendar ID="Calendar1" Visible="false" OnSelectionChanged="Calendar1_SelectionChanged" runat="server" OnDayRender="Calendar1_DayRender" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                            ForeColor="#663399" ShowGridLines="True">
                                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                            <SelectorStyle BackColor="#FFCC66" />

                                            <OtherMonthDayStyle ForeColor="#CC9966" />
                                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                        </asp:Calendar>
                                        <asp:Label ID="selectdate" runat="server" Text="Select a Date" Visible="false" ForeColor="Red"></asp:Label>--%>
                                                      <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>

                                                <asp:RangeValidator ID="rgvStartDate" runat="server" ErrorMessage="Only Previous 3 days are allowed"
                 ValidationGroup="at" ControlToValidate="txtDate" ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:RangeValidator>
                                                          </span>
                                                   
                                            </div>
                                            <div class=" col-sm-6 form-group">
                                                  <label class="col-sm-6 col-form-label">Start Time</label>
                                               <asp:TextBox ID="txtStartTime" ClientIDMode="Static" runat="server" class="form-control" TabIndex="7" TextMode="Time" Format="hh:mm tt" ></asp:TextBox>
                                                    <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredStartTime" runat="server" ControlToValidate="txtStartTime" ErrorMessage="Please Enter Start Time " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
</span>
                                                   </div>
                                                    <div class=" col-sm-6 form-group" style="margin-left:500px;margin-top:-125px">
                                                  <label class="col-sm-6 col-form-label">End Time</label>
                                             
                                                <asp:TextBox ID="txtEndTime" runat="server" ClientIDMode="Static" class="form-control" TabIndex="8" TextMode="Time" Format="hh:mm tt" ></asp:TextBox>
                                                   <span class="help-block">
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="End Time should be greater than Start Time"
                                                    ForeColor="Red" ControlToValidate="txtEndTime" Display="Dynamic" ClientValidationFunction="DateTimeValidation" ValidationGroup="at"></asp:CustomValidator>
                                                 <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Difference between End Time and Start Time shoud be less than 12 hours"
                                                    ForeColor="Red" ControlToValidate="txtEndTime" Display="Dynamic" ClientValidationFunction="DateTime12Validation" ValidationGroup="at"></asp:CustomValidator>
                                                <asp:RequiredFieldValidator ID="requiredEndTime" runat="server" ControlToValidate="txtEndTime" ErrorMessage="Please Enter End Time " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                       </span>
                                                   </div>
                                               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class=" col-sm-6 form-group" style="margin-top:-40px;">
                          <label class="col-sm-6 col-form-label">Status</label>
                                     <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="9" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredStatus" runat="server" ControlToValidate="ddlStatus" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Status" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </span>
                                                   </div>
                                         <div class=" col-sm-6 form-group" style="margin-top:-120px;margin-left:500px">
                                        <label class="col-sm-6 col-form-label">Comments</label>
                                         <asp:TextBox ID="txtComment" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="10" class="form-control">
                                                </asp:TextBox>
                                        </div>
                                 <div class="form-group row">
                            <div class="col-sm-5"></div>
                            <div class=" col-sm-3">
                                    <asp:Button ID="btnsubmit" runat="server" TabIndex="11" ClientIDMode="Static" Text="Submit" class="btn btn-outline-primary" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" style="width:150px"></asp:Button>
                                    </div>
                         </ContentTemplate>
                    </asp:UpdatePanel>
                                         </div>
                                
</asp:Content>
