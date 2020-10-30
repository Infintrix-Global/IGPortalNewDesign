<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ProjectStatusDetails.aspx.cs" Inherits="IG_Portal.ProjectStatusDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card-body">
        <div class="portlet-body">
    
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Project Details" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                  <div class="row"  align="center">
                            <div class="col m12 s12 l12">
                                

                       
                                <table >
                                    <colgroup span="3"></colgroup>
                                   
                                        <tr>
                                    
                                        <td colspan="1">Project Name :</td>
                                            <td colspan="2"><asp:Label ID="lblProjectName" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                             <td colspan="1">Proposed Hours :</td>
                                            <td colspan="2"><asp:Label ID="lblProposedhrs" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                        
                                    </tr>
                                    <tr>
                                        
                                    
                                        
                                    </tr>
                                     <tr>
                                       
                                        <td colspan="1">Planned Task :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblPTask" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                          <td colspan="1">Planned Task Hours :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblPTaskHrs" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                    <tr>
                                        
                                       
                                    </tr>
                                  
                                      <tr>
                                       
                                        <td colspan="1">Actual Task :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblATask" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                             
                                        <td colspan="1">Actual Task Hours :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblATaskHrs" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                    <tr>
                                     
                                    </tr>
                                  
                                    <tr>
                                       
                                        <td colspan="1">Bugs :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblBugs" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                          <td colspan="1">Bug Hours  :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblBugHrs" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                      
                                    </tr>

                                    

                                      <tr>
                                        <td colspan="1">Testing Hours :</td>
                                        <td colspan="2"> <asp:Label ID="lblTestingHrs" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                             <td colspan="1">ReWork Teting Hours:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblReTestingHrs" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                          </tr>

                                     
                                     <tr>
                                       
                                     
                                    </tr>
                                   
                                     <tr>
                                       
                                        <td colspan="1">Actual TimeSpent:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblTimeSpent" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                           <td colspan="1">Status:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                       
                                      
                                    </tr>

                                     <tr >
                                       
                                        <td colspan="1" >Management Time Difference :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblMTimeDiff" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                          <td colspan="1" >Development Time Difference :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblDTimeDiff" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                         
                                        <td colspan="1" >Total Time Difference :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblTTimeDiff" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr >
                                       
                                       
                                    </tr>
                                     <tr >
                                       
                                    </tr>

                                      <tr>
                                      
                                    </tr>

                                  
                                </table>
                            </div>
                        </div>
                        <br />
              </div>
            </div>
        </div>
</asp:Content>
