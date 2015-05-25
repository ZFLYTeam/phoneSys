<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="ColorAdd.aspx.cs" Inherits="Admin_ColorAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center;margin-top:30px;">
    <div style=" text-align:center;width:80%;height:50px;font-size:40px;color:#000">
    添加手机颜色
    </div>
    <div>
    <center>
    <table style="width:80%; height: 95px;">
    <tr>
    <td>颜色编号：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtcolorid" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="31px" Width="191px"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>名称：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtcolorname" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="33px" Width="204px"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>备注：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtcommit" runat="server" Height="86px" TextMode="MultiLine" 
            Width="338px" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        </td>
    </tr>
    </table>
    <div style="width:80%;text-align:center;margin-top:15px;">
        <asp:Button ID="btnSave" runat="server" Text="保存" onclick="btnSave_Click" 
            BackColor="Red" ForeColor="White" Width="55px" />
    </div>
    </center>
    </div>
    </div>
</asp:Content>
