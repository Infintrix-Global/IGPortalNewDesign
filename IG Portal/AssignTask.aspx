<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AssignTask.aspx.cs" Inherits="IG_Portal.AssignTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">--%>
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
          <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Assign Task</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="Admindashboard.html"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="AssignTask.aspx">Assign Task Details</a></div>
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

                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                     <div class="section-body">
                          <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Fill up the Details
                                                <i class="fas fa-arrow-down"></i></h4>
                                        </div>
                                            <div class="card-body">
                                            <div class="form-group row">
                                            <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Project Name</label>
                                   
                                        <asp:DropDownList ID="ddlProjectName" runat="server" placeholder="" AutoPostBack="true"
                                                     TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                   
                                        </div>
                                                <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Task Type</label>
                                                <asp:DropDownList ID="ddlTaskType" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="2" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskType" runat="server" ControlToValidate="ddlTaskType" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Type" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                           
                                        </div>
                                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                <label class="col-sm-6 col-form-label">Task Title</label>
                                               
                                               <asp:DropDownList ID="ddlTaskTitle" runat="server" placeholder="" class="form-control"
                                                    TabIndex="3" OnSelectedIndexChanged="ddlTaskTitle_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskTitle" runat="server" ControlToValidate="ddlTaskTitle" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                 `<asp:TextBox ID="txtTaskTitle" class="form-control" placeholder="Enter Task Title" TabIndex="4" Visible="false" runat="server"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredtxttitle" runat="server" ControlToValidate="txtTaskTitle" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title " ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                <label class="col-sm-6 col-form-label">Task Details</label>
                                               
                                                <asp:TextBox ID="txtTaskDescription" runat="server" placeholder="" Height="80px"
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="4" CssClass="form-control">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskDescription" runat="server" ControlToValidate="txtTaskDescription" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Description" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                  
                                        </div>
                                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                <label class="col-sm-6 col-form-label"> Estimated Start Date</label>
                                               
                                                 <asp:TextBox ID="txtDate" runat="server" class="form-control"  TabIndex="5" TextMode="Date"   ></asp:TextBox>
                                               <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                   </span>
                                                            </div>
                                                
                                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                <label class="col-sm-6 col-form-label"> Estimated Work Time(In hours)</label>
                                               
                                                <asp:TextBox ID="txtTime" runat="server" class="form-control" TabIndex="6"  ></asp:TextBox>
                                                             <span class="help-block">
                                                 <asp:RegularExpressionValidator runat="server" ErrorMessage="Decimal Only" ControlToValidate="txtTime"
      ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="requiredStartTime" runat="server" ControlToValidate="txtTime" ErrorMessage="Please Enter Work Time " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                                 </span>
                                              
                                        </div>
                                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                <label class="col-sm-6 col-form-label">Assign To</label>
                                                
                                                <asp:DropDownList ID="ddlAssignTo" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="7" class="form-control">
                                                </asp:DropDownList>
                                                            </div>
                                       
                                        <%--  <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
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
                                                 <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                <label class="col-sm-6 col-form-label">Comments</label>
                                                
                                                <asp:TextBox ID="txtComment" runat="server" placeholder="" Height="80px"
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="9" class="form-control">
                                                </asp:TextBox>
                                    </div>
                                                
                                    </div>
                                 <div class="form-group row" style="margin-top:-30px">
                                                            <div class="col-sm-5"></div>
                                                            <div class=" col-sm-6">
                                    <asp:Button ID="btnsubmit" runat="server" TabIndex="10" ClientIDMode="Static" Text="Submit" class="btn btn-outline-primary" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" style="width:180px"></asp:Button>
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
