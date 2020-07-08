<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddTaskMaster.aspx.cs" Inherits="IG_Portal.AddTask" %>
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


                        <a href="AddTaskMaster.aspx">Add Task Type</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>--%>
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Add Task" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
               
                   <asp:UpdatePanel ID="upProject" runat="server">
                    <ContentTemplate>
                         <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <div class="row">
                    <div class=" col m3">
                        <div class="form-group">
                            <label>Task Name</label>
                            <asp:TextBox ID="txtTaskName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requiredTask" runat="server" ControlToValidate="txtTaskName" ErrorMessage="Please Enter Task Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>

                        </div>
                    </div>

                    <div class="col m2">
                        <div class="form-group form-md-line-input ">

                          

                                <asp:Button ID="btAdd" runat="server" Text="Add" class="btn blue" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" />


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
                                <div class="table-scrollable">
                                    <asp:GridView ID="GridTask" runat="server"  AutoGenerateColumns="False"
                                        class="striped" OnPageIndexChanging="GridTask_PageIndexChanging"
                                        GridLines="None" AllowPaging="true"
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Task Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("TaskName")  %>'></asp:Label>
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
