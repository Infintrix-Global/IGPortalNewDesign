<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="IG_Portal.EmployeeProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                <asp:Button runat="server" id="btnEdit" class="btn blue" ClientIDMode="Static" OnClick="btnEdit_Click" Text="Edit"  />
                                </div>
                     </div>
                <br />
                 <div class="row"  align="center">
                            <div class="col m12 s12 l12">
                                <table >
                                    <colgroup span="12"></colgroup>
                                    
                                     <tr>
                                        
                                    
                                        <td colspan="1">Employee Code :</td>
                                            <td colspan="2"><asp:Label ID="lblEmpCode" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                      
                                        
                                    </tr>
                                    <tr>
                                        
                                    
                                        <td colspan="1">Name :</td>
                                            <td colspan="2"><asp:Label ID="lblName" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                      
                                        
                                    </tr>
                                     <tr>
                                       
                                        <td>Mobile No :</td>
                                            <td>
                                            <asp:Label ID="lblMobileNo" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                    <tr>
                                        
                                        <td>Email ID :</td>
                                            <td>
                                            <asp:Label ID="lblEmail" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                    <tr>
                                       
                                        <td>Address:</td>
                                            <td>
                                            <asp:Label ID="lblAddress" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                        <td>Date Of Joining:</td>
                                            <td>
                                            <asp:Label ID="lblJoinDate" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                        <td>Role:</td>
                                            <td>
                                            <asp:Label ID="lblRole" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                      <tr>
                                        <td>Manager:</td>
                                        <td> <asp:Label ID="lblManager" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                     <tr>
                                       
                                        <td>Date Of Birth:</td>
                                            <td>
                                            <asp:Label ID="lblDOB" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>
                                   
                                     <tr>
                                       
                                        <td>Department:</td>
                                            <td>
                                            <asp:Label ID="lblDepartment" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                </table>
                            </div>
                        </div>
                        <br />
              </div>
            </div>
        </div>
</asp:Content>
