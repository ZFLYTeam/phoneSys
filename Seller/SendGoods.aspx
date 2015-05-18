<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="SendGoods.aspx.cs" Inherits="Seller_SendGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style1
        {
            width: 100%;
            height: 381px;
        }
        .style2
        {
        }
        .style3
        {
            text-align: right;
        }
        .style4
        {
            text-align: right;
        }
         #content
    {
        margin:0 auto;
        padding:0;
        height: auto;
        width:1035px;
        border:1px solid #ff9900;
        border-bottom-style:none;
        margin-top:15px; 
        background-image:url('../images/seller2.jpg');
        font-family: 微软雅黑;          
    }
        .style5
        {
            height: 36px;
            width: 660px;
        }
        .style6
        {
            width: 660px;
        }
        .style7
        {
            text-align: right;
            height: 26px;
        }
        .style8
        {
            width: 660px;
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <div id="content">
        <table class="style1">
            <tr>
                <td class="style4" rowspan="9">
&nbsp;&nbsp;
                    &nbsp;<asp:Image ID="Image2" runat="server" Height="344px" 
                        ImageUrl="~/images/seller1.jpg" Width="202px" />
                </td>
                <td class="style4">
                    <div>
                    </div>
                </td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style2" rowspan="9">
                    <asp:Image ID="Image1" runat="server" Height="344px" 
                        ImageUrl="~/images/seller1.jpg" Width="202px" />
                </td>
            </tr>
            <tr>
                <td class="style4">
                    订单号：</td>
                <td class="style5">
                    <asp:Label ID="lblOrderId" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    收件人姓名：</td>
                <td class="style6">
                    <asp:Label ID="lblBuyerName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    收件人联系电话：</td>
                <td class="style6">
                    <asp:Label ID="lblBuyerPhone" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    收件人地址：</td>
                <td class="style8">
                    <asp:Label ID="lblBuyerAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    发件人姓名：</td>
                <td class="style6">
                    <asp:TextBox ID="txtSellerName" runat="server" Height="18px" 
                        Width="175px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    发件人联系电话：</td>
                <td class="style6">
                    <asp:TextBox ID="txtSellerPhone" runat="server" 
                        Height="18px" Width="179px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    发件人所在地：</td>
                <td class="style6">
                    <asp:TextBox ID="txtSellerAddr" runat="server" Height="18px" Width="177px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Button ID="btnSendGoods" runat="server" onclick="btnSendGoods_Click" 
                        Text="确认发货" Width="150px" />
                </td>
                <td class="style6">
                    &nbsp;&nbsp;&nbsp; <asp:Button ID="btnCancel" runat="server" Text="返回订单管理" 
                        onclick="btnCancel_Click" Width="144px" />
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <p>
        &nbsp;</p>
</asp:Content>

