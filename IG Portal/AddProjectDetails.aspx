<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddProjectDetails.aspx.cs" Inherits="IG_Portal.AddProjectDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Project</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="Admindashboard.html"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="Addproject.html">Project Details</a></div>
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
                                            <h4>Add Project Details
                                                <i class="fas fa-arrow-down"></i></h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group row">
                                                
                                                 <div class=" col-sm-6 form-group">
                                                    <label class="col-sm-6 col-form-label">Project Name</label>
                                                        
                                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                                     TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                </div>
                                                 <div class=" col-sm-6 form-group">
                                                    <label class="col-sm-6 col-form-label">Project Description</label>
                                                     <asp:TextBox ID="txtProjectDesription" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="2" class="form-control">
                                                </asp:TextBox>
                                                </div>
                                                 <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                    <label class="col-sm-6 col-form-label">Project Manager</label>
                                                  <asp:DropDownList ID="ddlProjectManager" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1" class="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlProjectManager" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Project Manager" ForeColor="Red"></asp:RequiredFieldValidator>
                                              </div>
                                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                    <label class="col-sm-6 col-form-label">Start Date</label>
                                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"  TabIndex="4" TextMode="Date"   ></asp:TextBox>
                                                <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                    </span>
                                                </div>
                                                <div class=" col-sm-6 form-group" style="margin-top:-30px">
                                                    <label class="col-sm-6 col-form-label">Website Link</label>
                                           <asp:TextBox ID="txtWebsiteLInk" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="3" class="form-control">
                                                </asp:TextBox>
                                               
                                            </div>

                                        </div>
                                             <div class="form-group row">
                                           <div class=" col-sm-12 form-group" style="margin-top:-30px">
                                               <asp:Label ID="lblAPLive"  Font-Bold="true" Text="Admin Panel Live Link and Credentials" runat="server" class="col-sm-12 col-form-label"></asp:Label>
                                             </div>
                                                    <div class=" col-sm-4 form-group">
                                                    <label class="col-sm-4 col-form-label">Link</label>
                                               
                                                <asp:TextBox ID="txtAPLiveLink" runat="server" placeholder=""
                                                    ClientIDMode="Static"  TabIndex="4" class="form-control">
                                                </asp:TextBox>
                                                </div>
                                                 <div class=" col-sm-4 form-group">
                                                    <label class="col-sm-4 col-form-label">User Name</label>
                                                     <asp:TextBox ID="txtLiveUserName" runat="server" CssClass="form-control"  TabIndex="5" ></asp:TextBox>
                                                    </div>
                                                 <div class=" col-sm-4 form-group">
                                                    <label class="col-sm-4 col-form-label">Password</label>
                                                 <asp:TextBox ID="txtLivePasssword" runat="server" class="form-control" TabIndex="6"  ></asp:TextBox>
                                            </div>
                                        </div>
                                            <div class="form-group row">
                                           <div class=" col-sm-12 form-group" style="margin-top:-30px">
                                           <asp:Label ID="lblAPUAT" Text="Admin Panel UAT Link and Credentials" Font-Bold="true" runat="server"></asp:Label>
                                             </div>
                                                <div class=" col-sm-4 form-group">
                                                    <label class="col-sm-4 col-form-label">Link</label>
                                                <asp:TextBox ID="txtAPUATLink" runat="server" placeholder=""
                                                    ClientIDMode="Static"  TabIndex="7" class="form-control">
                                                </asp:TextBox>
                                                </div>
                                                    <div class=" col-sm-4 form-group">
                                                    <label class="col-sm-4 col-form-label">User Name</label>
                                               <asp:TextBox ID="txtUATUserName" runat="server" CssClass="form-control"  TabIndex="8"></asp:TextBox>
                                                </div>
                                               <div class=" col-sm-4 form-group">
                                                    <label class="col-sm-4 col-form-label">Password</label>
                                                <asp:TextBox ID="txtUATPassword" runat="server" class="form-control" TabIndex="9"></asp:TextBox>
                                            </div>
                                        </div>
                                      <div class="form-group row">
                                           <div class=" col-sm-12 form-group" style="margin-top:-30px">
                                          <asp:Label ID="lblAPK"  Font-Bold="true" Text="Android APK Link and Credentials" runat="server"></asp:Label>
                                             </div>
                                         <div class=" col-sm-4 form-group">
                                         <label class="col-sm-4 col-form-label">Link</label>
                                          <asp:TextBox ID="txtAPKLink" runat="server" placeholder=""
                                                    ClientIDMode="Static"  TabIndex="10" class="form-control">
                                                </asp:TextBox>
                                        </div>
                                        <div class=" col-sm-4 form-group">
                                         <label class="col-sm-4 col-form-label">User Name</label>      
                                                <asp:TextBox ID="txtAPKUsename" runat="server" CssClass="form-control"  TabIndex="11" ></asp:TextBox>
                                        </div>
                                        <div class=" col-sm-4 form-group">
                                         <label class="col-sm-4 col-form-label">Password</label>      
                                                  <asp:TextBox ID="txtAPKPassword" runat="server" class="form-control" TabIndex="12"  ></asp:TextBox>
                                          </div>
                                                 
                                        </div>
                                    <div class="form-group row">
                                      <div class=" col-sm-6 form-group">
                            <asp:FileUpload ID="FileUpReciept" runat="server" AllowMultiple="true" class="form-control"/>
                               <asp:Label ID="Label2" runat="server" Text="(Format supported:jpeg,png,jpg)" ForeColor="Red"></asp:Label>
                            </div>
                                         <div class=" col-sm-6 form-group">
                                        <asp:Button ID="btnFileUpload" runat="server" Text="Upload File"  OnClick="btnFileUpload_Click" />
                                             </div>

                                        <div class="col m3">
        <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
              </div>
                                        </div>
                                             <div class="form-group row">
                                     <div class="col-sm-12 ">
                                        <center><asp:Button ID="btnsubmit" runat="server" TabIndex="13" ClientIDMode="Static" Text="Submit" class="btn btn-outline-primary  waves-effect" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" style="width: 30%"></asp:Button></center>
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
