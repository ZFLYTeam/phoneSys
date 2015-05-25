<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="LookShop.aspx.cs" Inherits="Buyer_LookShop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row-fluid">
        <div class="span9 offset1">
            <div class="span3">
                <asp:Image ID="imgShopLogo" runat="server" cssClass="img-rounded"/></div>
            <div class="page-header span7">
                <h1>
                    <asp:Label ID="lblShopName" runat="server" ForeColor="Black"></asp:Label>
                    &nbsp;<asp:Button ID="btnCollection" runat="server" BackColor="#FF8F59" BorderStyle="None"
                        ForeColor="White" Text="收藏店铺" OnClick="btnCollection_Click" /></h1>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="page-header span9 offset1">
                <h2>
                    宝贝推荐</h2>
            </div>
            <div class="span3 offset1">
                <div class="thumbnail" style="margin-top: 5px">
                    <asp:Image ID="img1" runat="server" class=" img-rounded" Height="150" Width="100px" />
                    <div class="caption" style="margin-bottom: 10px;">
                        <div style="height: 20px">
                            <h5>
                                <asp:LinkButton ID="lbtnName1" runat="server" CommandArgument="phone_id" OnClick="lbtnName1_Click"></asp:LinkButton>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span3">
                <div class="thumbnail" style="margin-top: 5px">
                    <asp:Image ID="img2" runat="server" class=" img-rounded" Height="150" Width="100px" />
                    <div class="caption" style="margin-bottom: 10px;">
                        <div style="height: 20px">
                            <h5>
                                <asp:LinkButton ID="lbtnName2" runat="server" OnClick="lbtnName2_Click"></asp:LinkButton>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span3">
                <div class="thumbnail" style="margin-top: 5px">
                    <asp:Image ID="img3" runat="server" class=" img-rounded" Height="150" Width="100px" />
                    <div class="caption" style="margin-bottom: 10px;">
                        <div style="height: 20px">
                            <h5>
                                <asp:LinkButton ID="lbtnName3" runat="server" OnClick="lbtnName3_Click"></asp:LinkButton>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9 offset1" style="text-align: center;">
            <hr />
            <asp:Label ID="Label3" runat="server" Text="本店搜索" Width="70px"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" Wrap="False" placeholder="请输入手机名"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="价格"></asp:Label>
            <asp:TextBox ID="txtLower" runat="server" Width="49px" placeholder="大于" Wrap="False"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="—"></asp:Label>
            <asp:TextBox ID="txtHigher" runat="server" Width="49px" placeholder="小于" Wrap="False"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="搜索" class="btn btn-primary" Width="50px"
                OnClick="btnSearch_Click" />
            <hr />
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9 offset1">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row-fluid">
                        <asp:DataList ID="dlPhone" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                            OnItemCommand="dlPhone_ItemCommand" OnItemDataBound="dlPhone_ItemDataBound">
                            
                            <ItemTemplate>
                                <div style="text-align: center; width: 280px">
                                    <div class="thumbnail" style="margin-top: 5px">
                                        <asp:ImageButton ID="imgbtnPhoto" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                            Height="170px" ImageUrl='<%# Eval("phone_image") %>' OnClick="imgbtnPhoto_Click" />
                                        <div class="caption">
                                            <div style="height: 50px;margin-bottom:5px;">
                                                <h5>
                                            <asp:LinkButton ID="lbtnPName" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                                Text='<%# Eval("phone_name") %>' OnClick="lbtnPName_Click"></asp:LinkButton><br />
                                            <asp:Label ID="lblPrice" runat="server" Font-Size="X-Large" ForeColor="Firebrick"
                                                Text='<%#"¥"+Eval("price") %>'></asp:Label>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                            </ItemTemplate>
                            <FooterTemplate>
                                <div style="text-align: center">
                                    <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                    <asp:Label ID="lblCount" runat="server"></asp:Label>
                                    <div class="btn-group">
                                        <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first" CssClass="btn btn-info">首页</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn btn-info">上一页</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn btn-info">下一页</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn btn-info">尾页</asp:LinkButton>
                                    </div>
                                    <asp:Label ID="lblSkip" runat="server" ForeColor="Black" Text="跳转至"></asp:Label>
                                    <asp:TextBox ID="txtSkip" runat="server" Height="18px" Width="28px" Wrap="False"></asp:TextBox>
                                    <asp:Button ID="btnSkip" runat="server" CommandName="search" CssClass="btn btn-info btn-small"
                                        Text="Go" />
                                </div>
                            </FooterTemplate>
                        </asp:DataList>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
