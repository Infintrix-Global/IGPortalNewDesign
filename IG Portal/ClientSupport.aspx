<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ClientSupport.aspx.cs" Inherits="IG_Portal.ClientSupport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Support" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                     <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <div class="row" >
                        <div class="col m4">
                            <span class="title">
                                                    <label>Project Name<span class="required">*</span></label>
                                                   
                                                </span>
                    <asp:DropDownList ID="ddlProjectName" runat="server" TabIndex="1" >
                    </asp:DropDownList>
                            <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                            </div>

                          <div class="col m4">
                            <span class="title">
                                                    <label>Issue Type<span class="required">*</span></label>
                                                   
                                                </span>
                    <asp:DropDownList ID="ddlIssueType" runat="server" TabIndex="2" >
                         <asp:ListItem Text="Technical Help" Value="Technical Help"></asp:ListItem>
                     <asp:ListItem Text="Billing & Payment" Value="Billing & Payment"></asp:ListItem>
                    </asp:DropDownList>
                            </div>

                          <div class="col m4">
                            <span class="title">
                                                    <label>Issue In<span class="required">*</span></label>
                                                </span>
                    <asp:DropDownList ID="ddlIssueIn" runat="server" TabIndex="3" >
                     <asp:ListItem Text="Android App" Value="Android App"></asp:ListItem>
                        <asp:ListItem Text="Mobile App" Value="Mobile App"></asp:ListItem>
                        <asp:ListItem Text="Web" Value="Web"></asp:ListItem>
                    </asp:DropDownList>
                            </div>

                    </div>
               
                <div class="row">
                      <div class="col m3">

                                <label><span class="title">Details</span><span class="required">*</span> </label>
                          
                                <asp:TextBox ID="txtDetails" class="form-control"  TabIndex="4" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDetails" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Details" ForeColor="Red"></asp:RequiredFieldValidator>
                              
                            </div>

                      <div class="col m3">
            <asp:FileUpload ID="FileUpReciept" runat="server" AllowMultiple="true" />
                               <asp:Label ID="Label2" runat="server" Text="(Format supported:jpeg,png,jpg)" ForeColor="Red"></asp:Label>
                           
        </div>
                                        <%-- <div class="col m3">
                                           <asp:Button ID="btnFileUpload" runat="server" Text="Upload File"  OnClick="btnFileUpload_Click" />
                                             </div>--%>

                                        <div class="col m3">
        <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
              </div>
                                    </div>

                                    
                   <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="6" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false"   ></asp:Button>
                                    </div>

                                    </div>
                                </div>
                         </div>
                </div>


   </div>

                 </div>
   
</asp:Content>
