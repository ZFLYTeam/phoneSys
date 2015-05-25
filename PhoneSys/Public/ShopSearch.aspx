<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopSearch.aspx.cs" Inherits="Public_ShopSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>校园手机淘宝</title>
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <link href="../css/search1.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="../js/Mask.js" type="text/javascript"></script>
    <script src="../js/Mask2.js" type="text/javascript"></script>
    <script src="../js/scrollToTop.js" type="text/javascript"></script>
    <style type="text/css">
        .confloat
        {
            border-bottom:2px solid #cc0000;
            background-image:url(../images/back.png);
            background-color:White;
            position:absolute;
            top: 24px;
            left: 0px;
            width:100%;
            z-index:1000;
        }
       .box
        {
            width:90%;
            margin:0 auto;
        }
        .center_top
        {
            margin-top:30px;
            margin-left:50px;
            margin-right:0px;
            margin-bottom:10px;            
            width:950px;
            border:2px solid #FFFF00;
            padding:20px;
            
        }
        .center_bottom
        {
            margin:0 auto;
            width:100%;
            margin-top:10px;
            margin-bottom:15px;          
            border:2px solid #cc0000;
            font:normal 12px "楷体";
            text-align:center;
            clear:right;
            text-align:center;
        }
        .style1
        {
            width: 111px;
        }
        .style2
        {
            width: 128px;
        }
        .style3
        {
            width: 127px;
        }
    </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
        <div class="top">
           <div class="top_info">
              <div class="top_info_center">
                 <p class="p1"><asp:Label ID="lblMsg" runat="server"></asp:Label>
                      <a href="#" onclick="openDiv('newDiv');" style="cursor:pointer">
                      <asp:Label ID="lblLogin" runat="server" Text="[登录]"></asp:Label></a>
                   <a href="#" onclick="openDiv2('newDiv2');" style="cursor:pointer">
                       <asp:Label ID="lblRegister" runat="server" Text="[免费注册]"></asp:Label></a>
                     <asp:Button ID="btnQuit"
                             runat="server" Text="[注销]" ForeColor="#BD2424"  BackColor="#EEEEE0" Height="23px" Width="49px" 
                         BorderStyle="None" onclick="btnQuit_Click1" /></p>
                   <p class="p0">
                        <asp:LinkButton ID="lbtnFirstPage" runat="server" Font-Underline="True" 
                            onclick="lbtnFirstPage_Click">淘宝首页</asp:LinkButton>
                        <asp:Label ID="Label2" runat="server" Text="| 关于我们"></asp:Label>
                  </p>
              </div>
           </div>
           
           <div class="top_logo">
           <div id="newDiv2">
                 <table cellpadding="0" cellspacing="0">
                     <tr id="tr12"><td class="td12">免费注册</td><td class="td23"></td><td class="td12"></td><td class="td23"><a id="close2"><font color="#000">关闭</font></a></td></tr>
                      <tr class="tr12"><td class="td12">用户名：</td><td class="td23">
                          <asp:TextBox ID="txtUserName" runat="server" Height="30px" Width="200px"></asp:TextBox>
                          </td></tr>
                          <tr class="tr12"><td class="td12">真实姓名：</td><td class="td23">
                          <asp:TextBox ID="txtRealName" runat="server" Height="30px" Width="200px"></asp:TextBox>
                          </td></tr>
                          <tr class="tr12"><td class="td12">电子邮箱：</td><td class="td23">
                             <asp:TextBox ID="txtEmail" runat="server" Height="30px" Width="200px"></asp:TextBox>
                           </td></tr>
                          <tr class="tr12"><td class="td12">联系电话：</td><td class="td23">
                          <asp:TextBox ID="txtTelPhone" runat="server" Height="30px" Width="200px"></asp:TextBox>
                          </td></tr>                     
                        
                          <tr class="tr12"><td class="td12">常用地址：</td><td class="td23">
                          <asp:TextBox ID="txtStreet" runat="server" Height="30px" Width="200px"></asp:TextBox>
                          </td></tr>
                       <tr class="tr12"><td class="td12">密码：</td><td class="td23">
                           <asp:TextBox ID="txtNewPwd" runat="server" Height="30px" Width="200px" 
                               TextMode="Password"></asp:TextBox>
                           </td></tr>
                        <tr class="tr12"><td class="td12">确认密码：</td><td class="td23">
                            <asp:TextBox ID="txtAckPwd" runat="server" Height="30px" Width="200px" 
                                TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="td23">
                                <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToCompare="txtNewPwd"  ControlToValidate="txtAckPwd" ErrorMessage="密码不一致！" ForeColor="Red"></asp:CompareValidator>
                            </td>
                            </tr>
                          <tr class="tr12"><td class="td12">安全问题：</td><td class="td23">
                              <asp:TextBox ID="txtQuestion" runat="server" Height="30px" Width="200px"></asp:TextBox>
                              </td></tr>
                           <tr class="tr12"><td class="td12">问题答案：</td><td class="td23">
                               <asp:TextBox ID="txtAnswer" runat="server" Height="30px" Width="200px"></asp:TextBox>
                               </td></tr>                       
                            <tr class="tr12"><td class="td12"></td><td class="td23">
                                <asp:Button ID="btnRegister" runat="server" BackColor="#cd2626" BorderColor="#cd2626" 
                                    Font-Bold="False" Font-Size="X-Large" ForeColor="White" Height="35px" Text="    注册" 
                                    Width="140px"  OnClick="btnRegister_Click"/>
                                </td></tr>
                 </table>
              </div>
           <div class="confloat" id="confloat">
              <div class="top_logo_center">
                  <div class="logo">
                      <p class="p4">校园手机淘宝</p>
                    <p class="p5">xiaoyuanshoujitaobao</p>
                 </div>
                 <div class="search">
                    <div class="search_center">
                    <div style="height:38px;width:300px;float:left;">
                    <asp:TextBox ID="txtSearch" runat="server" BorderColor="#006600" placeholder="搜索店铺，请输入关键词"
                            BorderStyle="Solid" BorderWidth="2px" Height="34px" Width="300px"></asp:TextBox>
                    </div>
                    <div style="height:38px;width:80px;float:left;">
                    <asp:Button ID="btnSearch" runat="server" BackColor="#006600" 
                            BorderColor="#006600" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" 
                            Height="38px" Text="   搜索" Width="80px" onclick="btnSearch_Click" />
                    </div>
                        
                     </div>
                 </div>
               </div>
           </div>
           <script type="text/javascript">
               $.fn.smartFloat = function () {
                   var position = function (element) {
                       var top = element.position().top, pos = element.css("position");
                       $(window).scroll(function () {
                           var scrolls = $(this).scrollTop();
                           if (scrolls > top) {
                               if (window.XMLHttpRequest) {
                                   element.css({
                                       position: "fixed",
                                       top: 0
                                   });
                               } else {
                                   element.css({
                                       top: scrolls
                                   });
                               }
                           } else {
                               element.css({
                                   position: pos,
                                   top: top
                               });
                           }
                       });
                   };
                   return $(this).each(function () {
                       position($(this));
                   });
               };
               //绑定
               $("#confloat").smartFloat();
