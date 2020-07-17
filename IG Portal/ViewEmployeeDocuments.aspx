<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewEmployeeDocuments.aspx.cs" Inherits="IG_Portal.ViewEmployeeDocuments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">
             <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Employee Document" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
               
                         <asp:Label ID="lblmsg" runat="server"></asp:Label>
               

                <div class="row">
                    <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="count"></asp:Label>
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <asp:GridView ID="GridDocument" runat="server"  AutoGenerateColumns="False"
                                        class="striped"  DataKeyNames="DocumentID"
                                        GridLines="None"  OnRowDataBound="GridDocument_RowDataBound"
                                        ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GridDocument_RowCommand">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Document Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("DocumentName")  %>' ></asp:Label> 
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                               <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDwnld" ForeColor="Blue" runat="server" Text='<%# Eval("FileName")  %>' CommandName="Download" CommandArgument='<%# Eval("FileName")  %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                   <asp:FileUpload ID="FileupDocs" runat="server" EnableViewState="true" />
                                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CommandArgument="<%# Container.DataItemIndex%>" CommandName="Upload" />
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
    </div>
</asp:Content>
