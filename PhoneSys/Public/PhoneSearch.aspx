<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhoneSearch.aspx.cs" Inherits="Public_PhoneSearch" %>

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
        #lchy_filter table tr td input[type="submit"]
        {
            border:1px solid transparent;
            color:#00d;
        }
        .box
        {
            width:960px;
            margin:0 auto;
        }
         .center_top
        {
            margin:0 auto;
            margin-top:15px;          
            width:960px;
            border:2px solid #cc0000;
            float:left;
            clear:right;
        }
        .center_bottom
        {
            margin:0 auto;
            width:960px;
            margin-top:10px;
            margin-bottom:15px;          
            border:2px solid #cc0000;
            font:normal 12px "楷体";
            float:left;
            clear:right;
        }
        .confloat
        {
            background-image:url(../images/back.png);
            background-color:White;
            border-bottom:2px solid #cc0000;
            position:absolute;
            top: 24px;
            left: 0px;
            width:100%;
            z-index:1000;
        }
        .menu
        {
            font-size: medium;
        }
        .menu
        {
            font-size: small;
        }
        .style1
        {
            color: #FFFFFF;
        }
    </style>
</head>
<body>
  <form id="form1" runat="server">
        <div class="top">
           <div class="top_info">
              <div class="top_info_center">
                 <p class="p1"><asp:Label ID="lblMsg" runat="server"></asp:Label>
                    <a href="#" onclick="openDiv('newDiv');" style="cursor:pointer">
                      <asp:Label ID="lblLogin" runat="server" Text="[登录]"></asp:Label></a>
                   <a href="#" onclick="openDiv2('newDiv2');" style="cursor:pointer">
                       <asp:Label ID="lblRegister" runat="server" Text="[免费注册]"></asp:Label></a>
                     <asp:Button ID="btnQuit"
                             runat="server" Text="[注销]" ForeColor="#BD2424"  BackColor="#EEEEE0" 
                         Height="23px" Width="49px" 
                         BorderStyle="None" onclick="btnQuit_Click" CausesValidation="False" /></p>
                    <p class="p0">
                        <asp:LinkButton ID="lbtnFirstPage" runat="server" Font-Underline="False" 
                            onclick="lbtnFirstPage_Click" ToolTip="淘宝首页">淘宝首页</asp:LinkButton>
                        <asp:Label ID="Label2" runat="server" Text="| 关于我们"></asp:Label>
                  </p>
              </div>
           </div>
           <div id="newDiv2">
                 <table cellpadding="0" cellspacing="0">
                     <tr id="tr12"><td class="td12">免费注册</td><td class="td23"></td><td class="td12"></td><td class="td23"><a id="close2"><font color="#000" style="cursor:pointer;">关闭</font></a></td></tr>
                      <tr class="tr12"><td class="td12">用户名：</td><td class="td23">
                          <asp:TextBox ID="txtUserName" runat="server" Height="30px" Width="250px" 
                              BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                          </td></tr>
                          <tr class="tr12"><td class="td12">真实姓名：</td><td class="td23">
                          <asp:TextBox ID="txtRealName" runat="server" Height="30px" Width="250px" 
                                  BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                          </td></tr>
                          <tr class="tr12"><td class="td12">电子邮箱：</td><td class="td23">
                             <asp:TextBox ID="txtEmail" runat="server" Height="30px" Width="250px" 
                                  BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                           </td></tr>
                          <tr class="tr12"><td class="td12">联系电话：</td><td class="td23">
                          <asp:TextBox ID="txtTelPhone" runat="server" Height="30px" Width="250px" 
                                  BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                          </td></tr>                     
                         
                          <tr class="tr12"><td class="td12">常用地址：</td><td class="td23">
                          <asp:TextBox ID="txtStreet" runat="server" Height="30px" Width="250px" 
                                  BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                          </td></tr>
                       <tr class="tr12"><td class="td12">密码：</td><td class="td23">
                           <asp:TextBox ID="txtNewPwd" runat="server" Height="30px" Width="250px" 
                               TextMode="Password" BorderColor="#8A8A8A" BorderStyle="Solid" 
                               BorderWidth="1px"></asp:TextBox>
                           </td></tr>
                        <tr class="tr12"><td class="td12">确认密码：</td><td class="td23">
                            <asp:TextBox ID="txtAckPwd" runat="server" Height="30px" Width="250px" 
                                TextMode="Password" BorderColor="#8A8A8A" BorderStyle="Solid" 
                                BorderWidth="1px"></asp:TextBox>
                            </td>
                            <td class="td23">
                                <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToCompare="txtNewPwd"  ControlToValidate="txtAckPwd" ErrorMessage="密码不一致！" ForeColor="Red"></asp:CompareValidator>
                            </td>
                            </tr>
                          <tr class="tr12"><td class="td12">安全问题：</td><td class="td23">
                              <asp:TextBox ID="txtQuestion" runat="server" Height="30px" Width="250px" 
                                  BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                              </td></tr>
                           <tr class="tr12"><td class="td12">问题答案：</td><td class="td23">
                               <asp:TextBox ID="txtAnswer" runat="server" Height="30px" Width="250px" 
                                   BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                               </td></tr>                       
                            <tr class="tr12"><td class="td12"></td><td class="td23">
                                <asp:Button ID="btnRegister" runat="server" BackColor="#cc0000" BorderColor="#cc0000" 
                                    Font-Bold="False" Font-Size="X-Large" ForeColor="White" Height="35px" Text="注册" 
                                    Width="250px"  OnClick="btnRegister_Click" CssClass="btnCss"/>
                                </td></tr>
                 </table>
              </div>

           <div class="top_logo">
           <div class="confloat" id="confloat">
              <div class="top_logo_center">
                  <div class="logo">
                      <p class="p4">校园手机淘宝</p>
                    <p class="p5">xiaoyuanshoujitaobao</p>
                 </div>
                  <div class="search">
                    <div class="search_center">
                    <div style="height:38px;width:280px;float:left;">
                    <asp:TextBox ID="txtSearch" runat="server" BorderColor="#006600" placeholder="搜索手机，请输入关键词"
                            BorderStyle="Solid" BorderWidth="2px" Height="34px" Width="280px"></asp:TextBox>
                    </div>
                        <div style="height:38px;width:90px;float:left;">
                        <asp:Button ID="btnSearch" runat="server" BackColor="#006600" 
                            BorderColor="#006600" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" 
                            Height="38px" Text="   搜索" Width="90px" onclick="btnSearch_Click" />
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
                 <div id="menu_left">手机商品查询<small><small></small></small></div>
                 <div id="menu_right">
                        <asp:Menu ID="Menu1" runat="server" 
                            DataSourceID="SiteMapDataSource1" ForeColor="White" Orientation="Horizontal" 
                            StaticDisplayLevels="2" EnableViewState="False" CssClass="menu">
                        </asp:Menu>
                 </div>
              </div>
           </div>
        </div>
        <div>

   <div id="newDiv">
           <table cellpadding="0" cellspacing="0">
              <tr id="tr1"><td class="td1">登录</td><td class="td2"><span style="margin-left:360px"><a id="close"><font color="#000" style="cursor:pointer;">关闭</font></a></span></td></tr>
               <tr class="tr2"><td class="td1">用户名：</td><td class="td2">
                   <asp:TextBox ID="txtUser" runat="server" Height="30px" Width="280px" 
                       BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                   </td></tr>
                <tr class="tr2"><td class="td1">密码：</td><td class="td2">
                    <asp:TextBox ID="txtPwd" runat="server" Height="30px" TextMode="Password" 
                        Width="280px" BorderColor="#8A8A8A" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    </td></tr>
                 <tr class="tr2"><td class="td1"></td>
                     <td class="td2"><asp:CheckBox ID="CheckBox1" runat="server" />记住用户名&nbsp;&nbsp;&nbsp;
                     <a><asp:LinkButton ID="lbtnFindPwd" runat="server" ForeColor="red" OnClick="lbtnFindPwd_Click">忘记密码</asp:LinkButton></a></td></tr>
                 <tr class="tr2">
                 <td class="td1"></td>
                 <td class="td2">
                     <asp:Button ID="btnUserLogin" runat="server" Height="40px" Text="登录" Width="285px"  OnClick="btnUserLogin_Click"
                         BackColor="#cc0000" BorderColor="#cc0000" Font-Size="X-Large" ForeColor="White" CssClass="btnCss" />
                     </td></tr>
           </table>
        </div>
         <div class="box">
         <div  class="center_top">
        <asp:Panel ID="pnlbtncondition" runat="server">
        <div id="lchy_filter">
                    <table>
                    <tr>
                        <td align="right" class="style2">
                            <span class="lchy_filterTitle">品牌:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button4" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button5" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button6" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button7" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button8" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button9" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button10" runat="server" Text="Button" BackColor="White"
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" 
                                Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="Button11" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button12" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button13" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button14" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button15" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button16" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button17" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button18" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button19" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button20" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                    </tr>
                    </table>
                    <table>
                    <tr>
                        <td align="right" class="style2">
                            <span class="lchy_filterTitle">操作系统:</span>
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button21" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button22" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button23" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button24" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button25" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button26" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button27" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button28" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button29" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="Button30" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                    </tr>
                    </table>
                    <table>
                    <tr>
                        <td align="right" class="style2">
                            <span class="lchy_filterTitle">手机颜色:</span>
                        </td>
                        <td>
                            <asp:Button ID="Button31" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button32" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button33" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button34" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button35" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button36" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button37" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button38" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button39" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button40" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                    </tr>
                    </table>
                    <table>
                    <tr>
                        <td align="right" class="style2">
                            <span class="lchy_filterTitle">屏幕尺寸:</span>
                        </td>
                        <td>
                            <asp:Button ID="Button41" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button42" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button43" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button44" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button45" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button46" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button47" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button48" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button49" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button50" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" />
                        </td>
                    </tr>
                    </table>
                    <table>
                    <%--<tr>
                        <td align="right" class="style2">
                            <span class="style1">价格区间:</span>
                        </td>
                        <td>
                            <asp:Button ID="Button51" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button52" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button53" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button54" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button55" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button56" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button57" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button58" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button59" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="Button60" runat="server" Text="Button" BackColor="White"  
                                  OnClick="filter_Click" ToolTip="点击后筛选查询" Visible="False" 
                                CssClass="style1" Enabled="False" />
                        </td>
                    </tr>--%>
                    </table>
                <div style="float:right;height:30px;">
                    <asp:Button ID="btnmoreselect" runat="server" Text="+ 多选" BorderStyle="Solid" 
                        onclick="btnmoreselect_Click" />
                </div>
                </div>
        </asp:Panel>
        <asp:Panel ID="pnlcondition" runat="server" Visible="False">
        <table>
       <tr>
       <td class="style4">手机品牌：</td>
       <td>
           <asp:CheckBoxList ID="cblBrand" runat="server" RepeatDirection="Horizontal" 
               DataSourceID="sdsbrand" DataTextField="meaning" DataValueField="brandid">
           </asp:CheckBoxList>
           <asp:SqlDataSource ID="sdsbrand" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
               SelectCommand="SELECT [brandid], [identification], [meaning], [comment] FROM [DM_phonebrand]">
           </asp:SqlDataSource>
       </td>
       </tr>
       <tr>
       <td class="style4">操作系统：</td>
       <td>
           <asp:CheckBoxList ID="cblOS" runat="server" RepeatDirection="Horizontal" 
               DataSourceID="sdsos" DataTextField="meaning" DataValueField="osid" >
           </asp:CheckBoxList>
           <asp:SqlDataSource ID="sdsos" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
               SelectCommand="SELECT * FROM [DM_os]"></asp:SqlDataSource>
       </td>
       </tr>
       <tr>
       <td class="style4">屏幕大小：</td>
       <td>
           <asp:CheckBoxList ID="cblSreen" runat="server" RepeatDirection="Horizontal" 
               DataSourceID="sdsscreen" DataTextField="meaning" DataValueField="screensizeid">
           </asp:CheckBoxList>
           <asp:SqlDataSource ID="sdsscreen" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
               SelectCommand="SELECT * FROM [DM_screensize]"></asp:SqlDataSource>
       </td>
       </tr>
       <tr>
       <td class="style4">价格区间：</td>
       <td>
           <asp:CheckBoxList ID="cblPrice" runat="server" RepeatDirection="Horizontal" 
               DataSourceID="sdsprice" DataTextField="priceinterval" 
               DataValueField="priceintid">
           </asp:CheckBoxList>
           <asp:SqlDataSource ID="sdsprice" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
               SelectCommand="select priceintid,CONVERT(varchar,low)+'-'+CONVERT(varchar,high) priceinterval
