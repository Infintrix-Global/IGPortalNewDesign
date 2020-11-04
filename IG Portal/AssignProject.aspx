<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AssignProject.aspx.cs" Inherits="IG_Portal.AssignProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

         .block1 {
            height:200px;
            width:300px;
            border:1px solid aliceblue;
            overflow-y:scroll;
        }
    </style>

     <script type="text/javascript">
  function GetApproveConfirmation()
  {
      var reply = confirm("Are you sure you want to remove this from assigned project?");
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">
      
            <!-- BEGIN FORM-->


            <div class="form-body">

                <div class="row" align="center">
                    <h4 class="header2">Assign Project</h4>
                    <%--<asp:Label ID="lbltitle" runat="server" Text="Assign Project" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />

                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                     
                                    <div class="row">
                                         <div class="col m3">
                                              <div class="input-field">
                                                <div class="select-wrapper initialized">
                                                    
                                                    
                                                <asp:DropDownList ID="ddlEmployee" runat="server" placeholder=""
                                                    TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlEmployee" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Employee Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                    </div>
                                                  <label>Employee Name</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col m3">
                                             <div class="input-field">
                                                <div class="select-wrapper initialized">
                                                   
                                                   
                                                <div class="block1">
                            <asp:ListBox ID="lstProject" runat="server" Visible="false" SelectionMode="Multiple" AppendDataBoundItems="true" ></asp:ListBox>
                              
                          
                              <asp:CheckBoxList ID="chkProject" RepeatLayout="OrderedList" runat="server"   TabIndex="2"/>
                                                    </div>
                                                     <label>Project List </label>
                        </div>
                                            </div>
                                        </div>


                                      


                                    </div>

                                    <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="3" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" OnClientClick="this.disabled='true';"></asp:Button>
                                    </div>
                                </div>
                            </div>

                        </div>

                           <div class="row">
                    <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="count"></asp:Label>
                            <div class="portlet-body">
                                <div class="table-scrollable table-scrollable-borderless">
                                    <asp:GridView ID="GridProject" runat="server"  AutoGenerateColumns="False"
                                        class="striped" 
                                        GridLines="None" OnRowCommand="GridProject_RowCommand"
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Project Name" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProjectName")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Remove" ImageUrl="~/images/delete.png" AlternateText="delete" ToolTip="delete"  OnClientClick="return GetApproveConfirmation();"></asp:ImageButton>
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

                        <div class="clearfix"></div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
         </div>
    
</asp:Content>
