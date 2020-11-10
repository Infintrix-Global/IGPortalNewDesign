<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewEvent.aspx.cs" Inherits="IG_Portal.ViewEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="card-body">
        <div class="portlet-body">
            
                <div class="row">
                    <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="count"></asp:Label>
                            <div class="portlet-body">
                                <div class="table-scrollable table-scrollable-borderless">
                                     <asp:GridView ID="GridEvent" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        class="striped" OnPageIndexChanging="GridEvent_PageIndexChanging"
                                        GridLines="None" OnRowDataBound="GridEvent_RowDataBound" OnSorting="GridEvent_Sorting"
                                         OnRowCommand="GridEvent_RowCommand"
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="autostyle2" SortExpression="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Date")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Location" HeaderStyle-CssClass="autostyle2" SortExpression="Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Location")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Title")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                             <asp:TemplateField HeaderText="Description" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description")  %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Attendee" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("AttendeeList")  %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                               

                                              <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2"  SortExpression="IsActive">
                                                <ItemTemplate>
                                                     <asp:Label ID="lblStatus" runat="server"  Text='<%# Eval("IsActive")  %>' visible="false" ></asp:Label>
                                                    <asp:Label ID="lblStatusName" runat="server"   ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                              <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="lnkEdit" Text="Edit" runat="server" CommandName="Edit"  CommandArgument='<%# Eval("ID")  %>' ImageUrl="~/images/edit.png" AlternateText="edit" ToolTip="edit"  />
                                                                </ItemTemplate>
                                                               </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Remove" AlternateText="delete"   ></asp:ImageButton>
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
            </div>
        </div>
</asp:Content>
