<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ManagerDashBoardWM.aspx.cs" Inherits="IG_Portal.AdminDashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="Sc1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upManager" runat="server">
        <ContentTemplate>


     <div class="row">
            <div class="col m3">
            <div class="card">
                <div class="card-content  green white-text">
                    <p class="card-stats-title">
                      Pending Task-
                    
                        <asp:LinkButton ID="lnkTask" runat="server" OnClick="lnkTask_Click" ></asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
        

         <div class="col m3">
            <div class="card">
                <div class="card-content  blue white-text">
                    <p class="card-stats-title">
                      Pending Bugs-
                    
                        <asp:LinkButton ID="lnkBug" runat="server" OnClick="lnkBug_Click"  ></asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
         <div class="col m3">
            <div class="card">
                <div class="card-content  red white-text">
                    <p class="card-stats-title">
                     Assigned Projects-
                    
                        <asp:Label ID="lblProject" runat="server"   ></asp:Label>
                    </p>
                </div>
            </div>
        </div>
        
        </div>


            <div class="row">
                     <div class="col s12 m12 l4">
                         <div class="row">
                                 <div class="col s12 m12 l12">
                                <asp:TextBox ID="txtDate" TextMode="Date" runat="server" ClientIDMode="Static" OnTextChanged="txtDate_TextChanged" AutoPostBack="true" />
                            </div>
                             </div>
                            <div class="clearfix"></div>
                            <hr />
                            <asp:Chart ID="Chart3" EnableViewState="true" runat="server" Height="300px" Width="400px">
                                <Titles>
                                    <asp:Title ShadowOffset="3" Name="Items" />
                                </Titles>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                        LegendStyle="Row"  />
                                </Legends>
                                <Series>
                                    <asp:Series Name="Default"  />
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea3" BorderWidth="0" />
                                </ChartAreas>
                            </asp:Chart>
                        </div>

                              <div class="col s12 m12 l4">


                            <asp:Chart ID="Chart2" runat="server" EnableViewState="true" Height="400px" Width="600px">
        <ChartAreas>
            <asp:ChartArea Name="ChartArea2">
                <AxisY>
                    <MajorGrid LineColor="DarkGray" LineDashStyle="Dot" />
                    <LabelStyle  Interval="3" />
                </AxisY>
                <AxisX>
                    <MajorGrid LineColor="DarkGray" LineDashStyle="Dot" />
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Name="Legend1">
            </asp:Legend>
        </Legends>
    </asp:Chart>
                        </div>

                

            </div>


     <!--work collections start-->
                    <div id="work-collections">
                        <div class="row">
                            <div class="col s12 m12 l4">
                                <div class="row">
                                 <div class="col l12">
                                <asp:DropDownList ID="ddlPRoject"  runat="server"  OnSelectedIndexChanged="ddlPRoject_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                                    </div>
                              <%--  <ul id="task-card" class="collection ">--%>
                                    <ul id="issues-collection1" class="collection">
                                     <li class="collection-item avatar">
                                        <i class="mdi-file-folder circle light-blue darken-2"></i>
                                        <span class="collection-header"> Task</span>
                                      <p>Latest Assigned</p>
                                          <a href="PendingAssignTask.aspx" class="secondary-content"><i class="mdi-action-grade">View All</i></a>
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
                                  <div class="row">
                                 <div class="col s12 m12 l12">
                                <asp:DropDownList ID="ddlProjectBug"  runat="server"  OnSelectedIndexChanged="ddlProjectBug_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                                      </div>
                                <ul id="issues-collection" class="collection">
                                    <li class="collection-item avatar">
                                        <i class="mdi-action-bug-report circle red darken-2"></i>
                                        <span class="collection-header">Issues</span>
                                        <p>Assigned to you</p>
                                        <a href="ViewBug.aspx" class="secondary-content"> <i class="mdi-action-grade">View All</i></a>
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


                            <asp:Chart ID="Chart1" EnableViewState="true" runat="server" Height="300px" Width="400px">
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

  
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
