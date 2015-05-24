<%@ Page Title="" Language="C#" MasterPageFile="~/Public/index.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="Public_Index" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--分类选择部分开始-->
    <div class="row-fluid">
        <div class="span2">
            <div class="btn-group open">
                <ul class="dropdown-menu" contenteditable="false">
                    <li class="dropdown-submenu"><a href="#" tabindex="-1">手机品牌</a>
                        <ul class="dropdown-menu">
                            <li><a href="PhoneSearch.aspx?phonekeyword=华为">华为</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=中兴">中兴</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=联想">联想</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=三星">三星</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=苹果">苹果</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=小米">小米</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=HTC">HTC</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=诺基亚">诺基亚</a></li>
                        </ul>
                    </li>
                    <li class="dropdown-submenu"><a href="#" tabindex="-1">手机操作系统</a>
                        <ul class="dropdown-menu">
                            <li><a href="PhoneSearch.aspx?phonekeyword=安卓">安卓</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=微软">微软</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=塞班">塞班</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=IOS">IOS</a></li>
                        </ul>
                    </li>
                    <li class="dropdown-submenu"><a href="#" tabindex="-1">手机屏幕大小</a>
                        <ul class="dropdown-menu">
                            <li><a href="PhoneSearch.aspx?phonekeyword=4寸及以下">4寸及以下</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=4.0寸-4.5寸">4.0寸-4.5寸</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=4.5寸-5.0寸">4.5寸-5.0寸</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=5.0寸以上">5.0寸以上</a></li>
                        </ul>
                    </li>
                    <li class="dropdown-submenu"><a href="#" tabindex="-1">手机价格区间</a>
                        <ul class="dropdown-menu">
                            <li><a href="PhoneSearch.aspx?phonekeyword=500元以下">500元以下</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=500-1000">500-1000</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=1000-1500">1000-1500</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=1500以上">1500以上</a></li>
                        </ul>
                    </li>
                    <li class="dropdown-submenu"><a href="#" tabindex="-1">手机机身颜色</a>
                        <ul class="dropdown-menu">
                            <li><a href="PhoneSearch.aspx?phonekeyword=红色">红色</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=白色">白色</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=黑色">黑色</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=灰色">灰色</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=蓝色">蓝色</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=黄色">黄色</a></li>
                        </ul>
                    </li>
                    <li class="dropdown-submenu"><a href="#" tabindex="-1">手机特色功能</a>
                        <ul class="dropdown-menu">
                            <li><a href="PhoneSearch.aspx?phonekeyword=双卡双待">双卡双待</a></li>
                            <li><a href="PhoneSearch.aspx?phonekeyword=三防">三防</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="span10">
            <div class="carousel slide" id="carousel-994754">
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#carousel-994754"></li>
                    <li data-slide-to="1" data-target="#carousel-994754"></li>
                    <li data-slide-to="2" data-target="#carousel-994754"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <a href="GoodsInfo.aspx?PhoneId=100000062">
                            <img src="../images/1.jpg" alt="" />
                        </a>
                    </div>
                    <div class="item">
                        <a href="GoodsInfo.aspx?PhoneId=100000060">
                            <img src="../images/2.jpg" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="GoodsInfo.aspx?PhoneId=100000061">
                            <img src="../images/3.jpg" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="GoodsInfo.aspx?PhoneId=100000059">
                            <img src="../images/4.jpg" alt="" /></a>
                    </div>
                </div>
                <a data-slide="prev" href="#carousel-994754" class="left carousel-control">‹</a>
                <a data-slide="next" href="#carousel-994754" class="right carousel-control">›</a>
            </div>
        </div>
    </div>
    <!--分类选择部分结束-->
    <!--热销商品部分开始-->
    <div class=" row-fluid">
        <div class="span12">
            <div class="page-header">
                <h2>
                    热销商品<a class="btn btn-info" href="MoreGoods.aspx">查看更多 »</a>
                </h2>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="" style="text-align: center; float: left;">
                        <div class="span12">
                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <div style="width: 280px">
                                        <div class="thumbnail" style="margin-top: 5px">
                                            <a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                                                <asp:Image ID="imgGoodsPhoto" runat="server" ImageUrl='<%# Eval("phone_image") %>'
                                                    Width="105px" Height="198px" CssClass="imgCss" /></a>
                                            <div class="caption">
                                                <div style="height: 40px">
                                                    <h5>
                                                        <a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                                                            <%#Eval("phone_name")%></a> <span style="color: Red">
                                                                <li class="fa fa-cny"></li>
                                                                <%#Eval("price")%></span>元
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                        <div id="pagenation">
                            总共页码为:[<asp:Label ID="Lbl_Count" runat="server" Text="10"></asp:Label>] 当前页码为：[<asp:Label
                                ID="lbl_NowPage" runat="server" Text="1"></asp:Label>]
                            <div class="btn-toolbar">
                                <div class="btn-group">
                                    <asp:Button ID="LnkBtnFirst" runat="server" Text="第一页" OnClick="LnkBtnFirst_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnFront" runat="server" Text="上一页" OnClick="LnkBtnFront_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnNext" runat="server" Text="下一页" OnClick="LnkBtnNext_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnlast" runat="server" Text="最后一页" OnClick="LnkBtnlast_Click"
                                        CssClass="btn" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!--热销商品部分结束-->
    <!--推荐商品部分开始-->
    <div class=" row-fluid">
        <div class="span12">
            <div class="page-header">
                <h2>
                    推荐商品<a class="btn btn-info" href="MoreGoods.aspx">查看更多 »</a>
                </h2>
            </div>
            <div style="text-align: center">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div style="width: 280px">
                                    <div class="thumbnail" style="margin-top: 5px">
                                        <a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                                            <asp:Image ID="imgGoodsPhoto" runat="server" ImageUrl='<%# Eval("phone_image") %>'
                                                Height="198px" CssClass="imgCss" Style="text-align: center" /></a>
                                        <div class="caption">
                                            <div style="height: 40px">
                                                <h5>
                                                    <a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                                                        <%#Eval("phone_name")%></a> <span style="color: Red">
                                                            <li class="fa fa-cny"></li>
                                                            <%#Eval("price")%></span>元
                                                </h5>
                                            </div>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Style="color: Blue" OnClick="LinkButton1_Click2"
                                                PostBackUrl='<%#"~/public/GoodsInfo.aspx?PhoneId="+Eval("phone_id")%>'>详细信息</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnInChart2" runat="server" Style="color: Blue" OnClick="lbtnInChart2_Click"
                                                CommandArgument='<%# Eval("phone_id") %>'>加入购物车</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <div id="pagenation2">
                            总共页码为:[<asp:Label ID="Lbl_Count2" runat="server" Text="10"></asp:Label>] 当前页码为：[<asp:Label
                                ID="Lbl_NowPage2" runat="server" Text="1"></asp:Label>]
                            <div class="btn-toolbar">
                                <div class="btn-group">
                                    <asp:Button ID="LnkBtnFirst2" runat="server" Text="第一页" OnClick="LnkBtnFirst2_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnFront2" runat="server" Text="上一页" OnClick="LnkBtnFront2_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnNext2" runat="server" Text="下一页" OnClick="LnkBtnNext2_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnlast2" runat="server" Text="最后一页" OnClick="LnkBtnlast2_Click"
                                        CssClass="btn" />
                                </div>
                            </div>
                        </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
    </div>
    <!--推荐商品部分结束-->
    <!--新商品部分开始-->
    <div class=" row-fluid">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="span12">
                    <div class="page-header">
                        <h2>
                            新品上市<a class="btn btn-info" href="MoreGoods.aspx">查看更多 »</a>
                        </h2>
                    </div>
                    <div style="text-align: center">
                        <asp:DataList ID="DataList3" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div style="width: 280px">
                                    <div class="thumbnail" style="margin-top: 5px">
                                        <a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                                            <asp:Image ID="imgGoodsPhoto" runat="server" ImageUrl='<%# Eval("phone_image") %>'
                                                Height="198px" CssClass="imgCss" Style="text-align: center" /></a>
                                        <div class="caption">
                                            <div style="height: 40px">
                                                <h5>
                                                    <a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                                                        <%#Eval("phone_name")%></a> <span style="color: Red">
                                                            <li class="fa fa-cny"></li>
                                                            <%#Eval("price")%></span>元
                                                </h5>
                                            </div>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Style="color: Blue" OnClick="LinkButton1_Click2"
                                                PostBackUrl='<%#"~/public/GoodsInfo.aspx?PhoneId="+Eval("phone_id")%>'>详细信息</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnInChart2" runat="server" Style="color: Blue" OnClick="lbtnInChart2_Click"
                                                CommandArgument='<%# Eval("phone_id") %>'>加入购物车</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <div id="pagenation3">
                            总共页码为:[<asp:Label ID="Lbl_Count3" runat="server" Text="10"></asp:Label>] 当前页码为：[<asp:Label
                                ID="Lbl_NowPage3" runat="server" Text="1"></asp:Label>]
                            <div class="btn-toolbar">
                                <div class="btn-group">
                                    <asp:Button ID="LnkBtnFirst3" runat="server" Text="第一页" OnClick="LnkBtnFirst3_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnFront3" runat="server" Text="上一页" OnClick="LnkBtnFront3_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnNext3" runat="server" Text="下一页" OnClick="LnkBtnNext3_Click"
                                        CssClass="btn" />
                                    <asp:Button ID="LnkBtnlast3" runat="server" Text="最后一页" OnClick="LnkBtnlast3_Click"
                                        CssClass="btn" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <!--新商品部分结束-->
    </div>
</asp:Content>
