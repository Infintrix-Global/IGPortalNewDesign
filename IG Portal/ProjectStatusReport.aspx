<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ProjectStatusReport.aspx.cs" Inherits="IG_Portal.ProjectStatusReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
      
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Project Status Report</h4>
                  <%--  <asp:Label ID="lbltitle" runat="server" Text="Project Status Report" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />
                <!-- END PAGE HEADER-->

                  <asp:UpdatePanel ID="upTask" runat="server">
                    <ContentTemplate>

                           <div class="portlet light ">

                    <div class="row">
                        <div class="col m12">
                            <div class="portlet light ">

                                <div class="row">
                                   <div class=" col m5">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    </div>
                                      <div class="clearfix"></div>
                                   
                                    <br />
                                    <div class="clearfix"></div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="portlet-body">
                                                <div class="table-scrollable">
                                                    <asp:GridView ID="GridProject" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        class="striped" OnSorting="GridProject_Sorting" AllowSorting="true" 
                                                        GridLines="None" OnRowCommand="GridProject_RowCommand" OnRowDataBound="GridProject_RowDataBound"
                                                        ShowHeaderWhenEmpty="True" Width="100%" OnPageIndexChanging="GridProject_PageIndexChanging" PageSize="20">
                                                        <Columns>
                                                           
                                                            <asp:TemplateField HeaderText="Sr. No."  HeaderStyle-CssClass="autostyle2" ItemStyle-Width="2%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                      <asp:Label ID="lblTID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Proposed Hours" HeaderStyle-CssClass="autostyle2" SortExpression="ProposedHours">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPtime" runat="server" Text='<%# Eval("ProposedHours")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Actual Task Hours" HeaderStyle-CssClass="autostyle2" SortExpression="ActualTaskHours">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("ActualTaskHours")   %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Actual TimeSpent" HeaderStyle-CssClass="autostyle2" SortExpression="ActualTimeSpent">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblATimespent" runat="server" Text='<%# Eval("ActualTimeSpent")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                           
                                                            <asp:TemplateField HeaderText="Time Difference" HeaderStyle-CssClass="autostyle2" SortExpression="TimeDifference">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("TimeDifference")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                              <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStatus" runat="server" ></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                              <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2" >
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkDetails" runat="server" Text="Details" CommandName="Details" CommandArgument='<%# Eval("ID")  %>' ></asp:LinkButton>
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
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
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
