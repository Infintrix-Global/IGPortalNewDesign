<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddClientDetails.aspx.cs" Inherits="IG_Portal.AddClientDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Page</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Page Details</a></div>
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
    
            <!-- BEGIN FORM-->
            <asp:UpdatePanel ID="upClient" runat="server">
                    <ContentTemplate>

                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                         <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Add Page</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Mobile Number</label>
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="" TabIndex="2"></asp:TextBox>
                                                    <span class="help-block">
                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Please enter valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="e"></asp:RegularExpressionValidator>
                                                        </span>
                            </div>
                            <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Name </label>
                               <asp:TextBox ID="txtName" class="form-control" placeholder="" TabIndex="3" runat="server"></asp:TextBox>
                                                    <span class="help-block">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Only text is allowed" Display="Dynamic" ControlToValidate="txtName"
                                    SetFocusOnError="True" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$">
                                </asp:RegularExpressionValidator>
                                    </span>
                            </div>
                                <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Email</label>
                             
                              <asp:TextBox ID="txtEmail" class="form-control" placeholder="" TabIndex="4" runat="server"></asp:TextBox>
                                                     <span class="help-block">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="e"
                                    ForeColor="Red" ErrorMessage="Enter valid Email" Display="Dynamic" ControlToValidate="txtEmail"
                                    SetFocusOnError="True" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
                                </asp:RegularExpressionValidator>
                                                          </span>
                                    
                            </div> 
                                    <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Location</label>
                             
                                    
                                    <asp:TextBox ID="txtLocation" class="form-control" placeholder="" TabIndex="4" runat="server"></asp:TextBox>
                                                     <span class="help-block">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLocation" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Location" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                                                   </div>
                                       
                            </div>
                         <div class="form-group row">
                         <div class="col-sm-4"></div>
                         <div class="col-sm-2">
                                <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="10" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" style="width:130px"/>
                            </div>
                            <div class="col-sm-2">
                                    <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="11" class="btn btn-outline-success" ClientIDMode="Static" OnClick="btclear_Click" style="width:130px;margin-left:-25px"/>

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
                                <h4>Page Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <h5>        
                        <asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                         <asp:GridView ID="GridClient" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                class="table table-bordered"  AllowSorting="true" OnPageIndexChanging="GridClient_PageIndexChanging"
                                                GridLines="None" OnSorting="GridClient_Sorting" 
                                                ShowHeaderWhenEmpty="True" Width="100%" >
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    

                                                    <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Name")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Contact Number" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Mobile")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Email" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Email")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Location" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Location")  %>'></asp:Label>
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
            
</asp:Content>
