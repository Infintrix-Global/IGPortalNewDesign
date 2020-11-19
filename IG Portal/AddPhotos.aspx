<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddPhotos.aspx.cs" Inherits="IG_Portal.AddPhotos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                                    <label>Event</label>
                                                  
                                                </span>
                                                </div>
                          </div>
                          <div class="col m6">
                               <div class="input-feild">
                                                <asp:DropDownList ID="ddlEvent" runat="server"  class="form-control" placeholder="" 
                                ClientIDMode="Static" ValidationGroup="e"></asp:DropDownList>
                                               
                                            </div>
                                        </div>
                    </div>
                <br />
                              <div class="clearfix"></div>
                    <div class="row">

                   <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Photos</label>
                                                   
                                                </span>
                                                </div>
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

                     </div>

                     <br />
              <div class="row" align="center">
                            <div class="col m6">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="10" class="btn " ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" />

                                </div>
                            </div>
                           <%-- <div class="col m6">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="11" class="btn blue" ClientIDMode="Static" OnClick="btclear_Click" />

                                </div>
                            </div>--%>

                        </div>

            

                </div>
            </div>
          
</asp:Content>
