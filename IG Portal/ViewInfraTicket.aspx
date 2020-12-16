<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewInfraTicket.aspx.cs" Inherits="IG_Portal.ViewInfraTicket" %>
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

          .modalPopup1 {
            background-color: #FFFFFF;
            width: 400px;
            height: 500px;
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

     <script type="text/javascript">
         function DateTimeValidation(sender, args) {
             var start = document.getElementById("<%=txtSTime.ClientID %>").value;
                    var end = document.getElementById("<%=txtETime.ClientID %>").value;
                    var date1 = new Date();
                    var startTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + start);

                    var endTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + end);


                    if (startTime >= endTime) {
                        args.IsValid = false;
                    }

                }

                function DateTime12Validation(sender, args) {
                    var start = document.getElementById("<%=txtSTime.ClientID %>").value;
                     var end = document.getElementById("<%=txtETime.ClientID %>").value;
             var date1 = new Date();
             var startTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + start);

             var endTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + end);


             var diff = (endTime.getTime() - startTime.getTime()) / 1000;
             diff /= (60 * 60);

             if (diff > 12) {
                 args.IsValid = false;
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
                    <h4 class="header2">View Support Tickets</h4>
                  <%--  <asp:Label ID="lbltitle" runat="server" Text="View Support Tickets" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />
                <!-- END PAGE HEADER-->
  <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />
                <asp:UpdatePanel ID="up1" runat="server">
                    <ContentTemplate>

                <div class="row">

                      <div class=" col m3"> <div class="input-field">
                                                <div class="select-wrapper initialized">
                                    
                                    <asp:DropDownList ID="ddlClient" runat="server" class="form-control" placeholder="" OnSelectedIndexChanged="ddlClient_SelectedIndexChanged"
                                        ClientIDMode="Static"  >
                                    </asp:DropDownList>
</div>
                                                    <label>Client Name </label>

                                </div>
                            </div>

                    <div class=" col m3">
                                <div class="input-field">
                                                <div class="select-wrapper initialized">
                                
                                    <asp:DropDownList ID="ddlAssetName" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static" >
                                    </asp:DropDownList>
</div>
                                        <label>Asset Name </label>

                                </div>
                            </div>

      <div class="col m3">
                                           <div class="input-field">
                                                <div class="select-wrapper initialized">
                                                    
                                                <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" >
                                                </asp:DropDownList>
                                                </div>
                                               <label>Status </label>
                                            </div>
                                        </div>

                       </div> 
                    </ContentTemplate>
                </asp:UpdatePanel>
                    
                             
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
                                            ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GridSupport_RowCommand"    >
                                            <Columns>
                                             

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="5px" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkHistory" runat="server" Text="<%#Container.DataItemIndex + 1%>" CommandName="ViewHistory" CommandArgument='<%# Eval("ID")  %>' ForeColor="Blue" CssClass="font-timesheet" ToolTip="View History"></asp:LinkButton>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                         
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Ticket No." HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("OEMTicketNo")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Client Name" HeaderStyle-CssClass="autostyle2" SortExpression="ClientName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("ClientName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                   <asp:TemplateField HeaderText="Asset Name" HeaderStyle-CssClass="autostyle2" SortExpression="AssetName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("AssetName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Asset Number" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("AssetNummber")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Priority" HeaderStyle-CssClass="autostyle2" SortExpression="Priority">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("Priority")  %>' CssClass="font-timesheet"></asp:Label>
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

                                                 

                                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" SortExpression="StatusName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("StatusName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                             
                                                
                                                <asp:TemplateField HeaderText="Engineer " HeaderStyle-CssClass="autostyle2" SortExpression="EngineerName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl3" runat="server" Text='<%# Eval("EngineerName")  %>'   CssClass="font-timesheet"></asp:Label>
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
                                                            
                                                          <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkWorkLog" runat="server" Text="Add Work Log"    CommandArgument='<%#Eval("ID")  %>' CommandName="WorkLog"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField> 
                                               
                                              <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkVWorkLog" runat="server" Text="View Work Log"    CommandArgument='<%#Eval("ID")  %>' CommandName="ViewWorkLog"></asp:LinkButton>
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


                      <asp:Button ID="btnShow" runat="server" Text="" Visible="true" Style="display: none" />
                  <!-- ModalPopupExtender -->
    <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="pnlpp" TargetControlID="btnShow"
        CancelControlID="Vpbtncancel" BackgroundCssClass="modalBackground" />
    
              <asp:Panel ID="pnlpp" runat="server" Style="display: none" >
                                                              
                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup1">
                                                                <table >
                                                                    <tr>
                                                                        <td>
                                                                             <asp:Label ID="lblSupportID" runat="server"  Visible="false"> </asp:Label>
                                                                            <asp:Label ID="lblDetails" runat="server" Text="Details"></asp:Label>
                                                                        </td>
                                                                         <td>
                                                                            <asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                                             <asp:RequiredFieldValidator runat="server"
                                    ID="RequiredFieldValidator4"
                                    ControlToValidate="txtDetails" Text="Required"  ValidationGroup="w"
                                    ErrorMessage="Enter Details"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblSTime" runat="server" Text="Start Time"></asp:Label>
                                                                        </td>
                                                                         <td>
                                                                            <asp:TextBox ID="txtSTime" runat="server" TextMode="Time"  ></asp:TextBox>
                                                                             <asp:RequiredFieldValidator runat="server"
                                    ID="RequiredFieldValidator5"
                                    ControlToValidate="txtSTime" Text="Required"  ValidationGroup="w"
                                    ErrorMessage="Enter Start Time"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblETime" runat="server" Text="End Time"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtETime" runat="server" TextMode="Time"  ></asp:TextBox>
                                                                             <asp:RequiredFieldValidator runat="server"
                                    ID="RequiredFieldValidator6"
                                    ControlToValidate="txtETime" Text="Required"  ValidationGroup="w"
                                    ErrorMessage="Enter End Time"></asp:RequiredFieldValidator>
                                                                               <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="End Time should be greater than Start Time"
                                                    ForeColor="Red" ControlToValidate="txtETime" Display="Dynamic" ClientValidationFunction="DateTimeValidation" ValidationGroup="at"></asp:CustomValidator>
                                                 <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Difference between End Time and Start Time shoud be less than 12 hours"
                                                    ForeColor="Red" ControlToValidate="txtETime" Display="Dynamic" ClientValidationFunction="DateTime12Validation" ValidationGroup="at"></asp:CustomValidator>
                                                                        </td>
                                                                        </tr>
                                                                    <tr>
                                                                        <td>
                               
                                <asp:Label ID="lblwsStatus" runat="server" Text="Status"></asp:Label>
                            </td>
                                                                                                                     
                             <td>
                               
                               <asp:DropDownList ID="ddlwsStatus"  runat="server"></asp:DropDownList>
                             
                                <asp:RequiredFieldValidator runat="server"
                                    ID="RequiredFieldValidator3" InitialValue="0"
                                    ControlToValidate="ddlppStatus" Text="Required"  ValidationGroup="w"
                                    ErrorMessage="Select a Status"></asp:RequiredFieldValidator>
                            </td>
                                                                    </tr>
                                                                    <tr align="center">
                                                                       <td></td>
                                                                        <td>
                                                                            <asp:Button ID="btnWLsubmit" runat="server" Text="Submit" OnClick="btnWLsubmit_Click" />
                                                                        </td>

                                                                    </tr>
                                                                </table>
                        </asp:Panel>
                    <div class="row" align="center">
                    
                   <asp:Button ID="Vpbtncancel" CausesValidation="false" runat="server" Text="Cancel " Visible="true" BackColor="#c5484d" ForeColor="white" Height="29px" />
                   
                </div>

                                                            </asp:Panel>
          
            </div>
            </div>
</asp:Content>
