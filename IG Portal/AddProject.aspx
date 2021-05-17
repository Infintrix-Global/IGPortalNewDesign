<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="IG_Portal.ProjectMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    
  <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Project</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Project Details</a></div>
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
                                        <div class="card-body">
                            <!-- BEGIN FORM-->
                                <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Add Project</h4>
                                  </div>
                            <div class="card-body">
                                 <div class="section-title">Project Name</div>
                                <div class="form-group row">
                                  <div class="col-sm-12">
                                        <asp:TextBox ID="txtProjectName" runat="server" class="form-control" placeholder=""
                                            ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                        <span class="help-block">
                                            <asp:RequiredFieldValidator ID="requiredProject" runat="server" ControlToValidate="txtProjectName" ErrorMessage="Please Enter Project Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                        </span>
                                    </div>
                                    </div>
                                <div class="row">
                                <div class="col-sm-2">
                                <asp:Button ID="btAdd" runat="server" Text="Add Project" class="btn btn-outline-primary  waves-effect" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" />
                                </div>
                                <div class="col-sm-1" style="margin-left:-40px">
                                 <asp:Button ID="btclear" runat="server" Text="Clear" class="btn btn-outline-primary  waves-effect" ClientIDMode="Static" OnClick="btclear_Click" />
                                </div>
                                <div class="col-sm-1">
                                  <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-outline-primary  waves-effect" ClientIDMode="Static" OnClick="btnSearch_Click" />

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
                                <h4>Project Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                    <div style="overflow-x:auto;width:100%">
                                    
                                    <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                            <asp:GridView ID="GridProject" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                class="table table-bordered" OnPageIndexChanging="GridProject_PageIndexChanging"
                                                GridLines="None" OnRowCommand="GridProject_RowCommand" OnRowCancelingEdit="GridProject_RowCancelingEdit" OnRowEditing="GridProject_RowEditing"
                                                 OnRowUpdating="GridProject_RowUpdating"
                                                ShowHeaderWhenEmpty="True" width="100%">
                                                <Columns>




                                                    <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                             <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>'  Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtPName" runat="server" Text='<%# Eval("ProjectName")  %>' CssClass="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Project Details" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <center><asp:LinkButton ID="lnkDetails" runat="server" CommandArgument='<%# Eval("ID")  %>' Text="Details" CommandName="ViewDetails" class="btn btn-outline-primary"></asp:LinkButton></center>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <center><asp:LinkButton ID="btn_Edit" runat="server" CommandName="Edit" class="btn btn-primary"> <i class="fas fa-edit"></i></asp:LinkButton>
                                                                                 </center> </ItemTemplate>
                                                        <EditItemTemplate>
                                                           <center><asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" class="btn btn-info"/>
                                                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" class="btn btn-dark"/>
                                                        </center>
                                                               </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                           <center><asp:LinkButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="RemoveProject" class="btn" style="background-color: green" OnClientClick="return confirm('Are you sure you want to remove this project?');"><i class="fas fa-trash-alt" style="color:white"></i></asp:LinkButton></center>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                                <PagerStyle CssClass="GridPager" HorizontalAlign="right"/>
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
                            
                    </ContentTemplate>
                </asp:UpdatePanel>
            
</asp:Content>

