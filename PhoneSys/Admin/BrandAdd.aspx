<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="BrandAdd.aspx.cs" Inherits="Admin_BrandAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center >
    <div style="text-align:center;margin-top:30px;">
    <div style=" text-align:center;width:80%; height: 50px; font-size:40px; color:#000;">
    添加手机品牌
    </div>
    <div>
    <center>
    <table style="width:60%;">
    <tr>
    <td>品牌编号：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtbrandid" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="30px" Width="338px"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>名称：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtbrandname" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="33px" Width="338px"></asp:TextBox>
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
    <div style="width:76%; text-align:center;margin-top:15px;">
        <asp:ImageButton ID="IbnSave" runat="server" Height="30px" 
            ImageUrl="../images/save.jpg" onclick="IbnSave_Click" Width="60px" />
    </div>
    </center>
    </div>
    </div>
    </center>

    
</asp:Content>