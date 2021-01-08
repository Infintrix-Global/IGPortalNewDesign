<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ReleaseManagement.aspx.cs" Inherits="IG_Portal.ReleaseManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "images/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "images/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
    <style>
           .block1 {
            height: 100px;
            width: 800px;
            border: 1px solid aliceblue;
            overflow-y: scroll;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">

                <div class="form-body">

                <div class="row" align="center">
                    <h4 class="header2">Release Management</h4>
                 
                </div>
                <br />
                    <asp:UpdatePanel ID="up1" runat="server">
                        <ContentTemplate>

                      <div class="row" align="center">
                    <asp:Button ID="btnAddNew" runat="server" Text="Add" class="btn blue" OnClick="btnAddNew_Click" />
</div>
                    <br />


             <asp:Panel ID="addRelease" runat="server" Visible="false"> 
                  <asp:Label ID="lblmsg" runat="server"></asp:Label>
                   <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                  
                                    <div class="row">
                                        <div class="col m4">
                                            <div class="input-field">
                                                  <div class="select-wrapper initialized">
                                             
                                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder="" AutoPostBack="true"
                                                     TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                      </div>
                                                  <label>Project Name </label>
                                            </div>
                                        </div>

                                           <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                

                                              
                                                <asp:TextBox ID="txtLink" runat="server" placeholder="" Height="80px"
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="2">
                                                </asp:TextBox>
                                                            <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLink" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Link" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
            </div>
                                                    <label>Link</label>

                                            </div>
                                        </div>

                                           <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                  
                                                <asp:TextBox ID="txtTaskDescription" runat="server" placeholder="" Height="80px"
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="3">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskDescription" runat="server" ControlToValidate="txtTaskDescription" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Description" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                    </div>
                                                  <label>Description</label>
                                            </div>
                                        </div>

                                         <div class="clearfix"></div>
                                        
                            <div class="col m8">
                                <div class="input-field">
                                    <div class="select-wrapper initialized">
                                        <%-- <asp:TextBox ID="txtSearch" runat="server" onkeyup="KeyUp(this,'#chkTask');"
                    placeholder="Search Task">
                                             
                </asp:TextBox>
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />--%>
                                        <div class="block1">
                                            <asp:CheckBoxList ID="chkTask" RepeatLayout="OrderedList" runat="server" class="form-control" TabIndex="4"></asp:CheckBoxList>
                                        </div>
                                        <span class="help-block">
                                            <%--  <asp:RequiredFieldValidator ID="requiredRole" runat="server" ControlToValidate="chkRole" InitialValue="0" ErrorMessage="Please Select Role" ForeColor="Red" SetFocusOnError="true" ValidationGroup="e"></asp:RequiredFieldValidator>--%>
                                            <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Please select at least one task."
                                                ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" ValidationGroup="at" />
                                        </span>
                                    </div>
                                    <label>Tasks</label>
                                </div>
                            </div>
                        
                                      
                                        <div class="clearfix"></div>

                                        <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                            
                                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"  TabIndex="5" TextMode="Date"   ></asp:TextBox>
                                               <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                   </span>
                                                            </div>
                                                <label>
                                                       Date
                                                    </label>
                                            </div>
                                        </div>

                                            <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                   
                                                  
                                              
                                                
                                                <asp:RadioButtonList ID="radType"  runat="server" class="form-control" TabIndex="6" RepeatDirection="Horizontal">
                                                    <asp:ListItem Text="UAT" Value="UAT" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Live" Value="Live"></asp:ListItem>
                                                

                                                </asp:RadioButtonList>
                                               
                                            </div>
                                                 <label>
                                                        Type</label>
                                        </div>

                                   

                                     
                                    </div>

                                          <div class="clearfix"></div>
                                    <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="10" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at"  ></asp:Button>
                                    </div>
                                </div>
                            </div>

                        </div>
                            </div>
             </asp:Panel>

                   <br />
                <div id="viewRelease" runat="server">
                    <div class="row">
                        <div class=" col m12">
                            <div class="portlet light ">
                                <asp:Label runat="server" Text="" ID="count"></asp:Label>
                                <div class="portlet-body">
                                    <div class="table-scrollable">
                                        <asp:GridView ID="GridReleaseManagement" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            class="striped" AllowSorting="true" OnPageIndexChanging="GridReleaseManagement_PageIndexChanging"
                                            GridLines="None" OnSorting="GridReleaseManagement_Sorting" PageSize="10" OnRowDataBound="GridReleaseManagement_RowDataBound"
                                            ShowHeaderWhenEmpty="True" Width="100%"  DataKeyNames="ID">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2" SortExpression="ProjectName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Link" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("Link")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Description" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("Description")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label21" runat="server" Text='<%# Eval("Type")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("Date","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                              
                                              


                                               

                                                <asp:TemplateField HeaderText="Tasks" HeaderStyle-CssClass="autostyle2">
                                                    <ItemTemplate>
                                                        <img alt="" style="cursor: pointer" src="images/plus.png" />
                                                        <asp:Panel ID="Panel1" runat="server" Style="display: none">
                                                            <asp:GridView ID="gvmp" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Points">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label18" runat="server" Text='<%#  Eval("Task")  %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                  
                                                                </Columns>
                                                            </asp:GridView>
                                                        </asp:Panel>
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
                </div>   
                    
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
            </div>

        </div>

    </div>
</asp:Content>
