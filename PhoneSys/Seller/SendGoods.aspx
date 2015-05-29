<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="SendGoods.aspx.cs" Inherits="Seller_SendGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content" class="span6 offset3">
        <div class="control-group">
            <div class="controls">
                <td class="style4">
                    订单号：
                </td>
                <td class="style5">
                    <asp:Label ID="lblOrderId" runat="server"></asp:Label>
                </td>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <td class="style3">
                    收件人姓名：
                </td>
                <td class="style6">
                    <asp:Label ID="lblBuyerName" runat="server"></asp:Label>
                </td>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <td class="style3">
                    收件人联系电话：
                </td>
                <td class="style6">
                    <asp:Label ID="lblBuyerPhone" runat="server"></asp:Label>
                </td>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <td class="style7">
                    收件人地址：
                </td>
                <td class="style8">
                    <asp:Label ID="lblBuyerAddress" runat="server"></asp:Label>
                </td>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <td class="style3">
                    发件人姓名：
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtSellerName" runat="server" Height="18px" Width="175px"></asp:TextBox>
                </td>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <td class="style3">
                    发件人联系电话：
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtSellerPhone" runat="server" Height="18px" Width="179px"></asp:TextBox>
                </td>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <td class="style3">
                    发件人所在地：
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtSellerAddr" runat="server" Height="18px" Width="177px"></asp:TextBox>
                </td>
            </div>
        </div>
        <div class="control-group">
            <div class="controls" style="margin-left: 78px">
                <asp:Button ID="btnSendGoods" runat="server" OnClick="btnSendGoods_Click" Text="确认发货"
                    Width="110px" class="btn btn-success" />
                <asp:Button ID="btnCancel" runat="server" Text="返回订单管理" OnClick="btnCancel_Click"
                    Width="110px" class="btn btn-success" />
            </div>
        </div>
    </div>
    <p>
        &nbsp;</p>
</asp:Content>
