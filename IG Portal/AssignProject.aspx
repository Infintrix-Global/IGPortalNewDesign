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
     
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Assign Project</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Assign Project Details</a></div>
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

                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                   <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                
                                <div class="card">
                                  <div class="card-header">
                                    <h4>Fill Up the below Details
                                        <i class="fas fa-arrow-down"></i>
                                    </h4>
                                  </div>
                            <div class="card-body">
                                <div class="form-group row">
                               <div class=" col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Employee Name</label>
                                         
                                                <asp:DropDownList ID="ddlEmployee" runat="server" placeholder=""
                                                    TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged" CssClass="form-control">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlEmployee" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Employee Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                    </div>
                                                 <div class="col-sm-6 form-group">
                               <label class="col-sm-6 col-form-label">Project List </label>
                                                <div class="block1">
                            <asp:ListBox ID="lstProject" runat="server" Visible="false" SelectionMode="Multiple" AppendDataBoundItems="true" ></asp:ListBox>
                              <asp:CheckBoxList ID="chkProject" RepeatLayout="OrderedList" runat="server"   TabIndex="2"/>
                                                    </div>
                                                         </div>
                                        </div>
                                <div class="form-group row">
                         <div class="col-sm-5"></div>
                         <div class="col-sm-2">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="3" ClientIDMode="Static" Text="Submit" class="btn btn-outline-primary" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" style="width:150px"></asp:Button>
                                    </div>
                                </div>
                             <div class="form-group row" runat="server" id="divSearch" visible="false">
                                <div class="col-sm-6 form-group">
                            <label class="col-sm-6 col-form-label">Project Name</label>
                                 <asp:TextBox ID="txtProjectName" runat="server" class="form-control" placeholder=""
                                ClientIDMode="Static" ValidationGroup="e"></asp:TextBox>
                                </div>
                              <div class="col-sm-6 form-group">
                             <asp:Button ID="btnSearch" runat="server"  Text="Search" class="btn btn-outline-info" ClientIDMode="Static" OnClick="btnSearch_Click" style="margin-top:50px;width:150px"/>
                            </div>
                          </div>
                        </div>
                            <div class="row" style="margin-left:20px;margin-right:20px">
                            <div class="col-12">
                                <h5>
                              <asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                            
                                    <div style="overflow-x:auto;width:100%">
                                        <asp:GridView ID="GridProject" runat="server"  AutoGenerateColumns="False"
                                        class="table table-bordered" 
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
