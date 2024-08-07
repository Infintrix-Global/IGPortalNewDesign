﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="LeaveApproval.aspx.cs" Inherits="IG_Portal.LeaveApproval" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
    <script type="text/javascript">
        function GetConfirmation() {
            var reply = confirm("Are you sure you want to submit these details?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
    <style>
        .myradio {
            position: absolute;
            left: 0px;
            visibility: visible;
        }
        .inline-rb input[type="radio"] {
            width: auto;
            position:initial;
            left: 0px;
            visibility: visible;
}

.inline-rb label {
    display: inline;
}
      .inline-rb [type="radio"]:checked + label {
     position: initial;
        }
        .inline-rb [type="radio"]:not(:checked) + label {
     position: initial;
        }
    </style>

     <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 400px;
            height: 300px;
            border: 3px solid #0DA9D0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="section-header">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
<div class="section-header-breadcrumb-content">
<h1>Leave Approval</h1>
<div class="section-header-breadcrumb">
<div class="breadcrumb-item active"><a href="#"><i class="fas fa-home"></i></a></div>
<div class="breadcrumb-item"><a href="#.aspx">Leave Details</a></div>
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
    

    <%-- <div class="page-bar">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="AdminDashBoard.aspx">Home</a>
                        <i class="fa fa-angle-right"></i>


                        <a href="LeaveApplication.aspx">Leave Approval Applications</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>

            </div>--%>
            <!-- BEGIN FORM-->


            
                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                <div class="card-header">
                                <h4>Leave Approval Details
                                <i class="fas fa-arrow-down"></i></h4>
                                </div>
                                <div class="card-body">
                                <h5><asp:Label runat="server" Text="" ID="count"></asp:Label></h5>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div style="overflow-x:auto;width:100%">
                                                <asp:GridView ID="GridLeave" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            class="table table-bordered" OnSorting="GridLeave_Sorting" AllowSorting="true" DataKeyNames="ID"
                                                            GridLines="None" OnRowCommand="GridLeave_RowCommand" OnRowDataBound="GridLeave_RowDataBound"
                                                            ShowHeaderWhenEmpty="True" Width="100%" OnPageIndexChanging="GridLeave_PageIndexChanging" PageSize="10">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Application Date" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveApplicationDate">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("LeaveApplicationDate")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Employee Name" HeaderStyle-CssClass="autostyle2" SortExpression="EmployeeName">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeName")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Leave type" HeaderStyle-CssClass="autostyle2" SortExpression="LeaveName">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("LeaveName")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="From Date" HeaderStyle-CssClass="autostyle2" SortExpression="FromDate">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("FromDate","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="To Date" HeaderStyle-CssClass="autostyle2" SortExpression="ToDate">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("ToDate","{0:dd/MMM/yy}")   %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                  <asp:TemplateField HeaderText="Days" HeaderStyle-CssClass="autostyle2" SortExpression="ToDate">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Days")   %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Reason" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Reason")  %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                               

                                                                   <asp:TemplateField HeaderText="Details" HeaderStyle-CssClass="autostyle2">
                                                            <ItemTemplate>
                                                                <img alt="" style="cursor: pointer" src="images/plus.png" />
                                                                <asp:Panel ID="Panel1" runat="server" Style="display: none">
                                                                    <asp:GridView ID="gvmp" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowDataBound="gvmp_RowDataBound">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                                 <asp:Label ID="lblldID" runat="server" Text='<%# Eval("ID")  %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Date">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label18" runat="server" Text='<%#  Eval("LeaveApplicationDate","{0:dd/MMM/yy}")  %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Applied Leave ">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblApplied" runat="server" Text='<%#  Eval("LeaveApplied")  %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblAppliedLeave" runat="server" ></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                             <asp:TemplateField HeaderText="Approved Leave ">
                                                                                <ItemTemplate>
                                                                                    
                                                                                    <asp:RadioButtonList ID="radLeave" runat="server" RepeatDirection="Horizontal"  CssClass="inline-rb" OnSelectedIndexChanged="radLeave_SelectedIndexChanged">  
                                                                                         
                                                                                        <asp:ListItem Text="Half Day" Value="0.5" >  </asp:ListItem>
                                                                         <asp:ListItem Text="Full Day" Value="1" ></asp:ListItem>
                                                                                          <asp:ListItem Text="Reject" Value="0" ></asp:ListItem>
                                                                     </asp:RadioButtonList>
                                                                                </ItemTemplate>
                                                                                
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>

                                                                     
                                                                   
                                                                </asp:Panel>
                                                            </ItemTemplate>
                                                     
                                                </asp:TemplateField>

                                                                  <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnSubmit" Text="Submit" runat="server"  CssClass="btn btn-outline-info" OnClientClick="return GetConfirmation();" CommandName="Submit"  CommandArgument='<%#Container.DataItemIndex %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                               <%-- <asp:TemplateField HeaderText="" HeaderStyle-CssClass="autostyle2">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnApprove" runat="server" CssClass="btn" Text="Approve" CommandName="Approve" CommandArgument='<%# Eval("ID")  %>'></asp:Button>
                                                                        <asp:Button ID="btnReject" runat="server" CssClass="btn" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("ID")  %>'></asp:Button>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>--%>







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
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>

                        </div>


                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

                <asp:Button ID="btnShow" runat="server" Text="" Visible="true" Style="display: none" />
            <!-- ModalPopupExtender -->
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlpp" TargetControlID="btnShow"
                CancelControlID="Vpbtncancel" BackgroundCssClass="modalBackground" />

            <asp:Panel ID="pnlpp" runat="server" Style="display: none">

                <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup">
                    <table>
                      
                        <tr>
                             <td>
                                 <asp:Label ID="lblppLeaveID" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblComment" runat="server" Text="Comment"></asp:Label>
                            </td>
                           

                            <td>
                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"></asp:TextBox>
                                 <asp:RequiredFieldValidator runat="server"
                                    ID="RequiredFieldValidator1"
                                    ControlToValidate="txtComment" Text="Required"  ValidationGroup="v"
                                    ErrorMessage="Enter an comment"></asp:RequiredFieldValidator>
                            </td>
                          

                        </tr>

                        <tr align="center">
                            <td></td>
                             <td>
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn blue" OnClick="btnsubmit_Click" ValidationGroup="v" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <div class="row" align="center">

                    <asp:Button ID="Vpbtncancel" CausesValidation="false" runat="server" Text="Cancel " Visible="true" BackColor="#c5484d" ForeColor="white" Height="29px" />

                </div>

            </asp:Panel>

        </div>

    </div>
</asp:Content>
