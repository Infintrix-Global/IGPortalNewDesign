<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="InfraSupport.aspx.cs" Inherits="IG_Portal.InfraSupport" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Support</h4>
                         <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    <asp:UpdatePanel ID="up1" runat="server">
                                        <ContentTemplate>

                                     
                        <div id="Asset" runat="server" >
                                        <div class="row" align="center">
                                           <div class="col m4" >
                             <div class="input-field">
                                  <div class="select-wrapper initialized">
                                  <asp:DropDownList ID="ddlAssetName" runat="server" TabIndex="1" OnSelectedIndexChanged="ddlAssetName_SelectedIndexChanged" AutoPostBack="true" >
                    </asp:DropDownList>
                            <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlAssetName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Asset Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                      </div>
                                               
                                                    <label>Asset Name</label>
                                                   </div>
                                               </div>
                                            <div class="clearfix"></div>
                                            <asp:Label ID="lbldetails" runat="server"></asp:Label>
                                            </div>
                                            
          <div class="clearfix"></div>
                                           <div class="row" >
                                       
                                         <div class="col m2">
                                        <asp:Button ID="btnAssetNext" runat="server" CssClass="btn" OnClick="btnAssetNext_Click" Text="Next" ValidationGroup="at" />
                                        </div>
                                            </div>
                                    </div>

                     


               <div id="Details" runat="server" visible="false">
                <div class="row" align="center">
                         <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                  
                                              
                                                
                                                <asp:RadioButtonList ID="radPriority"  runat="server" class="form-control" TabIndex="8" RepeatDirection="Horizontal">
                                                    <asp:ListItem Text="High Priority" Value="High Priority" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Medium Priority" Value="Medium Priority"></asp:ListItem>
                                                    <asp:ListItem Text="Low Priority" Value="Low Priority"></asp:ListItem>

                                                </asp:RadioButtonList>
                                               
                                            </div>
                                                <label>Priority</label>
                                        </div>
                             </div>

                    <div class="clearfix"></div>
                      <div class="col m8">
                            <div class="input-field">
                                                <div class="select-wrapper initialized">
                                                       <CKEditor:CKEditorControl ID="CKEditor1" BasePath="~/Scripts/ckeditor/" runat="server" style="width: 700px; " >
   </CKEditor:CKEditorControl>
                                <%--<asp:TextBox ID="txtDetails" class="form-control"  TabIndex="4" runat="server" TextMode="MultiLine" Height="150px" Width="450px"></asp:TextBox>--%>
                                                     <span class="help-block">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CKEditor1" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Details" ForeColor="Red"></asp:RequiredFieldValidator>
                                                         </span>
                              </div>
                                <label>Details</label>
                          </div>
                         </div>
                  
                    </div>
                     <div class=" clearfix"></div>
                   
                    <div class="clearfix"></div>
                    <div class="row">
                   
                     <div class="col m6">
                                                 <asp:Button ID="btnDetailsPrev" runat="server" CssClass="btn blue" OnClick="btnDetailsPrev_Click"   Text="Prev" />
                                            
                                        </div>
                                         <div class="col m2">
                                          <asp:Button ID="btnDetailsNext" runat="server" CssClass="btn " OnClick="btnDetailsNext_Click" Text="Submit" ValidationGroup="e"  CausesValidation="true"/>
                                        </div>
                                    </div>
                   </div>
                   </div>
                     </ContentTemplate>
                                    </asp:UpdatePanel>
                    </div>
                                </div>
                             </div>
                   
                </div>
            </div>
            </div>
        </div>
</asp:Content>
