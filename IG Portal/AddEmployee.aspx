﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="IG_Portal.EmployeeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         .block1 {
            height:100px;
            width:250px;
            border:1px solid aliceblue;
            overflow-y:scroll;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
           <%-- <div class="page-bar">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="AdminDashBoard.aspx">Home</a>
                        <i class="fa fa-angle-right"></i>


                        <a href="AddEmployee.aspx">Add Employee</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>--%>
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Add Employee" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                           <div class="row">
                            <div class="col m3">

                                <label><span class="auto-style1">Employee Code</span> <span class="required">*</span></label>
                                <asp:TextBox ID="txtEmpCode" runat="server" class="form-control" placeholder="Enter Employee Code" TabIndex="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmpCode" ErrorMessage="Please Enter Employee Code" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                               
                            </div>
                               </div>

                        <div class="row">
                            <div class="col m3">

                                <label><span class="auto-style1">Mobile Number</span> <span class="required">*</span></label>
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Enter Mobile" TabIndex="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Please enter valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="e"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col m3">

                                <label><span class="auto-style1">Name</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtName" class="form-control" placeholder="Name" TabIndex="3" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Only text is allowed" Display="Dynamic" ControlToValidate="txtName"
                                    SetFocusOnError="True" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="col m4">

                                <label><span class="auto-style1">Email</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email ID" TabIndex="4" runat="server"></asp:TextBox>
                                  <asp:Label ID="lblStatus" runat="server" ForeColor="red"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Enter valid Email" Display="Dynamic" ControlToValidate="txtEmail"
                                    SetFocusOnError="True" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="col m2">
                                <label><span class="auto-style1">Role</span><span class="required">*</span> </label>
                                <asp:DropDownList ID="ddlRole" runat="server" class="form-control" TabIndex="5"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="requiredRole" runat="server" ControlToValidate="ddlRole" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col m4">

                                <label><span class="auto-style1">Address</span> </label>

                                <asp:TextBox ID="txtAddress" class="form-control" placeholder="Address" TabIndex="6" runat="server"></asp:TextBox>


                            </div>

                            <div class="col m3">

                                <label><span class="auto-style1">Joining Date</span><span class="required">*</span> </label>

                                <asp:TextBox ID="txtJoinDate" class="form-control" placeholder="Name" TabIndex="7" runat="server" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJoinDate" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Select Date of Joing" ForeColor="Red"></asp:RequiredFieldValidator>


                            </div>

                            <div class="col m3">

                                <label><span class="auto-style1">Date Of Birth</span></label>
                                <asp:TextBox ID="txtDOB" class="form-control" placeholder="Birth Date" TabIndex="8" runat="server" TextMode="Date"></asp:TextBox>
                            </div>

                            <div class="col m2">
                                <label><span class="auto-style1">Manager</span><span class="required">*</span> </label>
                                <asp:DropDownList ID="ddlManager" runat="server" class="form-control" TabIndex="9"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlManager" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row">
                                   <div class="col m3">
                               <span class="title">
                                                    <label>Department</label>
                                                    <span class="required">*</span>
                                                </span>
                           <div class="block1">
                          
                              <asp:CheckBoxList ID="chkDepartment" RepeatLayout="OrderedList" runat="server"   TabIndex="9"/>
                        </div>
                         </div>
                        </div>

                        <div class="row" align="center">
                            <div class="col m6">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="10" class="btn " ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" />

                                </div>
                            </div>
                            <div class="col m6">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="11" class="btn blue" ClientIDMode="Static" OnClick="btclear_Click" />

                                </div>
                            </div>

                        </div>

                        <br />
                        <br />
                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <asp:GridView ID="GridEmployee" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                class="striped" OnRowCommand="GridEmployee_RowCommand" AllowSorting="true" OnPageIndexChanging="GridEmployee_PageIndexChanging"
                                                GridLines="None" OnSorting="GridEmployee_Sorting" OnRowDataBound="GridEmployee_RowDataBound"
                                                ShowHeaderWhenEmpty="True" Width="100%" >
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                      <asp:TemplateField HeaderText="Employee Code" HeaderStyle-CssClass="autostyle2" >
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
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("RoleName")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgView" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="ViewProfile" ImageUrl="~/images/view.png" AlternateText="view" ToolTip="view"></asp:ImageButton>
                                                            <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="EditProfile" ImageUrl="~/images/edit.png" AlternateText="edit" ToolTip="edit" Visible="false" ></asp:ImageButton>
                                                             <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="RemoveProfile" ImageUrl="~/images/delete.png" AlternateText="delete" ToolTip="delete" Visible="false" OnClientClick="return confirm('Are you sure you want to remove this employee?');" ></asp:ImageButton>
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
