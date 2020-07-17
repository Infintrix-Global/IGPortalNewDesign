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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="card-body">
        <div class="portlet-body">
      
            <!-- BEGIN FORM-->


            <div class="form-body">

                <div class="row" align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Assign Project" Font-Bold="true" Font-Size="Large"></asp:Label>
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
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Employee Name</label>
                                                    <span class="required">*</span>
                                                </span>
                                                <asp:DropDownList ID="ddlEmployee" runat="server" placeholder=""
                                                    ClientIDMode="Static" TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlEmployee" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Select Employee Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col m3">
                                            <div class="form-group">
                                                <span class="title">
                                                    <label>Project List </label>
                                                    <span class="required">*</span>
                                                </span>
                                                <div class="block1">
                            <asp:ListBox ID="lstProject" runat="server" Visible="false" SelectionMode="Multiple" AppendDataBoundItems="true" ></asp:ListBox>
                              
                          
                              <asp:CheckBoxList ID="chkProject" RepeatLayout="OrderedList" runat="server"   TabIndex="2"/>
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

                        <div class="clearfix"></div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
         </div>
    
</asp:Content>
