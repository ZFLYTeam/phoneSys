<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="Seller_Info.aspx.cs" Inherits="Seller_Seller_Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="span12">
            <div class="page-header">
                <h1>
                    店铺信息</h1>
            </div>
        </div>
    </div>
    <div id="content" class="span6 offset3">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td class="style2" rowspan="8">
                                <div style="width: 200px; height: 340px">
                                    <asp:Image ID="imgShop" runat="server" Height="260px" ImageUrl='<%# Eval("Idcard_photo") %>'
                                        Width="190px" />
                                    <br />
                                    店主昵称：<asp:Label ID="lblSellerName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                    <br />
                                    真实姓名：<asp:Label ID="lblSellerRealName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                    <br />
                                </div>
                            </td>
                   
                        </tr>
                        <tr>
                            <td class="style5">
                                商铺名称：
                            </td>
                            <td class="style3">
                                <asp:Label ID="lblShopName" runat="server" Text='<%# Eval("shop_name") %>'></asp:Label>
                                <asp:TextBox ID="txtShopName" runat="server"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td class="style4">
                                开始营业：
                            </td>
                            <td class="style3">
                                <asp:Label ID="lblShopStartTime" runat="server" Text='<%# Eval("meaning") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                商铺电话：
                            </td>
                            <td class="style3">
                                <asp:Label ID="lblShopTele" runat="server" Text='<%# Eval("meaning") %>'></asp:Label>
                                <asp:TextBox ID="txtShopTele" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                商铺地址：
                            </td>
                            <td class="style3">
                                <asp:Label ID="lblShopAddr" runat="server" Text='<%# Eval("meaning") %>'></asp:Label>
                                <asp:TextBox ID="txtShopAddr" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                商铺简介：
                            </td>
                            <td class="style3" rowspan="2">
                                <asp:TextBox ID="txtIntroduction" runat="server" Height="45px" ReadOnly="True" Text='<%# Eval("shop_jianjie") %>'
                                    TextMode="MultiLine" Width="255px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                            </td>
                            <td class="style3" colspan="2" rowspan="2">
                                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text=" 编辑" Width="60px"
                                    class="btn btn-success" />
                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click"
                                    Text="更新" Width="60px" class="btn btn-success" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
