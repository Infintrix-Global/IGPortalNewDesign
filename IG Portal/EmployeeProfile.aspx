<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="IG_Portal.EmployeeProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    function SetTarget() {
        document.forms[0].target = "_blank";
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-body">
        <div class="portlet-body">
    
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Employee Details" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                   <div class="row"  align="center">
                            <div class="col m12 s12 l12">
                                <asp:Button runat="server" id="btnEdit" class="btn " ClientIDMode="Static" OnClick="btnEdit_Click" Text="Edit"  />
                                </div>
                     </div>
                <br />
                 <div class="row"  align="center">
                            <div class="col m12 s12 l12">
                                  <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">

                                  
                                        
                                 
                                </div>
                            </div>


                        </div>
                                <table >
                                    <colgroup span="12"></colgroup>
                                   
                                    
                                     <tr>
                                        
                                    
                                        <td colspan="1">Employee Code :</td>
                                            <td colspan="2"><asp:Label ID="lblEmpCode" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                       <td  rowspan="4" align="right">
                                              <asp:Image ID="ImagePhoto"  runat="server" Height="180px" Width="180px" GenerateEmptyAlternateText="True" />
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        
                                    
                                        <td colspan="1">Name :</td>
                                            <td colspan="2"><asp:Label ID="lblName" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                       
                                        
                                    </tr>
                                     <tr>
                                       
                                        <td colspan="1">Mobile No :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblMobileNo" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                    <tr>
                                        
                                        <td colspan="1">Email ID :</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblEmail" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                  
                                    <tr>
                                       
                                        <td colspan="1">Address:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblAddress" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                        <td colspan="1">Date Of Joining:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblJoinDate" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                        <td colspan="1">Role:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblRole" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                      <tr>
                                        <td colspan="1">Manager:</td>
                                        <td colspan="2"> <asp:Label ID="lblManager" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                          </tr>

                                      <tr>
                                        <td colspan="1">LinkedIn:</td>
                                        <td colspan="2"><asp:LinkButton ID="lnkLinkedIn" runat="server" Text="" ForeColor="Blue"  Font-Bold="true" OnClientClick="SetTarget();" OnClick="lnkLinkedIn_Click"></asp:LinkButton></td>
                                          </tr>
                                     <tr>
                                       
                                        <td colspan="1">Date Of Birth:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblDOB" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>
                                   
                                     <tr>
                                       
                                        <td colspan="1">Department:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblDepartment" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                       
                                        <td colspan="1">Status:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr id="LastDay" runat="server">
                                       
                                        <td colspan="1">Last Working Day:</td>
                                            <td colspan="2">
                                            <asp:Label ID="lblLastDay" runat="server" Text="" Font-Bold="true"></asp:Label></td>

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
