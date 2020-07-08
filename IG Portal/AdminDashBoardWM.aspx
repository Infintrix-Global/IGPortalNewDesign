<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AdminDashBoardWM.aspx.cs" Inherits="IG_Portal.SuperAdminDashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="page-content">

           <div class="page-content">
          <div class="row">
        <div class="work-collections">
            <div class="row">
                <div class="col s12 m12 l6">
                     
                  <div class="col m4">
                    <asp:TextBox ID="txtDate"  TextMode="Date" runat="server"  OnTextChanged="txtDate_TextChanged" AutoPostBack="true" />
                      </div>
                    <div class="clearfix"></div>
<hr />
                          <asp:Chart ID="Chart1" runat="server" Height="300px" Width="400px" >
    <Titles>
        <asp:Title ShadowOffset="3" Name="Items" />
    </Titles>
    <Legends>
        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
            LegendStyle="Row" />
    </Legends>
    <Series>
        <asp:Series Name="Default" />
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
    </ChartAreas>
</asp:Chart>
                    </div>

                     <div class="col s12 m12 l6">
                    <ul id="projects-collection" class="collection">
                        <li class="collection-item avatar indigo" style="color: white; font-weight: bold"><span class="collection-header">MOM</span>
                            <a href="AddMOM.aspx" class="secondary-content white-text">View all</a>
                        </li>
                        <li class="collection-item">
                            <asp:GridView ID="GridMOM" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            class="striped" 
                                            GridLines="None" PageSize="10"
                                            ShowHeaderWhenEmpty="True" Width="100%"  DataKeyNames="ID">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Meeting Date" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("MeetingDate","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                  <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("MeetingTypeName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="From Time" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("FromTime")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="To Time" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("ToTime")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                              

                                                 <asp:TemplateField HeaderText="Client Name" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("ClientName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("PName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                             

                                            </Columns>

                                            <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                                            <PagerSettings Mode="NumericFirstLast" />
                                            <EmptyDataTemplate>
                                                No Record Available
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                        </li>
                    </ul>
</div>
                

            </div>

            <div class="row">
                <div class="col s12 m12 l6">
                       <ul id="ul1" class="collection">
                        <li class="collection-item avatar indigo" style="color: white; font-weight: bold"><span class="collection-header">Project with Open Bugs</span>
                           
                        </li>
                        <li class="collection-item">
                            <asp:GridView ID="GridBug" runat="server"  AutoGenerateColumns="False"
                                            class="striped" AllowSorting="true" 
                                            GridLines="None" 
                                            ShowHeaderWhenEmpty="True" Width="100%"  >
                                            <Columns>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 

                                            </Columns>

                                            <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                                            <PagerSettings Mode="NumericFirstLast" />
                                            <EmptyDataTemplate>
                                                No Record Available
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
       
    </div>

    </div>
</asp:Content>
