<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="temp.aspx.cs" Inherits="IG_Portal.temp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
      <div class="card-body">
        <div class="portlet-body">
             
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Notifications" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
     <asp:TabContainer ID="tabcontainer1" runat="server"  AutoPostBack="true" ActiveTabIndex="0">

                      <asp:TabPanel ID="NotificationMOM" runat="server" HeaderText="MOM" TabIndex="0">

                        <ContentTemplate>
                   <asp:UpdatePanel ID="upNotificationMOM" runat="server">
                    <ContentTemplate>
                         <asp:Label ID="lblmsg1" runat="server"></asp:Label>
               
                <div class="row">
                    <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="count1"></asp:Label>
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <asp:GridView ID="GridNotificationMOM" runat="server"  AutoGenerateColumns="False"
                                        class="striped"  OnPageIndexChanging="GridNotificationMOM_PageIndexChanging"
                                        GridLines="None" AllowPaging="true" OnSorting="GridNotificationMOM_Sorting"
                                         PageSize="10"
                                        ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GridNotificationMOM_RowCommand" DataKeyNames="ID">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("Type")  %>' Visible="false"></asp:Label>
                                                     <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="DateTime" HeaderStyle-CssClass="autostyle2" SortExpression="NotificationDateTime">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("NotificationDateTime")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                               <asp:TemplateField HeaderText="Message" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Messsage")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2" >
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnConfirm" runat="server"  Text="Confirm" Visible="false" OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Confirm"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                               <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnReject" runat="server"  Text="Reject" Visible="false"  OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Reject"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                               <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2"  >
                                                        <ItemTemplate>
                                                            <asp:DropdownList ID="ddlDeveloper" runat="server"   Visible="false"   ></asp:DropdownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                              <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnAssign" runat="server"  Text="Assign" Visible="false" OnClientClick="return GetApproveConfirmation();"  CommandArgument='<%# Container.DataItemIndex  %>' CommandName="Assign"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                             <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnDetails" runat="server"  Text="Details" Visible="false"  CommandArgument='<%# Eval("BugID")  %>' CommandName="Details"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                               <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2" >
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnClosed" runat="server"  Text="Close" Visible="false" OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Close"></asp:Button>
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
                            </div>

                        </div>
                    </div>

                </div>

                           </ContentTemplate>
                </asp:UpdatePanel>

                            </ContentTemplate>
                          </asp:TabPanel>
         
                     </asp:TabContainer>
            </div>
        </div>
    </div>
</asp:Content>
