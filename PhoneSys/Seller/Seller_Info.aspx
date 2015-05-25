<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="Seller_Info.aspx.cs" Inherits="Seller_Seller_Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 439px;
        }
        .style2
        {   width: 81px;
        }
        .style3
        {
        }
        .style4
        {
            text-align: right;
        }
       
        #content
       {
        margin:0 auto;
        width:960px;
        padding:0;
        height:auto;
        width:1035px;
        border:1px solid #ff9900;
        background-image:url('../images/seller2.jpg');
        font-family: 微软雅黑;
        margin-bottom:15px;
        }
        .style5
        {
            text-align: right;
            font-family: 微软雅黑;
        }
        .style6
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content" >
<div>
        <br />
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>               
                <br />
                <br />
                <table class="style1">
                    <tr>
                        <td class="style2" rowspan="8">
                            <div style="Width:200px; Height:340px">
                                <asp:Image ID="imgShop" runat="server" Height="260px"
                                    ImageUrl='<%# Eval("Idcard_photo") %>' Width="190px" />
                                <br />
                                店主昵称：<asp:Label ID="lblSellerName" runat="server" 
                                    Text='<%# Eval("UserName") %>'></asp:Label>
                                <br />
                                真实姓名：<asp:Label ID="lblSellerRealName" runat="server" 
                                    Text='<%# Eval("UserName") %>'></asp:Label>
                                <br />
                            </div>
                        </td>
                        <td class="style3" colspan="3">
                            <span style="width:70px; margin-left:100px;"><asp:Image ID="Image1" runat="server" 
                                ImageUrl="~/images/myShop.jpg" Width="184px" /></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            商铺名称：</td>
                        <td class="style3">
                            <asp:Label ID="lblShopName" runat="server" Text='<%# Eval("shop_name") %>'></asp:Label>
                            <asp:TextBox ID="txtShopName" runat="server"></asp:TextBox>
                        </td>
                        <td class="style3" rowspan="6">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/seller1.jpg" 
                                Width="184px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            开始营业：</td>
                        <td class="style3">
                            <asp:Label ID="lblShopStartTime" runat="server" Text='<%# Eval("meaning") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            商铺电话：</td>
                        <td class="style3">
                            <asp:Label ID="lblShopTele" runat="server" Text='<%# Eval("meaning") %>'></asp:Label>
                            <asp:TextBox ID="txtShopTele" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            商铺地址：</td>
                        <td class="style3">
                            <asp:Label ID="lblShopAddr" runat="server" Text='<%# Eval("meaning") %>'></asp:Label>
                            <asp:TextBox ID="txtShopAddr" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            商铺简介：</td>
                        <td class="style3" rowspan="2">
                            <asp:TextBox ID="txtIntroduction" runat="server" Height="45px" ReadOnly="True" 
                                Text='<%# Eval("shop_jianjie") %>' TextMode="MultiLine" Width="255px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            </td>
                        <td class="style3" colspan="2" rowspan="2">
                            <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" Text="编辑" 
                                Width="60px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                                Text="更新" Width="60px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
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

