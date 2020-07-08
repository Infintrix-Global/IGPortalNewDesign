<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="IG_Portal.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="msapplication-tap-highlight" content="no" />
    <title>Forgot Password</title>

    <!-- Favicons-->
    <link rel="icon" href="images/favicon/favicon-32x32.png" sizes="32x32" />
    <!-- Favicons-->
    <link rel="apple-touch-icon-precomposed" href="images/favicon/apple-touch-icon-152x152.png" />
    <!-- For iPhone -->
    <meta name="msapplication-TileColor" content="#00bcd4" />
    <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png" />
    <!-- For Windows Phone -->


    <!-- CORE CSS-->

    <link href="css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <!-- Custome CSS-->
    <link href="css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/layouts/page-center.css" type="text/css" rel="stylesheet" media="screen,projection" />

    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <link href="js/plugins/prism/prism.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection" />

    <!-- jQuery Library -->
    <script type="text/javascript" src="<%= ResolveUrl("~/js/plugins/jquery-1.11.2.min.js") %>"></script>
    <!--materialize js-->
    <script type="text/javascript" src="<%= ResolveUrl("~/js/materialize.min.js") %>"></script>
    <!--prism-->
    <script type="text/javascript" src="<%= ResolveUrl("~/js/plugins/prism/prism.js") %>"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="<%= ResolveUrl("~/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js") %>"></script>

    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="<%= ResolveUrl("~/js/plugins.min.js") %>"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src=" <%= ResolveUrl("~/js/custom-script.js") %> "></script>



</head>
<body style="background-color: #f2f2f2">

    <div class="row">

        <div class="col s12 center input-field">
            <img src="images/IG_logo.jpg" width="180" alt="" />
        </div>
    </div>
    <div id="login-page" class="row">
        <div class="col s12 z-depth-4 card-panel" style="background-color: white">
            <form class="login-form" runat="server">
                <div class="row margin">
                    <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                </div>

                <div class="row margin">
                    <div id="dEmail" runat="server" visible="true">
                        <asp:Label ID="lblVEmail" runat="server" ForeColor="red"></asp:Label>
                        <div class="row">
                            <div class="input-field col s12">

                                <asp:TextBox ID="txtUserName" runat="server" placeholder="Email Address"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requiredUserName" runat="server" ControlToValidate="txtUserName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Email Address" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Enter valid Email" Display="Dynamic" ControlToValidate="txtUserName"
                                    SetFocusOnError="True" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s12">
                                <asp:Button ID="btnOTP" OnClick="btnOTP_Click" class="btn" runat="server" CausesValidation="true" Text="Get OTP" ValidationGroup="e" ForeColor="White" />
                            </div>
                        </div>
                    </div>

                    <div id="dOTP" runat="server" visible="false">
                         <div class="row">
                        <asp:Label ID="lblVOTP" runat="server" ForeColor="red"></asp:Label>
                        <div class="input-field col s12">

                            <asp:TextBox ID="txtOTP" runat="server" placeholder="Enter OTP"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requiredOTP" runat="server" ControlToValidate="txtOTP" ValidationGroup="o"
                                SetFocusOnError="true" ErrorMessage="Please Enter OTP" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                             </div>
                         <div class="row">
                        <div class="input-field col s5">
                            <asp:Button ID="btnOback" OnClick="btnOback_Click" class="btn" runat="server" Text="Back" ForeColor="White" />
                        </div>
                        <div class="input-field col s5">
                            <asp:Button ID="btnVerifyOTP" OnClick="btnVerifyOTP_Click" class="btn" runat="server" CausesValidation="true" Text="Verify OTP" ValidationGroup="o" ForeColor="White" />
                        </div>

                             </div>
                    </div>

                </div>

                <div id="dPassword" runat="server" visible="false">
                    <asp:Label ID="lblCPass" runat="server"></asp:Label>
                    <div class="row margin">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ValidationGroup="p"
                                SetFocusOnError="true" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row margin">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtConfirmpass" TextMode="Password" placeholder="Confirm Password" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmpass" ValidationGroup="p"
                                SetFocusOnError="true" ErrorMessage="Please ReEnter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator" runat="server" ControlToValidate="txtConfirmpass" ControlToCompare="txtPassword" ValidationGroup="p" SetFocusOnError="true" ErrorMessage="Enter Same Passsword" ForeColor="Red"></asp:CompareValidator>
                        </div>

                    </div>


                    <div class="row">
                        <div class="input-field col s12 m12 l12">

                            <asp:Button ID="btnchanngepass" OnClick="btnchanngepass_Click" class="btn" runat="server" Text="Change Password" ForeColor="White" />
                        </div>
                        <div class="input-field col s12 m12 l12">
                            <p class="margin medium-small">
                                <asp:HyperLink runat="server" ID="HyperLink2" NavigateUrl="~/Login.aspx" Text="Go To Login Page" ForeColor="#e79497" Font-Bold="true"></asp:HyperLink>
                            </p>
                        </div>



                    </div>

                </div>
            </form>

        </div>


    </div>

</body>
</html>
