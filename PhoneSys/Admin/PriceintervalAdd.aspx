<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="PriceintervalAdd.aspx.cs" Inherits="Admin_PriceintervalAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" text-align:center;width:80%;height:50px;font-size:40px;">
        添加价格区间
    </div>
    <div>
    <center>
    <table style="width:80%; height: 95px;">
    <tr>
    <td>区间编号：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtpriceid" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="27px" Width="338px" ></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>价格下限：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtpricelow" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="27px" Width="338px"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>价格上限：</td>
    <td style="text-align:left;">
        <asp:TextBox ID="txtpricehigh" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Height="27px" Width="338px"></asp:TextBox>
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
        <asp:ImageButton ID="Ibnsave" runat="server" Height="35px" 
            ImageUrl="~/images/save.jpg" onclick="Ibnsave_Click" />
    </div>
    </center>
    </div>
</asp:Content>
