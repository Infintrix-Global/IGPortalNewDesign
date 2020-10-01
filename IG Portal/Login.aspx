<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IG_Portal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="msapplication-tap-highlight" content="no"/>
  <meta name="description" content=""/>
  <meta name="keywords" content=""/>
  <title>Login Page  </title>

  <!-- Favicons-->
  <link rel="icon" href="~/images/favicon/favicon-32x32.png" sizes="32x32"/>
  <!-- Favicons-->
  <link rel="apple-touch-icon-precomposed" href="~/images/favicon/apple-touch-icon-152x152.png"/>
  <!-- For iPhone -->
  <meta name="msapplication-TileColor" content="#00bcd4"/>
  <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png"/>
  <!-- For Windows Phone -->


  <!-- CORE CSS-->
  
  <link href="~/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="~/css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <!-- Custome CSS-->    
    <link href="~/css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="~/css/layouts/page-center.css" type="text/css" rel="stylesheet" media="screen,projection"/>

  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="~/js/plugins/prism/prism.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="~/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection"/>

     
</head>
<body class="cyan" id="loginBody">
  
   
   
            <img src="images/IG_loginlogo.jpg" alt="" >
          
          
        
  
   <%-- <header class="navbar-fixed">
<nav class="navbar navbar-toggleable-md sign-in-header">
  <div class="sidebar-left">  <a class="navbar-brand imglogo"  ></a> </div>
  <div class="col"></div>
  <div class="sidebar-right pull-right" >
    <a href="#" class="navbar-brand"></a>
  </div>
</nav>
</header>--%>
   
  <div class="wrapper-content-sign-in background">
     <div class="container text-center">
         
  <%--  <div class="form-signin-heading text-white">
    <img src="~/images/login-logo.png" width="200" height="67" alt=""/></div>--%>
   <div id="login-page" class="row"   >
   <%-- <div class="col s4 z-depth-4 card-panel">--%>
       <div class="col s12 z-depth-4 card-panel">
      <form class="login-form" runat="server">
        <div class="row">
          <div class="input-field col s12 center">
              <h2 class="tex-black mb-4">Sign in</h2>
           <%-- <img src="images/login-logo.png" alt="" class="circle responsive-img valign profile-image-login">
            <p class="center login-form-text">Material Design Admin Template</p>--%>
          </div>
        </div>
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" 
	ForeColor="Red" Text=""></asp:Label>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            
                        <asp:TextBox ID="txtUserName" runat="server"  placeholder="Username"  class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                                                            SetFocusOnError="true" ErrorMessage="Please Enter User Name" ForeColor="Red"></asp:RequiredFieldValidator>
            <%--<label for="username" class="center-align">Username</label>--%>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
           
              <asp:TextBox ID="txtPassword" TextMode ="Password" placeholder="Password" runat="server"  class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                                            SetFocusOnError="true" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
           <%-- <label for="password">Password</label>--%>
          </div>
        </div>
          <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
           <asp:TextBox ID="txtimgcode" runat="server" autocomplete="off"></asp:TextBox>
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/CImage.aspx"/>
   
              </div>
              </div>
           <br />
        <div class="row">          
          <div class="input-field col s12 m12 l12  login-text">
              <input type="checkbox" id="CheckBoxRemember" runat="server"/>
              <label for="CheckBoxRemember">Remember me</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
              <asp:Button ID="btnlogin"  class="btn waves-effect waves-light col s12" runat="server" Text="Login" OnClick="btnlogin_Click"  />
           
          </div>
        </div>
           <div class="row">
         
          <div class="input-field col s12 m12 l12">
              <p class="margin right-align medium-small"><a href="ForgotPassword.aspx">Forgot password ?</a></p>
          </div>          
        </div>
        <%--<div class="row">
          <div class="input-field col s6 m6 l6">
            <p class="margin medium-small"><a href="page-register.html">Register Now!</a></p>
          </div>
          <div class="input-field col s6 m6 l6">
              <p class="margin right-align medium-small"><a href="page-forgot-password.html">Forgot password ?</a></p>
          </div>          
        </div>--%>

      </form>
    </div>
  </div>
      
  
 

     <%--  <footer class="footer-content row  justify-content-between align-items-center">
    <div class="col sm8"><div class="text">Designed by <a href="#" target="_blank" class="">Infintrix Global Pvt. Ltd.</a></div></div>
    <div class="col sm8 text-right"><span class="text-white">Copyright © 2019 - 2020 by <a href="">InfintrixGlobal Pvt. Ltd.</a> | All Rights Reserved</span></div>
  </footer>--%>
</div>
  </div>
    
    <!-- ================================================
    Scripts
    ================================================ -->

  <!-- jQuery Library -->
  <script type="text/javascript" src="~/js/plugins/jquery-1.11.2.min.js"></script>
  <!--materialize js-->
  <script type="text/javascript" src="~/js/materialize.min.js"></script>
  <!--prism-->
  <script type="text/javascript" src="~/js/plugins/prism/prism.js"></script>
  <!--scrollbar-->
  <script type="text/javascript" src="~/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

      <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="~/js/plugins.min.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="~/js/custom-script.js"></script>
</body>
</html>
