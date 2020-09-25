<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDashBoardWM.aspx.cs" Inherits="IG_Portal.Employee_DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection" />
    
  
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
  <div class="row">
     

         <div class="col m3">
            <div class="card">
                <div class="card-content  blue white-text">
                    <p class="card-stats-title">
                      Pending Task-
                    
                        <asp:LinkButton ID="lnkTask" runat="server" OnClick="lblTask_Click"  ></asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
         <div class="col m3">
            <div class="card">
                <div class="card-content  red white-text">
                    <p class="card-stats-title">
                      Pending Bugs-
                    
                        <asp:LinkButton ID="lnkBug" runat="server" OnClick="lblBug_Click"  ></asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
        </div>

     <!--work collections start-->
                    <div id="work-collections">
                        <div class="row">
                            <div class="col s12 m12 l4">
                              <%--  <ul id="task-card" class="collection ">--%>
                                    <ul id="issues-collection1" class="collection">
                                     <li class="collection-item avatar">
                                        <i class="mdi-file-folder circle light-blue darken-2"></i>
                                        <span class="collection-header">My Task</span>
                                      <p>Latest Assigned</p>
                                          <a href="ViewAssignedTaskEmployee.aspx" class="secondary-content"><i class="mdi-action-grade">View All</i></a>
                                    </li>
                                   <%-- <li class="collection-header cyan">
                                         <i class="mdi-file-folder circle light-blue darken-2"></i>
                                        <h4 class="task-card-title">My Task</h4>
                                         <a href="AssignedTask.aspx" class="secondary-content"><i class="mdi-action-grade">View All</i></a>
                                       <%-- <p class="task-card-date"><%= DateTime.Now %></p>
                                    </li>--%>
                                   
                                    <li class="collection-item dismissable">
                                       <asp:DataList ID="dlTask" class="striped" runat="server" CellPadding="4" ForeColor="#333333" OnItemDataBound="dlTask_ItemDataBound">

                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle BackColor="#EFF3FB" />
                                            <ItemTemplate>
                                    <div class="row-no-gutters">
                                       
                                               <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status")  %>' Visible="false" ></asp:Label>
                                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("Project")  %>' Font-Bold="true"></asp:Label>
                                          <br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("TaskDetails")  %>' ></asp:Label>
                                              
                                         <a class="secondary-content"> <span class="ultra-small"><asp:Label ID="lblDate" runat="server" Text='<%# Eval("TaskAssignedDateTime","{0:dd/MMM/yy}")  %>'></asp:Label></span></a>
                                            <br />
                                             <span class="task-cat "><asp:Label ID="lblStatusName" runat="server" Text='<%# Eval("StatusName")  %>'></asp:Label></span>
                                      
                                        
                                        </div>
                                        
                                    
                                                </ItemTemplate>
                              
                                            <AlternatingItemStyle BackColor="White" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                              
                                <FooterTemplate>
                                    <asp:Label Visible='<%#bool.Parse((dlTask.Items.Count==0).ToString())%>' runat="server"
                                        ID="lblNoRecord" Text="No Record Found!"></asp:Label>
                                </FooterTemplate>
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                       </asp:DataList>
                                    </li>
                                   
                                  
                                </ul>
                            </div>
                      

                             <div class="col s12 m12 l4">
                                <ul id="issues-collection" class="collection">
                                    <li class="collection-item avatar">
                                        <i class="mdi-action-bug-report circle red darken-2"></i>
                                        <span class="collection-header">Issues</span>
                                        <p>Assigned to you</p>
                                        <a href="ViewBugs.aspx" class="secondary-content"> <i class="mdi-action-grade">View All</i></a>
                                    </li>
                                    <li class="collection-item dismissable">
                                           <asp:DataList ID="DataList1" class="striped" runat="server" CellPadding="4" ForeColor="#333333">

                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle BackColor="#EFF3FB" />
                                            <ItemTemplate>
                                    <div class="row-no-gutters">
                                       
                                               <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status")  %>' Visible="false" ></asp:Label>
                                          <%-- <p class="collections-content">--%><asp:Label ID="lblProjectName" runat="server" Font-Bold="true" Text='<%# Eval("ProjectName")  %>'></asp:Label><%--</p>--%>
                                          <br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("BugDetails")  %>' ></asp:Label>
                                              
                                        
                                              
                                        </div>
                                        
                                    
                                                </ItemTemplate>
                              
                                            <AlternatingItemStyle BackColor="White" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                              
                                <FooterTemplate>
                                    <asp:Label Visible='<%#bool.Parse((dlTask.Items.Count==0).ToString())%>' runat="server"
                                        ID="lblNoRecord" Text="No Record Found!"></asp:Label>
                                </FooterTemplate>
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                       </asp:DataList>
                                    </li>
                                   
                                </ul>
                            </div>

                              <div class="col s12 m12 l4">


                            <asp:Chart ID="Chart1" runat="server" Height="300px" Width="400px">
                                <Titles>
                                    <asp:Title  Name="Items" Text="TimeSheet Hours of the Week" />
                                </Titles>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="TimeSheet Hours"
                                        LegendStyle="Row"  />
                                </Legends>
                                <Series>
                                    <asp:Series Name="Default"  />
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                                </ChartAreas>
                            </asp:Chart>
                        </div>

                        </div>
                    </div>
                    <!--work collections end-->

</asp:Content>
