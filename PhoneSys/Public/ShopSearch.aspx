<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopSearch.aspx.cs" Inherits="Public_ShopSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>校园手机淘宝</title>
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <link href="../libs/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../libs/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="../libs/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <link href="../libs/font-awesome/css/font-awesome.css" rel="stylesheet" />
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
                    OnClick="btnQuit_Click1" /></div>
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="page-header span12">
                        <h3>
                            搜索结果</h3>
                    </div>
                </div>
                <div class="row">
                    <asp:DataList ID="dlShop" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                        OnItemDataBound="dlShop_ItemDataBound" DataKeyField="shop_id" OnItemCommand="dlShop_ItemCommand">
                        <ItemTemplate>
                            <!--搜索结果做左侧-->
                            <div class="span2 well" style="text-align: center">
                                <asp:Image ID="imgLogo" runat="server" AlternateText="淘" BorderColor="#CCCCCC" BorderStyle="Solid"
                                    GenerateEmptyAlternateText="True" Height="100px" ImageAlign="Middle" ImageUrl='<%# Bind("shop_logo","{0}") %>'
                                    Width="100px" /><br />
                                <asp:LinkButton ID="lbtnShopName" runat="server" CommandArgument='<%# Eval("shop_id") %>'
                                    OnClick="lbtnShopName_Click" Text='<%# Eval("shop_name") %>'></asp:LinkButton><br />
                                卖家：<a href="LookShop.aspx?ShopId=<%# Eval("shop_id") %>"><%# Eval("UserName") %></a>
                                <asp:Label ID="lblHidden" runat="server" Text='<%# Eval("shop_id") %>' Visible="False"></asp:Label>
                            </div>
                            <!--搜索结果做右侧-->
                            <div class="span9" style="padding-left: 20px">
                                <div class="row">
                                    <asp:Label ID="Label1" runat="server" Text="【本店热销】" class="label label-important"></asp:Label>
                                    <asp:DataList ID="dlPhoneInShop" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <div class="span3" style="text-align: center">
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
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            <div id="pagenation" style="text-align:center">
                                <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                <asp:Label ID="lblCount" runat="server"></asp:Label>
                                <div class="btn-group">
                                    <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first" CssClass="btn">首页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn">尾页</asp:LinkButton>
                                </div>
                                <asp:Label ID="lblSkip" runat="server" Text="跳转至"></asp:Label>
                                <asp:TextBox ID="txtSkip" runat="server" Width="30px"></asp:TextBox>
                                <asp:Button ID="btnSkip" runat="server" CommandName="search" class="btn btn-info"
                                    Text="Go" />
                            </div>
                        </FooterTemplate>
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div>
        <div class="box">
            <div class="center_bottom">
            </div>
        </div>
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
            $('.selectpicker').selectpicker();
            $('.bootstrap-select').width('75px');
        });

        function logIn() {
            $('#modalLogin').modal('show');
        }
        function signIn() {
            $('#modelSignIn').modal('show');
        }
    </script>
</body>
</html>
