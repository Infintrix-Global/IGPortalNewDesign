<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EventMaster.aspx.cs" Inherits="IG_Portal.EventMaster" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
         .block1 {
            height:100px;
            width:250px;
            border:1px solid aliceblue;
            overflow-y:scroll;
        }
    </style>
    <script type="text/javascript">
          function ValidateCheckBoxListAttendee(sender, args) {
              var checkBoxList = document.getElementById("<%=chkAttendee.ClientID %>");
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
       <div class="card-body">
        <div class="portlet-body">
             
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Add Event</h4>
                    <%--<asp:Label ID="lbltitle" runat="server" Text="Add News/Announcements" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />
               
                  
 <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <div class="row">

                     

                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Date</label>
                                                    <span class="required">*</span>
                                                </span>
                                                </div>
                          </div>
                          <div class="col m6">
                               <div class="input-feild">
                                                <asp:TextBox ID="txtDate" runat="server"  class="form-control" placeholder="" TextMode="Date"
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" ValidationGroup="e" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                              <div class="clearfix"></div>
                      <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Location</label>
                                                    <span class="required">*</span>
                                                </span>
                                                </div>
                          </div>
                          <div class="col m6">
                               <div class="input-field">
                                                <asp:TextBox ID="txtLocation" runat="server"  class="form-control" placeholder="" 
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLocation" ValidationGroup="e" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Location" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                              <div class="clearfix"></div>


                      <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Title</label>
                                                    <span class="required">*</span>
                                                </span>
                                                </div>
                          </div>
                          <div class="col m6">
                               <div class="input-field">
                                                <asp:TextBox ID="txtTitle" runat="server"  class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="txtTitle" ValidationGroup="e" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                              <div class="clearfix"></div>

                    <div class=" col m3">
                        <div class="form-group">
                            <span class="title">
                            <label>Description</label>
                                 <span class="required">*</span>
                                                </span>
                            </div>
                        </div>

                    <div class="col m9">
                         <div class="input-field">
                    
                           <CKEditor:CKEditorControl ID="CKEditor1" BasePath="~/Scripts/ckeditor/" runat="server" style="width: 792px; " >
   </CKEditor:CKEditorControl>
                           
                        </div>
                    </div>

                    
                              <div class="clearfix"></div>
                     <div class=" col m3">
                        <div class="form-group">
                            <span class="title">
                            <label>Attendees</label>
                                 <span class="required">*</span>
                                                </span>
                            </div>
                        </div>

                    <div class="col m6">
                                        <div class="input-field">
                                               <div class="select-wrapper initialized">
                            
                           <div class="block1">
                          
                              <asp:CheckBoxList ID="chkAttendee" RepeatLayout="OrderedList" runat="server"   TabIndex="9"/>
                        </div>
                                                       <span class="help-block">
                                       <asp:CustomValidator ID="CustomValidator2" ErrorMessage="Please select at least one attendee."
    ForeColor="Red" ClientValidationFunction="ValidateCheckBoxListAttendee" runat="server" ValidationGroup="e" />
                                                           </span>
                           
                                                   </div>
                                             
                         </div>
                        </div>
                     </div>

                     <br />
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

            

                </div>
            </div>
           </div>
</asp:Content>
