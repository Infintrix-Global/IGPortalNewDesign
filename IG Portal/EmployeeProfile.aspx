<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="IG_Portal.EmployeeProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    function SetTarget() {
        document.forms[0].target = "_blank";
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Employee Profile</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="Admindashboard.html"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="EmployeeProfile.aspx">Employee Profile Details</a></div>
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
                            <div class="row mt-sm-4 background-image-body">
                                <div class="col-md-12 col-lg-12 box-center">
                                    <div class="row author-box">
                                        <img alt="image" src="assets/img/users/user-6.png" class="rounded-circle author-box-picture box-center mt-4">
                                    </div>
                                    <div class="row author-box">
                                        <div class="page-inner box-center align-center">
                                            <h2><a href="#">Alexa Lopez</a></h2>
                                            <div class="page-description">
                                                <h5>Web Developer</h5>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="row author-box mb-4">
                                        <div class="box-center align-center">
                                            <div class="mb-2 mt-3">
                                                <h6>Follow Hasan On</h6>
                                            </div>
                                            <a href="#" class="btn btn-social-icon mr-1 btn-facebook">
                                                <i class="fab fa-facebook-f"></i>
                                            </a>
                                            <a href="#" class="btn btn-social-icon mr-1 btn-twitter">
                                                <i class="fab fa-twitter"></i>
                                            </a>
                                            <a href="#" class="btn btn-social-icon mr-1 btn-github">
                                                <i class="fab fa-github"></i>
                                            </a>
                                            <a href="#" class="btn btn-social-icon mr-1 btn-instagram">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                            <div class="w-100 d-sm-none"></div>
                                        </div>
                                    </div>         			
                                </div>
                            </div>
                       </div>
    <div class="card-body">
        <div class="portlet-body">
    
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Employee Details</h4>
                  <%--  <asp:Label ID="lbltitle" runat="server" Text="Employee Details" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
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
