<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddBug.aspx.cs" Inherits="IG_Portal.AddBug" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .rb1 input[type="radio"]
{
   margin-left: 10px;
   margin-right: 3px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Bug Details</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Add Bug</a></div>
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
          

            
                <asp:UpdatePanel ID="upBug" runat="server">
                    <ContentTemplate>
                         <div class="section-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Add Bug Data Through Below form
                                                <i class="fas fa-arrow-down"></i></h4>
                                        </div>
                                         <div class="card-body">
                                        
                                 <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                     <div class="form-group row">
                                                <div class="col-sm-3">
                                                     <label class="col-sm-6 col-form-label">Project Name</label>
                                                    <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                                    TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged"  AutoPostBack="true" CssClass="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                         </div>
                                        <div class="col-sm-3">
                                        <label class="col-sm-6 col-form-label">Task Type</label>
                                          <asp:DropDownList ID="ddlTaskType" runat="server" placeholder=""
                                                    TabIndex="2" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskType" runat="server" ControlToValidate="ddlTaskType" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Type" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                         </div>
                                        <div class="col-sm-3">
                                        <label class="col-sm-6 col-form-label">Page Name</label>
                                         <asp:DropDownList ID="ddlPageTitle" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="4" CssClass="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPageTitle" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Page Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                                
                                        </div>
                                         <div class="col-sm-3">
                                        <label class="col-sm-6 col-form-label">Task Title</label>
                                        <asp:DropDownList ID="ddlTaskTitle" runat="server" placeholder="" CssClass="form-control"
                                                    TabIndex="3" OnSelectedIndexChanged="ddlTaskTitle_SelectedIndexChanged" AutoPostBack="true" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskTitle" runat="server" ControlToValidate="ddlTaskTitle" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <div class="input-field">
                                                <asp:TextBox ID="txtTaskTitle" class="form-control" placeholder="Enter Task Title" TabIndex="4" Visible="false" runat="server"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredtxttitle" runat="server" ControlToValidate="txtTaskTitle" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title " ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>
                                       <div class="col-sm-3">
                                        <label class="col-sm-6 col-form-label">Task Details</label>
                                             <%--     <asp:DropDownList ID="ddlIDMatch" runat="server" Visible="false" ClientIDMode="Static"></asp:DropDownList>
                                                <asp:DropDownList ID="ddlTaskDetails" runat="server" Visible="false" ClientIDMode="Static"></asp:DropDownList>--%>
                                                <asp:TextBox ID="txtTaskDetails" runat="server" placeholder="" Enabled="false"
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="11" CssClass="form-control">
                                                </asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                        <label class="col-sm-6 col-form-label">Date</label>
                                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" ClientIDMode="Static"  TextMode="Date" TabIndex="6"  ></asp:TextBox>
                                               <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date "  ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                  <%-- <asp:RangeValidator ID="rgvDate" runat="server" ErrorMessage="Future Date Not Allowed"
                 ValidationGroup="at" ControlToValidate="txtDate" ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:RangeValidator>--%>
                                                   </span>
                                        </div>
                                         <div class="col-sm-3">
                                        <label class="col-sm-6 col-form-label">Priority</label>
                                         <asp:RadioButtonList ID="radPriority"  runat="server" RepeatDirection="Horizontal" class="form-control rb1" TabIndex="7">
                                                    <asp:ListItem Text="High" Value="High Priority" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Medium" Value="Medium Priority"></asp:ListItem>
                                                    <asp:ListItem Text="Low" Value="Low Priority"></asp:ListItem>

                                                </asp:RadioButtonList>
                                               
                                        </div>
                                          <div class="col-sm-3">
                                        <label class="col-sm-6 col-form-label">Suggested By</label>
                                       <asp:DropDownList ID="ddlSuggetedBy" runat="server" class="form-control" TabIndex="8"  ></asp:DropDownList>
                                                    <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredSuggestedBy" runat="server" ControlToValidate="ddlSuggetedBy" ErrorMessage="Please Select Suggested By" InitialValue="0" ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                        </span>
                                                   </div>
                                         </div>
                                             <div class="form-group row">
                                     
                                                  <div class="col-sm-3">
                                        <label class="col-sm-6 col-form-label">Bug Details</label>
                                          <asp:TextBox ID="txtBugDescription" runat="server" placeholder="" CssClass="form-control"
                                                    ClientIDMode="Static" TextMode="MultiLine" Height="100px" TabIndex="5">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredBugDescription" runat="server" ControlToValidate="txtBugDescription" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Bug Description" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                                    <div class="col-sm-3">
                                                    <label class="col-sm-6 col-form-label">Assign To </label>
                                                    <asp:DropDownList ID="ddlAssignTo" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="9" class="form-control">
                                                </asp:DropDownList>
                                                 </div>
                                             <div class="col-sm-3">
                                                    <label class="col-sm-6 col-form-label">Status</label>
                                                 <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="10" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredStatus" runat="server" ControlToValidate="ddlStatus" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Status" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                                    <div class="col-sm-3">
                                                    <label class="col-sm-6 col-form-label">Comments</label>
                                                 <asp:TextBox ID="txtComment" runat="server" placeholder="" Height="100px"
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="11" CssClass="form-control">
                                                </asp:TextBox>
                                                   
                                        </div>
                                                 </div>
                                             <div class="form-group row">
                                     
                                                <div class="col-sm-3">
                                                    <asp:FileUpload ID="FileUpReciept" runat="server" AllowMultiple="true" CssClass="form-control" />
                               <asp:Label ID="Label2" runat="server" Text="(Format supported:jpeg,png,jpg)" ForeColor="Red" class="col-sm-6 col-form-label"></asp:Label>
                                                   
                                        <%-- <div class="col m3">
                                           <asp:Button ID="btnFileUpload" runat="server" Text="Upload File"  OnClick="btnFileUpload_Click" />
                                             </div>--%>
                                                    </div>
                                        <div class="col m3">
                                    <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
                                          </div>
                                    </div>
                                     <div class="col-sm-12 form-group">
                                       <center><asp:Button ID="btnsubmit" runat="server" TabIndex="12" ClientIDMode="Static" Text="Add" class="btn btn-info" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" style="width:200px"></asp:Button></center> 
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
