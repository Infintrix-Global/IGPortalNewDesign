<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="IG_Portal.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .block1 {
            height: 100px;
            width: 250px;
            border: 1px solid aliceblue;
            overflow-y: scroll;
           
            margin-top: 30px;
        }
         .block2 {
            height: 100px;
            width: 250px;
            border: 1px solid aliceblue;
            overflow-y: scroll;
            margin-top: 30px;
        }
    </style>
    <script type="text/javascript">
    function ValidateCheckBoxList(sender, args) {
        var checkBoxList = document.getElementById("<%=chkRole.ClientID %>");
        var checkboxes = checkBoxList.getElementsByTagName("input");
        var isValid = false;
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                isValid = true;
                break;
            }
        }
        args.IsValid = isValid;
    }
    </script>

      <script type="text/javascript">
          function ValidateCheckBoxListDept(sender, args) {
              var checkBoxList = document.getElementById("<%=chkDepartment.ClientID %>");
              var checkboxes = checkBoxList.getElementsByTagName("input");
              var isValid = false;
              for (var i = 0; i < checkboxes.length; i++) {
                  if (checkboxes[i].checked) {
                      isValid = true;
                      break;
                  }
              }
              args.IsValid = isValid;
          }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="sc1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Edit Profile</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#">Edit Profile Details</a></div>
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
      <asp:Label ID="lblmsg" runat="server"></asp:Label>
   
                              
    
                <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Edit Profile</h4></div>
                            <div class="table-responsive">
                            <div class="card-body">
                                 
                            <table class="table table-bordered">
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
                                    <asp:TextBox ID="txtMobileNo" runat="server" Text="" Font-Bold="true" class="form-control"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Please enter valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="e"></asp:RegularExpressionValidator>
                            </tr>
                            <tr>
                                <td>Email ID :</td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" Text="" Font-Bold="true" class="form-control"></asp:TextBox></td>
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
                                    <asp:TextBox ID="txtAddress" runat="server" Text="" Font-Bold="true" class="form-control"></asp:TextBox></td>
                            </tr>

                            <tr>
                                <td>Date Of Joining:</td>
                                <td>
                                    <asp:TextBox ID="txtJoinDate" runat="server" Text="" Font-Bold="true" TextMode="date" class="form-control"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJoinDate" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Date of Joing" ForeColor="Red"></asp:RequiredFieldValidator>
                            </tr>

                            <tr>
                                <td>Role:</td>
                                <td>
                                    <div class="block1">
                                    <asp:CheckBoxList ID="chkRole" runat="server"></asp:CheckBoxList>
                                </div></td>
                                <%--<asp:RequiredFieldValidator ID="requiredRole" runat="server" ControlToValidate="chkRole" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>--%>
                                  <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Please select at least one role."
    ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" ValidationGroup="e" />
                            </tr>
                            <tr>
                                <td>Manager:</td>
                                <td>
                                    <asp:DropDownList ID="ddlManager" runat="server" class="form-control"></asp:DropDownList></td>
                                <asp:RequiredFieldValidator ID="requiredManager" runat="server" ControlToValidate="ddlManager" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                            </tr>

                            <tr>
                                <td>LinkedIn Profile:</td>
                                <td>
                                    <asp:TextBox ID="txtLinkedIn" runat="server" Text="" Font-Bold="true" class="form-control"></asp:TextBox>
                             <%--       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLinkedIn" ForeColor="red" ErrorMessage="Invalid!" ValidationExpression="/(http(s)?:\\)?([\w-]+\.)+[\w-]+[.com|.in|.org]+(\[\?%&=]*)?/" ValidationGroup="e"></asp:RegularExpressionValidator>--%>
                                </td>

                            </tr>

                            <tr>
                                <td>Date Of Birth:</td>
                                <td>
                                    <asp:TextBox ID="txtDOB" runat="server" Text="" Font-Bold="true" TextMode="date" class="form-control"></asp:TextBox></td>
                            </tr>

                            <tr id="passsword" runat="server">
                                <td>Password:</td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" Text="" Font-Bold="true" class="form-control"></asp:TextBox></td>
                            </tr>
                            <asp:UpdatePanel ID="up2" runat="server">
                                <ContentTemplate>
                                    <tr>
                                        <td>Status:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlStatus" runat="server" ClientIDMode="Static" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true" class="form-control"></asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr id="LastDay" runat="server" visible="false">
                                        <td>Last Working Day:</td>
                                        <td>
                                            <asp:TextBox ID="txtLastDay" TextMode="Date" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                </ContentTemplate>
                            </asp:UpdatePanel>  
                            <tr id="department" runat="server">
                                <td>Department:</td>
                                <td>
                                    <div class="block2" id="chkDept" runat="server">
                                    <asp:CheckBoxList ID="chkDepartment" runat="server" />
                                    </div>
                                    <asp:CustomValidator ID="CustomValidator2" ErrorMessage="Please select at least one department."
    ForeColor="Red" ClientValidationFunction="ValidateCheckBoxListDept" runat="server" ValidationGroup="e" />
                              </td>
                            </tr>
                              <tr>
                                  <td colspan="2">
                                      <center>
                                   <asp:Button runat="server" ID="btnUpdate" class="btn btn-info" ClientIDMode="Static" OnClick="btnUpdate_Click" Text="Update" ValidationGroup="e" />
                                 </center>
                                          </td>
                              </tr>  
                        </table>

                        </div>
                    </div>
                </div>
    </div>
               
            </div>
        
</asp:Content>
