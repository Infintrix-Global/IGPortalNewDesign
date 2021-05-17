<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewLEads.aspx.cs" Inherits="IG_Portal.ViewLEads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>View Leads</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Lead Details</a></div>
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
            
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                   <asp:UpdatePanel ID="upTask" runat="server">
                    <ContentTemplate>
                <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Fill up the Details<i class="fas fa-arrow-down"></i></h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-4 form-group">
                               <label class="col-sm-4 col-form-label">Enquiry Source</label>
                                        <asp:DropDownList ID="ddlEnquirySource" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static" OnSelectedIndexChanged="ddlEnquirySource_SelectedIndexChanged" >
                                    </asp:DropDownList> 
                                </div>
                            <div class=" col-sm-4 form-group">
                               <label class="col-sm-4 col-form-label">Enquiry For</label>
                                    <asp:DropDownList ID="ddlEnquiryFor" runat="server" class="form-control" placeholder="" 
                                        ClientIDMode="Static"  >
                                    </asp:DropDownList>
                        </div>
                        <div class=" col-sm-4 form-group">
                               <label class="col-sm-4 col-form-label">Status</label>
                                         <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" class="form-control" style="margin-top:20px;">
                                                </asp:DropDownList>
                                                
                                            </div>
                                    <div class=" col-sm-4 form-group" style="margin-top:-20px">
                               <label class="col-sm-4 col-form-label">From Date</label>
                              <asp:TextBox ID="txtFromDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" ></asp:TextBox>
                                 </div>
                      <div class=" col-sm-4 form-group" style="margin-top:-20px;">
                               <label class="col-sm-4 col-form-label">To Date</label>
                               <asp:TextBox ID="txtToDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" ></asp:TextBox>
                                 

                                </div>
                            </div>
                    
                    </div>    
                        </div>
                                    </div>
                    </div>
                        </ContentTemplate>
                       </asp:UpdatePanel>
                        <div class="form-group row" style="margin-top:-80px">
                         <div class="col-sm-4"></div>
                         <div class="col-sm-2">
                        <asp:Button ID="btSearch" runat="server" Text="Search" class="btn btn-outline-success" ClientIDMode="Static" OnClick="btSearch_Click"  CausesValidation="true" style="width:150px"/>
                            </div>
                            <div class="col-sm-2">
                             <asp:Button ID="btclear" runat="server" Text="Clear" ClientIDMode="Static" OnClick="btclear_Click" class="btn btn-outline-info" style="width:150px"/>
                        </div>
                        </div>
   
                        <div class="row" style="margin-top:50px">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Lead Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                    <div class="col m3">
                                       <%-- <button class="btn" runat="server" onserverclick="btnExport_Click"  id="btExport"><i class="fa fa-download"></i>Export</button>--%>
                                        
                                    </div>
                                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                    <div style="overflow-x:auto;width:100%">
                                            <asp:GridView ID="GridLead" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            class="table table-bordered" AllowSorting="true" OnPageIndexChanging="GridLead_PageIndexChanging"
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