from DM_priceinterval">
           </asp:SqlDataSource>
       </td>
       </tr>
       <tr>
       <td class="style4">手机颜色：</td>
       <td>
           <asp:CheckBoxList ID="cblcolor" runat="server" RepeatDirection="Horizontal" 
               DataSourceID="sdscolor" DataTextField="meaning" DataValueField="colorid">
           </asp:CheckBoxList>
           <asp:SqlDataSource ID="sdscolor" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
               SelectCommand="SELECT * FROM [DM_color]"></asp:SqlDataSource>
       </td>
       </tr>
       <tr>
       <td class="style4"></td>
       <td>
           <div style="width:50%;float:left;">
               <asp:Button ID="btnsave" runat="server" BackColor="Red" BorderColor="Red" 
                   ForeColor="White" onclick="btnsave_Click" Text="确定" />
               <asp:Button ID="btncancel" runat="server" BackColor="Red" BorderColor="Red" 
                   ForeColor="White" onclick="btncancel_Click" Text="取消" />
           </div>

       </td>
       </tr>
         </table>
        </asp:Panel>
    
    </div>
         <div class="scroll" id="scroll" style="display:none;">
		    回<br/>到<br/>顶<br/>部
	     </div>
         <div class="center_bottom">
         <asp:DataList ID="dlPhone" runat="server" EnableTheming="False" 
            HorizontalAlign="Center" RepeatColumns="5" RepeatDirection="Horizontal" 
                 DataSourceID="sdsresult" DataKeyField="phone_id">
        <ItemTemplate>
                    <div style="width:180px;text-align:center;">
                    <asp:ImageButton ID="imgbtnPhoto" runat="server" onclick="imgbtnPhoto_Click" 
                    AlternateText="加载中..." Height="180px" ImageAlign="TextTop"  Width="100px" 
                    CommandArgument='<%#Eval("phone_id")%>' 
                    ImageUrl='<%#Eval("phone_image")%>' />
                <br />
                <asp:LinkButton ID="lbtnPName" runat="server" ForeColor="#0033CC" 
                    onclick="lbtnPName_Click" CausesValidation="False" 
                    CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>' ></asp:LinkButton>
                <br />
                <asp:Label ID="lblPrice" runat="server" ForeColor="Red" 
                    Text='<%#Eval("price") %>'></asp:Label>
                &nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="免运费"></asp:Label>
                <br />
                <asp:LinkButton ID="lbtnSName" runat="server" ForeColor="#0033CC" 
                    onclick="lbtnSName_Click" CausesValidation="False" 
                    CommandArgument="shop_id" 
                    Text='<%#Eval("shop_name") %>'></asp:LinkButton>
                    </div>
                
                &nbsp;
            </ItemTemplate>
        </asp:DataList>
             <asp:SqlDataSource ID="sdsresult" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT * FROM [shopinfo_phoneinfo_query_view1]"></asp:SqlDataSource>
             <br />
             <asp:ObjectDataSource ID="odsphone" runat="server"></asp:ObjectDataSource>
        <asp:DataList ID="dlodsphone" runat="server" EnableTheming="False" 
            HorizontalAlign="Center" RepeatColumns="5" RepeatDirection="Horizontal" 
                 DataKeyField="phone_id">
        <ItemTemplate>
                <div style="text-align:center;width:180px;">
                    <asp:ImageButton ID="imgbtnPhoto" runat="server" onclick="imgbtnPhoto_Click" 
                    AlternateText="加载中..." Height="180px" ImageAlign="TextTop" Width="105px" 
                    CommandArgument='<%# Eval("phone_id") %>' 
                    ImageUrl='<%# Eval("phone_image") %>' />
                <br />
                <asp:LinkButton ID="lbtnPName" runat="server" ForeColor="#0033CC" 
                    onclick="lbtnPName_Click" CausesValidation="False" 
                    CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>' ></asp:LinkButton>
                <br />
                <asp:Label ID="lblPrice" runat="server" ForeColor="Red" 
                    Text='<%#Eval("price") %>'></asp:Label>
                &nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="免运费"></asp:Label>
                <br />
                <asp:LinkButton ID="lbtnSName" runat="server" ForeColor="#0033CC" 
                    onclick="lbtnSName_Click" CausesValidation="False" 
                    CommandArgument='<%# Eval("shop_id") %>' 
                    Text='<%# Eval("shop_name") %>'></asp:LinkButton>
                &nbsp;
                </div>
                
            </ItemTemplate>
        </asp:DataList>
    </div>
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
                 <p class="p10">客服热线：400-800-8800&nbsp; Copyright © 2014湖北大学 11计科1班第五组</p>
                 <div class="zhifu"></div>
              </div>
           </div>
        </div>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    </form>
</body>
</html>
