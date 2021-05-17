<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddTaskMaster.aspx.cs" Inherits="IG_Portal.AddTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
      <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Task</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#">Task Details</a></div>
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
    
                    
                  
                   <asp:UpdatePanel ID="upProject" runat="server">
                    <ContentTemplate>
                         <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        <div class="section-body">
                          <div class="row">
                          <div class="card-body">
                            <!-- BEGIN FORM-->
                                <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Add Task</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                                <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Department Name</label>
                                               
                                <asp:DropDownList ID="ddlDepartment" runat="server" class="form-control" placeholder=""
                                           ValidationGroup="e"></asp:DropDownList>
                                                <span class="help-block">
                                      <asp:RequiredFieldValidator ID="requiredProject" runat="server" ControlToValidate="ddlDepartment" ErrorMessage="Please Select Department Name" InitialValue="0" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                                    </span>
                                  </div>
                                <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Task Name</label>
                                <asp:TextBox ID="txtTaskName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                <span class="help-block">
                            <asp:RequiredFieldValidator ID="requiredTask" runat="server" ControlToValidate="txtTaskName" ErrorMessage="Please Enter Task Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                                    </span>
                                                </div>
                              
                    </div>
                        <div class="form-group row">
                            <div class="col-sm-3"></div>
                            <div class=" col-sm-2">
                                <asp:Button ID="btAdd" runat="server" Text="Add" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" style="width:130px"/>
                            </div>
                          <div class=" col-sm-2">
                           <asp:Button ID="btclear" runat="server" Text="Clear" class="btn btn-outline-info" ClientIDMode="Static" OnClick="btclear_Click" style="width:130px;margin-left:-25px"/>
                        </div>
                        <div class=" col-sm-2">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-outline-success" ClientIDMode="Static" OnClick="btnSearch_Click" style="width:130px;margin-left:-50px"/>
                        </div>
                            </div>
                </div>
                                    </div>
                                    </div>
                                    </div>
                              </div>
                              </div>
                            </div>

                <div class="section-body">

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Task Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                <div style="overflow-x:auto;width:100%">
                                   
                                    <asp:GridView ID="GridTask" runat="server"  AutoGenerateColumns="False"
                                        class="table table-bordered" OnPageIndexChanging="GridTask_PageIndexChanging"
                                        GridLines="None" AllowPaging="true" OnRowCancelingEdit="GridTask_RowCancelingEdit" OnRowEditing="GridTask_RowEditing"
                                         OnRowUpdating="GridTask_RowUpdating" OnRowCommand="GridTask_RowCommand"
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                       <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Department Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("DepartmentName")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Task Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("TaskName")  %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtTaskName" runat="server" Text='<%# Eval("TaskName")  %>' class="form-control"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <%--<asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" /> --%>
                                                           <center><asp:LinkButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Edit" class="btn btn-primary"><i class="fas fa-edit"></i>&nbsp; Edit</asp:LinkButton></center>

                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" class="btn btn-info"/>
                                                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" class="btn btn-dark"/>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>

                                                        <center><asp:LinkButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="RemoveTask"  OnClientClick="return confirm('Are you sure you want to remove this project?');" class="btn" style="background-color: green;color:white"><i class="fas fa-trash-alt" style="color:white"></i>&nbsp; Delete</asp:LinkButton></center>
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
