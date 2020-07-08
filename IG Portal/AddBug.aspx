<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddBug.aspx.cs" Inherits="IG_Portal.AddBug" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
          

            <div class="form-body">

                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Add Bugs" Font-Bold="true" Font-Size="Large"></asp:Label>
                </div>
                <br />

                <asp:UpdatePanel ID="upBug" runat="server">
                    <ContentTemplate>

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
                                                    ClientIDMode="Static" TabIndex="1" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged"  AutoPostBack="true">
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

                                          <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Page Name</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlPageTitle" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="4">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPageTitle" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Page Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Task Title</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlTaskTitle" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="3" OnSelectedIndexChanged="ddlTaskTitle_SelectedIndexChanged" AutoPostBack="true" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskTitle" runat="server" ControlToValidate="ddlTaskTitle" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>

                                            </div>

                                            <div class="form-group">
                                                `<asp:TextBox ID="txtTaskTitle" class="form-control" placeholder="Enter Task Title" TabIndex="4" Visible="false" runat="server"></asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtTaskTitle" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Task Title " ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>
                                       
                                       
                                          <div class="clearfix"></div>

                                         <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Bug Details</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:TextBox ID="txtBugDescription" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" Height="100px" TabIndex="5">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredBugDescription" runat="server" ControlToValidate="txtBugDescription" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Bug Description" ForeColor="Red"></asp:RequiredFieldValidator>

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
                                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" TabIndex="6" ></asp:TextBox>
                                               
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Priority</label>
                                                    <span class="required">*</span>
                                                </span>
                                                
                                                <asp:RadioButtonList ID="radPriority"  runat="server" class="form-control" TabIndex="7">
                                                    <asp:ListItem Text="High Priority" Value="High Priority" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Medium Priority" Value="Medium Priority"></asp:ListItem>
                                                    <asp:ListItem Text="Low Priority" Value="Low Priority"></asp:ListItem>

                                                </asp:RadioButtonList>
                                               
                                            </div>
                                        </div>

                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>
                                                        Suggested By</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlSuggetedBy" runat="server" class="form-control" TabIndex="8"  ></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="requiredSuggestedBy" runat="server" ControlToValidate="ddlSuggetedBy" ErrorMessage="Please Select Suggested By" InitialValue="0" ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>

                                        

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Status </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlStatus" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="9" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredStatus" runat="server" ControlToValidate="ddlStatus" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Status" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Comments</label>

                                                </span>
                                                <asp:TextBox ID="txtComment" runat="server" placeholder=""
                                                    ClientIDMode="Static" TextMode="MultiLine" TabIndex="10">
                                                </asp:TextBox>


                                            </div>
                                        </div>


                                        <div class="clearfix"></div>
                                          <div class="col m3">
            <asp:FileUpload ID="FileUpReciept" runat="server" AllowMultiple="true" />
                               <asp:Label ID="Label2" runat="server" Text="(Format supported:jpeg,png,jpg)" ForeColor="Red"></asp:Label>
                           
        </div>
                                        <%-- <div class="col m3">
                                           <asp:Button ID="btnFileUpload" runat="server" Text="Upload File"  OnClick="btnFileUpload_Click" />
                                             </div>--%>

                                        <div class="col m3">
        <asp:Label ID="lblReciept" runat="server" Visible="true"></asp:Label>
              </div>
                                    </div>

                                    <div class="row" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" TabIndex="10" ClientIDMode="Static" Text="Submit" class="btn" CausesValidation="true" OnClick="btnsubmit_Click" ValidationGroup="at" UseSubmitBehavior="false"   ></asp:Button>
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
