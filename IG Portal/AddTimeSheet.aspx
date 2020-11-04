<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddTimeSheet.aspx.cs" Inherits="IG_Portal.AddTasks" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
           
            <!-- BEGIN FORM-->

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
            <script type="text/javascript">
                function DateTimeValidation(sender, args) {
                    var start = document.getElementById("<%=txtStartTime.ClientID %>").value;
        var end = document.getElementById("<%=txtEndTime.ClientID %>").value;
                    var date1 = new Date();
                    var startTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + start);

                    var endTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + end);


                    if (startTime >= endTime) {
                        args.IsValid = false;
                    }

                }

                function DateTime12Validation(sender, args) {
                    var start = document.getElementById("<%=txtStartTime.ClientID %>").value;
                     var end = document.getElementById("<%=txtEndTime.ClientID %>").value;
                     var date1 = new Date();
                     var startTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + start);

                     var endTime = new Date(date1.getMonth() + "/" + date1.getDate() + "/" + date1.getYear() + " " + end);


                    var diff = (endTime.getTime() - startTime.getTime()) / 1000;
                    diff /= (60 * 60);
                    
                    if(diff>12) {
                         args.IsValid = false;
                     }

                 }
            </script>

            <div class="form-body">

                <div class="row" align="center">
                    <h4 class="header2">Add TimeSheet</h4>
                  <%--  <asp:Label ID="lbltitle" runat="server" Text="Add TimeSheet" Font-Bold="true" Font-Size="Large"></asp:Label>--%>
                </div>
                <br />

               

                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    <div class="row">
                                         <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>
                                        <div class="col m3">
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

                                          <div class="col m3">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                                   
                                                   
                                                <asp:DropDownList ID="ddlTaskCategory" runat="server" placeholder=""  AutoPostBack="true"
                                                     TabIndex="2" OnSelectedIndexChanged="ddlTaskCategory_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlTaskCategory" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Task Category" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                        </div>
                                                 <label>Task Category</label>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                                   
                                                   
                                                <asp:DropDownList ID="ddlTaskType" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="3">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskType" runat="server" ControlToValidate="ddlTaskType" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Type" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                        </div>
                                                 <label>Task Type</label>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                                   
                                                    
                                                <asp:DropDownList ID="ddlTaskTitle" runat="server" placeholder=""
                                                    TabIndex="4" OnSelectedIndexChanged="ddlTaskTitle_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlAssignTask" runat="server" placeholder="" Visible="false"
                                                    ClientIDMode="Static" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskTitle" runat="server" ControlToValidate="ddlTaskTitle" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                        </div>
                                                 <label>Task Title</label>

                                            </div>

                                            <div class="input-field">
                                                <asp:TextBox ID="txtTaskTitle" class="form-control" placeholder="Enter Task Title" TabIndex="4" Visible="false" runat="server"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredtxttitle" runat="server" ControlToValidate="txtTaskTitle" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title " ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                                      </ContentTemplate>
                    </asp:UpdatePanel>
                                        <div class="clearfix"></div>

                                        <div class="col m3">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                                    
                                                    
                                                <asp:TextBox ID="txtTaskDescription" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="5">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskDescription" runat="server" ControlToValidate="txtTaskDescription" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Description" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                   </div>
                                                <label>Task Details</label>

                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                                                                                   
                                                <asp:TextBox ID="txtDate"  ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="Date" TabIndex="6"   ></asp:TextBox>
                                                <%-- <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendar.png" UseSubmitBehavior="false" OnClick="imgPopup_Click" runat="server" TabIndex="5" />
                                        <asp:Calendar ID="Calendar1" Visible="false" OnSelectionChanged="Calendar1_SelectionChanged" runat="server" OnDayRender="Calendar1_DayRender" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                            ForeColor="#663399" ShowGridLines="True">
                                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                            <SelectorStyle BackColor="#FFCC66" />

                                            <OtherMonthDayStyle ForeColor="#CC9966" />
                                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                        </asp:Calendar>
                                        <asp:Label ID="selectdate" runat="server" Text="Select a Date" Visible="false" ForeColor="Red"></asp:Label>--%>
                                                      <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>

                                                <asp:RangeValidator ID="rgvStartDate" runat="server" ErrorMessage="Only Previous 3 days are allowed"
                 ValidationGroup="at" ControlToValidate="txtDate" ForeColor="Red" SetFocusOnError="true" Type="Date"></asp:RangeValidator>
                                                          </span>
                                                   </div>
                                                   <label>
                                                        Date
                                                    </label>

                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                                   
                                                  
                                                <asp:TextBox ID="txtStartTime" ClientIDMode="Static" runat="server" class="form-control" TabIndex="7" TextMode="Time" Format="hh:mm tt" ></asp:TextBox>
                                                    <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredStartTime" runat="server" ControlToValidate="txtStartTime" ErrorMessage="Please Enter Start Time " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
</span>
                                                   </div>
                                                 <label>
                                                        Start Time</label>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                                    
                                                    
                                                <asp:TextBox ID="txtEndTime" runat="server" ClientIDMode="Static" class="form-control" TabIndex="8" TextMode="Time" Format="hh:mm tt" ></asp:TextBox>
                                                   <span class="help-block">
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="End Time should be greater than Start Time"
                                                    ForeColor="Red" ControlToValidate="txtEndTime" Display="Dynamic" ClientValidationFunction="DateTimeValidation" ValidationGroup="at"></asp:CustomValidator>
                                                 <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Difference between End Time and Start Time shoud be less than 12 hours"
                                                    ForeColor="Red" ControlToValidate="txtEndTime" Display="Dynamic" ClientValidationFunction="DateTime12Validation" ValidationGroup="at"></asp:CustomValidator>
                                                <asp:RequiredFieldValidator ID="requiredEndTime" runat="server" ControlToValidate="txtEndTime" ErrorMessage="Please Enter End Time " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                       </span>
                                                   </div>
                                                <label>
                                                        End Time</label>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                                        <div class="col m4">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                                    
                                                    
                                                <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="9" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredStatus" runat="server" ControlToValidate="ddlStatus" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Status" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </span>
                                                   </div>
                                                <label>Status </label>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="input-field">
                                               <div class="select-wrapper initialized">
                                               
                                                <asp:TextBox ID="txtComment" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="10">
                                                </asp:TextBox>
                                                   </div>
                                                   <label>Comments</label>
                                            </div>
                                        </div>
                                   
                              <div class="clearfix"></div>

                                    <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="11" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false"   ></asp:Button>
                                    </div>
                         </ContentTemplate>
                    </asp:UpdatePanel>
                                         </div>
                                </div>
                            </div>

                        </div>

                   
            </div>

        </div>

    </div>
</asp:Content>