</script>
           </div>
           <div class="top_menu">
              <div class="top_menu_center">
                 <div id="menu_left">店铺搜索<small><small></small></small></div>
                 <div id="menu_right">
                    <ul>
                        <asp:Menu ID="Menu1" runat="server" 
                            DataSourceID="SiteMapDataSource1" ForeColor="White" Orientation="Horizontal" 
                            StaticDisplayLevels="2" EnableViewState="False" CssClass="menu">
                        </asp:Menu>
                    </ul>
                 </div>
              </div>
           </div>
        </div>
        <div class="scroll" id="scroll" style="display:none;">
		    回<br/>到<br/>顶<br/>部
	    </div>
        <div id="newDiv">
           <table cellpadding="0" cellspacing="0">
              <tr id="tr1"><td class="td1">登录</td><td class="td2"><span style="margin-left:360px"><a id="close"><font color="#000">关闭</font></a></span></td></tr>
               <tr class="tr2"><td class="td1">用户名：</td><td class="td2">
                   <asp:TextBox ID="txtUser" runat="server" Height="30px" Width="280px"></asp:TextBox>
                   </td></tr>
                <tr class="tr2"><td class="td1">密码：</td><td class="td2">
                    <asp:TextBox ID="txtPwd" runat="server" Height="30px" TextMode="Password" 
                        Width="280px"></asp:TextBox>
                    </td></tr>
                 <tr class="tr2"><td class="td1"></td>
                     <td class="td2"><asp:CheckBox ID="CheckBox1" runat="server" />记住用户名&nbsp;&nbsp;&nbsp;
                     <a><asp:LinkButton ID="lbtnFindPwd" runat="server" ForeColor="red" OnClick="lbtnFindPwd_Click">忘记密码</asp:LinkButton></a></td></tr>
                 <tr class="tr2">
                 <td class="td1"></td>
                 <td class="td2">
                     <asp:Button ID="btnUserLogin" runat="server" Height="40px" Text="         登录" Width="285px"  OnClick="btnUserLogin_Click"
                         BackColor="#cd2626" BorderColor="#cd2626" Font-Size="X-Large" ForeColor="White" />
                     </td></tr>
           </table>
        </div>
        <div class="box">
        <div class="center_bottom">
        <asp:DataList ID="dlShop" runat="server" RepeatColumns="1" 
                 RepeatDirection="Horizontal" onitemdatabound="dlShop_ItemDataBound" 
                 DataKeyField="shop_id" Height="200px" Width="100%" 
                 onitemcommand="dlShop_ItemCommand" BackColor="#DEBA84" 
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="2px" CellPadding="3" 
                CellSpacing="2" GridLines="Both">

                 <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />

                 <FooterTemplate>
                     <asp:Panel ID="pnlselect" runat="server">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                     <asp:Label ID="lblCount" runat="server"></asp:Label>
                     <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first">首页</asp:LinkButton>
                     <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre">上一页</asp:LinkButton>
                     <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next">下一页</asp:LinkButton>
                     <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last">尾页</asp:LinkButton>
                     <asp:Label ID="lblSkip" runat="server" Text="跳转至"></asp:Label>
                     <asp:TextBox ID="txtSkip" runat="server" Width="30px"></asp:TextBox>
                     <asp:Button ID="btnSkip" runat="server" CommandName="search" Text="Go" />
                     </asp:Panel>
                 </FooterTemplate>

                 <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                 <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />

                 <ItemTemplate>
                     <table class="style1">
                         <tr style="width:40%;">
                             <td style="text-align:center;border-right-style:solid; border-right-width:3px; border-right-color:#DEBA84;" 
                                 rowspan="4">
                                 <div style="width:300px;text-align:center;height:100%;">
                                 <div style="height:20px;width:100%;text-align:left;margin-top:5px;">
                                 <asp:LinkButton ID="lbtnShopName" runat="server" 
                                                 CommandArgument='<%# Eval("shop_id") %>' Font-Underline="True" 
                                                 ForeColor="#CC6600" onclick="lbtnShopName_Click" 
                                                 Text='<%# Eval("shop_name") %>'></asp:LinkButton>
                                 </div>
                                 <div style="height:120px;width:100%;text-align:center;">
                                 <div style="height:100px;width:100px;text-align:center;float:left;">
                                 <asp:Image ID="imgLogo" runat="server" AlternateText="淘" BorderColor="#CCCCCC" 
                                                 BorderStyle="Solid" BorderWidth="1px" ForeColor="#FF8000" 
                                                 GenerateEmptyAlternateText="True" Height="100px" ImageAlign="Middle" 
                                                 ImageUrl='<%# Bind("shop_logo","{0}") %>' Width="100px" />
                                 </div>
                                 <div style="height:40px;width:180px;text-align:left;float:left;">
                                 卖家：<a href="LookShop.aspx?ShopId=<%# Eval("shop_id") %>"><%# Eval("UserName") %></a> 
                                     <img src="../images/在线聊.gif" />
                                 </div>
                                 <div style="height:60px;width:180px;text-align:left;float:left;">
                                 收货地址：<%# Eval("shop_address") %></div>
                                 </div>
                                 <div style="height:20px;width:100%;text-align:center;">
                                     <img src="../images/信任度.png" />
                                 </div>
                                 <div><asp:Label ID="lblHidden" runat="server" Text='<%# Eval("shop_id") %>' Visible="False"></asp:Label></div>
                                </div>
                             </td>
                             <td>
                                 <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-Bold="False" 
                                     Font-Names="楷体" Font-Size="Large" ForeColor="Red" Height="19px" Text="【本店热销】" 
                                     Width="117px"></asp:Label>
                             </td>
                         </tr>
                         <tr style="width:60%;">
                             <td class="style3">
                                 <table class="style6">
                                     <tr>
                                         <td>
                                             <asp:DataList ID="dlPhoneInShop" runat="server" 
                                                 RepeatColumns="5" 
                                                 RepeatDirection="Horizontal" Width="800px" Height="146px">
                                                 <ItemTemplate>
                                                     <table class="style4">
                                                         <tr>
                                                             <td class="style7">
                                                                 <asp:ImageButton ID="imgbtnPhoto" runat="server" 
                                                                     CommandArgument='<%# Eval("phone_id") %>' Height="150px" 
                                                                     ImageUrl='<%# Eval("phone_image") %>' onclick="imgbtnPhoto_Click" 
                                                                     Width="100px" />
                                                             </td>
                                                         </tr>
                                                         <tr>
                                                             <td class="style9">
                                                                 <asp:LinkButton ID="lbtnPName" runat="server" 
                                                                     CommandArgument='<%# Eval("phone_id") %>' ForeColor="#0033CC" 
                                                                     onclick="lbtnPName_Click" Text='<%# Eval("phone_name") %>' 
                                                                     Font-Underline="True"></asp:LinkButton>
                                                             </td>
                                                         </tr>
                                                         <tr>
                                                             <td style="width:160px;text-align:center;">
                                                                 <asp:Label ID="lblPrice" runat="server" ForeColor="Red" 
                                                                     Text='<%# "¥ "+Eval("price") %>'></asp:Label>
                                                             </td>
                                                         </tr>
                                                     </table>
                                                 </ItemTemplate>
                                             </asp:DataList>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                 </table>
                             </td>
                         </tr>
                     </table>
                     <hr />
                 </ItemTemplate>

                 <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />

             </asp:DataList>
        </div>
        </div>

          
          
        <div class="bottom">
           <div class="bottom_logo">
              <div class="bottom_logo_center">
                 <p class="p6">■享正品&nbsp;有保障</p>
                 <p class="p7">❤新服务&nbsp;新体验</p>
                 <p class="p8">▲种类全&nbsp;配送广</p>
              </div>
           </div>
           <div class="bottom_info">
              <div class="bottom_info_center">
                 <p class="p9"><a href="#">网站首页</a>|<a href="#">关于校园手机淘宝</a>|<a href="#">产品分类</a>|<a href="#">联系我们</a></p>
                 <p class="p10">客服热线：400-800-8800&nbsp; Copyright © 2014湖北大学 版权所有 11计科1班第五组</p>
                 <div class="zhifu"></div>
              </div>
           </div>
           <div class="bottom_img">
           </div>
        </div>
    </div>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    </form>
</body>
</html>
