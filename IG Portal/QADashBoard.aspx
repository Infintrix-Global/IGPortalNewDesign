<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="QADashBoard.aspx.cs" Inherits="IG_Portal.QADashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="Sc1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upManager" runat="server">
        <ContentTemplate>
      
          <div class="row">
   

         <div class="col s12 m12 l6">
                      <asp:Chart ID="Chart3" runat="server" EnableViewState="true" Height="400px" Width="600px">
                                <Titles>
                                    <asp:Title Name="Items" Text="Project Wise Bug/Task "></asp:Title>
                                </Titles>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea3">
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

       <div class="col s12 m12 l6">
              <div class="row">
                                 <div class="col s12 m12 l6">
                                     <asp:Label ID="lblFdate" runat="server" Text="From Date"></asp:Label>
                                <asp:TextBox ID="txtDate" TextMode="Date" runat="server" ClientIDMode="Static" OnTextChanged="txtDate_TextChanged"  AutoPostBack="true"  />
                            </div>
                   <div class="col s12 m12 l6">
                             <asp:Label ID="lblTDate" runat="server" Text="To Date"></asp:Label>
                                <asp:TextBox ID="txtToDate" TextMode="Date" runat="server" ClientIDMode="Static" OnTextChanged="txtToDate_TextChanged" AutoPostBack="true"     />
                            </div>
               <%--   <div class="col s12 m12 l4">
                      <asp:Button ID="go" runat="server" Text="Go" Width="35px" OnClick="go_Click" />
                  </div>--%>
                  </div>
     <asp:Chart ID="Chart2" runat="server" EnableViewState="true" Height="400px" Width="600px">
                                <Titles>
                                    <asp:Title Name="Items" Text="Project Wise Bug Status"></asp:Title>
                                </Titles>
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
            <div class="clearfix"></div>
            <div class="row">
                 <div class="col s12 m12 l4">
                                  <div class="row">
                                 <div class="col s12 m12 l12">
                                <asp:DropDownList ID="ddlProjectBug"  runat="server"  OnSelectedIndexChanged="ddlProjectBug_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                                      </div>
                                <ul id="issues-collection" class="collection">
                                    <li class="collection-item avatar">
                                        <i class="mdi-action-bug-report circle red darken-2"></i>
                                        <span class="collection-header">Bugs</span>
                                        <p>Completed for Testing </p>
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
                                    <asp:Label Visible='<%#bool.Parse((DataList1.Items.Count==0).ToString())%>' runat="server"
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
                                <asp:DropDownList ID="ddlProjectTask"  runat="server"  OnSelectedIndexChanged="ddlProjectTask_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                                      </div>
                                <ul id="issues-collection1" class="collection">
                                    <li class="collection-item avatar">
                                        <i class="mdi-action-bug-report circle red darken-2"></i>
                                        <span class="collection-header">Task</span>
                                        <p>Approved for Testing </p>
                                        <a href="ViewTaskQA.aspx" class="secondary-content"> <i class="mdi-action-grade">View All</i></a>
                                    </li>
                                    <li class="collection-item dismissable">
                                           <asp:DataList ID="DataList2" class="striped" runat="server" CellPadding="4" ForeColor="#333333">

                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle BackColor="#EFF3FB" />
                                            <ItemTemplate>
                                    <div class="row-no-gutters">
                                       
                                              
                                          <%-- <p class="collections-content">--%><asp:Label ID="lblProjectName" runat="server" Font-Bold="true" Text='<%# Eval("ProjectName")  %>'></asp:Label><%--</p>--%>
                                          <br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("TaskDetails")  %>' ></asp:Label>
                                              
                                        
                                              
                                        </div>
                                        
                                    
                                                </ItemTemplate>
                              
                                            <AlternatingItemStyle BackColor="White" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                              
                                <FooterTemplate>
                                    <asp:Label Visible='<%#bool.Parse((DataList2.Items.Count==0).ToString())%>' runat="server"
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
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
