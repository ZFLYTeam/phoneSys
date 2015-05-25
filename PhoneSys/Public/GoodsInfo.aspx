<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="GoodsInfo.aspx.cs" Inherits="Public_GoodInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/GoodsInfo.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row-fluid">
        <div class="span1">
        </div>
        <div class="span9">
            店铺：<asp:Button ID="lbtnSellerName" runat="server" OnClick="lbtnSellerName_Click"
                class="btn" />
        </div>
        <div class="span1">
            <asp:LinkButton ID="lblReturn" runat="server" Text="后退" OnClick="lbtnReturn_Click"
                class="btn btn-primary"></asp:LinkButton>
        </div>
        <div class="span1">
        </div>
    </div>
    <div class="row-fluid">
        <hr />
        <div class="span1">
        </div>
        <div class="span3">
            <div class="imgbox">
                <div class="probox">
                    <asp:Image ID="ImgGoodsUrl" class="img-polaroid" runat="server" />
                    <div class="hoverbox">
                    </div>
                </div>
                <div class="showbox">
                    <asp:Image ID="ImgGoodsUrl1" runat="server" />
                </div>
            </div>
        </div>
        <div class="span6">
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="lblGoodsName" runat="server" Text="手机名称"></asp:Label>
                    </td>
                </tr>
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
                        <div class="input-prepend input-append">
                            <button class="btn btn-info" type="button" id="minusCount">
                                -</button>
                            <asp:TextBox ID="txtNum" runat="server" Height="18px" Width="30px" OnTextChanged="txtNum_TextChanged">1</asp:TextBox>
                            <button class="btn btn-success" type="button" id="addCount">
                                +</button>
                        </div>
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
                    <td style="line-height: 20px;">
                        <asp:ImageButton ID="ibtnMoveCart" runat="server" ImageUrl="~/images/加入购物车.jpg"  OnClick="ibtnCollect_Click"/>
                        <asp:ImageButton ID="ibtnBuyNow" runat="server" ImageUrl="~/images/立即购买.jpg" OnClick="ibtnBuyNow_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:ImageButton ID="ibtnCollect" runat="server" ImageUrl="~/images/Collect.jpg"
                            OnClick="ibtnCollect_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="span2">
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10 offset1">
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"><a href="#goodDetails" data-toggle="tab">商品详情</a></li>
                <li><a href="#goodEstimate" data-toggle="tab">商品评价</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="goodDetails">
                    <table cellspacing="0">
                        <tr>
                            <td>
                                [品牌]
                                <asp:Label ID="lblPhoneBrand" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                [名称]
                                <asp:Label ID="lblPhoneName" runat="server"></asp:Label>
                            </td>
                            <td rowspan="6">
                                <asp:Image ID="imgpicture" runat="server" Height="200px" Width="120px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                [操作系统]
                                <asp:Label ID="lblPhoneOs" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                [内核数]
                                <asp:Label ID="lblPhoneCpu" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                [屏幕大小]
                                <asp:Label ID="lblPhonescreen" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                [像素]
                                <asp:Label ID="lblPhonePixel" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                [颜色]
                                <asp:Label ID="lblPhonecolor" runat="server" Width="200px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                [最近销量]
                                <asp:Label ID="lblSalenumber" runat="server"></asp:Label>
                                件
                            </td>
                        </tr>
                        <tr>
                            <td>
                                [店铺地址]
                                <asp:Label ID="lblAdreess" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                [简介]
                                <asp:Label ID="lblIntroduce" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="tab-pane fade" id="goodEstimate">
                    <div class="estimate">
                        <asp:Label ID="lblNo" runat="server" Text="该商品暂无评价！"></asp:Label>
                        <asp:UpdatePanel ID="UpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:DataList ID="dlEstimate" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                                    Height="200px" Width="900px" OnItemCommand="dlEstimate_ItemCommand" OnItemDataBound="dlEstimate_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="well">
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                            <asp:Label ID="lblTime" runat="server" ForeColor="#999999" Text='<%# Eval("esttime") %>'></asp:Label>
                                            <asp:Label ID="lblInfo" runat="server" Text='<%# Eval("estinfo") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                        <asp:Label ID="lblCount" runat="server"></asp:Label>
                                        <div class="btn-group" style="display: inline">
                                            <asp:LinkButton ID="lbtnFirst" runat="server" CommandArgument="first" CssClass="btn">首页</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn">上一页</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn">下一页</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn">尾页</asp:LinkButton>
                                        </div>
                                        <asp:Label ID="lblSkip" runat="server" Text="跳转至"></asp:Label>
                                        <asp:TextBox ID="txtSkip" runat="server" Width="28px" Height="18"></asp:TextBox>
                                        <asp:Button ID="btnSkip" runat="server" CommandName="search" Text="Go" class="btn btn-primary btn-small" />
                                    </FooterTemplate>
                                </asp:DataList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
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
                $('#minusCount').click(function () {
                    minusCount();
                });
                $('#addCount').click(function () {
                    addCount();
                });
            })


            function minusCount() {
                var num = $('#ContentPlaceHolder1_txtNum').val();
                var count = $('#ContentPlaceHolder1_lblStore').html();
                if (num > 1) {
                    count++;
                    num--;
                }
                $('#ContentPlaceHolder1_txtNum').val(num);
                $('#ContentPlaceHolder1_lblStore').html(count);
            }

            function addCount() {
                var num = $('#ContentPlaceHolder1_txtNum').val();
                var count0 = $('#ContentPlaceHolder1_lblStore').html();
                var count = $('#ContentPlaceHolder1_lblStore').html();
                if (num < count0) {
                    num++;
                    count--;
                }
                $('#ContentPlaceHolder1_txtNum').val(num);
                $('#ContentPlaceHolder1_lblStore').html(count);
            }
        </script>
</asp:Content>
