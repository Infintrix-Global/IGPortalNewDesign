<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="ProjectDelivery.aspx.cs" Inherits="IG_Portal.ProjectDelivery" %>
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
    function ValidateCheckBoxList(sender, args) {
        var checkBoxList = document.getElementById("<%=chkProjectType.ClientID %>");
        var checkboxes = checkBoxList.getElementsByTagName("input");
        var isValid = false;
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                isValid = true;
                break;
            }
        }
        args.IsValid = isValid;
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
                    <asp:Label ID="lbltitle" runat="server" Text="Project Delivery Details" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

              <%--  <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>--%>
                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    <div class="row">
                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Project Name </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                                     TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Technology</label>
                                                  
                                                </span>
                                              
                                                <asp:DropDownList ID="ddlTechnology" runat="server" placeholder="" AutoPostBack="true"
                                                    ClientIDMode="Static" TabIndex="2">
                                                </asp:DropDownList>
                                              <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTechnology" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Technology" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </span>
                                                  <asp:TextBox ID="txtTechnology" class="form-control"  TabIndex="19" Visible="false" runat="server" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqtxtTechnology" runat="server" ControlToValidate="txtTechnology" ValidationGroup="e"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Technology " ForeColor="Red"></asp:RequiredFieldValidator>
                                              
                                            </div>
                                        </div>

                                          <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Project Type </label>
                                                    <span class="required">*</span>
                                                </span>
                                                    <div class="block1">
                                                <asp:CheckBoxList ID="chkProjectType"  runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="3" >
                                                  
                                                </asp:CheckBoxList>
                                                        </div>
                                                <span class="help-block">
                                                   <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Please select at least one type."
    ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" ValidationGroup="e" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Free Support(In Months)</label>
                                                </span>
                                                <asp:TextBox ID="txtFreeSupport" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="4"  >
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFreeSupport" ValidationGroup="at" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Free Support" ForeColor="Red"></asp:RequiredFieldValidator>
                                                     <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="at" ForeColor="Red"
 ControlToValidate="txtFreeSupport" ErrorMessage="Value must be a whole number" />
                                                </span>
                                            </div>

                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label> % of AMC</label>
                                                   
                                                </span>
                                                <asp:TextBox ID="txtAMC" runat="server" placeholder=""
                                                    ClientIDMode="Static"  TabIndex="5" >

                                                </asp:TextBox>
                                                 <span class="help-block">
                                             <asp:RegularExpressionValidator runat="server" ErrorMessage="Decimal Only" ControlToValidate="txtAMC"
      ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                     
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAMC" ValidationGroup="at" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter AMC %" ForeColor="Red"></asp:RequiredFieldValidator>
                                               
                                                     </span>
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Working Days
                                                    </label>
                                                   
                                                </span>
                                                <asp:TextBox ID="txtWorkingDays" runat="server" CssClass="form-control"  TabIndex="6"  ></asp:TextBox>
                                              <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Working Days" ForeColor="Red"></asp:RequiredFieldValidator>
                                                  <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="at" ForeColor="Red"
 ControlToValidate="txtWorkingDays" ErrorMessage="Value must be a whole number" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Cost</label>
                                                    
                                                </span>
                                                <asp:TextBox ID="txtCost" runat="server" class="form-control" TabIndex="7"  ></asp:TextBox>
                                                   <span class="help-block">
                                             <asp:RegularExpressionValidator runat="server" ErrorMessage="Decimal Only" ControlToValidate="txtCost"
      ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                     
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCost" ValidationGroup="at" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Cost" ForeColor="Red"></asp:RequiredFieldValidator>
                                               
                                                     </span>
                                            </div>
                                        </div>

                                          <div class="clearfix"></div>
                     
                                                   
                     <%--   </ContentTemplate>
                    </asp:UpdatePanel>--%>
                                  
                                
                          <div class="col m3">
                             
                                                <span class="title">
                                                    <label>
                                                        Scope</label>
                                                    
                                                </span>
            <asp:FileUpload ID="FileUpScope" runat="server" AllowMultiple="true" />
                               <asp:Label ID="Label2" runat="server" Text="(Format supported:doc,pdf,docx)" ForeColor="Red"></asp:Label>
      
                              </div>
                                         <div class="col m3">
                                           <asp:Button ID="btnFileUpload" runat="server" Text="Upload File"  OnClick="btnFileUpload_Click" />
                                             </div>

                                        <div class="col m3">
        <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
              </div>
                                        <div class="clearfix"></div>
                                        <div class="row" id="Scope" runat="server" visible="false"> 
                                            <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label runat="server" Text="" ID="count"></asp:Label>
                            <div class="portlet-body">
                                <div class="table-scrollable table-scrollable-borderless">
                                    <asp:GridView ID="GridScope" runat="server"  AutoGenerateColumns="False"
                                        class="striped"
                                        GridLines="None" OnRowCommand="GridScope_RowCommand"
                                        ShowHeaderWhenEmpty="True" Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Scope" HeaderStyle-CssClass="autostyle2">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkImage" runat="server" Text='<%# Eval("ImageName")  %>' ForeColor="Blue" CommandArgument='<%# Eval("ImageName")  %>' CommandName="Download"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                        <ItemTemplate>
                                                           
                                                             <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<%# Eval("ID")  %>' CommandName="Remove" ImageUrl="~/images/delete.png" AlternateText="delete" ToolTip="delete"  OnClientClick="return confirm('Are you sure you want to remove this document?');" ></asp:ImageButton>
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
                                            


                                    <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="13" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false"   ></asp:Button>
                                    </div>
                                </div>
                            </div>

                        </div>

                
            </div>
                    
        </div>

    </div>
        </div>
</asp:Content>
