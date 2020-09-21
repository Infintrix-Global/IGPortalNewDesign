<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AssignTask.aspx.cs" Inherits="IG_Portal.AssignTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->

            <script>

                $(function () {

                    $("#ddlProjectName").customselect();
                    search: true;
                    hoveropen: false;


                    $("#ddlTaskType").customselect();
                    search: true;
                    hoveropen: false;
                });
            </script>
          

            <div class="form-body">

                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Assign Task" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    <div class="row">
                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Project Name </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder="" AutoPostBack="true"
                                                     TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>


                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Task Type</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlTaskType" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="2">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskType" runat="server" ControlToValidate="ddlTaskType" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Type" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Task Title</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlTaskTitle" runat="server" placeholder=""
                                                    TabIndex="3" OnSelectedIndexChanged="ddlTaskTitle_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskTitle" runat="server" ControlToValidate="ddlTaskTitle" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>

                                            </div>

                                            <div class="form-group">
                                                `<asp:TextBox ID="txtTaskTitle" class="form-control" placeholder="Enter Task Title" TabIndex="4" Visible="false" runat="server"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredtxttitle" runat="server" ControlToValidate="txtTaskTitle" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title " ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Task Details</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtTaskDescription" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="4">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskDescription" runat="server" ControlToValidate="txtTaskDescription" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Description" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>

                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                      Estimated Start Date
                                                    </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"  TabIndex="5" TextMode="Date"   ></asp:TextBox>
                                               
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>

                                               
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Estimated Work Time(In hours)</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtTime" runat="server" class="form-control" TabIndex="6"  ></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="requiredStartTime" runat="server" ControlToValidate="txtTime" ErrorMessage="Please Enter Work Time " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                      

                                        <div class="clearfix"></div>
                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Assign To </label>
                                                    <span class="required"></span>
                                                </span>
                                                <asp:DropDownList ID="ddlAssignTo" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="7" >
                                                </asp:DropDownList>
                                               
                                            </div>
                                        </div>

                                        <%--  <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Priority</label>
                                                    <span class="required">*</span>
                                                </span>
                                                
                                                <asp:RadioButtonList ID="radPriority"  runat="server" class="form-control" TabIndex="8">
                                                    <asp:ListItem Text="High Priority" Value="High Priority" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Medium Priority" Value="Medium Priority"></asp:ListItem>
                                                    <asp:ListItem Text="Low Priority" Value="Low Priority"></asp:ListItem>

                                                </asp:RadioButtonList>
                                               
                                            </div>
                                        </div>--%>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Comments</label>

                                                </span>
                                                <asp:TextBox ID="txtComment" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="9">
                                                </asp:TextBox>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="10" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false"   ></asp:Button>
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
