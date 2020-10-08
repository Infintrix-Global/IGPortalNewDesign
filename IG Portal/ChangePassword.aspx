<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="IG_Portal.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-body">
        <div class="portlet-body">
            <div class="page-bar" id="pbAdmin" runat="server" visible="false">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="AdminDashBoard.aspx">Home</a>
                        <i class="fa fa-angle-right"></i>


                        <a href="ChangePassword.aspx">Change Password</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>

            <div class="page-bar" id="pbEmployee" runat="server" visible="false">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="EmployeeDashBoard.aspx">Home</a>
                        <i class="fa fa-angle-right"></i>


                        <a href="ChangePassword.aspx">Change Password</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>
            <div class="form-body">


                <div class="row">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </div>


                <div id="dOldPass" runat="server" visible="true">
                    <div class="row">

                        <asp:Label ID="lblVPass" runat="server" ForeColor="red"></asp:Label>
                        <div class="row">

                            <div class="col m5" align="right">
                                <asp:Label ID="lblOldPass" runat="server" Text="Old Password "></asp:Label>
                            </div>
                            <div class="col m4">
                                <asp:TextBox ID="txtOldPass" runat="server" placeholder="" TextMode="Password" TabIndex="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requiredOldPass" runat="server" ControlToValidate="txtoldpass" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter password" ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="row" align="center">
                            <div class="col m12">
                                <asp:Button ID="btnVerify" OnClick="btnVerify_Click" class="btn" runat="server" TabIndex="2" CausesValidation="true" Text="Verify" ValidationGroup="e" ForeColor="White" />
                            </div>
                        </div>
                    </div>

                </div>

               
                <div id="dPassword" runat="server" visible="false">
                   <asp:Label ID="lblCPass" runat="server" ></asp:Label>
                    <div class="row">
                        <div class="col m5" align="right">
                            <asp:Label ID="lblNewPass" runat="server" Text="New Password "></asp:Label>
                        </div>
                        <div class="col m4">
                            <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="" runat="server" TabIndex="1"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ValidationGroup="p"
                                ErrorMessage="Use At least one lower case letter, At least one upper case letter, At least special character, At least one number, At least 8 characters length"
                                ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$"
                                ControlToValidate="txtPassword" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ValidationGroup="p"
                                SetFocusOnError="true" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col m5" align="right">
                            <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password "></asp:Label>
                        </div>
                        <div class="col m4">
                            <asp:TextBox ID="txtConfirmpass" TextMode="Password" placeholder="" runat="server" TabIndex="2"></asp:TextBox>
                               <asp:CompareValidator ID="CompareValidator" runat="server" ControlToValidate="txtConfirmpass" ControlToCompare="txtPassword" ValidationGroup="p" SetFocusOnError="true" ErrorMessage="Please Enter the same Password" ForeColor="Red"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmpass" ValidationGroup="p"
                                SetFocusOnError="true" ErrorMessage="Please ReEnter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                         
                        </div>

                    </div>


                    <div class="row" align="center">
                        <div class="input-field col s12 m12 l12">

                            <asp:Button ID="btnchanngepass" ValidationGroup="p" OnClick="btnchanngepass_Click" class="btn" runat="server" Text="Change Password" ForeColor="White" TabIndex="3" />
                        </div>




                    </div>

                </div>

               <div id="LoginLink" runat="server" visible="false">
                   <div class="row" align="center"> 
                       <asp:LinkButton ID="lnkLogin" runat="server" Text="Click here to Login" OnClick="lnkLogin_Click"></asp:LinkButton>
                   </div>
               </div>

            </div>
        </div>
    </div>

</asp:Content>
