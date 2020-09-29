<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddDepartment.aspx.cs" Inherits="IG_Portal.AddDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
      <div class="card-body">
          <div class="portlet-body">
             
              <!-- BEGIN FORM-->
              <div class="form-body">
                  <div class="row" align="center">
                      <asp:Label ID="lbltitle" runat="server" Text=" Add Department " Font-Bold="true" Font-Size="Large"></asp:Label>
                  </div>
                  <br />

                  <asp:UpdatePanel ID="upProject" runat="server">
                      <ContentTemplate>
                          <asp:Label ID="lblmsg" runat="server"></asp:Label>
                          <div class="row">
                              <div class=" col m3">
                                  <div class="form-group">
                                      <label>Department Name</label>
                                      <asp:TextBox ID="txtDepartmentName" runat="server" class="form-control" placeholder=""
                                          ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="requiredProject" runat="server" ControlToValidate="txtDepartmentName" ErrorMessage="Please Enter Department Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>

                                  </div>
                              </div>

                              <div class="col m2">
                                  <div class="form-group form-md-line-input ">



                                      <asp:Button ID="btAdd" runat="server" Text="Add" class="btn" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" />


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
                                              <asp:GridView ID="GridDepartment" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                  class="striped" OnPageIndexChanging="GridDepartment_PageIndexChanging"
                                                  GridLines="None" 
                                                  ShowHeaderWhenEmpty="True" Width="100%">
                                                  <Columns>

                                                      <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                          <ItemTemplate>
                                                              <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                          </ItemTemplate>
                                                      </asp:TemplateField>

                                                      <asp:TemplateField HeaderText="Department Name" HeaderStyle-CssClass="autostyle2">
                                                          <ItemTemplate>
                                                              <asp:Label ID="Label7" runat="server" Text='<%# Eval("DepartmentName")  %>'></asp:Label>
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
