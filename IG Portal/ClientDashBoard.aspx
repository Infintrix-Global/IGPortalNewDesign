<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ClientDashBoard.aspx.cs" Inherits="IG_Portal.ClientDashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="row" align="center">
         <div class="col m4">
         <div id="card-alert" class="card light-blue">
                      <div class="card-content white-text">
                      <asp:LinkButton ID="lnkRaise" runat="server" OnCommand="Raise_Command" CommandName="Raise" Text="Raise Ticket"></asp:LinkButton>
                      </div>
                    </div>
             </div>
        
                            <%--    <asp:Button ID="Raise"  CssClass="card light-blue" runat="server" Text="Raise Ticket" OnCommand="Raise_Command" CommandName="Raise" />--%>

                           
       
                            <div class="col m4">
                               <%-- <asp:Button ID="Chat" class="card light-blue" runat="server" Text="Chat with Support" CommandName="Chat" OnCommand="Raise_Command" />--%>
                                  <div id="card-alert2" class="card light-green">
                      <div class="card-content white-text">
                      <asp:LinkButton ID="lnkChat" runat="server" Text="Chat with Support" CommandName="Chat" OnCommand="Raise_Command"></asp:LinkButton>
                      </div>
                    </div>

                            </div>
          
                             <div class="col m4">
                             <%--   <asp:Button ID="View" class="card light-blue" runat="server" Text="View Tickets" CommandName="View" OnCommand="Raise_Command" />--%>
                                   <div id="card-alert3" class="card orange">
                      <div class="card-content white-text">
                      <asp:LinkButton ID="lnkView" runat="server" Text="View Tickets" CommandName="View" OnCommand="Raise_Command"></asp:LinkButton>
                      </div>

                            </div>
        
    </div>
        
</asp:Content>
