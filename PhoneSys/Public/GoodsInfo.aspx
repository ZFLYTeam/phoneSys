<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="GoodsInfo.aspx.cs" Inherits="Public_GoodInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/GoodsInfo.css" rel="stylesheet" type="text/css" />
    <script src="../js/menu.js" type="text/javascript"></script>
    <script src="../js/选项卡.js" type="text/javascript"></script>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <style type="text/css">
        .estimate
        {
            margin-left: 0px;
            width: 918px;
            padding: 15px;
            border-left: 1px solid #cc0000;
            border-right: 1px solid #cc0000;
            border-bottom: 1px solid #cc0000;
        }
        .style1
        {
            width: 100%;
            height: 100%;
        }
        .style2
        {
        }
        
        .style8
        {
            height: 20px;
        }
        
        .style10
        {
            width: 82px;
            height: 45px;
        }
        .style11
        {
            height: 45px;
        }
        
        .style12
        {
            width: 100%;
        }
        .style13
        {
        }
        .style6
        {
            height: 30px;
            width: 339px;
        }
        .style17
        {
            width: 339px;
        }
        .style18
        {
            height: 22px;
            width: 182px;
        }
        
        .style19
        {
            height: 30px;
        }
        .style20
        {
            height: 35px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="right">
            <div style="text-align: left; float: left; height: 30px; width: 950px;">
                <div style="text-align: left; float: left; height: 30px; width: 235px;">
                    店铺：<asp:LinkButton ID="lbtnSellerName" runat="server" ForeColor="Blue" OnClick="lbtnSellerName_Click"></asp:LinkButton></div>
                <div style="text-align: right; float: right; height: 30px; width: 55px;">
                    <asp:LinkButton ID="lblReturn" runat="server" Text="后退" OnClick="lbtnReturn_Click"></asp:LinkButton>
                </div>
            </div>
            <div id="rt">
                <div id="rt1">
                    <table align="center" width="100%" cellpadding="0" cellspacing="0" style="height: 25px;
                        text-align: center;">
                        <tr>
                            <td>
                                <asp:Label ID="lblGoodsName" runat="server" Text="手机名称"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <div id="imgBig">
                        <div class="imgbox">
                            <div class="probox">
                                <asp:Image ID="ImgGoodsUrl" runat="server" Width="113px" />
                                <div class="hoverbox">
                                </div>
                            </div>
                            <div class="showbox">
                                <asp:Image ID="ImgGoodsUrl1" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="rt2">
                    <table class="style1">
                        <tr>
                            <td class="style8" colspan="2">
                                价格：<font color="#f00">￥</font><asp:Label ID="lblGoodsPrice" runat="server"></asp:Label>
                                (元)
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" colspan="2">
                                品牌：<asp:Label ID="lblGoodsType" runat="server" Text="手机品牌"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" colspan="2">
                                最近卖出
                                <asp:Label ID="lblquantity" runat="server"></asp:Label>
                                件
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" colspan="2">
                                <asp:Label ID="lblShow1" runat="server" Text="商品数量："></asp:Label>
                                <asp:LinkButton ID="lbtnSub" runat="server" Height="20px" Width="20px" OnClick="lbtnSub_Click">-</asp:LinkButton>
                                <asp:TextBox ID="txtNum" runat="server" Height="20px" Width="40px" OnTextChanged="txtNum_TextChanged">1</asp:TextBox>
                                <asp:LinkButton ID="lbtnAdd" runat="server" Height="20px" Width="20px" OnClick="lbtnAdd_Click">+</asp:LinkButton>
                                <asp:Label ID="lblShow2" runat="server" Text="库存："></asp:Label>
                                <asp:Label ID="lblStore" runat="server"></asp:Label>
                                <asp:Label ID="lblShow3" runat="server" Text="件">
                                </asp:Label><asp:Label ID="lblShow6" runat="server" Text="抱歉，此商品已下架！" Font-Bold="True"
                                    Font-Size="Large"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" colspan="2">
                                <asp:Label ID="lblShow4" runat="server" Text=" 总价："></asp:Label>
                                <asp:Label ID="lblAllPrice" runat="server"></asp:Label>
                                <asp:Label ID="lblShow5" runat="server" Text="元"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;
                            </td>
                            <td style="line-height: 20px;">
                                <asp:ImageButton ID="ibtnMoveCart" runat="server" ImageUrl="~/images/加入购物车.jpg" OnClick="ibtnMoveCart_Click" />
                                <asp:ImageButton ID="ibtnBuyNow" runat="server" ImageUrl="~/images/立即购买.jpg" OnClick="ibtnBuyNow_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                            </td>
                            <td class="style11">
                                <asp:ImageButton ID="ibtnCollect" runat="server" ImageUrl="~/images/Collect.jpg"
                                    OnClick="ibtnCollect_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <asp:UpdatePanel>
                <ContentTemplate>
                    <div class="wrap">
                        <ul id="tab_t">
                            <li class="act">
                                <asp:Button ID="btnDetail" runat="server" BorderStyle="None" OnClick="btnDetail_Click"
                                    Text="商品详情" Width="98px" CssClass="btnDetail" />
                            </li>
                            <li>
                                <asp:Button ID="btnEstimate" runat="server" BorderStyle="None" OnClick="btnEstimate_Click"
                                    Text="商品评价" Width="100px" CssClass="btnEstimateCss" />
                            </li>
                        </ul>
                        <asp:Panel ID="Panel1" runat="server">
                            <div id="tab_c">
                                <table class="style1" cellspacing="0">
                                    <tr>
                                        <td class="style6" style="border-top: 1px solid #aaa;">
                                            [品牌]
                                            <asp:Label ID="lblPhoneBrand" runat="server"></asp:Label>
                                        </td>
                                        <td style="border-top: 1px solid #aaa;" class="style19">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            [名称]
                                            <asp:Label ID="lblPhoneName" runat="server"></asp:Label>
                                        </td>
                                        <td rowspan="6" class="style7">
                                            <asp:Image ID="imgpicture" runat="server" Height="200px" Width="120px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            [操作系统]
                                            <asp:Label ID="lblPhoneOs" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            [内核数]
                                            <asp:Label ID="lblPhoneCpu" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            [屏幕大小]
                                            <asp:Label ID="lblPhonescreen" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            [像素]
                                            <asp:Label ID="lblPhonePixel" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            [颜色]
                                            <asp:Label ID="lblPhonecolor" runat="server" Width="200px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            [最近销量]
                                            <asp:Label ID="lblSalenumber" runat="server"></asp:Label>
                                            件
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            [店铺地址]
                                            <asp:Label ID="lblAdreess" runat="server"></asp:Label>
                                        </td>
                                        <td class="style19">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style20" colspan="2">
                                            [简介]
                                            <asp:Label ID="lblIntroduce" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">
                            <div class="estimate">
                                <asp:Label ID="lblNo" runat="server" Text="该商品暂无评价！"></asp:Label>
                                <asp:DataList ID="dlEstimate" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                                    Height="200px" Width="900px" OnItemCommand="dlEstimate_ItemCommand" OnItemDataBound="dlEstimate_ItemDataBound">
                                    <FooterTemplate>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                        <asp:Label ID="lblCount" runat="server"></asp:Label>
                                        <asp:LinkButton ID="lbtnFirst" runat="server" CommandArgument="first">首页</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre">上一页</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next">下一页</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last">尾页</asp:LinkButton>
                                        <asp:Label ID="lblSkip" runat="server" Text="跳转至"></asp:Label>
                                        <asp:TextBox ID="txtSkip" runat="server" Width="28px"></asp:TextBox>
                                        <asp:Button ID="btnSkip" runat="server" CommandName="search" Text="Go" Width="25px" />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <table class="style12" style="border-bottom-style: solid; border-bottom-width: thin;
                                            border-bottom-color: #C0C0C0">
                                            <tr>
                                                <td class="style17" rowspan="2">
                                                    <asp:Label ID="lblInfo" runat="server" Text='<%# Eval("estinfo") %>'></asp:Label>
                                                </td>
                                                <td class="style18">
                                                    操作系统：<asp:Label ID="lblOS" runat="server" Text='<%# Eval("os") %>'></asp:Label>
                                                </td>
                                                <td class="style13" rowspan="3">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style18">
                                                    内核：<asp:Label ID="lblCpu" runat="server" Text='<%# Eval("cpu") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style16">
                                                    <asp:Label ID="lblTime" runat="server" ForeColor="#999999" Text='<%# Eval("esttime") %>'></asp:Label>
                                                </td>
                                                <td class="style18">
                                                    颜色：<asp:Label ID="lblColor" runat="server" Text='<%# Eval("color") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </asp:Panel>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

        <script type="text/javascript">
            /*
            imgbox 当前图片区域
            hoverbox 鼠标移入区域
            l 当前图片左距离
            t 当前图片上距离
            x 鼠标距离X轴
            y 鼠标距离Y轴
            h_w 鼠标移入图片块宽度
            h_h 鼠标移入图片块高度
            showbox 展示大图区域
            */
            function Zoom(imgbox, hoverbox, l, t, x, y, h_w, h_h, showbox) {
                var moveX = x - l - (h_w / 2);
                //鼠标区域距离
                var moveY = y - t - (h_h / 2);
                //鼠标区域距离
                if (moveX < 0) { moveX = 0 }
                if (moveY < 0) { moveY = 0 }
                if (moveX > imgbox.width() - h_w) { moveX = imgbox.width() - h_w }
                if (moveY > imgbox.height() - h_h) { moveY = imgbox.height() - h_h }
                //判断鼠标使其不跑出图片框
                var zoomX = showbox.width() / imgbox.width()
                //求图片比例
                var zoomY = showbox.height() / imgbox.height()

                showbox.css({ left: -(moveX * zoomX), top: -(moveY * zoomY) })
                hoverbox.css({ left: moveX, top: moveY })
                //确定位置

            }
            function Zoomhover(imgbox, hoverbox, showbox) {
                var l = imgbox.offset().left;
                var t = imgbox.offset().top;
                var w = hoverbox.width();
                var h = hoverbox.height();
                var time;
                $(".probox img,.hoverbox").mouseover(function (e) {
                    var x = e.pageX;
                    var y = e.pageY;
                    $(".hoverbox,.showbox").show();
                    hoverbox.css("opacity", "0.3")
                    time = setTimeout(function () { Zoom(imgbox, hoverbox, l, t, x, y, w, h, showbox) }, 1)
                }).mousemove(function (e) {
                    var x = e.pageX;
                    var y = e.pageY;
                    time = setTimeout(function () { Zoom(imgbox, hoverbox, l, t, x, y, w, h, showbox) }, 1)
                }).mouseout(function () {
                    showbox.parent().hide()
                    hoverbox.hide();
                })
            }
            $(function () {
                Zoomhover($(".probox img"), $(".hoverbox"), $(".showbox img"));
            })
    </script>
</asp:Content>
