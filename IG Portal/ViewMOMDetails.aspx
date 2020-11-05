<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewMOMDetails.aspx.cs" Inherits="IG_Portal.ViewMOMDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="card-body">
        <div class="portlet-body">
         <!-- BEGIN FORM-->
            <div class="form-body">
                  <div class="row" >
                    <asp:Button ID="btnBack" runat="server" Text="Back"  OnClick="btnBack_Click"></asp:Button>
                </div>

                <br />
                <div class="row" align="center">
                    <h4 class="header2">MOM Details</h4>
                   <%-- <asp:Label ID="lbltitle" runat="server" Text="MOM Details " Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />

                
                 <div class="row"  align="center">
                            <div class="col m12 s12 l12">
                                <table >
                                    <colgroup span="12"></colgroup>
                                    
                                      <tr>
                                        
                                        <td colspan="1">Project Name :</td>
                                            <td colspan="2"><asp:Label ID="lblProjectName" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td colspan="1">Initiator :</td>
                                            <td colspan="2"><asp:Label ID="lblInitiator" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                        
                                    </tr>
                                     <tr>
                                       
                                        <td>Meeting Place :</td>
                                            <td>
                                            <asp:Label ID="lblMeetingPlace" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                      <tr>
                                       
                                        <td>Meeting Date:</td>
                                            <td>
                                            <asp:Label ID="lblMeetingDate" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                      <tr>
                                       
                                        <td>From Time:</td>
                                            <td>
                                            <asp:Label ID="lblFromTime" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                        <td>To Time:</td>
                                            <td>
                                            <asp:Label ID="lblToTime" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                        
                                        <td>Agenda :</td>
                                            <td>
                                            <asp:Label ID="lblAgenda" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                    
                                   
                                     <tr>
                                         
                                        <td>Attendee:</td>
                                            <td>
                                            <asp:Label ID="lblAttendee" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     
                                   
                                   

                                </table>
                            </div>
                        </div>

                <div class="row" runat="server" id="divScreenshot" >
                     <div class=" col m12">
                        <div class="portlet light ">
                            
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <asp:GridView ID="GridMOMPoints" runat="server"  AutoGenerateColumns="False"
                                        class="striped"  
                                        GridLines="None" AllowPaging="false" 
                                        
                                        ShowHeaderWhenEmpty="True" Width="100%" DataKeyName="ID">
                                           <Columns>
                                                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label24" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="MeetingPoint">
                                                                                <ItemTemplate>
                                                                                     <asp:Label ID="lnkDownload" runat="server" CausesValidation="False"
                                                            Text='<%# Eval("MeetingPoint") %>'  />
                                                                                   
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
                    </div>
                </div>
                        <br />
              </div>
            </div>
        </div>
</asp:Content>
