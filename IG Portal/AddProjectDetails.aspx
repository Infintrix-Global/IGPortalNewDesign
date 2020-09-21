<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddProjectDetails.aspx.cs" Inherits="IG_Portal.AddProjectDetails" %>
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

            <div class="form-body">

                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Add Project Details" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    <div class="row">
                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Project Name </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                                     TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Project Description</label>
                                                  
                                                </span>
                                              
                                                <asp:TextBox ID="txtProjectDesription" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="2">
                                                </asp:TextBox>
                                              
                                            </div>
                                        </div>

                                          <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Project Manager </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlProjectManager" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1"  >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlProjectManager" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Project Manager" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Website Link</label>
                                                </span>
                                                <asp:TextBox ID="txtWebsiteLInk" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="3" >
                                                </asp:TextBox>
                                               
                                            </div>

                                        </div>
                                        <div class="clearfix"></div>

                                         <div class=" col m12">
                                               <asp:Label ID="lblAPLive"  Font-Bold="true" Text="Admin Panel Live Link and Credentials" runat="server"></asp:Label>
                                             </div>
                                         <div class="clearfix"></div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label> Link</label>
                                                   
                                                </span>
                                                <asp:TextBox ID="txtAPLiveLink" runat="server" placeholder=""
                                                    ClientIDMode="Static"  TabIndex="4">
                                                </asp:TextBox>
                                            
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        User Name
                                                    </label>
                                                   
                                                </span>
                                                <asp:TextBox ID="txtLiveUserName" runat="server" CssClass="form-control"  TabIndex="5" ></asp:TextBox>
                                             
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Password</label>
                                                    
                                                </span>
                                                <asp:TextBox ID="txtLivePasssword" runat="server" class="form-control" TabIndex="6"  ></asp:TextBox>
                                            </div>
                                        </div>

                                          <div class="clearfix"></div>

                                          <div class=" col m12">
                                               <asp:Label ID="lblAPUAT" Text="Admin Panel UAT Link and Credentials" Font-Bold="true" runat="server"></asp:Label>
                                             </div>
                                         <div class="clearfix"></div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label> Link</label>
                                                   
                                                </span>
                                                <asp:TextBox ID="txtAPUATLink" runat="server" placeholder=""
                                                    ClientIDMode="Static"  TabIndex="7">
                                                </asp:TextBox>
                                            
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        User Name
                                                    </label>
                                                   
                                                </span>
                                                <asp:TextBox ID="txtUATUserName" runat="server" CssClass="form-control"  TabIndex="8" ></asp:TextBox>
                                             
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Password</label>
                                                    
                                                </span>
                                                <asp:TextBox ID="txtUATPassword" runat="server" class="form-control" TabIndex="9"  ></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>

                                      <div class=" col m12">
                                               <asp:Label ID="lblAPK"  Font-Bold="true" Text="Android APK Link and Credentials" runat="server"></asp:Label>
                                             </div>
                                         <div class="clearfix"></div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label> Link</label>
                                                   
                                                </span>
                                                <asp:TextBox ID="txtAPKLink" runat="server" placeholder=""
                                                    ClientIDMode="Static"  TabIndex="10">
                                                </asp:TextBox>
                                            
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        User Name
                                                    </label>
                                                   
                                                </span>
                                                <asp:TextBox ID="txtAPKUsename" runat="server" CssClass="form-control"  TabIndex="11" ></asp:TextBox>
                                             
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Password</label>
                                                    
                                                </span>
                                                <asp:TextBox ID="txtAPKPassword" runat="server" class="form-control" TabIndex="12"  ></asp:TextBox>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>
                                
                          <div class="col m3">
            <asp:FileUpload ID="FileUpReciept" runat="server" AllowMultiple="true" />
                               <asp:Label ID="Label2" runat="server" Text="(Format supported:jpeg,png,jpg)" ForeColor="Red"></asp:Label>
                           
        </div>
                                         <div class="col m3">
                                           <asp:Button ID="btnFileUpload" runat="server" Text="Upload File"  OnClick="btnFileUpload_Click" />
                                             </div>

                                        <div class="col m3">
        <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
              </div>
                                        <div class="clearfix"></div>

                                    <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="13" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false"   ></asp:Button>
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
