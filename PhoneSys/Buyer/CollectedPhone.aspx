<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="CollectedPhone.aspx.cs" Inherits="Buyer_CollectedPhone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        label
        {
            display: inline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="span9 offset1">
                    <asp:CheckBox ID="cbAll" runat="server" Text=" 全选" OnCheckedChanged="cbAll_CheckedChanged"
                        AutoPostBack="True" ForeColor="Black" />
                    <asp:ImageButton ID="imgbtnDel" runat="server" ImageUrl="~/images/delete.jpg" OnClick="imgbtnDel_Click" />
                </div>
            </div>
            <div class="row">
                <div class="span9 offset1" style="text-align: center">
                    <div class="row">
                    <asp:DataList ID="dlCPhone" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                        OnItemCommand="dlCPhone_ItemCommand" OnItemDataBound="dlCPhone_ItemDataBound">
                        <ItemTemplate>
                            <table class="style1" align="left">
                                <tr>
                                    <td style="border-top-style: solid; border-top-width: thin; border-top-color: #C0C0C0;
                                        border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0;
                                        border-left-style: solid; border-left-width: thin; border-left-color: #C0C0C0;
                                        width: 200px; height: 200px; text-align: center">
                                        <asp:ImageButton ID="imgbtnPhoto" runat="server" Height="150px" ImageAlign="TextTop"
                                            OnClick="imgbtnPhoto_Click" Width="100px" CommandArgument='<%# Eval("phone_id") %>'
                                            ImageUrl='<%# Eval("phone_image") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2" style="border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0;
                                        border-left-style: solid; border-left-width: thin; border-left-color: #C0C0C0;
                                        width: 200px; height: 70px">
                                        <asp:LinkButton ID="lbtnPName" runat="server" Font-Size="Medium" Font-Underline="True"
                                            ForeColor="#0033CC" OnClick="lbtnPName_Click" CommandArgument='<%# Eval("phone_id") %>'
                                            Text='<%# Eval("phone_name") %>'></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2" style="border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0;
                                        border-left-color: #C0C0C0; border-left-width: thin; border-left-style: solid;
                                        width: 200px; height: 20px">
                                        <asp:Label ID="lblPrice" runat="server" ForeColor="Red" Text='<%# "¥ "+Eval("price") %>'></asp:Label>
                                        <asp:Label ID="lblHidden" runat="server" Text='<%# Eval("phone_id") %>' Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3" style="border-bottom-style: solid; border-bottom-width: thin;
                                        border-bottom-color: #C0C0C0; border-right-color: #C0C0C0; border-right-width: thin;
                                        border-right-style: solid; border-left-style: solid; border-left-width: thin;
                                        border-left-color: #C0C0C0">
                                        <asp:CheckBox ID="cbSel" runat="server" AutoPostBack="True" />
                                        <asp:ImageButton ID="imgbtnDelOne" runat="server" ImageUrl="~/images/deleteicon.gif"
                                            OnClick="imgbtnDelOne_Click" ToolTip="删除" CommandArgument='<%# Eval("phone_id") %>'
                                            CommandName="delOne" />
                                        <asp:ImageButton ID="imgbtnInCart" runat="server" ImageUrl="~/images/inCart.jpg"
                                            OnClick="imgbtnInCart_Click" ToolTip="加入购物车" CommandArgument='<%# Eval("phone_id") %>' />
                                        <asp:ImageButton ID="imgbtnEnterShop" runat="server" Height="19px" ImageUrl="~/images/EnterShop.jpg"
                                            OnClick="imgbtnEnterShop_Click" ToolTip="进入店铺" CommandArgument='<%# Eval("shopId") %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="text-align: center; padding-top: 20px">
                                <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                <asp:Label ID="lblCount" runat="server"></asp:Label>
                                <div class="btn-group">
                                    <asp:LinkButton ID="lbtnFirst" runat="server" CommandArgument="first" CssClass="btn btn-info">首页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn btn-info">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn btn-info">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn btn-info">尾页</asp:LinkButton>
                                </div>
                                <asp:Label ID="lblSkip" runat="server" Text="跳转至"></asp:Label>
                                <asp:TextBox ID="txtSkip" runat="server" Width="28px"></asp:TextBox>
                                <asp:Button ID="btnSkip" runat="server" CommandName="search" Text="Go" class="btn btn-primary btn-mini" />
                            </div>
                        </FooterTemplate>
                    </asp:DataList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span4 offset4">
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/notfound.jpg" />
                        <asp:Label ID="Label3" runat="server" Font-Bold="False" Text="还没收藏任何商品！"></asp:Label>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
