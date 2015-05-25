<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="UpdateInfo.aspx.cs" Inherits="Public_UpdateInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="content">
                <div id="info">
                </div>
                <div id="info1">
                    &nbsp;&nbsp;个人信息维护&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/images/Edit.jpg" OnClick="ibtnEdit_Click" />
                </div>
                <div id="cont">
                    <table>
                        <tr class="style3">
                            <td class="style9">
                            </td>
                            <td class="style1">
                                用户名：
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server" Height="21px" Width="210px" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr class="style2">
                            <td class="style9">
                            </td>
                            <td class="style1">
                                邮箱：
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Height="21px" Width="210px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr class="style6">
                            <td class="style9">
                            </td>
                            <td class="style1">
                                联系方式：
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhone" runat="server" Height="21px" Width="210px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr class="style6">
                            <td class="style9">
                            </td>
                            <td class="style1">
                                地址：
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" Height="21px" Width="210px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr class="style6">
                            <td class="style9">
                            </td>
                            <td class="style1">
                                问题：
                            </td>
                            <td>
                                <asp:TextBox ID="txtQuestion" runat="server" Height="21px" Width="210px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr class="style6">
                            <td class="style9">
                            </td>
                            <td class="style1">
                                答案：
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswer" runat="server" Height="21px" Width="210px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr class="style8">
                            <td class="style9">
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:ImageButton ID="BtnAlter" runat="server" 
                                    ImageUrl="~/images/AlterUserInfo.jpg" onclick="BtnAlter_Click" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>
