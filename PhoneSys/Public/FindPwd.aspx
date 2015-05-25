<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Findpwd.master" AutoEventWireup="true"
    CodeFile="FindPwd.aspx.cs" Inherits="Public_ResetPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="page-header">
            <h1>
                找回密码
            </h1>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label" for="txtUserName">
                    用户名</label>
                <div class="controls">
                    <asp:TextBox ID="txtUserName" runat="server" AutoPostBack="True" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="txtQuestion">
                    问题</label>
                <div class="controls">
                    <asp:TextBox ID="txtQuestion" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="txtAnswer">
                    答案</label>
                <div class="controls">
                    <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="txtNewPwd">
                    设置密码</label>
                <div class="controls">
                    <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="txtConfirmPwd">
                    设置密码</label>
                <div class="controls">
                    <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <div class="control">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPwd"
                        ControlToValidate="txtConfirmPwd" ErrorMessage="两次输入密码不一致!" ForeColor="Red"></asp:CompareValidator></div>
                <div class="controls">
                <asp:Button Text="保存"  ID="ibtnSave" runat="server" onclick="ibtnSave_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
