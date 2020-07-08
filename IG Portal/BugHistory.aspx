<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="BugHistory.aspx.cs" Inherits="IG_Portal.Bug_History" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Bug History" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
                <!-- END PAGE HEADER-->
  <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />
         <div class="row">
                        <div class=" col m12">
                            <div class="portlet light ">
                                  <div class=" col m9">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    </div>
                                   
                                    <div class="col m3">
                                        <button class="btn" runat="server" onserverclick="btnExport_Click"  id="btExport"><i class="fa fa-download"></i>Export</button>
                                        <%--<asp:Button ID="btnExport" Text="Export To Excel" runat="server" OnClick="btnExport_Click" /></div>--%>
                                    </div>
                                    <br />
                                <div class="portlet-body">
                                     <asp:Panel ID="panel1" runat="server" Height="100%" Width="100%" ScrollBars="Both">
                                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                    <div class="table-scrollable">
                                        <asp:GridView ID="GridBug" runat="server"  AutoGenerateColumns="False"
                                            class="striped" AllowSorting="true" 
                                            GridLines="None" OnSorting="GridBug_Sorting" PageSize="10"  DataKeyNames="ID"
                                            ShowHeaderWhenEmpty="True" Width="100%" >
                                            <Columns>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="2%" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                         
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Post By" HeaderStyle-CssClass="autostyle2" SortExpression="PostBy">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label25" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("TaskTitle")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Details" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("Detail")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="DateTime" HeaderStyle-CssClass="autostyle2" SortExpression="WorkDate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("DateTime","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                               
                                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("Status")  %>'></asp:Label>
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
                                            </ContentTemplate>
                                              </asp:UpdatePanel>
                                         </asp:Panel>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
         </div>
</asp:Content>
