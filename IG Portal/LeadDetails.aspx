<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="LeadDetails.aspx.cs" Inherits="IG_Portal.LeadDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>

         .block1 {
            height:200px;
            width:300px;
            border:1px solid aliceblue;
            overflow-y:scroll;
        }
    </style>
     <style type="text/css">
        .rb1 input[type="radio"]
{
   margin-left: 10px;
   margin-right: 3px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Lead</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Lead Details</a></div>
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
                     <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Add Lead Details</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Enquiry Date<span class="required">*</span></label>
                            <asp:TextBox ID="txtEnquiryDate" runat="server" class="form-control" TabIndex="1" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  runat="server" ControlToValidate="txtEnquiryDate" ErrorMessage="Please Enter Date" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                
                            </div>
                                 <div class=" col-sm-6 form-group">
                              <label class="col-sm-6 col-form-label">Mobile Number<span class="required">*</span></label>
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control"  TabIndex="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Please enter valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="e"></asp:RegularExpressionValidator>
                            </div>
                    </div>

                 <asp:UpdatePanel ID="upLead" runat="server">
                    <ContentTemplate>
                             <div class="form-group row" style="margin-top:-40px">
                               <div class=" col-sm-4 form-group">
                                   <label class="col-sm-5 col-form-label">First Name<span class="required">*</span></label>
                                <asp:TextBox ID="txtName" class="form-control"  TabIndex="3" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Only text is allowed" Display="Dynamic" ControlToValidate="txtName"
                                    SetFocusOnError="True" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$">
                                </asp:RegularExpressionValidator>
                            </div>
                        <div class=" col-sm-4 form-group">
                                   <label class="col-sm-5 col-form-label">Last Name<span class="required">*</span></label>
                               <asp:TextBox ID="txtLastName" class="form-control"  TabIndex="4" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Only text is allowed" Display="Dynamic" ControlToValidate="txtLastName"
                                    SetFocusOnError="True" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$">
                                </asp:RegularExpressionValidator>
                            </div>
                                 <div class=" col-sm-4 form-group">
                                   <label class="col-sm-5 col-form-label">Email<span class="required">*</span></label>
                                <asp:TextBox ID="txtEmail" class="form-control"  TabIndex="5" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Enter valid Email" Display="Dynamic" ControlToValidate="txtEmail"
                                    SetFocusOnError="True" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
                                </asp:RegularExpressionValidator>
                            </div>

                           <%--  <div class="col m2">
                                                <label><span class="auto-style1">Gender</span><span class="required">*</span> </label>
                                                    <asp:RadioButtonList ID="RadGender" runat="server" TabIndex="1" RepeatDirection="Horizontal" ValidationGroup="bd" class="form-control">
                                                        <asp:ListItem Value="Male" Selected="True">Male</asp:ListItem>
                                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </span>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredGender" ErrorMessage="Please select a Gender.<br />"
                                                        ControlToValidate="RadGender" runat="server" ForeColor="Red" Display="Dynamic" ValidationGroup="bd" SetFocusOnError="true" />
                                                </span>
                                            </div>--%>

                            <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                   <label class="col-sm-6 col-form-label">Country<span class="required">*</span></label>
                                  <asp:DropDownList ID="ddlCountry" class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="6"
                                                    OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                </asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCountry" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Country" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                  <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                   <label class="col-sm-6 col-form-label">State<span class="required">*</span></label>
                                 <asp:DropDownList ID="ddlState" class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="7"
                                                    OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlState" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select State" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                   <label class="col-sm-6 col-form-label">City<span class="required">*</span></label>
                                                <asp:DropDownList ID="ddlCity" class="custom-select"  TabIndex="8" runat="server">
                                                </asp:DropDownList>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCity" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select City" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                   <label class="col-sm-6 col-form-label">Location<span class="required">*</span></label>
                                <asp:TextBox ID="txtLocation" class="form-control"  TabIndex="9" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLocation" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Location" ForeColor="Red"></asp:RequiredFieldValidator>
                              
                            </div>
                              <div class=" col-sm-4 form-group" style="margin-top:-30px">
                                   <label class="col-sm-4 col-form-label">Company Type<span class="required">*</span></label>
                                <asp:TextBox ID="txtCompanyType" class="form-control"  TabIndex="10" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCompanyType" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Company Type" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                                    <div class=" col-sm-4 form-group" style="margin-top:-30px">
                                   <label class="col-sm-4 col-form-label">Company Name<span class="required">*</span></label>
                                <asp:TextBox ID="txtCompanyName" class="form-control"  TabIndex="11" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCompanyName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Company Name" ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>
                                    <div class=" col-sm-4 form-group" style="margin-top:-30px">
                                   <label class="col-sm-4 col-form-label">Website Url<span class="required">*</span></label>
                                <asp:TextBox ID="txtWebsite" class="form-control"  TabIndex="12" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtWebsite" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Website Url" ForeColor="Red"></asp:RequiredFieldValidator>
                              
                            </div>
                                <div class=" col-sm-4 form-group" style="margin-top:-30px">
                                   <label class="col-sm-4 col-form-label"> Enquiry Source<span class="required">*</span></label>
                                              <asp:DropDownList ID="ddlEnquirySource" class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="13"
                                                    >
                                                </asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlEnquirySource" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Source" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                <div class=" col-sm-4 form-group" style="margin-top:-30px">
                                   <label class="col-sm-4 col-form-label">Enquiry For<span class="required">*</span></label>
                                                <div class="block1">
                                                <asp:CheckBoxList ID="chkEnquiryFor"  class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="14">
                                                </asp:CheckBoxList>
                                                  </div>
                                            </div>
                                  <div class=" col-sm-4 form-group" style="margin-top:-30px">
                                   <label class="col-sm-4 col-form-label">Interest Rating<span class="required">*</span></label>
                                               <asp:RadioButtonList ID="radInterest" runat="server" RepeatDirection="Horizontal" TabIndex="15" CssClass="form-control rb1">
                                                   <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                   <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                   <asp:ListItem Text="3" Value="3" Selected="True"></asp:ListItem>
                                                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                   <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                               </asp:RadioButtonList>
                                                
                                            </div>
                           <div class=" col-sm-6 form-group" style="margin-top:-10px">
                                   <label class="col-sm-6 col-form-label">Status<span class="required">*</span></label>
                                               <asp:DropDownList ID="ddlStatus" class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="16"
                                                    >
                                                </asp:DropDownList>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlStatus" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Status" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                         <div class=" col-sm-6 form-group" style="margin-top:-10px">
                                   <label class="col-sm-6 col-form-label">Preffered Technology<span class="required">*</span></label>
                                                    <asp:RadioButtonList ID="radTechnology" runat="server"  TabIndex="17" RepeatDirection="Horizontal" OnSelectedIndexChanged="radTechnology_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control rb1">
                                                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                        <asp:ListItem Selected="True" Value="No">No</asp:ListItem>
                                                    </asp:RadioButtonList></span>
                                            </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-20px">
                                   <asp:Label ID="lblTechnologyType" runat="server" Visible="False" class="col-sm-6 col-form-label">Technology Type</asp:Label></span>
                                                <asp:DropDownList ID="ddlTechnology" Visible="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTechnology_SelectedIndexChanged" TabIndex="18" CssClass="form-control"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="reqdddlTechnology" runat="server" ControlToValidate="ddlTechnology" ValidationGroup="e" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Technology" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtTechnology" class="form-control"  TabIndex="19" Visible="false" runat="server" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqtxtTechnology" runat="server" ControlToValidate="txtTechnology" ValidationGroup="e"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Technology " ForeColor="Red"></asp:RequiredFieldValidator>
                                              
                                            </div>
                                  <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                   <label class="col-sm-6 col-form-label">Remarks<span class="required">*</span></label>
                                      <asp:TextBox ID="txtRemark" class="form-control"  TabIndex="20" runat="server"></asp:TextBox>
                               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtRemark" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Website Url" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                              
                            </div>

                        </div>

                        <div class="form-group row">
                                                 <div class="col-sm-4"></div>
                                                 <div class="col-sm-2">
                            <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="21" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false"  ValidationGroup="e" style="width:150px"/>
                                </div>
                           <div class="col-sm-2">
                            <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="22" class="btn btn-outline-info" ClientIDMode="Static" OnClick="btclear_Click" style="width:150px"/>
                            </div>
                            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
