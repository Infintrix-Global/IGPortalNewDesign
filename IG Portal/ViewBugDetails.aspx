<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ViewBugDetails.aspx.cs" Inherits="IG_Portal.ViewBugDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="card-body">
        <div class="portlet-body">
         <!-- BEGIN FORM-->
            <div class="form-body">
                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Bug Details " Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                
                 <div class="row"  align="center">
                            <div class="col m12 s12 l12">
                                <table >
                                    <colgroup span="12"></colgroup>
                                    
                                      <tr>
                                        
                                        <td colspan="1">Project Name :</td>
                                            <td colspan="2"><asp:Label ID="lblProjectName" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td colspan="1">Task Title :</td>
                                            <td colspan="2"><asp:Label ID="lblTaskTitle" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                                        
                                    </tr>
                                     <tr>
                                       
                                        <td>Page Name :</td>
                                            <td>
                                            <asp:Label ID="lblPageName" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                      <tr>
                                       
                                        <td>Suggested By:</td>
                                            <td>
                                            <asp:Label ID="lblSuggestedBy" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                      <tr>
                                       
                                        <td>Priority:</td>
                                            <td>
                                            <asp:Label ID="lblPriority" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                        <td>Bug Details:</td>
                                            <td>
                                            <asp:Label ID="lblBugDetails" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                        
                                        <td>Date :</td>
                                            <td>
                                            <asp:Label ID="lblDate" runat="server" Text="" Font-Bold="true"></asp:Label></td>


                                    </tr>
                                    
                                   
                                     <tr>
                                         
                                        <td>Status:</td>
                                            <td>
                                            <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                        <td>CrossChecked By:</td>
                                            <td>
                                            <asp:Label ID="lblCrossCheckedBy" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                     <tr>
                                         
                                        <td>Developer:</td>
                                            <td>
                                            <asp:Label ID="lblDeveloper" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>

                                    <tr>
                                     <td>Comment:</td>
                                            <td>
                                            <asp:Label ID="lblComment" runat="server" Text="" Font-Bold="true"></asp:Label></td>

                                    </tr>
                                     
                                   
                                   

                                </table>
                            </div>
                        </div>

                <div class="row" runat="server" id="divScreenshot" >
                     <div class=" col m12">
                        <div class="portlet light ">
                            
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <asp:GridView ID="GridBug" runat="server"  AutoGenerateColumns="False"
                                        class="striped"  OnRowCommand="GridBug_RowCommand"
                                        GridLines="None" AllowPaging="false" 
                                        
                                        ShowHeaderWhenEmpty="True" Width="100%" DataKeyName="ID">
                                           <Columns>
                                                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label24" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Images">
                                                                                <ItemTemplate>
                                                                                     <asp:LinkButton ID="lnkDownload" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ImageName") %>'
                                                            CommandName="Download" Text='<%# Eval("ImageName") %>' ForeColor="LightBlue" />
                                                                                   
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
                        <br />
              </div>
            </div>
        </div>
</asp:Content>
