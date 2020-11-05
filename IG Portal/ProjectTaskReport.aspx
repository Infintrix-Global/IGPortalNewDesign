<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ProjectTaskReport.aspx.cs" Inherits="IG_Portal.ProjectTaskReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
           
            <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <h4 class="header2">Project Task Report</h4>
                   <%-- <asp:Label ID="lbltitle" runat="server" Text="Project Task Report" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />
                <!-- END PAGE HEADER-->

                 <asp:UpdatePanel ID="upTask" runat="server">
                    <ContentTemplate>

                        <div class="row">
                             <div class=" col m3 ">
                                <div class="input-field">
                                                <div class="select-wrapper initialized">
                                   
                                    <asp:DropDownList ID="ddlProjectName" runat="server" class="form-control" placeholder="" AutoPostBack="true"
                                       OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged">
                                    </asp:DropDownList>
</div>
                                     <label>Project Name </label>

                                </div>
                            </div>

                            <div class=" col m2">
                             <div class="input-field">
                                                <div class="select-wrapper initialized">
                                  
                                    <asp:TextBox ID="txtFromDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" OnTextChanged="txtFromDate_TextChanged"
                                        AutoPostBack="true"></asp:TextBox>
                                                      <span class="help-block">
                                    <asp:RequiredFieldValidator ID="requiredFromDate" runat="server" ControlToValidate="txtFromDate" ValidationGroup="vt"
                                        SetFocusOnError="true" ErrorMessage="Enter From Date" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                                                          </span>
                                                    </div>
                                   <label>From Date</label>
                                </div>
                            </div>

                            <div class=" col m2">
                               <div class="input-field">
                                                <div class="select-wrapper initialized">
                                   
                                    <asp:TextBox ID="txtToDate" runat="server" class="form-control" placeholder=""
                                        ClientIDMode="Static" TextMode="Date" OnTextChanged="txtToDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                      <span class="help-block">
                                    <asp:RequiredFieldValidator ID="requiredToDate" runat="server" ControlToValidate="txtToDate" ValidationGroup="vt"
                                        SetFocusOnError="true" ErrorMessage="Enter To Date" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                                                          </span>
</div>
                                    <label>To Date</label>
                                </div>
                            </div>
                        </div>

                 

                <div class="row" align="center">


                    <div class="col m12">
                        <div class="form-group form-md-line-input ">
                              <asp:Button ID="btSearch" runat="server" Text="Search" class="btn" ClientIDMode="Static" OnClick="btSearch_Click" ValidationGroup="vt" CausesValidation="true" />
                            <asp:Button ID="btclear" runat="server" Text="Clear" ClientIDMode="Static" OnClick="btclear_Click" class="btn blue" />
                        </div>
                    </div>
                    <div class="col m2">
                        <div class="form-group form-md-line-input ">
                          
                        </div>
                    </div>
                </div>




                <div class="clearfix"></div>

                <br />
                <!-- BEGIN SAMPLE FORM PORTLET-->
                <div class="portlet light ">

                    <div class="row">
                        <div class="col m12">
                            <div class="portlet light ">

                                <div class="row">
                                    <div class=" col m5">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                    </div>
                                     <div class="clearfix"></div>
                                    <div class=" col m5">
                                        <asp:Label runat="server" Text="" ID="tottime"></asp:Label>
                                    </div>
                                     <div class=" col m5">
                                        <asp:Label runat="server" Text="" ID="actualtime"></asp:Label>
                                    </div>
                                      <div class="clearfix"></div>
                                   
                                    <br />
                                    <div class="clearfix"></div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="portlet-body">
                                                <div class="table-scrollable">
                                                    <asp:GridView ID="GridTask" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        class="striped" OnSorting="GridTask_Sorting" AllowSorting="true"  
                                                        GridLines="None" OnRowDataBound="GridTask_RowDataBound"
                                                        ShowHeaderWhenEmpty="True" Width="100%" OnPageIndexChanging="GridTask_PageIndexChanging" PageSize="20">
                                                        <Columns>
                                                           
                                                            <asp:TemplateField HeaderText="Sr. No."  HeaderStyle-CssClass="autostyle2" ItemStyle-Width="2%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                      <asp:Label ID="lblTID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                          

                                                            <asp:TemplateField HeaderText="Task Details" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTaskDetail" runat="server" Text='<%# Eval("TaskDetails")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Start Date" ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2" SortExpression="EstimatedWorkDate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWorkDate" runat="server" Text='<%# Eval("EstimatedWorkDate","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="End Date" HeaderStyle-CssClass="autostyle2" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("EndDate")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Estimated Hours" HeaderStyle-CssClass="autostyle2" SortExpression="EstiamtedWorkTime">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPTime" runat="server" Text='<%# Eval("EstiamtedWorkTime","{0:n}")  %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Actual Completion Hours" HeaderStyle-CssClass="autostyle2" SortExpression="ActualTimeSpent" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblATime" runat="server" Text='<%# Eval("ActualTimeSpent","{0:n}")  %>' ></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                             <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="autostyle2" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStatus" runat="server" ></asp:Label>
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
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
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
