<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewNews.aspx.cs" Inherits="IG_Portal.ViewNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>View News/Announcement</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">View News</a></div>
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
                          
    
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>News Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                      <asp:GridView ID="GridNews" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        class="table table-bordered" OnPageIndexChanging="GridNews_PageIndexChanging"
                                        GridLines="None" OnRowDataBound="GridNews_RowDataBound" OnSorting="GridNews_Sorting"
                                         OnRowCommand="GridNews_RowCommand"
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                 
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="autostyle2" SortExpression="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Date","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="autostyle2" SortExpression="Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Type")  %>'></asp:Label>
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

                                               

                                              <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2"  SortExpression="IsActive">
                                                <ItemTemplate>
                                                     <asp:Label ID="lblStatus" runat="server"  Text='<%# Eval("IsActive")  %>' visible="false" ></asp:Label>
                                                    <asp:Label ID="lblStatusName" runat="server" style="font-weight:bold"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                              <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CommandName="Edit"  CommandArgument='<%# Eval("ID")  %>'  AlternateText="edit" ToolTip="edit" class="btn btn-dark"><i class="fas fa-edit"></i></asp:LinkButton>
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
</asp:Content>
