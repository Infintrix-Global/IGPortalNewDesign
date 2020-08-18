<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDashBoardWM.aspx.cs" Inherits="IG_Portal.Employee_DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection" />
    
  
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
  <div class="row">
        <div class="col m3">
            <div class="card">
                <div class="card-content  red white-text">
                    <p class="card-stats-title">
                      Pending Bugs-
                    
                        <asp:LinkButton ID="lnkBug" runat="server" OnClick="lblBug_Click"  ></asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>

         <div class="col m3">
            <div class="card">
                <div class="card-content  blue white-text">
                    <p class="card-stats-title">
                      Pending Task-
                    
                        <asp:LinkButton ID="lnkTask" runat="server" OnClick="lblTask_Click"  ></asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
        </div>

</asp:Content>
