<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="HolidayMaster.aspx.cs" Inherits="IG_Portal.HolidayMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
      <div class="card-body">
        <div class="portlet-body">
          
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Add Holiday</h4>
                 <%--   <asp:Label ID="lbltitle" runat="server" Text=" Add Project " Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />
               
                   <asp:UpdatePanel ID="upProject" runat="server">
                    <ContentTemplate>
 <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <div class="row">
                    <div class=" col m3">
                       <div class="input-field "> 											
											<div class="select-wrapper initialized">
                           
                            <asp:TextBox ID="txtHolidayName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                   <span class="help-block">
                            <asp:RequiredFieldValidator ID="requiredProject" runat="server" ControlToValidate="txtHolidayName" ErrorMessage="Please Enter Holiday Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
</span>
                                                </div>
                            <label>Holiday Name</label>
                        </div>
                    </div>

                     <div class="col m3">
                                            <div class="input-field "> 											
											<div class="select-wrapper initialized">
                                                   
                                                <asp:TextBox ID="txtHolidayDesription" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="2">
                                                </asp:TextBox>
                                              </div>
                                                 <label>Holiday Description</label>
                                            </div>
                                        </div>

                       <div class="col m3">
                                              <div class="input-field "> 											
											<div class="select-wrapper initialized">
                                                   
                                                </span>
                                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"  TabIndex="4" TextMode="Date"   ></asp:TextBox>
                                                <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                    </span>
                                                </div>
                                                    <label>
                                                      Holiday Date
                                                    </label>
                                               
                                            </div>
                                        </div>
                     </div>
                    <div class="clearfix"></div>
                    <div class="row" align="center">
                    <div class="col m12">
                        <div class="form-group form-md-line-input ">

                                <asp:Button ID="btAdd" runat="server" Text="Add" class="btn " ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" />
                               <asp:Button ID="btclear" runat="server" Text="Clear" class="btn blue" ClientIDMode="Static" OnClick="btclear_Click" />

                        </div>
                    </div>
                   
                    </div>
                        </div>
               
                        <div class="row" align="Center">
                            <div class="col m3">
                            <asp:DropDownList ID="ddlYear" runat="server" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                            </div>
                <div class="row">
                    <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="count"></asp:Label>
                            <div class="portlet-body">
                                <div class="table-scrollable table-scrollable-borderless">
                                    <asp:GridView ID="GridHoliday" runat="server"  AutoGenerateColumns="False"
                                        class="striped" 
                                        GridLines="None" 
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Holiday Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("HolidayName")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                             <asp:TemplateField HeaderText="Description" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                              <asp:Label ID="Label8" runat="server" Text='<%# Eval("HolidayDescription")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                              <asp:Label ID="Label9" runat="server" Text='<%# Eval("HolidayDate","{0:dd/MMM/yy}")  %>'></asp:Label>
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

