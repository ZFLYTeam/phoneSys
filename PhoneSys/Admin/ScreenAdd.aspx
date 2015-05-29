<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="ScreenAdd.aspx.cs" Inherits="Admin_ScreenAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" text-align:center;color:#000;margin-top:30px;height:50px;font-size:40px;">
        添加屏幕尺寸
    </div>
    <div>
    <center>
    <table style="width:80%; height: 95px;;height:50px;font-size:40px;">
    <tr>
    <td><span style="font-size: 20px">尺寸编号：</span></td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtsizeid" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="29px" Width="338px"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td><span style="font-size: 20px">尺寸大小：</span></td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtsizename" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="29px" Width="338px"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td><span style="font-size: 20px">备注：</span></td>
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
