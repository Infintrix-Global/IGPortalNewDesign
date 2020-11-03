<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddClientDetails.aspx.cs" Inherits="IG_Portal.AddClientDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
        
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Add Client</h4>
                    <%--<asp:Label ID="lbltitle" runat="server" Text="Add Client" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />

                <asp:UpdatePanel ID="upClient" runat="server">
                    <ContentTemplate>

                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                         

                        <div class="row">
                            <div class="col m3">
                                <div class="input-field">
                                               <div class="select-wrapper initialized">
                                
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="" TabIndex="2"></asp:TextBox>
                                                    <span class="help-block">
                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Please enter valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="e"></asp:RegularExpressionValidator>
                                                        </span>
                                                   </div>
                                    <label>Mobile Number</label>
                                    </div>

                            </div>
                            <div class="col m3">
                                <div class="input-field">
                                               <div class="select-wrapper initialized">
                                

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
                                    <label>Name </label>
                                    </div>
                            </div>

                            <div class="col m3">
                                <div class="input-field">
                                               <div class="select-wrapper initialized">
                              

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
                                      <label>Email</label>
                                    </div>
                            </div>

                                <div class="col m3">
                                    <div class="input-field">
                                               <div class="select-wrapper initialized">
                                

                                <asp:TextBox ID="txtLocation" class="form-control" placeholder="" TabIndex="4" runat="server"></asp:TextBox>
                                                     <span class="help-block">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLocation" ValidationGroup="e"
                                    SetFocusOnError="true" ErrorMessage="Please Enter Location" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                                                   </div>
                                        <label>Location</label>
                                        </div>
                            </div>
                           
                        </div>

                        

                        <div class="row" align="center">
                            <div class="col m6">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btAdd" runat="server" Text="Add" TabIndex="10" class="btn " ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" />

                                </div>
                            </div>
                            <div class="col m6">
                                <div class="form-group form-md-line-input ">

                                    <asp:Button ID="btclear" runat="server" Text="Clear" TabIndex="11" class="btn blue" ClientIDMode="Static" OnClick="btclear_Click" />

                                </div>
                            </div>

                        </div>

                        <br />
                        <br />
                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <asp:GridView ID="GridClient" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                class="striped"  AllowSorting="true" OnPageIndexChanging="GridClient_PageIndexChanging"
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
            </div>
        </div>
    </div>
</asp:Content>
