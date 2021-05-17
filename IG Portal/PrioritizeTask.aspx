<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="PrioritizeTask.aspx.cs" Inherits="IG_Portal.PrioritizeTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function GetApproveConfirmation() {
            var reply = confirm("Are You Sure ?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
         }
         </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SrciptManager1" runat="server"></asp:ScriptManager>
     <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Prioritize Task</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="Admindashboard.html"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="PrioritizeTask.aspx">Prioritize Task Details</a></div>
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
    
    
    <asp:Label runat="server" Text="" ID="lblmsg"></asp:Label>
                 <div class="section-body">
                          <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Prioritize Task Details
                                                <i class="fas fa-arrow-down"></i></h4>
                                        </div>
                                            <div class="card-body">
                                            <div class="form-group row">
                                            <div class=" col-sm-6 form-group">
                                                <label class="col-sm-6 col-form-label">Employee Name</label>
                                  
                            <asp:DropdownList ID="ddlempName" runat="server" class="form-control" placeholder="" AutoPostBack="true"
                                ClientIDMode="Static" OnSelectedIndexChanged="ddlempName_SelectedIndexChanged"></asp:DropdownList>
                                </div>
                                                 <div class=" col-sm-6 form-group">
                                         <asp:Button ID="btnUpdate" runat="server" OnClientClick="return GetConfirmation();" OnClick="btnUpdate_Click" Text="Update" class="btn btn-outline-primary" style="width:150px;margin-top:40px"/>
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
     
                                <div class="form-group row">
                                <div class="table-responsive">
                                              <h5> <asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                              <asp:GridView ID="GridAssignTask" runat="server" AutoGenerateColumns="False"
                                                    class="table table-striped table-hover"
                                                    GridLines="None"  OnSorting="GridAssignTask_Sorting"
                                                    
                                                    ShowHeaderWhenEmpty="True" Width="100%"  DataKeyNames="ID">
                                                    <Columns>

                                                      <%--  <asp:TemplateField HeaderText="Select" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                              
                                                                <asp:CheckBox runat="server" ID="chkSelect"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>

                                                        <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                               
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Task Added Date" ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2" SortExpression="TaskAddedDateTime">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWorkDate" runat="server" Text='<%# Eval("TaskAddedDateTime","{0:dd/MMM/yy}")  %>' CssClass="font-timesheet"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                         

                                                          <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Task Name" HeaderStyle-CssClass="autostyle2" SortExpression="TaskName">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("TaskName")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Task Title" HeaderStyle-CssClass="autostyle2" SortExpression="TaskTitle">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("TaskTitle")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Task Details" HeaderStyle-CssClass="autostyle2" SortExpression="TaskDetails">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TaskDetails")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Priority" HeaderStyle-CssClass="autostyle2" SortExpression="Priority">
                                                            <ItemTemplate>
                                                                <asp:Textbox ID="txtPriority" runat="server" Text='<%# Eval("Priority")  %>' TextMode="Number" class="form-control"></asp:Textbox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                       <%-- <asp:TemplateField HeaderText="Developer" HeaderStyle-CssClass="autostyle2" SortExpression="Priority">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDeveloper" runat="server" Text='<%# Eval("AssignTo")  %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>

                                              <%-- <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2" Visible="false" >
                                                        <ItemTemplate>
                                                            <asp:DropdownList ID="ddlDeveloper" runat="server"      ></asp:DropdownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                              <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnAssign" runat="server"  Text="Assign"  OnClientClick="return GetApproveConfirmation();"  CommandArgument='<%# Container.DataItemIndex  %>' CommandName="Assign"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                        
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

                </div>
            </div>
         </div>

</asp:Content>
