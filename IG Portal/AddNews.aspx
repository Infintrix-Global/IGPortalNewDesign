<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="IG_Portal.AddNews" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
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
      <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add News/Announcement</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">News/Announcement</a></div>
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
                       
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                 <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Add News/Announcements</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-4 form-group">
                               <label class="col-sm-6 col-form-label">Project Name <span class="required">*</span></label>
                              <asp:RadioButtonList ID="radType" runat="server" RepeatDirection="Horizontal" CssClass="form-control rb1">
                                                   <asp:ListItem Text="News" Value="News" Selected="True"></asp:ListItem>
                                                   <asp:ListItem Text="Announcement" Value="Announcement" ></asp:ListItem>
                                               </asp:RadioButtonList>
                                               
                                        </div>
                                <div class=" col-sm-4 form-group">
                               <label class="col-sm-6 col-form-label">Date<span class="required">*</span></label>
                                            <asp:TextBox ID="txtDate" runat="server"  class="form-control" placeholder="" TextMode="Date"
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" ValidationGroup="e" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                     <div class=" col-sm-4 form-group">
                               <label class="col-sm-6 col-form-label">Title<span class="required">*</span></label>
                              <asp:TextBox ID="txtTitle" runat="server"  class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="txtTitle" ValidationGroup="e" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        
                                 <div class=" col-sm-12 form-group" style="margin-top:-30px">
                               <label class="col-sm-6 col-form-label">Description<span class="required">*</span></label>
                                <CKEditor:CKEditorControl ID="CKEditor1" BasePath="~/Scripts/ckeditor/" runat="server" style="width: 792px; " >
                                </CKEditor:CKEditorControl>
                           
                        </div>
                    </div>
                      <div class="form-group row">
                         <div class="col-sm-4"></div>
                         <div class="col-sm-2">
                         <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="10" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" style="width:130px"/>
                        </div>
                        <div class="col-sm-2">
                          <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="11" class="btn btn-outline-info" ClientIDMode="Static" OnClick="btclear_Click" style="width:130px;margin-left:-20px"/>
                        </div>
                         </div>

            

                </div>
            </div>
           </div>
                     </div>
</asp:Content>
