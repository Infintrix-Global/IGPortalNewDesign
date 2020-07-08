<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="IG_Portal.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-body">
        <div class="portlet-body">
           <%-- <div class="page-bar" id="pbEmployee" runat="server" visible="false">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="EmployeeDashBoard.aspx">Home</a>
                        <i class="fa fa-angle-right"></i>

                        <a href="EmployeeProfile.aspx">Profile</a>
                        <i class="fa fa-angle-right"></i>

                        <a href="EditProfile.aspx">Edit Profile</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>
            <div class="page-bar" id="pbSAdmin" runat="server" visible="false">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="SuperAdminDashBoard.aspx">Home</a>
                        <i class="fa fa-angle-right"></i>

                        <a href="AddEmployee.aspx">Add Employee</a>
                        <i class="fa fa-angle-right"></i>

                        <a href="EmployeeProfile.aspx">Profile</a>
                        <i class="fa fa-angle-right"></i>

                        <a href="EditProfile.aspx">Edit Profile</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>--%>
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Employee Details" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <div class="row" align="center">
                    <div class="col m12 s12 l12">
                        <table>

                            <tr>
                                <td>Employee Code :</td>
                                <td>
                                <asp:TextBox ID="txtEmpCode" runat="server" class="form-control" placeholder="Enter Employee Code" TabIndex="1"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmpCode"
                                    ErrorMessage="Please Enter Employee Code" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                            </tr>

                            <tr>
                                <td>Name :</td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" Text="" Font-Bold="true" class="form-control"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Only text is allowed" Display="Dynamic" ControlToValidate="txtName"
                                    SetFocusOnError="True" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$">
                                </asp:RegularExpressionValidator>
                            </tr>
                            <tr>
                                <td>Mobile No :</td>
                                <td>
                                    <asp:TextBox ID="txtMobileNo" runat="server" Text="" Font-Bold="true"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Please enter valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="e"></asp:RegularExpressionValidator>
                            </tr>
                            <tr>
                                <td>Email ID :</td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" Text="" Font-Bold="true"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Enter valid Email" Display="Dynamic" ControlToValidate="txtEmail"
                                    SetFocusOnError="True" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
                                </asp:RegularExpressionValidator>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" Text="" Font-Bold="true"></asp:TextBox></td>
                            </tr>

                            <tr>
                                <td>Date Of Joining:</td>
                                <td>
                                    <asp:TextBox ID="txtJoinDate" runat="server" Text="" Font-Bold="true" TextMode="date"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJoinDate" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Date of Joing" ForeColor="Red"></asp:RequiredFieldValidator>
                            </tr>

                            <tr>
                                <td>Role:</td>
                                <td>
                                    <asp:DropDownList ID="ddlRole" runat="server"></asp:DropDownList></td>
                                <asp:RequiredFieldValidator ID="requiredRole" runat="server" ControlToValidate="ddlRole" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                            </tr>
                            <tr>
                                <td>Manager:</td>
                                <td>
                                    <asp:DropDownList ID="ddlManager" runat="server"></asp:DropDownList></td>
                                <asp:RequiredFieldValidator ID="requiredManager" runat="server" ControlToValidate="ddlManager" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                            </tr>

                            <tr>
                                <td>Date Of Birth:</td>
                                <td>
                                    <asp:TextBox ID="txtDOB" runat="server" Text="" Font-Bold="true" TextMode="date"></asp:TextBox></td>
                            </tr>

                             <tr id="passsword" runat="server">
                                <td>Password:</td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" Text="" Font-Bold="true" ></asp:TextBox></td>
                            </tr>


                        </table>
                    </div>
                </div>
                <br />

                <div class="row" align="center">
                    <div class="col m12 s12 l12">
                        <asp:Button runat="server" ID="btnUpdate" class="btn blue" ClientIDMode="Static" OnClick="btnUpdate_Click" Text="Update" ValidationGroup="e" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
