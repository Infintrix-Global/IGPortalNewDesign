<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewLEads.aspx.cs" Inherits="IG_Portal.ViewLEads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="View Leads" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
                <!-- END PAGE HEADER-->
  <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />

                <div class="row">

                  
                    <div class=" col m2 ">
                                <div class="form-group">
                                    <label>Enquiry Source </label>
                                    <asp:DropDownList ID="ddlEnquirySource" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static" OnSelectedIndexChanged="ddlEnquirySource_SelectedIndexChanged" >
                                    </asp:DropDownList>


                                </div>
                            </div>

                    <div class=" col m2 ">
                                <div class="form-group">
                                    <label>Enquiry For</label>
                                    <asp:DropDownList ID="ddlEnquiryFor" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static"  >
                                    </asp:DropDownList>


                                </div>
                            </div>

                     <div class="col m2">
                                            <div class="form-group">
                                                    <label>Status </label>
                                                <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" >
                                                </asp:DropDownList>
                                                
                                            </div>
                                        </div>
                     <div class=" col m2">
                                <div class="form-group">
                                    <label>From Date</label>
                                    <asp:TextBox ID="txtFromDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" ></asp:TextBox>
                                 

                                </div>
                            </div>

                     <div class=" col m2">
                                <div class="form-group">
                                    <label>To Date</label>
                                    <asp:TextBox ID="txtToDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" ></asp:TextBox>
                                 

                                </div>
                            </div>
                    
                    </div>            
                <br />
                <div class="row" align="center">

                    <div class="col m4">
                        <div class="form-group form-md-line-input ">

                            <asp:Button ID="btclear" runat="server" Text="Clear" ClientIDMode="Static" OnClick="btclear_Click" class="btn" />
                        </div>
                    </div>

 
                    <div class="col m4">
                        <div class="form-group form-md-line-input ">
                            <asp:Button ID="btSearch" runat="server" Text="Search" class="btn" ClientIDMode="Static" OnClick="btSearch_Click"  CausesValidation="true" />
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
         
                
                <div class="clearfix"></div>
                 <div class="row" align="rignt">
               
                     </div>
                  
                    <div class="row">
                        <div class=" col m12">
                            <div class="portlet light ">
                                  <div class=" col m9">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    </div>
                                   
                                    <div class="col m3">
                                       <%-- <button class="btn" runat="server" onserverclick="btnExport_Click"  id="btExport"><i class="fa fa-download"></i>Export</button>--%>
                                        
                                    </div>
                                    <br />
                                <div class="portlet-body">
                                     <asp:Panel ID="panel1" runat="server" Height="100%" Width="100%" ScrollBars="Both">
                                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                    <div class="table-scrollable">
                                        <asp:GridView ID="GridLead" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            class="striped" AllowSorting="true" OnPageIndexChanging="GridLead_PageIndexChanging"
                                            GridLines="None" OnSorting="GridLead_Sorting" PageSize="10"  DataKeyNames="ID"
                                            ShowHeaderWhenEmpty="True" Width="100%"   >
                                            <Columns>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="5px" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>" CssClass="font-timesheet" ></asp:Label>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText=" Name" HeaderStyle-CssClass="autostyle2" SortExpression="FirstName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("FirstName") +"  "+ Eval("LastName") %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Mobile" HeaderStyle-CssClass="autostyle2" SortExpression="Mobile">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Mobile")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                    <asp:TemplateField HeaderText="Email" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("Email")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Enquiry Date" HeaderStyle-CssClass="autostyle2" SortExpression="EnquiryDate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("EnquiryDate","{0:dd/MMM/yy}")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Company Name" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("CompanyName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Source Name" HeaderStyle-CssClass="autostyle2" SortExpression="SourceName" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("SourceName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Enquiry For" HeaderStyle-CssClass="autostyle2" SortExpression="EnquiryFor">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("EnquiryFor")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 

                                                <asp:TemplateField HeaderText="Preferred Technology" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("TechnologyName")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Interest Rating" HeaderStyle-CssClass="autostyle2" SortExpression="Interest">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("InterestRating")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Remarks" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("Remarks")  %>' CssClass="font-timesheet"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" SortExpression="StatusName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("StatusName")  %>' CssClass="font-timesheet"></asp:Label>
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
                                            </ContentTemplate>
                                              </asp:UpdatePanel>
                                         </asp:Panel>
                                </div>

                            </div>
                        </div>

                    </div>
            </div>
            </div>
         </div>
</asp:Content>
