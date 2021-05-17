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
    
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Project Delivery</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Project Delivery Details</a></div>
</div>
</div>
</div>
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-chart float-right">
<div class="breadcrumb-chart m-l-50">
<div class="float-right">
<div class="icon m-b-10">
<div class="chart header-bar">
<canvas width="49" height="40" ></canvas>
</div>
</div>
</div>
<div class="float-right m-r-5 m-l-10 m-t-1">
<div class="chart-info">
<span>$10,415</span>
<p>Last Week</p>
</div>
</div>
</div>

<div class="breadcrumb-chart m-l-50">
<div class="float-right">
<div class="icon m-b-10">
<div class="chart header-bar2">
<canvas width="49" height="40" ></canvas>
</div>
</div>
</div>
<div class="float-right m-r-5 m-l-10 m-t-1">
<div class="chart-info">
<span>$22,128</span>
<p>Last Month</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
    <!-- BEGIN FORM-->

           
              <%--  <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>--%>
			<asp:Label ID="lblMessage" runat="server"></asp:Label>
                        <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Fill up the below details
                                        <i class="fas fa-arrow-down"></i>
                                    </h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-4 form-group">
                               <label class="col-sm-5 col-form-label">Project Name </label>
                                <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                                     TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                        </div>
                                     <div class=" col-sm-4 form-group">
                                    <label class="col-sm-5 col-form-label">Technology</label>
                                              <asp:DropDownList ID="ddlTechnology" runat="server" placeholder="" AutoPostBack="true"
                                                    ClientIDMode="Static" TabIndex="2" class="form-control">
                                                </asp:DropDownList>
                                              <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTechnology" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Technology" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </span>
                                                  <asp:TextBox ID="txtTechnology" class="form-control"  TabIndex="19" Visible="false" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqtxtTechnology" runat="server" ControlToValidate="txtTechnology" ValidationGroup="e"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Technology " ForeColor="Red"></asp:RequiredFieldValidator>
                                               </div>
                                    <div class=" col-sm-4 form-group">
                                    <label class="col-sm-5 col-form-label">Project Type</label>
                                    
                                                    <div class="block1">
                                                <asp:CheckBoxList ID="chkProjectType"  runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="3" class="form-control">
                                                  
                                                </asp:CheckBoxList>
                                                        </div>
                                                <span class="help-block">
                                                   <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Please select at least one type."
                                                ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" ValidationGroup="e" />
                                                </span>
                                      </div>
                                </div>
                             <div class="form-group row" style="margin-top:-60px;">
                               <div class=" col-sm-4 form-group">
                               <label class="col-sm-8 col-form-label">Free Support(In Months)</label>
                                        <asp:TextBox ID="txtFreeSupport" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="4" class="form-control">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFreeSupport" ValidationGroup="at" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Free Support" ForeColor="Red"></asp:RequiredFieldValidator>
                                                     <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="at" ForeColor="Red"
 ControlToValidate="txtFreeSupport" ErrorMessage="Value must be a whole number" />
                                                </span>
                                           </div>
                                              <div class=" col-sm-4 form-group">
                               <label class="col-sm-6 col-form-label">% of AMC</label>
                                    <asp:TextBox ID="txtAMC" runat="server" placeholder=""
                                                    ClientIDMode="Static"  TabIndex="5" class="form-control">
                                                </asp:TextBox>
                                                 <span class="help-block">
                                             <asp:RegularExpressionValidator runat="server" ErrorMessage="Decimal Only" ControlToValidate="txtAMC"
      ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAMC" ValidationGroup="at" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter AMC %" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </span>
                                                    </div>
                                                        <div class=" col-sm-4 form-group">
                                                        <label class="col-sm-6 col-form-label">Working Days</label>
                                      <asp:TextBox ID="txtWorkingDays" runat="server" CssClass="form-control"  TabIndex="6"  ></asp:TextBox>
                                              <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Working Days" ForeColor="Red"></asp:RequiredFieldValidator>
                                                  <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="at" ForeColor="Red"
 ControlToValidate="txtWorkingDays" ErrorMessage="Value must be a whole number" />
                                                </span>
                                            </div>
                                        </div>
                                 <div class="form-group row" style="margin-top:-60px;">
                               <div class=" col-sm-4 form-group">
                               <label class="col-sm-8 col-form-label">Cost</label>
                              <asp:TextBox ID="txtCost" runat="server" class="form-control" TabIndex="7"  ></asp:TextBox>
                                                   <span class="help-block">
                                             <asp:RegularExpressionValidator runat="server" ErrorMessage="Decimal Only" ControlToValidate="txtCost"
      ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                     
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCost" ValidationGroup="at" 
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Cost" ForeColor="Red"></asp:RequiredFieldValidator>
                                               
                                                     </span>
                                        </div>
                                            <%--   </ContentTemplate>
                    </asp:UpdatePanel>--%>
                                <div class=" col-sm-4 form-group">
                                     <label class="col-sm-8 col-form-label">Scope</label>
                               <asp:FileUpload ID="FileUpScope" runat="server" AllowMultiple="true" class="form-control"/>
                               <asp:Label ID="Label2" runat="server" Text="(Format supported:doc,pdf,docx)" ForeColor="Red"></asp:Label>
                                </div>
                                 <div class=" col-sm-4 form-group">
                                <asp:Button ID="btnFileUpload" class="btn btn-outline-primary" runat="server" Text="Upload File"  OnClick="btnFileUpload_Click" style="margin-top:50px"/>
                                             </div>
                                     </div>
                                        <div class="col m3">
                                           <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
                                                </div>
                                        <div class="row" id="Scope" runat="server" visible="false"> 
                                                <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Project Delivery Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <h5>
                                            <asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                             <div style="overflow-x:auto;width:100%">
                                    <asp:GridView ID="GridScope" runat="server"  AutoGenerateColumns="False"
                                        class="table table-bordered"
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
                                       <div class="form-group row">
                                     <div class="col-sm-5"></div>
                                     <div class="col-sm-2">
                                      <asp:Button ID="btnsubmit" class="btn btn-outline-info" runat="server" TabIndex="13" ClientIDMode="Static" Text="Submit" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false"  style="width:150px;" ></asp:Button>
                                    </div>
                                </div>
                            </div>
                                    </div>
                                    </div>
                            </div>
   
</asp:Content>
