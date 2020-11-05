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
     <div class="card-body">
        <div class="portlet-body">

            <!-- BEGIN FORM-->
            <div class="form-body">

                 <div class="row" align="center">
                     <h4 class="header2">Prioritize Task</h4>
                   <%-- <asp:Label ID="lbltitle" runat="server" Text="Prioritize Task" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />



                 <asp:Label runat="server" Text="" ID="lblmsg"></asp:Label>
                 <div class="row">
                    <div class=" col m3">
                       <div class="input-field">
                                                <div class="select-wrapper initialized">
                         
                            <asp:DropdownList ID="ddlempName" runat="server" class="form-control" placeholder="" AutoPostBack="true"
                                ClientIDMode="Static" OnSelectedIndexChanged="ddlempName_SelectedIndexChanged"></asp:DropdownList>
</div>

                              <label>Employee Name</label>
                        </div>
                    </div>

               

                </div>

                <br />

                 <div class="row">
                                        <asp:Button ID="btnUpdate" runat="server" OnClientClick="return GetConfirmation();" OnClick="btnUpdate_Click" Text="Update" class="btn" />
                                   
                                    </div>

      <div class="row">
                                <div class=" col m12">
                                    <div class="portlet light ">
                                        <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                        <div class="portlet-body">
                                            <div class="table-scrollable">
                                                <asp:GridView ID="GridAssignTask" runat="server" AutoGenerateColumns="False"
                                                    class="striped"
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
                                                                <asp:Textbox ID="txtPriority" runat="server" Text='<%# Eval("Priority")  %>' TextMode="Number"></asp:Textbox>
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
