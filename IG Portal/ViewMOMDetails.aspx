<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewMOMDetails.aspx.cs" Inherits="IG_Portal.ViewMOMDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>View MOM Details</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#">MOM Details</a></div>
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
     <div class="section-body">
                          <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4</h4>
                                        <asp:Button ID="btnBack" runat="server" Text="Back to previous page"  OnClick="btnBack_Click" class="btn btn-outline-primary" Width="150px"></asp:Button>
                            </div>
                                        
                                    <div class="card-body">
                                        <div style="overflow-x:auto;width:100%">
                                   
                                 <table class="table table-bordered">
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
                                        </div>
                                    </div>
                              </div>

                 <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div style="overflow-x:auto;width:100%">
                                           <asp:GridView ID="GridMOMPoints" runat="server"  AutoGenerateColumns="False"
                                        class="table table-bordered"  
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
                            </div>

                        </div>
                    </div>
                </div>
                        <br />
              </div>
            </div>
        </div>
</asp:Content>
