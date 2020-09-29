<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewSupportTicket.aspx.cs" Inherits="IG_Portal.ViewSupportTicket" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 400px;
            height: 300px;
            border: 3px solid #0DA9D0;
        }
    </style>
    <script>
         function GetCommentConfirmation() {
                var reply = confirm("Are You Sure?");
                if (reply) {
                    return true;
                }
                else {
                    return false;
                }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="View Support Tickets" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
                <!-- END PAGE HEADER-->
  <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />

                <div class="row">

                  
                    <div class=" col m3">
                                <div class="form-group">
                                    <label>Project Name </label>
                                    <asp:DropDownList ID="ddlProjectName" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static" >
                                    </asp:DropDownList>


                                </div>
                            </div>

                    <div class=" col m3">
                                <div class="form-group">
                                    <label>Client Name </label>
                                    <asp:DropDownList ID="ddlClient" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static"  >
                                    </asp:DropDownList>


                                </div>
                            </div>

                   

                         <div class="col m3">
                                            <div class="form-group">
                                                    <label>Status </label>
                                                <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" >
                                                </asp:DropDownList>
                                                
                                            </div>
                                        </div>

                     
                    
                    </div>            
                <br />
                <div class="row" align="center">

                    <div class="col m12">
                        <div class="form-group form-md-line-input ">
                               <asp:Button ID="btSearch" runat="server" Text="Search" class="btn" ClientIDMode="Static" OnClick="btSearch_Click"  CausesValidation="true" />
                            <asp:Button ID="btclear" runat="server" Text="Clear" ClientIDMode="Static" OnClick="btclear_Click" class="btn blue" />
                        </div>
                    </div>

 
                    <div class="col m4">
                        <div class="form-group form-md-line-input ">
                         
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
         
                
                <div class="clearfix"></div>
                 <div class="row" align="rignt">
                 <asp:Label runat="server" Text="Click on Sr.No. to view history" Font-Size="Small" ID="lblHistory"></asp:Label>
                     </div>
                  
                    <div class="row">
                        <div class=" col m12">
                            <div class="portlet light ">
                                  <div class=" col m9">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    </div>
                                   
<%--                                    <div class="col m3">
                                        <button class="btn" runat="server" onserverclick="btnExport_Click"  id="btExport"><i class="fa fa-download"></i>Export</button>
                                        <%--<asp:Button ID="btnExport" Text="Export To Excel" runat="server" OnClick="btnExport_Click" /></div>
                                    </div>--%>
                                    <br />
                                <div class="portlet-body">
                                     <asp:Panel ID="panel1" runat="server" Height="100%" Width="100%" ScrollBars="Both">
                                         <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>--%>
                                    <div class="table-scrollable">
                                        <asp:GridView ID="GridSupport" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            class="striped" AllowSorting="true" OnPageIndexChanging="GridSupport_PageIndexChanging"
                                            GridLines="None" OnSorting="GridSupport_Sorting" PageSize="10"  DataKeyNames="ID"
                                            ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GridSupport_RowCommand"   >
                                            <Columns>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="5px" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkHistory" runat="server" Text="<%#Container.DataItemIndex + 1%>" CommandName="ViewHistory" CommandArgument='<%# Eval("ID")  %>' ForeColor="Blue" CssClass="font-timesheet" ToolTip="View History"></asp:LinkButton>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                         
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("ProjectName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Client Name" HeaderStyle-CssClass="autostyle2" SortExpression="ClientName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ClientName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Issue Type" HeaderStyle-CssClass="autostyle2" SortExpression="IssueType">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("IssueType")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Issue In" HeaderStyle-CssClass="autostyle2" SortExpression="IssueIn">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("IssueWith")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Details" HeaderStyle-CssClass="autostyle2" SortExpression="Details" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Details")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Created On" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("CreatedOn","{0:dd/MMM/yy}")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 

                                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" SortExpression="WorkDate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("StatusName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="File " HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkFile" runat="server" Text='<%# Eval("FileUrl")  %>' CommandArgument='<%# Eval("FileUrl")  %>' ForeColor="LightBlue" CommandName="Download" CssClass="font-timesheet"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                
                                                <asp:TemplateField HeaderText="Comment" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("LastComment")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                       

                                                <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnComment" runat="server" class="btn blue" Text="Comment"    CommandArgument='<%#Container.DataItemIndex %>' CommandName="Comment"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                            
                                                          

                                             

                                            </Columns>

                                            <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                                            <PagerSettings Mode="NumericFirstLast" />
                                            <EmptyDataTemplate>
                                                No Record Available
                                            </EmptyDataTemplate>
                                        </asp:GridView>



                                    </div>
                                         <%--   </ContentTemplate>
                                              </asp:UpdatePanel>--%>
                                         </asp:Panel>
                                </div>

                            </div>
                        </div>

                    </div>


             <asp:Button ID="btnShowreject" runat="server" Text="" Visible="true" Style="display: none" />
            <!-- ModalPopupExtender -->
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlppcomment" TargetControlID="btnShowreject"
                CancelControlID="Vpbtncancelreject" BackgroundCssClass="modalBackground" />

            <asp:Panel ID="pnlppcomment" runat="server" Style="display: none">

                <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup">
                    <table>
                        <tr>
                            <td>
                               
                                 <asp:Label ID="lblppSupportID" runat="server" Visible="false" > </asp:Label>
                                <asp:Label ID="lblComment" runat="server" Text="Comment"></asp:Label>
                            </td>
                           
                             <td>
                               
                               <asp:TextBox ID="txtppComment"  runat="server"></asp:TextBox>
                             
                                <asp:RequiredFieldValidator runat="server"
                                    ID="RequiredFieldValidator2"
                                    ControlToValidate="txtppComment" Text="Required"  ValidationGroup="r"
                                    ErrorMessage="Enter a Comment"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       <tr>
                            <td>
                               
                                <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                            </td>
                           
                             <td>
                               
                               <asp:DropDownList ID="ddlppStatus"  runat="server"></asp:DropDownList>
                             
                                <asp:RequiredFieldValidator runat="server"
                                    ID="RequiredFieldValidator1" InitialValue="0"
                                    ControlToValidate="ddlppStatus" Text="Required"  ValidationGroup="r"
                                    ErrorMessage="Select a Status"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr align="center">
                            <td></td>
                             <td>
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn blue" OnClick="btnsubmit_Click" ValidationGroup="r" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <div class="row" align="center">

                    <asp:Button ID="Vpbtncancelreject" CausesValidation="false" runat="server" Text="Cancel " Visible="true" BackColor="#c5484d" ForeColor="white" Height="29px" />

                </div>

            </asp:Panel>
            </div>
            </div>
         </div>
        
    
</asp:Content>
