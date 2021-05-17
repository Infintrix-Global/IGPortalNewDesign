<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EventMaster.aspx.cs" Inherits="IG_Portal.EventMaster" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
         .block1 {
            height:100px;
            width:450px;
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
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Event</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Event</a></div>
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
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Add Event</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Date<span class="required">*</span></label>
                                <asp:TextBox ID="txtDate" runat="server"  class="form-control" placeholder="" TextMode="Date"
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" ValidationGroup="e" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                   <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Location<span class="required">*</span></label>
                                   <asp:TextBox ID="txtLocation" runat="server"  class="form-control" placeholder="" 
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLocation" ValidationGroup="e" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Location" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                     <div class=" col-sm-6 form-group" style="margin-top:-20px">
                               <label class="col-sm-6 col-form-label">Title<span class="required">*</span></label>
                                 <asp:TextBox ID="txtTitle" runat="server"  class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="txtTitle" ValidationGroup="e" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                    <div class=" col-sm-6 form-group" style="margin-top:-20px">
                               <label class="col-sm-6 col-form-label">Attendees<span class="required">*</span></label>
                              <div class="block1">
                          
                              <asp:CheckBoxList ID="chkAttendee" RepeatLayout="OrderedList" runat="server"   TabIndex="9" CssClass="form-control"/>
                        </div>
                                        <span class="help-block">
                                       <asp:CustomValidator ID="CustomValidator2" ErrorMessage="Please select at least one attendee."
    ForeColor="Red" ClientValidationFunction="ValidateCheckBoxListAttendee" runat="server" ValidationGroup="e" />
                                                           </span>
                               
                                        </div>
                                <div class=" col-sm-12 form-group" style="margin-top:-20px">
                               <label class="col-sm-6 col-form-label">Description<span class="required">*</span></label>
                             <CKEditor:CKEditorControl ID="CKEditor1" BasePath="~/Scripts/ckeditor/" runat="server" style="width: 792px; " >
                            </CKEditor:CKEditorControl>
                           
                        </div>
                          </div>                   
                         <div runat="server" id="photo" visible="false">
                    <div class="clearfix"></div>
                      <div class=" col m3">
                        <div class="form-group">
                            <span class="title">
                            <label>Photos</label>
                                </span>
                            </div>
                        </div>


                    <div class="col m6">
                              <asp:DataList ID="DataListGallery" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%"
                                        CellPadding="2" CellSpacing="0">
                                        <HeaderTemplate>
                                          
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                             <asp:Label ID="lblFilePath" runat="server" Text='<%# Eval("Text") %>' Visible="false"></asp:Label>
                                            <asp:Image ID="Image1" ImageUrl='<%# Eval("Value") %>'  runat="server" Height="100"
                                                Width="100" />

                                        </ItemTemplate>
                                    </asp:DataList>
                    </div>
                        </div>
                     </div>

                     <br />
               <div class="form-group row" style="margin-top:-40px;">
                         <div class="col-sm-4"></div>
                         <div class="col-sm-2">
                         <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="10" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" style="width:130px"/>

                                </div>
                            <div class="form-group row">
                         <div class="col-sm-3"></div>
                         <div class="col-sm-2">
                          <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="11" class="btn btn-outline-info" ClientIDMode="Static" OnClick="btclear_Click" style="width:130px;margin-left:-30px"/>

                                </div>
                            </div>

                        </div>

            

                </div>
            </div>
           </div>
</asp:Content>
