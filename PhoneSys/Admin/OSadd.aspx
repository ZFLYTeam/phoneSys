<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="OSadd.aspx.cs" Inherits="Admin_Osadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" text-align:center;width:80%;height:50px;font-size:40px;color:#000;">
    添加操作系统</div>
    <div>
    <center>
    <table style="width:80%; height: 95px;">
    <tr>
    <td>系统编号：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtosid" runat="server" BorderStyle="Solid" BorderWidth="1px" 
            Height="32px" Width="338px"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>系统名称：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtosname" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="32px" Width="338px"></asp:TextBox>
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
    <div style="width:80%;text-align:center">
        <asp:ImageButton ID="IbnSave" runat="server" Height="35px" 
            ImageUrl="~/images/保存.gif" onclick="IbnSave_Click" />
    </div>
    </center>
    </div>
</asp:Content>
