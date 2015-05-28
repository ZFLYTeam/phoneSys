<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhoneSearch.aspx.cs" Inherits="Public_PhoneSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>校园手机淘宝</title>
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <link href="../libs/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../libs/bootstrap/css/buttons.css" rel="stylesheet" />
    <link href="../libs/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="../libs/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <link href="../libs/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <style type="text/css">
        .label
        {
            background: #f5f5f5;
            }
        .checkbox input[type="checkbox"]
        {
            margin-left:0px;
            }
       .checkbox label
        {
            position: relative;
            display: inline;
            margin: 0;
            padding: 5px 15px 5px 38px;
            font-size: 13px;
            line-height: 17px;
            color: #fff;
            background: #1B9AF7;
            border: none;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="span4">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                <a href="#" onclick="logIn()" style="cursor: pointer">
                    <asp:Label ID="lblLogin" runat="server" Text="[登录]" ToolTip="登录"></asp:Label></a>
                <a href="#" onclick="signIn()" style="cursor: pointer">
                    <asp:Label ID="lblRegister" runat="server" Text="[免费注册]" ToolTip="免费注册"></asp:Label></a>
                <asp:Button ID="btnQuit" runat="server" Text="[注销]" Height="23px" Width="49px" BorderStyle="None"
                    OnClick="btnQuit_Click" /></div>
            <div class="span4">
            </div>
            <div class="span4" style="text-align: right">
                <asp:LinkButton ID="lbtnFirstPage" runat="server" Font-Underline="False" OnClick="lbtnFirstPage_Click"
                    ForeColor="#CC0000" ToolTip="淘宝首页">淘宝首页</asp:LinkButton>
                <asp:Label ID="Label2" runat="server" Text="| 关于我们"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="span4">
                <h1 style="color: #FF6633">
                    校园手机淘宝</h1>
            </div>
            <div class="span8" style="padding-top: 10px; text-align: right">
                <asp:TextBox ID="txtSearch" Style="width: 350px;" placeholder="要搜索店铺，请输入关键词" class="input-medium search-query"
                    runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" class="btn btn-success" runat="server" Text="搜一搜" OnClick="btnSearch_Click" />
            </div>
            <!--买家卖家导航开始-->
            <div class="span12" style="height: 20px">
            </div>
            <div id="publicNav" class="span12" style="padding-top: 15px" runat="server">
                <div class="navbar">
                    <div class="navbar-inner">
                        <div class="container-fluid">
                            <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar">
                                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                                </span></a><a href="../Public/Index.aspx" class="brand">ZFLY</a>
                            <div class="nav-collapse collapse navbar-responsive-collapse">
                                <ul class="nav">
                                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">收藏夹<strong
                                        class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="../Buyer/CollectedPhone.aspx">收藏的宝贝</a> </li>
                                            <li><a href="../Buyer/CollectedShop.aspx">收藏的店铺</a> </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">查看购物车<strong
                                        class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="../Buyer/ShoppingCart.aspx">购物车</a> </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">我的订单<strong
                                        class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="../Buyer/OrderInfo.aspx">订单详情</a> </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">我要开店<strong
                                        class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="../Buyer/ApplyShop.aspx">店铺申请</a> </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">我是卖家<strong
                                        class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="../Seller/My_Shop.aspx">我的店铺</a> </li>
                                            <li><a href="../Seller/Seller_Info.aspx">店铺信息</a> </li>
                                            <li><a href="../Seller/Publish.aspx">商品发布</a> </li>
                                            <li><a href="../Seller/OrderManage.aspx">订单管理</a> </li>
                                            <li><a href="../Seller/Estimate.aspx">评价管理</a> </li>
                                        </ul>
                                    </li>
                                </ul>
                                <ul class="nav pull-right">
                                    <li class="divider-vertical"></li>
                                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">信息维护<strong
                                        class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="../Public/UpdateInfo.aspx">个人信息</a> </li>
                                            <li><a href="../Public/Pwdreset.aspx">修改密码</a> </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="adminNav" class="span12" runat="server">
                <div class="navbar">
                    <div class="navbar-inner">
                        <div class="container-fluid">
                            <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar">
                                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                                </span></a><a href="Index.aspx" class="brand">ZFLY</a>
                            <div class="nav-collapse collapse navbar-responsive-collapse">
                                <ul class="nav">
                                    <li><a href="../Admin/shopexamine.aspx">店铺管理</a> </li>
                                    <li><a href="../Admin/goodsmanage.aspx">商品管理</a> </li>
                                    <li><a href="../Admin/Brandmanage.aspx">手机属性管理</a> </li>
                                    <li><a href="../Admin/usermanage.aspx">用户管理</a> </li>
                                    <li><a href="../Admin/goodscompmanage.aspx">投诉管理</a> </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--导航结束-->
        </div>
        <!--选择区域开始-->
        <div class="row-fluid span12">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlbtncondition" class="well" runat="server">
                        <div id="lchy_filter">
                            <table>
                                <tr>
                                    <td align="right">
                                        <span class="lchy_filterTitle">品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌:</span>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button2" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button3" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button4" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button5" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button6" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button7" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button8" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button9" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button10" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="Button11" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button12" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button13" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button14" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button15" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button16" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button17" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button18" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button19" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button20" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table>
                                <tr>
                                    <td align="right" class="style2">
                                        <span class="lchy_filterTitle">操作系统:</span>
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button21" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button22" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button23" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button24" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button25" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button26" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button27" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button28" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button29" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td class="style1">
                                        <asp:Button ID="Button30" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table>
                                <tr>
                                    <td align="right" class="style2">
                                        <span class="lchy_filterTitle">手机颜色:</span>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button31" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button32" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button33" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button34" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button35" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button36" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button37" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button38" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button39" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button40" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table>
                                <tr>
                                    <td align="right" class="style2">
                                        <span class="lchy_filterTitle">屏幕尺寸:</span>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button41" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button42" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button43" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button44" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button45" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button46" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button47" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button48" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button49" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button50" runat="server" Text="Button" class="button button-primary button-rounded button-tiny"
                                            OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                                    </td>
                                </tr>
                            </table>
                            <div style="text-align: right; height: 30px;">
                                <asp:Button ID="btnmoreselect" runat="server" Text="+ 多选" class="button button-pill button-action button-small"
                                    OnClick="btnmoreselect_Click" />
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlcondition" class="well" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td class="style4">
                                    手机品牌：
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="cblBrand" runat="server" RepeatDirection="Horizontal" DataSourceID="sdsbrand"
                                        DataTextField="meaning" DataValueField="brandid" CssClass="checkbox label">
                                    </asp:CheckBoxList>
                                    <asp:SqlDataSource ID="sdsbrand" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                                        SelectCommand="SELECT [brandid], [identification], [meaning], [comment] FROM [DM_phonebrand]">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr style="height: 20px;">
                            </tr>
                            <tr style="padding-top: 20px;">
                                <td class="style4">
                                    操作系统：
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="cblOS" runat="server" RepeatDirection="Horizontal" DataSourceID="sdsos"
                                        DataTextField="meaning" DataValueField="osid" CssClass="checkbox label">
                                    </asp:CheckBoxList>
                                    <asp:SqlDataSource ID="sdsos" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                                        SelectCommand="SELECT * FROM [DM_os]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr style="height: 20px;">
                            </tr>
                            <tr>
                                <td class="style4">
                                    屏幕大小：
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="cblSreen" runat="server" RepeatDirection="Horizontal" DataSourceID="sdsscreen"
                                        DataTextField="meaning" DataValueField="screensizeid" CssClass="checkbox label">
                                    </asp:CheckBoxList>
                                    <asp:SqlDataSource ID="sdsscreen" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                                        SelectCommand="SELECT * FROM [DM_screensize]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr style="height: 20px;">
                            </tr>
                            <tr>
                                <td class="style4">
                                    价格区间：
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="cblPrice" runat="server" RepeatDirection="Horizontal" DataSourceID="sdsprice"
                                        DataTextField="priceinterval" DataValueField="priceintid" CssClass="checkbox label">
                                    </asp:CheckBoxList>
                                    <asp:SqlDataSource ID="sdsprice" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                                        SelectCommand="select priceintid,CONVERT(varchar,low)+'-'+CONVERT(varchar,high) priceinterval
from DM_priceinterval"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr style="height: 20px;">
                            </tr>
                            <tr>
                                <td class="style4">
                                    手机颜色：
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="cblcolor" runat="server" RepeatDirection="Horizontal" DataSourceID="sdscolor"
                                        DataTextField="meaning" DataValueField="colorid" CssClass="checkbox label">
                                    </asp:CheckBoxList>
                                    <asp:SqlDataSource ID="sdscolor" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                                        SelectCommand="SELECT * FROM [DM_color]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                </td>
                                <td>
                                    <div style="float: left;padding-top:30px;">
                                        <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="确定" class="button button-rounded  button-action button-small" />
                                        <asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" Text="取消" class="button button-rounded  button-action button-small" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <div>
                        <br />
                        <asp:DataList ID="dlPhone" runat="server" EnableTheming="False" HorizontalAlign="Center"
                            RepeatColumns="5" RepeatDirection="Horizontal" DataSourceID="sdsresult" DataKeyField="phone_id">
                            <ItemTemplate>
                                <div style="width: 180px; text-align: center;">
                                    <asp:ImageButton ID="imgbtnPhoto" runat="server" OnClick="imgbtnPhoto_Click" AlternateText="加载中..."
                                        Height="180px" ImageAlign="TextTop" Width="100px" CommandArgument='<%#Eval("phone_id")%>'
                                        ImageUrl='<%#Eval("phone_image")%>' />
                                    <br />
                                    <asp:LinkButton ID="lbtnPName" runat="server" ForeColor="#0033CC" OnClick="lbtnPName_Click"
                                        CausesValidation="False" CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>'></asp:LinkButton>
                                    <br />
                                    <asp:Label ID="lblPrice" runat="server" ForeColor="Red" Text='<%#Eval("price") %>'></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Label1" runat="server" Text="免运费"></asp:Label>
                                    <br />
                                    <asp:LinkButton ID="lbtnSName" runat="server" ForeColor="#0033CC" OnClick="lbtnSName_Click"
                                        CausesValidation="False" CommandArgument="shop_id" Text='<%#Eval("shop_name") %>'></asp:LinkButton>
                                </div>
                                &nbsp;
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="sdsresult" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                            SelectCommand="SELECT * FROM [shopinfo_phoneinfo_query_view1]"></asp:SqlDataSource>
                        <br />
                        <asp:ObjectDataSource ID="odsphone" runat="server"></asp:ObjectDataSource>
                        <asp:DataList ID="dlodsphone" runat="server" EnableTheming="False" HorizontalAlign="Center"
                            RepeatColumns="5" RepeatDirection="Horizontal" DataKeyField="phone_id">
                            <ItemTemplate>
                                <div style="text-align: center; width: 180px;">
                                    <asp:ImageButton ID="imgbtnPhoto" runat="server" OnClick="imgbtnPhoto_Click" AlternateText="加载中..."
                                        Height="180px" ImageAlign="TextTop" Width="105px" CommandArgument='<%# Eval("phone_id") %>'
                                        ImageUrl='<%# Eval("phone_image") %>' />
                                    <br />
                                    <asp:LinkButton ID="lbtnPName" runat="server" ForeColor="#0033CC" OnClick="lbtnPName_Click"
                                        CausesValidation="False" CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>'></asp:LinkButton>
                                    <br />
                                    <asp:Label ID="lblPrice" runat="server" ForeColor="Red" Text='<%#Eval("price") %>'></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Label1" runat="server" Text="免运费"></asp:Label>
                                    <br />
                                    <asp:LinkButton ID="lbtnSName" runat="server" ForeColor="#0033CC" OnClick="lbtnSName_Click"
                                        CausesValidation="False" CommandArgument='<%# Eval("shop_id") %>' Text='<%# Eval("shop_name") %>'></asp:LinkButton>
                                    &nbsp;
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!--选择区域结束-->
    </div>
    <div class="container">
        <div class="row-fluid">
            <div class="span12">
                <div style="text-align: center">
                    Copyright © 2014-2015 ZFLY版权所有
                </div>
            </div>
        </div>
    </div>
    <!--注册模态框开始-->
    <div id="modelSignIn" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                ×</button>
            <h3 id="myModalLabel">
                用户注册
            </h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="txtUserName">
                        用户名</label>
                    <div class="controls">
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtUserName">
                        真实姓名</label>
                    <div class="controls">
                        <asp:TextBox ID="txtRealName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtEmail">
                        电子邮箱</label>
                    <div class="controls">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtTelPhone">
                        联系电话</label>
                    <div class="controls">
                        <asp:TextBox ID="txtTelPhone" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtStreet">
                        常用地址</label>
                    <div class="controls">
                        <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtNewPwd">
                        密码</label>
                    <div class="controls">
                        <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtAckPwd">
                        确认密码</label>
                    <div class="controls">
                        <asp:TextBox ID="txtAckPwd" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtQuestion">
                        安全问题</label>
                    <div class="controls">
                        <asp:TextBox ID="txtQuestion" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtQuestion">
                        问题答案</label>
                    <div class="controls">
                        <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <label>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPwd"
                                ControlToValidate="txtAckPwd" ErrorMessage="密码不一致！" ForeColor="Red"></asp:CompareValidator></label>
                        <asp:Button ID="btnRegister" runat="server" Text="注册" Width="220px" OnClick="btnRegister_Click"
                            CssClass="btn btn-success" />
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">
                取消</button>
        </div>
    </div>
    <!--注册框结束-->
    <!--登录模态框开始-->
    <div id="modalLogin" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                ×</button>
            <h3 id="H1">
                用户登录
            </h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="txtUserName">
                        用户名</label>
                    <div class="controls">
                        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtUserName">
                        密码</label>
                    <div class="controls">
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <label>
                            <asp:CheckBox ID="CheckBox1" runat="server" />记住用户名&nbsp;&nbsp;&nbsp; <a>
                                <asp:LinkButton ID="lbtnFindPwd" runat="server" ForeColor="red" OnClick="lbtnFindPwd_Click">忘记密码</asp:LinkButton></a><br />
                            <asp:Button ID="btnUserLogin" runat="server" Text="登录" Width="220px" OnClick="btnUserLogin_Click"
                                CssClass="btn btn-success" />
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">
                取消</button>
        </div>
    </div>
    <!--注册框结束-->
    </form>
    <script type="text/javascript" src="../libs/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../libs/bootstrap-select/js/bootstrap-select.js"></script>
    <script type="text/javascript">
        $(function () {

        });

        function checkBoxCss() {
            alert("hah");
        }

        function logIn() {
            $('#modalLogin').modal('show');
        }
        function signIn() {
            $('#modelSignIn').modal('show');
        }
    </script>
</body>
</html>
