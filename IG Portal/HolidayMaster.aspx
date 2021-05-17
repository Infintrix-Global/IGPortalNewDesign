<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="HolidayMaster.aspx.cs" Inherits="IG_Portal.HolidayMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Add Holiday</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Holiday Details</a></div>
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
               
                   <asp:UpdatePanel ID="upProject" runat="server">
                    <ContentTemplate>
                     <asp:Label ID="lblmsg" runat="server"></asp:Label>
                  <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Add Holiday</h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-4 form-group">
                               <label class="col-sm-4 col-form-label">Holiday Name </label>
                               
                            <asp:TextBox ID="txtHolidayName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                                   <span class="help-block">
                            <asp:RequiredFieldValidator ID="requiredProject" runat="server" ControlToValidate="txtHolidayName" ErrorMessage="Please Enter Holiday Name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>
                            </span>
                            </div>
                            <div class=" col-sm-4 form-group">
                               <label class="col-sm-5 col-form-label">Holiday Description</label>
                              <asp:TextBox ID="txtHolidayDesription" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="2" CssClass="form-control">
                                                </asp:TextBox>
                                              
                                        </div>
                                <div class=" col-sm-4 form-group">
                               <label class="col-sm-4 col-form-label">Holiday Date</label>
                                 <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"  TabIndex="4" TextMode="Date"   ></asp:TextBox>
                                                <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                    </span>
                                                </div>
                                 </div>
                                <div class="form-group row">
                         <div class="col-sm-4"></div>
                         <div class="col-sm-2">
                            <asp:Button ID="btAdd" runat="server" Text="Add" class="btn btn-outline-primary" ClientIDMode="Static" OnClick="btAdd_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ValidationGroup="e" style="width:130px"/>
                             </div>
                             <div class="col-sm-2">
                             <asp:Button ID="btclear" runat="server" Text="Clear" class="btn btn-outline-info" ClientIDMode="Static" OnClick="btclear_Click" style="width:130px;margin-left:-25px"/>
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
                                <h4>Holiday Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                           <div class="form-group row">
                                         <div class="col-sm-3">
                                            <asp:DropDownList ID="ddlYear" runat="server" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                               </div>
                             <div style="overflow-x:auto;width:100%">
                                 <asp:GridView ID="GridHoliday" runat="server"  AutoGenerateColumns="False"
                                        class="table table-bordered" 
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
            
</asp:Content>

