<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDocuments.aspx.cs" Inherits="IG_Portal.EmployeeDocuments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">
             <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Employee Document</h4>
                  <%--  <asp:Label ID="lbltitle" runat="server" Text="Employee Document" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />
               
                   <asp:UpdatePanel ID="upPDocs" runat="server">
                    <ContentTemplate>
                         <asp:Label ID="lblmsg" runat="server"></asp:Label>
               

                <div class="row">
                    <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="count"></asp:Label>
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <asp:GridView ID="GridDocumentStatus" runat="server"  AutoGenerateColumns="False"
                                        class="striped"  OnPageIndexChanging="GridDocumentStatus_PageIndexChanging"
                                        GridLines="None" AllowPaging="true"
                                        ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GridDocumentStatus_RowCommand">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Employee Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="Label7" ForeColor="Blue" runat="server" Text='<%# Eval("EmployeeName")  %>' CommandName="ViewDocs" CommandArgument='<%# Eval("ID")  %>'></asp:LinkButton> 
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                               <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Status")  %>'></asp:Label>
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
            </div>
        </div>
    </div>
</asp:Content>
