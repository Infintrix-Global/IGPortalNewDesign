<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="IG_Portal.EmployeeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .block1 {
            height: 100px;
            width: 250px;
            border: 1px solid aliceblue;
            overflow-y: scroll;
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
    <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Employee</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#">Employee Details</a></div>
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
    
 
                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                       <div class="section-body">
                          <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Add Employee Details
                                                <i class="fas fa-arrow-down"></i></h4>
                                        </div>
                                            <div class="card-body">
                                            <div class="form-group row">
                                            <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Employee Code</label>
                                                 
                                        <asp:TextBox ID="txtEmpCode" runat="server" class="form-control" placeholder="Enter Employee Code" TabIndex="1"></asp:TextBox>
                                        <span class="help-block">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmpCode" ErrorMessage="Please Enter Employee Code" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                        </span>
                                                </div>
                                       <div class=" col-sm-6 form-group">
                                       <label class="col-sm-6 col-form-label">Mobile Number</label>
                                       <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Enter Mobile" TabIndex="2"></asp:TextBox>
                                        <span class="help-block">
                                            <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Please enter valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="e"></asp:RegularExpressionValidator>
                                        </span>
                                           </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                       <label class="col-sm-6 col-form-label">Name</label>
                                       <asp:TextBox ID="txtName" class="form-control" placeholder="Name" TabIndex="3" runat="server"></asp:TextBox>
                                        <span class="help-block">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ValidationGroup="e"
                                                SetFocusOnError="true" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" ValidationGroup="e"
                                                ForeColor="Red" ErrorMessage="Only text is allowed" Display="Dynamic" ControlToValidate="txtName"
                                                SetFocusOnError="True" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$">
                                            </asp:RegularExpressionValidator>
                                        </span>
                                        </div>
                                        <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                       <label class="col-sm-6 col-form-label">Email</label>
                                      <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email ID" TabIndex="4" runat="server"></asp:TextBox>
                                        <asp:Label ID="lblStatus" runat="server" ForeColor="red"></asp:Label>
                                        <span class="help-block">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ValidationGroup="e"
                                                SetFocusOnError="true" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="e"
                                                ForeColor="Red" ErrorMessage="Enter valid Email" Display="Dynamic" ControlToValidate="txtEmail"
                                                SetFocusOnError="True" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
                                            </asp:RegularExpressionValidator>
                                            </div>
                                        <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                       <label class="col-sm-6 col-form-label">Role</label>
                                            <div class="block1">
                                            <asp:CheckBoxList ID="chkRole" RepeatLayout="OrderedList" runat="server" class="form-control" TabIndex="5"></asp:CheckBoxList>
                                        </div>
                                        <span class="help-block">
                                            <%--  <asp:RequiredFieldValidator ID="requiredRole" runat="server" ControlToValidate="chkRole" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>--%>
                                            <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Please select at least one role."
                                                ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" ValidationGroup="e" />
                                        </span>
                                            </div>
                                            <div class="col-sm-6 form-group" style="margin-top:-30px">
                                       <label class="col-sm-6 col-form-label">Address</label>
                                        <asp:TextBox ID="txtAddress" class="form-control" placeholder="Address" TabIndex="6" runat="server"></asp:TextBox>
                                    </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                       <label class="col-sm-6 col-form-label">Joining Date </label>
                                        <asp:TextBox ID="txtJoinDate" class="form-control" placeholder="Name" TabIndex="7" runat="server" TextMode="Date"></asp:TextBox>
                                        <span class="help-block">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJoinDate" ValidationGroup="e"
                                                SetFocusOnError="true" ErrorMessage="Please Select Date of Joing" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <%-- <asp:RangeValidator ID="rgvJoinDate" runat="server" ErrorMessage="Future Date Not Allowed"
                                            ValidationGroup="at" ControlToValidate="txtJoinDate" ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:RangeValidator>--%>
                                        </span>
                                    </div>
                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                       <label class="col-sm-6 col-form-label">Date Of Birth</label>
                                        <asp:TextBox ID="txtDOB" class="form-control" placeholder="Birth Date" TabIndex="8" runat="server" TextMode="Date"></asp:TextBox>
                                        <span class="help-block">
                                         <%--  <asp:RangeValidator ID="rgvDOB" runat="server" ErrorMessage="Future Date Not Allowed"
                                            ValidationGroup="at" ControlToValidate="txtDOB" ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:RangeValidator>--%>
                                        </span>
                                    </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                       <label class="col-sm-6 col-form-label">Manager</label>
                                        <asp:DropDownList ID="ddlManager" runat="server" class="form-control" TabIndex="9"></asp:DropDownList>
                                        <span class="help-block">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlManager" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                        </span>
                                    </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                       <label class="col-sm-6 col-form-label">Department</label>
                                     <div class="block1">
                                         <asp:CheckBoxList ID="chkDepartment" RepeatLayout="OrderedList" runat="server" TabIndex="9" class="form-control"/>
                                        </div>
                                        <span class="help-block">
                                            <asp:CustomValidator ID="CustomValidator2" ErrorMessage="Please select at least one department."
                                                ForeColor="Red" ClientValidationFunction="ValidateCheckBoxListDept" runat="server" ValidationGroup="e" />
                                        </span>
                                     </div>
                               </div>
                        <div class="form-group row">
                            <div class="col-sm-4"></div>
                            <div class=" col-sm-2">
                                    <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="10" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" style="width:130px"/>
                                   </div>
                            <div class=" col-sm-2">
                                <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="11" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btclear_Click" style="width:130px;margin-left:-30px"/>
                            </div>
                                </div>
                                </div>
                                        </div>
                                    </div>
                              </div></div>
                          <%--  <div class="col m4">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btnSearch" runat="server" Text="Search" TabIndex="12" class="btn blue" ClientIDMode="Static" OnClick="btnSearch_Click" />

                                </div>
                            </div>--%>
                         <div class="section-body">

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Employee Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                   <div style="overflow-x:auto;width:100%">
                                    <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                      <asp:GridView ID="GridEmployee" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                class="table table-bordered" OnRowCommand="GridEmployee_RowCommand" AllowSorting="true" OnPageIndexChanging="GridEmployee_PageIndexChanging"
                                                GridLines="None" OnSorting="GridEmployee_Sorting" OnRowDataBound="GridEmployee_RowDataBound"
                                                ShowHeaderWhenEmpty="True" Width="100%">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Employee Code" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeCode")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Contact Number" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("EmployeeID")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Email" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Email")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Role" HeaderStyle-CssClass="autostyle2" SortExpression="RoleName">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Roles")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="imgView" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="ViewProfile" class="btn btn-primary"><i class="fas fa-eye" style="color:white"></i></asp:LinkButton>
                                                           <asp:LinkButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="EditProfile" class="btn" style="background-color:yellow"><i class="fas fa-edit" style="color:black"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="RemoveProfile" OnClientClick="return confirm('Are you sure you want to remove this employee?');" class="btn" style="background-color: green"><i class="fas fa-trash-alt" style="color:white"></i></asp:LinkButton>
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

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
