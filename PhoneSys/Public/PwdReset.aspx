<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="PwdReset.aspx.cs" Inherits="Public_PwdReset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid">
        <div class="page-header">
            <h1>
                修改密码</h1>
        </div>
        <div class="span3">
        </div>
        <div class="span6">
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="txtOPwd">
                        旧密码</label>
                    <div class="controls">
                        <asp:TextBox ID="txtOPwd" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="controls">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOPwd"
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red">*必填项</asp:RequiredFieldValidator></div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtNPwd0">
                        新密码</label>
                    <div class="controls">
                        <asp:TextBox ID="txtNPwd0" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtNPwd1">
                        确认密码</label>
                    <div class="controls">
                        <asp:TextBox ID="txtNPwd1" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="controls">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNPwd0"
                            ControlToValidate="txtNPwd1" ErrorMessage="CompareValidator" ForeColor="Red">两次输入的密码不一致！</asp:CompareValidator>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click"
                            Text=" 确认" Width="100px"  class="btn btn-success"/>
                        &nbsp;
                        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text=" 重置"
                            Width="100px" class="btn btn-success"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="span3">
        </div>
    </div>
</asp:Content>
