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
                <div class="span12">
                    <asp:CheckBox ID="cbAll" runat="server" Text=" 全选" OnCheckedChanged="cbAll_CheckedChanged"
                        AutoPostBack="True" />
                    <asp:ImageButton ID="imgbtnDelete" runat="server" ImageUrl="~/images/delete.jpg"
                        OnClick="imgbtnDelete_Click" />
                </div>
                <div class="span12">
                    <asp:DataList ID="dlShop" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                        OnItemDataBound="dlShop_ItemDataBound" DataKeyField="shop_id" OnItemCommand="dlShop_ItemCommand">
                        <ItemTemplate>
                            <!--左侧-->
                            <div class="span2 well" style="text-align: center">
                                <asp:Label ID="lblHidden" runat="server" Text='<%# Eval("shop_id") %>' Visible="False"></asp:Label>
                                <asp:Image ID="imgLogo" runat="server" AlternateText="淘" BorderColor="#CCCCCC" BorderStyle="Solid"
                                    BorderWidth="1px" ForeColor="#FF8000" GenerateEmptyAlternateText="True" Height="90px"
                                    ImageAlign="Middle" ImageUrl='<%# Bind("shop_logo","{0}") %>' Width="100px" />
                                <br />
                                <asp:CheckBox ID="cbSel" runat="server" />
                                <asp:ImageButton ID="imgbtnDelOne" runat="server" CommandArgument='<%# Eval("shop_id") %>'
                                    ImageUrl="~/images/deleteicon.gif" OnClick="imgbtnDelOne_Click" ToolTip="删除" />
                                <asp:LinkButton ID="lbtnShopName" runat="server" CommandArgument='<%# Eval("shop_id") %>'
                                    OnClick="lbtnShopName_Click" Text='<%# Eval("shop_name") %>'></asp:LinkButton>
                            </div>
                            <!--搜索结果做右侧-->
                            <div class="span9" style="padding-left: 20px">
                                <div class="row">
                                    <asp:Label ID="Label1" runat="server" Text="【本店热销】" class="label label-important"></asp:Label>
                                    <asp:DataList ID="dlPhoneInShop" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <div style="text-align: center;width:280px">
                                                <div class="thumbnail" style="margin-top: 5px">
                                                    <asp:ImageButton ID="imgbtnPhoto" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                                        Height="150px" ImageUrl='<%# Eval("phone_image") %>' OnClick="imgbtnPhoto_Click"
                                                        Width="100px" />
                                                    <div class="caption">
                                                        <div style="height: 40px">
                                                            <h5>
                                                                <asp:LinkButton ID="lbtnPName" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                                                    OnClick="lbtnPName_Click" Text='<%# Eval("phone_name") %>'></asp:LinkButton>
                                                                <asp:Label ID="lblPrice" runat="server" ForeColor="Red" Text='<%# "¥ "+Eval("price") %>'></asp:Label>
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="text-align: center;">
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
