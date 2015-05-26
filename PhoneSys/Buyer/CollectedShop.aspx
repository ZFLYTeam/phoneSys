<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="CollectedShop.aspx.cs" Inherits="Buyer_CollectedShop" %>

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
            <div class="row-fluid">
                <div class="span9 offset1">
                    <asp:CheckBox ID="cbAll" runat="server" Text=" 全选" OnCheckedChanged="cbAll_CheckedChanged"
                        AutoPostBack="True" />
                    <asp:ImageButton ID="imgbtnDelete" runat="server" ImageUrl="~/images/delete.jpg"
                        OnClick="imgbtnDelete_Click" />
                </div>
                <div class="span9 offset1">
                    <asp:DataList ID="dlShop" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                        OnItemDataBound="dlShop_ItemDataBound" DataKeyField="shop_id" Height="200px"
                        Width="900px" OnItemCommand="dlShop_ItemCommand">
                        <ItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td class="style5" rowspan="2">
                                        <table class="style4">
                                            <tr>
                                                <td dir="ltr" valign="middle">
                                                    <asp:CheckBox ID="cbSel" runat="server" />
                                                    <asp:ImageButton ID="imgbtnDelOne" runat="server" CommandArgument='<%# Eval("shop_id") %>'
                                                        ImageUrl="~/images/deleteicon.gif" OnClick="imgbtnDelOne_Click" ToolTip="删除" />
                                                    <br />
                                                    <asp:Image ID="imgLogo" runat="server" AlternateText="淘" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                        BorderWidth="1px" ForeColor="#FF8000" GenerateEmptyAlternateText="True" Height="90px"
                                                        ImageAlign="Middle" ImageUrl='~/images/tao.jpg' Width="100px" />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="ltr" valign="middle">
                                                    <asp:LinkButton ID="lbtnShopName" runat="server" CommandArgument='<%# Eval("shop_id") %>'
                                                        Font-Underline="True" ForeColor="#CC6600" OnClick="lbtnShopName_Click" Text='<%# Eval("shop_name") %>'></asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="ltr" valign="middle">
                                                    <asp:Label ID="lblHidden" runat="server" Text='<%# Eval("shop_id") %>' Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="ltr" valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="ltr" valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="ltr" valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-Bold="False" Font-Names="楷体"
                                            Font-Size="Large" ForeColor="Red" Height="19px" Text="【本店热销】" Width="117px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <table class="style6">
                                            <tr>
                                                <td>
                                                    <asp:DataList ID="dlPhoneInShop" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                                                        Width="800px" Height="146px">
                                                        <ItemTemplate>
                                                            <table class="style4">
                                                                <tr>
                                                                    <td class="style7">
                                                                        <asp:ImageButton ID="imgbtnPhoto" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                                                            Height="150px" ImageUrl='<%# Eval("phone_image") %>' OnClick="imgbtnPhoto_Click"
                                                                            Width="100px" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style9">
                                                                        <asp:LinkButton ID="lbtnPName" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                                                            ForeColor="#0033CC" OnClick="lbtnPName_Click" Text='<%# Eval("phone_name") %>'
                                                                            Font-Underline="True"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style9">
                                                                        <asp:Label ID="lblPrice" runat="server" ForeColor="Red" Text='<%# "¥ "+Eval("price") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="text-align:center;">
                                <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                <asp:Label ID="lblCount" runat="server"></asp:Label>
                                <div class="btn-group">
                                    <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first" CssClass="btn btn-primary">首页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn btn-primary">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn btn-primary">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn btn-primary">尾页</asp:LinkButton>
                                </div>
                                <asp:Label ID="lblSkip" runat="server" Text="跳转至"></asp:Label>
                                <asp:TextBox ID="txtSkip" runat="server" Width="30px"></asp:TextBox>
                                <asp:Button ID="btnSkip" runat="server" CommandName="search" class="btn btn-info"
                                    Text="Go" />
                            </div>
                        </FooterTemplate>
                    </asp:DataList>
                </div>
                <div class="span4 offset4">
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/notfound.jpg" />
                        <asp:Label ID="Label3" runat="server" Text="您还未收藏店铺！"></asp:Label>
                    </asp:Panel>
                </div>
            </div>
            <!--rowend-->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
