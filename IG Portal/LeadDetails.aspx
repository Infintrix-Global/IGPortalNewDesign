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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
        
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Lead Details" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

               

                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                         
                        <div class="row">
                               <div class="col m3">

                                <label><span class="auto-style1">Enquiry Date</span> <span class="required">*</span></label>
                                <asp:TextBox ID="txtEnquiryDate" runat="server" class="form-control" TabIndex="1" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  runat="server" ControlToValidate="txtEnquiryDate" ErrorMessage="Please Enter Date" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                
                            </div>

                               <div class="col m3">

                                <label><span class="auto-style1">Mobile Number</span> <span class="required">*</span></label>
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control"  TabIndex="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Please enter valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="e"></asp:RegularExpressionValidator>
                            </div>

                        </div>

                 <asp:UpdatePanel ID="upLead" runat="server">
                    <ContentTemplate>

                        <div class="row">
                         
                            <div class="col m3">

                                <label><span class="auto-style1">First Name</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtName" class="form-control"  TabIndex="3" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Only text is allowed" Display="Dynamic" ControlToValidate="txtName"
                                    SetFocusOnError="True" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$">
                                </asp:RegularExpressionValidator>
                            </div>

                             <div class="col m3">

                                <label><span class="auto-style1">Last Name</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtLastName" class="form-control"  TabIndex="4" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Only text is allowed" Display="Dynamic" ControlToValidate="txtLastName"
                                    SetFocusOnError="True" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="col m3">

                                <label><span class="auto-style1">Email</span><span class="required">*</span> </label>

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

                            </div>

                        <div class="row">
                                
                              <div class="col m3">
                                                 <label><span class="auto-style1">
                                                   Country</span><span class="required">*</span></label>
                                                <asp:DropDownList ID="ddlCountry" class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="6"
                                                    OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                </asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCountry" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Country" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="col m3">
                                                 <label><span class="auto-style1">
                                                   State</span><span class="required">*</span></label>
                                                <asp:DropDownList ID="ddlState" class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="7"
                                                    OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlState" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select State" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="col m3">
                                               <label><span class="auto-style1">
                                                   City</span><span class="required">*</span></label>
                                                <asp:DropDownList ID="ddlCity" class="custom-select"  TabIndex="8" runat="server">
                                                </asp:DropDownList>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCity" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select City" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                           
                            <div class="col m3">

                                <label><span class="auto-style1">Location</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtLocation" class="form-control"  TabIndex="9" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLocation" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Location" ForeColor="Red"></asp:RequiredFieldValidator>
                              
                            </div>

                        </div>

                          <div class="row">
                         
                            <div class="col m3">

                                <label><span class="auto-style1">Company Type</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtCompanyType" class="form-control"  TabIndex="10" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCompanyType" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Company Type" ForeColor="Red"></asp:RequiredFieldValidator>
                              
                           
                            </div>

                             <div class="col m3">

                                <label><span class="auto-style1">Company Name</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtCompanyName" class="form-control"  TabIndex="11" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCompanyName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Company Name" ForeColor="Red"></asp:RequiredFieldValidator>
                               
                            </div>

                            <div class="col m3">

                                <label><span class="auto-style1">Website Url</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtWebsite" class="form-control"  TabIndex="12" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtWebsite" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Website Url" ForeColor="Red"></asp:RequiredFieldValidator>
                              
                            </div>

                             

                            </div>

                             <div class="row">
                                
                              <div class="col m3">
                                                 <label><span class="auto-style1">
                                                   Enquiry Source</span><span class="required">*</span></label>
                                                <asp:DropDownList ID="ddlEnquirySource" class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="13"
                                                    >
                                                </asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlEnquirySource" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Source" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="col m3">
                                                 <label><span class="auto-style1">
                                                   Enquiry For</span><span class="required">*</span></label>
                                                 <div class="block1">
                                                <asp:CheckBoxList ID="chkEnquiryFor"  class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="14">
                                                </asp:CheckBoxList>
                                                  </div>
                                            </div>

                                            <div class="col m3">
                                               <label><span class="auto-style1">
                                                   Interest Rating</span><span class="required">*</span></label>
                                               <asp:RadioButtonList ID="radInterest" runat="server" RepeatDirection="Horizontal" TabIndex="15">
                                                   <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                   <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                   <asp:ListItem Text="3" Value="3" Selected="True"></asp:ListItem>
                                                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                   <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                               </asp:RadioButtonList>
                                                
                                            </div>
                           
                                  <div class="col m3">
                                                 <label><span class="auto-style1">
                                                   Status</span><span class="required">*</span></label>
                                                <asp:DropDownList ID="ddlStatus" class="custom-select" ValidationGroup="e" runat="server" AutoPostBack="True" TabIndex="16"
                                                    >
                                                </asp:DropDownList>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlStatus" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Status" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                        

                        </div>

                        <div class="row">
                            <div class="col m2 ">
                                               <label><span class="auto-style1">
                                                   Preffered Technology</span><span class="required">*</span></label>

                                                    <asp:RadioButtonList ID="radTechnology" runat="server"  TabIndex="17" RepeatDirection="Horizontal" OnSelectedIndexChanged="radTechnology_SelectedIndexChanged" AutoPostBack="True">
                                                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                        <asp:ListItem Selected="True" Value="No">No</asp:ListItem>
                                                    </asp:RadioButtonList></span>
                                            </div>
                                          
                                            <div class="col m3">
                                                <span class="auto-style1">
                                                    <asp:Label ID="lblTechnologyType" runat="server" Visible="False">Technology Type</asp:Label></span>
                                                <asp:DropDownList ID="ddlTechnology" Visible="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTechnology_SelectedIndexChanged" TabIndex="18"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="reqdddlTechnology" runat="server" ControlToValidate="ddlTechnology" ValidationGroup="e" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Technology" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtTechnology" class="form-control"  TabIndex="19" Visible="false" runat="server" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqtxtTechnology" runat="server" ControlToValidate="txtTechnology" ValidationGroup="e"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Technology " ForeColor="Red"></asp:RequiredFieldValidator>
                                              
                                            </div>

                                  <div class="col m3">

                                <label><span class="auto-style1">Remarks</span></label>

                                <asp:TextBox ID="txtRemark" class="form-control"  TabIndex="20" runat="server"></asp:TextBox>
                               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtRemark" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Website Url" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                              
                            </div>

                        </div>


                        <div class="row" align="center">
                            <div class="col m6">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="21" class="btn" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false"  ValidationGroup="e" />

                                </div>
                            </div>
                            <div class="col m6">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="22" class="btn blue" ClientIDMode="Static" OnClick="btclear_Click" />

                                </div>
                            </div>

                        </div>

                        <br />
                        <br />
               
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
