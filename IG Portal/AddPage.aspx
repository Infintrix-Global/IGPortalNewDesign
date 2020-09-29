<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddPage.aspx.cs" Inherits="IG_Portal.AddPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
      <div class="card-body">
        <div class="portlet-body">
             <%--<div class="page-bar" >
                <ul class="page-breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="AdminDashBoard.aspx">Home</a>
                        <i class="fa fa-angle-right"></i>


                        <a href="AddProject.aspx">Add Project</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>--%>
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text=" Add Page" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
               
                   <asp:UpdatePanel ID="upProject" runat="server">
                    <ContentTemplate>
 <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <div class="row">

                      <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Project Name </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>


                    <div class=" col m3">
                        <div class="form-group">
                            <span class="title">
                            <label>Page Name</label>
                                 <span class="required">*</span>
                                                </span>
                            <asp:TextBox ID="txtPageName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requiredPage" runat="server" ControlToValidate="txtPageName" ErrorMessage="Please Enter Page Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>

                        </div>
                    </div>

                    <div class="col m2">
                        <div class="form-group form-md-line-input ">

                          

                                <asp:Button ID="btAdd" runat="server" Text="Add" class="btn " ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" />


                        </div>
                    </div>
                    <div class="col m2">
                        <div class="form-group form-md-line-input ">

                           
                                <asp:Button ID="btclear" runat="server" Text="Clear" class="btn blue" ClientIDMode="Static" OnClick="btclear_Click" />


                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="count"></asp:Label>
                            <div class="portlet-body">
                                <div class="table-scrollable table-scrollable-borderless">
                                    <asp:GridView ID="GridPage" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        class="striped" OnPageIndexChanging="GridPage_PageIndexChanging"
                                        GridLines="None" 
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Page Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("PageName")  %>'></asp:Label>
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
