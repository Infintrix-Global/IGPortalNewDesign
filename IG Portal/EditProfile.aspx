<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="IG_Portal.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .block1 {
            height: 100px;
            width: 250px;
            border: 1px solid aliceblue;
            overflow-y: scroll;
            margin-left: 480px;
            margin-top: -30px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="sc1" runat="server"></asp:ScriptManager>
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


                        <%--<div class="col m3">
                            <label>Profile Image </label>
                        </div>

                        <div class="col m3">
                        </div>
                        <div class="col m3">
                        </div>--%>


                        <table>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <tr id="photoupload1" runat="server">
                                        <td>Image Upload
                                    <asp:FileUpload ID="FileUpProfile" runat="server" ClientIDMode="Static" />
                                        </td>
                                        <td>
                                            <asp:Button ID="btnProfile" class="btn blue" CausesValidation="False"
                                                runat="server" Text="Upload" OnClick="btnImageProfile_Click" />
                                            <asp:Label ID="Label2" runat="server" Text="(Format supported:jpeg,png,jpg)" ForeColor="Red"></asp:Label>
                                            <asp:Label ID="lblProfile" runat="server" Visible="true"></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Image :</td>
                                        <td>
                                            <asp:Image ID="ImageProfile" runat="server" Height="80px" Width="80px" GenerateEmptyAlternateText="True" ImageUrl="~/Images/no-photo.jpg" />
                                    </tr>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                                <td>LinkedIn Profile:</td>
                                <td>
                                    <asp:TextBox ID="txtLinkedIn" runat="server" Text="" Font-Bold="true"></asp:TextBox>
                             <%--       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLinkedIn" ForeColor="red" ErrorMessage="Invalid!" ValidationExpression="/(http(s)?:\\)?([\w-]+\.)+[\w-]+[.com|.in|.org]+(\[\?%&=]*)?/" ValidationGroup="e"></asp:RegularExpressionValidator>--%>
                                </td>

                            </tr>

                            <tr>
                                <td>Date Of Birth:</td>
                                <td>
                                    <asp:TextBox ID="txtDOB" runat="server" Text="" Font-Bold="true" TextMode="date"></asp:TextBox></td>
                            </tr>

                            <tr id="passsword" runat="server">
                                <td>Password:</td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" Text="" Font-Bold="true"></asp:TextBox></td>
                            </tr>
                            <asp:UpdatePanel ID="up2" runat="server">
                                <ContentTemplate>
                                    <tr>
                                        <td>Status:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlStatus" runat="server" ClientIDMode="Static" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr id="LastDay" runat="server" visible="false">
                                        <td>Last Working Day:</td>
                                        <td>
                                            <asp:TextBox ID="txtLastDay" TextMode="Date" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <tr id="department" runat="server">
                                <td>Department:</td>
                            </tr>

                        </table>

                        <div class="row">
                            <div class="col m3">




                                <div class="block1" id="chkDept" runat="server">

                                    <asp:CheckBoxList ID="chkDepartment" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />

                <div class="row" align="center">
                    <div class="col m12 s12 l12">
                        <asp:Button runat="server" ID="btnUpdate" class="btn" ClientIDMode="Static" OnClick="btnUpdate_Click" Text="Update" ValidationGroup="e" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
