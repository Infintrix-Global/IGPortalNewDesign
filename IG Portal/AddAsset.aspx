<%@ Page Title="" Language="C#" MasterPageFile="~/PortalMaster.Master" AutoEventWireup="true" CodeBehind="AddAsset.aspx.cs" Inherits="IG_Portal.AddAsset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card-body">
        <div class="portlet-body">
         
            <!-- BEGIN FORM-->


            <div class="form-body">

                <div class="row" align="center">
                    <h4 class="header2">Add Asset</h4>
             
                </div>
                <br />

                <asp:UpdatePanel ID="upEmployee" runat="server">
                    <ContentTemplate>

                        <div class="row">
                            <div class=" col m12">
                                <div class="portlet light ">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    <div class="row">
                                        <div class="col m4">
                                            <div class="input-field">
                                                  <div class="select-wrapper initialized">
                                              <%--          <div class="select-wrapper initialized">
                                                  
                                                    <span class="required">*</span>
                                                </span>--%>
                                                <asp:DropDownList ID="ddlCustomerName" runat="server" placeholder="" 
                                                     TabIndex="1" >
                                                </asp:DropDownList>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredProjectName" runat="server" ControlToValidate="ddlCustomerName" ValidationGroup="at" InitialValue="0"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Customer Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                                      </div>
                                                  <label>Customer Name </label>
                                            </div>
                                        </div>

                                     
                                        <div class="clearfix"></div>

                                        <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                  
                                                <asp:TextBox ID="txtAssetNo" runat="server" placeholder="" Height="80px"
                                                    ClientIDMode="Static"  TabIndex="2">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="requiredTaskDescription" runat="server" ControlToValidate="txtAssetNo" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Asset No" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                    </div>
                                                  <label>Asset No.</label>
                                            </div>
                                        </div>

                                             <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                  
                                                  
                                                <asp:TextBox ID="txtAssetName" runat="server" placeholder="" Height="80px"
                                                    ClientIDMode="Static"  TabIndex="3">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAssetName" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Asset Name" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                    </div>
                                                  <label>Asset No.</label>
                                            </div>
                                        </div>

                                          <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                  
                                                  
                                                <asp:TextBox ID="txtSerialNum" runat="server" placeholder="" Height="80px"
                                                    ClientIDMode="Static"  TabIndex="4">
                                                </asp:TextBox>
                                                <span class="help-block">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAssetName" ValidationGroup="at"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter Serial Number" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </span>
                                                    </div>
                                                  <label>Serial Number</label>
                                            </div>
                                        </div>

                                        <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                   
                                                  <%--  <span class="required">*</span>
                                                </span>--%>
                                                <asp:TextBox ID="txtSDate" runat="server" CssClass="form-control"  TabIndex="5" TextMode="Date"   ></asp:TextBox>
                                               <span class="help-block">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ControlToValidate="txtSDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                   </span>
                                                            </div>
                                                <label>
                                                      Support Start Date
                                                    </label>
                                            </div>
                                        </div>

                                      <div class="col m4">
                                            <div class="input-field">
                                                        <div class="select-wrapper initialized">
                                                   
                                                  <%--  <span class="required">*</span>
                                                </span>--%>
                                                <asp:TextBox ID="txtEDate" runat="server" CssClass="form-control"  TabIndex="6" TextMode="Date"   ></asp:TextBox>
                                               <span class="help-block">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSDate" ErrorMessage="Please Enter Date  " ForeColor="Red" SetFocusOnError="true" ValidationGroup="at"></asp:RequiredFieldValidator>
                                                   </span>
                                                            </div>
                                                <label>
                                                      Support End Date
                                                    </label>
                                            </div>
                                        </div>
                                      

                                        <div class="clearfix"></div>
                                     
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
