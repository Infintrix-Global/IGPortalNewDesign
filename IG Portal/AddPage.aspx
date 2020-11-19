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
                    <h4 class="header2">Add Page</h4>
                   <%-- <asp:Label ID="lbltitle" runat="server" Text=" Add Page" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />
               
                   <asp:UpdatePanel ID="upProject" runat="server">
                    <ContentTemplate>
 <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <div class="row">

                      <div class="col m3">
                                            <div class="input-field">
                                                <div class="select-wrapper initialized">
                                                  
                                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                    </div>
                                                  <label>Project Name </label>
                                                   
                                            </div>
                                        </div>


                    <div class=" col m3">
                        <div class="input-field">
                                                <div class="select-wrapper initialized">
                           
                          
                                
                            <asp:TextBox ID="txtPageName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                  <span class="help-block">
                            <asp:RequiredFieldValidator ID="requiredPage" runat="server" ControlToValidate="txtPageName" ErrorMessage="Please Enter Page Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
</span>
                                                    </div>
                              <label>Page Name</label>
                                
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
                          <div class="col m2">
                                <div class="form-group form-md-line-input ">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn green" ClientIDMode="Static" OnClick="btnSearch_Click" />

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
                                        GridLines="None"  OnRowCancelingEdit="GridPage_RowCancelingEdit" OnRowCommand="GridPage_RowCommand"
                                         OnRowEditing="GridPage_RowEditing" OnRowUpdating="GridPage_RowUpdating"
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                     <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
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
                                                    <EditItemTemplate>
                                                    <asp:TextBox ID="txtPageName" runat="server" Text='<%# Eval("PageName")  %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                              <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <%--<asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" /> --%>
                                                            <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Edit" ImageUrl="~/images/edit.png" AlternateText="edit" ToolTip="edit" ></asp:ImageButton>

                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                                                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>

                                                            <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Remove" ImageUrl="~/images/delete.png" AlternateText="delete" ToolTip="delete" OnClientClick="return confirm('Are you sure you want to remove this page?');"></asp:ImageButton>
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
