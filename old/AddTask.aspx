<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTask.aspx.cs" Inherits="IG_Portal.AddTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="msapplication-tap-highlight" content="no"/>
<meta name="description" content=""/>
<meta name="keywords" content=""/>

    <!-- CORE CSS-->
  
  <link href="~/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="~/css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <!-- Custome CSS-->    
    <link href="~/css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="~/css/layouts/page-center.css" type="text/css" rel="stylesheet" media="screen,projection"/>

  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="~/js/plugins/prism/prism.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="~/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>
    <div class="card-panel">
    <div class="card-body">
        <div class="portlet-body">
            <!-- BEGIN FORM-->
             <form runat="server">
                  <script>

            $(function () {

                $("#ddlProjectName").customselect();
                search: true;
                hoveropen: false;
                      

                       $("#ddlTaskType").customselect();
                search: true;
                hoveropen: false;
            });
</script>
            <div class="form-body" >

                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Add Task" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />
               
                <div class="row">
                    <div class=" col m12">
                        <div class="portlet light ">
                            <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                            <div class="row">
                                <div class="col m4">
                                    <div class="form-group">
                                          <span class="title">
                                        <label>Project Name </label>
                                      <span class="required">*</span>
                                               </span>
                                        <asp:DropDownList ID="ddlProjectName" runat="server" placeholder=""
                                            ClientIDMode="Static" TabIndex="1">
                                        </asp:DropDownList>
                                         <span class="help-block">
                                        <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlProjectName" ValidationGroup="at" InitialValue="0"
                                            SetFocusOnError="true" ErrorMessage="Please Enter Project Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </span>
                                    </div>
                                </div>

                                <div class="col m4">
                                    <div class="form-group">
                                          <span class="title">
                                        <label>Task Type</label>
                                               <span class="required">*</span>
                                               </span>
                                        <asp:DropDownList ID="ddlTaskType" runat="server" placeholder=""
                                            ClientIDMode="Static" TabIndex="2">
                                        </asp:DropDownList>
                                         <span class="help-block">
                                        <asp:RequiredFieldValidator ID="requiredTaskType" runat="server" ControlToValidate="ddlTaskType" ValidationGroup="at" InitialValue="0"
                                            SetFocusOnError="true" ErrorMessage="Please Enter Task Type" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </span>
                                    </div>
                                </div>

                                <div class="col m4">
                                    <div class="form-group">
                                         <span class="title">
                                        <label>Task Title</label>
                                             <span class="required">*</span>
                                               </span>
                                        <asp:Textbox ID="txtTaskTitle" runat="server" placeholder=""
                                            ClientIDMode="Static"  TabIndex="3">
                                        </asp:Textbox>
                                        <span class="help-block">
                                        <asp:RequiredFieldValidator ID="requiredTaskTitle" runat="server" ControlToValidate="txtTaskTitle" ValidationGroup="at"
                                            SetFocusOnError="true" ErrorMessage="Please Enter Task Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                    </span>

                                    </div>
                                </div>
                                <div class="clearfix"></div>

                                 <div class="col m3">
                                    <div class="form-group">
                                         <span class="title">
                                        <label>Task Details</label>
                                             <span class="required">*</span>
                                               </span>
                                        <asp:TextBox ID="txtTaskDescription" runat="server" placeholder=""
                                            ClientIDMode="Static" TextMode="MultiLine" TabIndex="4">
                                        </asp:TextBox>
                                        <span class="help-block">
                                        <asp:RequiredFieldValidator ID="requiredTaskDescription" runat="server" ControlToValidate="txtTaskDescription" ValidationGroup="at"
                                            SetFocusOnError="true" ErrorMessage="Please Enter Task Description" ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                    </span>

                                    </div>
                                </div>

                                 <div class="col m3">
                                     <div class="form-group">
                                         <span class="title">
                                            <label> 
                                                 Date
                                             </label>
                                              <span class="required">*</span>
                                               </span>
                                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"  ReadOnly="true"></asp:TextBox>
                                            <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendar.png" UseSubmitBehavior="false" OnClick="imgPopup_Click" runat="server"  TabIndex="5"  />
                                            <asp:Calendar ID="Calendar1" Visible="false" OnSelectionChanged="Calendar1_SelectionChanged" runat="server" OnDayRender="Calendar1_DayRender" BackColor="#FFFFCC" BorderColor="#FFCC66"   BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"  
            ForeColor="#663399" ShowGridLines="True" >
                                                 <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />  
            <SelectorStyle BackColor="#FFCC66" />  
           
            <OtherMonthDayStyle ForeColor="#CC9966" />  
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />  
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />  
                                          <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />  
                                                </asp:Calendar>
                                              <asp:Label ID="selectdate" runat="server" Text="Select a Date" Visible="false" ForeColor="Red"></asp:Label>
                                            <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                        </div>
                                     </div>

                                 <div class="col m3">
                                        <div class="form-group">
                                         <span class="title">
                                            <label>
                                                Start Time</label> <span class="required">*</span>
                                             </span>
                                            <asp:TextBox ID="txtStartTime" runat="server" class="form-control"  TabIndex="6" TextMode="Time" Format="hh:mm" ></asp:TextBox>
                                            
                                            <asp:RequiredFieldValidator ID="requiredStartTime" runat="server" ControlToValidate="txtStartTime" ErrorMessage="Please Enter Start Time " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                        </div>
                            </div>

                                 <div class="col m3">
                                        <div class="form-group">
                                         <span class="title">
                                            <label>
                                                End Time</label> <span class="required">*</span>
                                             </span>
                                            <asp:TextBox ID="txtEndTime" runat="server" class="form-control"  TabIndex="7" TextMode="Time" Format="hh:mm" ></asp:TextBox>
                                            
                                            <asp:RequiredFieldValidator ID="requiredEndTime" runat="server" ControlToValidate="txtEndTime" ErrorMessage="Please Enter End Time " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                        </div>
                            </div>

                                 <div class="clearfix"></div>

                                
                            </div>
                        
                        <div class="row" align="center">
                           <asp:Button ID="btnsubmit" runat="server" TabIndex="8" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" ></asp:Button></div>
                        </div>
                        </div>

                    </div>

                 </div>
                    </form>
                </div>
           
        </div>
        </div>
    
</body>
</html>
