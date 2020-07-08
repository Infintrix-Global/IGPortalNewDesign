<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDashBoardWM.aspx.cs" Inherits="IG_Portal.Employee_DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection" />
    
     <script type="text/javascript">
  function GetApproveConfirmation()
  {
      var reply = confirm("Are You Sure ?");
      if(reply)
      {
         return true;
      }
      else
      {
         return false;
      }
  }

  function GetCloseConfirmation()
  {
      var reply = confirm("Are You Sure to Close the Bug ?");
      if(reply)
      {
         return true;
      }
      else
      {
         return false;
      }
  }
         
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   <%-- <div class="page-content">
          <div class="row">
        <div class="work-collections">
            <div class="row">
                <div class="col s12 m12 l12">
                      <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    <ul id="projects-collection" class="collection">
                        <li class="collection-item avatar indigo" style="color: white; font-weight: bold"><span class="collection-header">Notifications</span>
                            <a href="Notifications.aspx" class="secondary-content white-text">View all</a>
                        </li>
                        <li class="collection-item">
                            <asp:GridView ID="GridNotification" runat="server"  AutoGenerateColumns="False"
                                        class="striped"  OnPageIndexChanging="GridNotification_PageIndexChanging"
                                        GridLines="None" AllowPaging="true" OnSorting="GridNotification_Sorting"
                                OnRowDataBound="GridNotification_RowDataBound" PageSize="5"
                                        ShowHeaderWhenEmpty="True" Width="100%" OnRowCommand="GridNotification_RowCommand" DataKeyNames="ID">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("Type")  %>' Visible="false"></asp:Label>
                                                     <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="DateTime" HeaderStyle-CssClass="autostyle2" SortExpression="NotificationDateTime">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("NotificationDateTime")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Title" HeaderStyle-CssClass="autostyle2" SortExpression="Title">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                               <asp:TemplateField HeaderText="Message" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Messsage")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2" >
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnConfirm" runat="server"  Text="Confirm" Visible="false" OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Confirm"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                               <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnReject" runat="server"  Text="Reject" Visible="false"  OnClientClick="return GetApproveConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Reject"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                               <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2"  >
                                                        <ItemTemplate>
                                                            <asp:DropdownList ID="ddlDeveloper" runat="server"   Visible="false"   ></asp:DropdownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                              <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnAssign" runat="server"  Text="Assign" Visible="false" OnClientClick="return GetApproveConfirmation();"  CommandArgument='<%# Container.DataItemIndex  %>' CommandName="Assign"></asp:Button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                  <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnDetails" runat="server"  Text="Details" Visible="false"  CommandArgument='<%# Eval("BugID")  %>' CommandName="Details"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                               <asp:TemplateField HeaderText=" " HeaderStyle-CssClass="autostyle2" >
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnClosed" runat="server"  Text="Close" Visible="false" OnClientClick="return GetCloseConfirmation();" CommandArgument='<%# Eval("ID") %>' CommandName="Close"></asp:Button>
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
       
    </div>--%>

</asp:Content>
