<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDocuments.aspx.cs" Inherits="IG_Portal.EmployeeDocuments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
     <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Document Details</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Employee Document Details</a></div>
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
           <asp:UpdatePanel ID="upPDocs" runat="server">
                    <ContentTemplate>
                         <asp:Label ID="lblmsg" runat="server"></asp:Label>
               
                            <div class="row">
                            <div class="col-12">
                                <div class="card">
                                  <div class="card-body">
                                <h5>
                            <asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                             <div style="overflow-x:auto;width:100%">
                                    <asp:GridView ID="GridDocumentStatus" runat="server"  AutoGenerateColumns="False"
                                        class="table table-bordered"  OnPageIndexChanging="GridDocumentStatus_PageIndexChanging"
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
