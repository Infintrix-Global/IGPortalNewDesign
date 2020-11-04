<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ClientSupport.aspx.cs" Inherits="IG_Portal.ClientSupport" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script type="text/javascript">
    function UploadFile(fileUpload) {
        if (fileUpload.value != '') {
            document.getElementById("<%=btnUpload.ClientID %>").click();
        }
    }
     </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Support</h4>
                <%--    <asp:Label ID="lbltitle" runat="server" Text="Support" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />

                     <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                   <%-- <asp:UpdatePanel ID="up1" runat="server">
                                        <ContentTemplate>--%>

                                    
                                    <div id="IssueType" runat="server">
                                          <div class="row " align="center">

                            <div class="col m6">
                                <asp:Button ID="techHelp" CssClass="btn " runat="server" Text="Technical Help" OnCommand="techHelp_Command" CommandName="techHelp" />

                            </div>
                            <div class="col m6">
                                <asp:Button ID="BnP" class="btn" runat="server" Text="Billing & Payment" CommandName="BnP" OnCommand="techHelp_Command" />

                            </div>
                            <%-- <div class="col m4">
                                <asp:Button ID="courier" class="btn" runat="server" Text="COURIER" CommandName="Courier" OnCommand="imgVisitor_Command" />

                            </div>--%>
                        </div>
                        <div class="clearfix"></div>
                                           <div class="col m4" runat="server" visible="false">
                            <span class="title">
                                                    <label>Issue Type<span class="required">*</span></label>
                                                   
                                                </span>
                    <asp:DropDownList ID="ddlIssueType" runat="server" TabIndex="2" >
                         <asp:ListItem Text="Technical Help" Value="Technical Help"></asp:ListItem>
                     <asp:ListItem Text="Billing & Payment" Value="Billing & Payment"></asp:ListItem>
                    </asp:DropDownList>
                            </div>
                                    </div>

                                    <div id="Project" runat="server" visible="false">
                                        <div class="row" align="center">
                                           <div class="col m4" >
                             <div class="input-field">
                                  <div class="select-wrapper initialized">
                                  <asp:DropDownList ID="ddlProjectName" runat="server" TabIndex="1" >
                    </asp:DropDownList>
                            <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                      </div>
                                               
                                                    <label>Project Name</label>
                                                   </div>
                                               </div>
                                            </div>
                                            
          <div class="clearfix"></div>
                                           <div class="row" >
                                        <div class="col m10">
                                                <asp:Button ID="btnProjectPrev" CssClass="btn blue" runat="server" OnClick="btnProjectPrev_Click" Text="Prev" />
                                            
                                        </div>
                                         <div class="col m2">
                                        <asp:Button ID="btnProjectNext" runat="server" CssClass="btn" OnClick="btnProjectNext_Click" Text="Next" />
                                        </div>
                                            </div>
                                    </div>

                                    <div id="IssueIn" runat="server" visible="false">
                                        <div class="row" align="center">
                                            <div class="col m4">
                              <div class="input-field">
                                                <div class="select-wrapper initialized">
                                                     <asp:DropDownList ID="ddlIssueIn" runat="server" TabIndex="3" >
                     <asp:ListItem Text="Android App" Value="Android App"></asp:ListItem>
                        <asp:ListItem Text="Mobile App" Value="Mobile App"></asp:ListItem>
                        <asp:ListItem Text="Web" Value="Web"></asp:ListItem>
                    </asp:DropDownList>
                                                    </div>
                                                    <label>Issue In</label>
                                              </div>
                                               
                                                </div>
                                          
                                            </div>
                                            <div class="clearfix"></div>
                                        <div class="row">
                                           <div class="col m10">
                                                 <asp:Button ID="btnIssueInPrev" CssClass="btn blue" runat="server" OnClick="btnIssueInPrev_Click" Text="Prev" />
                                            
                                        </div>
                                         <div class="col m2">
                                          <asp:Button ID="btnIssueInNext" CssClass="btn " runat="server" OnClick="btnIssueInNext_Click" Text="Next" />
                                        </div>
                                            </div>
                                    </div>
               
               <div id="Details" runat="server" visible="false">
                <div class="row" align="center">
                      <div class="col m4">
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
                    <div class="row" align="center">
                      <div class="col m8">
            <asp:FileUpload ID="FileUpReciept" runat="server"  ClientIDMode="Static" />
                               <asp:Label ID="Label2" runat="server" Text="(Format supported:jpeg,png,jpg)" ></asp:Label>
                           
        </div>
                                        <%-- <div class="col m3">
                                           <asp:Button ID="btnFileUpload" runat="server" Text="Upload File"  OnClick="btnFileUpload_Click" />
                                             </div>--%>

                                        <div class="col m3">
                                         <%--    <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />--%>
        <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
              </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                   
                     <div class="col m10">
                                                 <asp:Button ID="btnDetailsPrev" runat="server" CssClass="btn blue" OnClick="btnDetailsPrev_Click" Text="Prev" />
                                            
                                        </div>
                                         <div class="col m2">
                                          <asp:Button ID="btnDetailsNext" runat="server" CssClass="btn " OnClick="btnDetailsNext_Click" Text="Next" ValidationGroup="e"  CausesValidation="true"/>
                                        </div>
                                    </div>
                   </div>

                                    <div id="Summary" runat="server" visible="false">
                                        <div class="row">
                                                <div class="col m12" align="center" id="image" runat="server" visible="false"> 

                                                    <asp:Image ID="Simage" runat="server" Height="80px" Width="80px" GenerateEmptyAlternateText="True" />
                                                    <br />
                                                </div>
                                            </div>

                                          <div class="row">
                                                <div class="col-md-12">
                                                    <table style="width: 100%;">
                                                        
                                                        <tr style="width: 100%;">
                                                            <td style="width: 100%;">Issue Type :
                                            <asp:Label ID="SIssueType" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                                            </tr>
                                                          <tr style="width: 100%;">
                                                            <td style="width: 100%;">Project Name :
                                            <asp:Label ID="SProjectName" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>

                                                               </tr>
                                                          <tr style="width: 100%;">
                                                            <td style="width: 100%;">Issue In :
                                            <asp:Label ID="SIssueIn" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                                                               </tr>
                                                          <tr style="width: 100%;">
                                                            
                                                            <td style="width: 100%;">Details :
                                            <asp:Label ID="SDetails" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>

                                                           
                   <div class="row" align="center">
                       <asp:Button ID="btnEdit" runat="server" Text="Edit" ClientIDMode="Static" OnClick="btnEdit_Click"  CssClass="btn blue" />
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="6" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false"   ></asp:Button>
                                    </div>

                                    </div>
                      <%--   </ContentTemplate>
                                    </asp:UpdatePanel>--%>
                                    </div>
                                </div>
                         </div>
                </div>


   </div>

                 </div>
   
</asp:Content>
