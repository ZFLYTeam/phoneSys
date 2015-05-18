<%@ Page Title="" Language="C#" MasterPageFile="~/Public/index.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Public_Index" Debug="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/index.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.4a2.min.js" type="text/javascript"></script>
    <script src="../js/jquery-2.1.0.min.js" type="text/javascript"></script>
    <script src="../js/jquery.KinSlideshow-1.1.js" type="text/javascript"></script>
    <script src="../js/jquery.KinSlideshow-1.2.1.min.js" type="text/javascript"></script>
    <script src="../js/menu.js" type="text/javascript"></script>
    <script src="../js/scrollToTop.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#KinSlideshow").KinSlideshow({ moveStyle: "left",
                titleBar: { titleBar_height: 30, titleBar_bgColor: "#fff", titleBar_alpha: 0}
            });
        })
    </script>
<style type="text/css">
    .style1
    {
        height: 20px;
        width: 99px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
      <div id="menu_img">
         <div id="left">
            <ul id="ul">
               <li class="li_a"><a class="a" href="">手机品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; >></a>
                  <ul class="inter_ul">
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
               <li class="li_a"><a class="a" href="">手机操作系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; >></a>
                  <ul class="inter_ul">
                    <li><a href="PhoneSearch.aspx?phonekeyword=安卓">安卓</a></li>
					<li><a href="PhoneSearch.aspx?phonekeyword=微软">微软</a></li>
					<li><a href="PhoneSearch.aspx?phonekeyword=塞班">塞班</a></li>
					<li><a href="PhoneSearch.aspx?phonekeyword=IOS">IOS</a></li>
                  </ul>
               </li>
               <li class="li_a"><a class="a" href="">手机屏幕大小&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; >></a>
                  <ul class="inter_ul">
                    <li><a href="PhoneSearch.aspx?phonekeyword=4寸及以下">4寸及以下</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=4.0寸-4.5寸">4.0寸-4.5寸</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=4.5寸-5.0寸">4.5寸-5.0寸</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=5.0寸以上">5.0寸以上</a></li>
                  </ul>
               </li>
               <li class="li_a"><a class="a" href="">手机价格区间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; >></a>
                  <ul class="inter_ul">
                    <li><a href="PhoneSearch.aspx?phonekeyword=500元以下">500元以下</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=500-1000">500-1000</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=1000-1500">1000-1500</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=1500以上">1500以上</a></li>
                  </ul>
               </li>
               <li class="li_a"><a class="a" href="">手机机身颜色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; >></a>
                  <ul class="inter_ul">
                    <li><a href="PhoneSearch.aspx?phonekeyword=红色">红色</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=白色">白色</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=黑色">黑色</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=灰色">灰色</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=蓝色">蓝色</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=黄色">黄色</a></li>
                  </ul>
               </li>
               <li class="li_a"><a class="a" href="">手机特色功能&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; >></a>
                  <ul class="inter_ul">
                    <li><a href="PhoneSearch.aspx?phonekeyword=双卡双待">双卡双待</a></li>
                    <li><a href="PhoneSearch.aspx?phonekeyword=三防">三防</a></li>
                  </ul>
               </li>
            </ul>
         </div>
         <div id="right">
            <div id="KinSlideshow" style="visibility:hidden">
            <a href="GoodsInfo.aspx?PhoneId=100000062"><img src="../images/1.jpg" alt="" width="750" height="200" /></a>
            <a  href="GoodsInfo.aspx?PhoneId=100000060"><img src="../images/2.jpg" alt="" width="750" height="200" /></a>
            <a href="GoodsInfo.aspx?PhoneId=100000061"><img src="../images/3.jpg" alt="" width="750" height="200" /></a>
            <a href="GoodsInfo.aspx?PhoneId=100000059"><img src="../images/4.jpg" alt="" width="750" height="200" /></a>
            </div>
         </div>
      </div>
      <div class="scroll" id="scroll" style="display:none;">
		回<br/>到<br/>顶<br/>部
	  </div>
      <div id="show">
         <div id="hot">
            <div id="hot_info">热销商品</div>
            <div class="more"><a href="MoreGoods.aspx" style="font-size:15px">more..</a></div>
            <div id="hot_goods">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <div id="" style="text-align:left;float:left;">
            <div style="text-align:left;margin-top:5px;float:left;width:20px;">
            <asp:Button ID="LnkBtnFront" runat="server" Text="&lt;" Height="259px" 
                    Width="20px" onclick="LnkBtnFront_Click"/>
            </div>
            <div style="text-align:left;float:left;width:920px;">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" 
                    RepeatDirection="Horizontal" Height="259px" Width="920px">
                  <ItemTemplate>
                     <table cellpadding="0" cellspacing="0"  style="margin-left:1px;margin-top:5px;font-size:10pt;border:1px solid #ccc;width:180px;text-align:center">
                        <tr><td align="center" valign="middle" colspan="2" style="height:200px"><a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                            <asp:Image ID="imgGoodsPhoto" runat="server" 
                                ImageUrl='<%# Eval("phone_image") %>' Width="105px" Height="198px" 
                                CssClass="imgCss" /></a><!--显示商品图片--></td></tr>
                        <tr><td colspan="2" style="height:10px;text-align:center"><a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>"><%#Eval("phone_name")%></a><!--显示商品名称--></td></tr>
                        <tr><td colspan="2" style="height:10px;text-align:center"><font color="#f00">¥</font><%#Eval("price")%>元<!--显示商品价格--></tr>
                        <tr>
                           <td  style="height:20px;text-align:center">&nbsp;</td>
                           <td  style="text-align:center" class="style1">&nbsp;</td>
                        </tr>
                     </table>
                  </ItemTemplate>
               </asp:DataList>
            </div>
            <div style="text-align:right;margin-top:5px;float:left;width:20px;">
            <asp:Button ID="LnkBtnNext" runat="server" Text="&gt;" Height="259px" 
                    Width="20px" onclick="LnkBtnNext_Click"/>
            </div>

               <div class="page">
               <div style="display:none;margin-left:560px">
                   总共页码为:[<asp:Label 
                       ID="Lbl_Count" runat="server" Text="10"></asp:Label>]
                   当前页码为：[<asp:Label ID="lbl_NowPage" runat="server" Text="1"></asp:Label>]
                   <asp:LinkButton ID="LnkBtnFirst" runat="server" Height="20px" 
                       onclick="LnkBtnFirst_Click" ForeColor="Blue">第一页</asp:LinkButton>
                   <asp:LinkButton ID="LnkBtnlast" runat="server" Height="20px" 
                       onclick="LnkBtnlast_Click" ForeColor="Blue">最后一页</asp:LinkButton>
                </div>
                </div>
            </div>
     </ContentTemplate>
    </asp:UpdatePanel>
            </div>
         </div>
         <div id="advice">
            <div id="advice_info">推荐商品</div>
             <div class="more"><a href="MoreGoods.aspx" style="font-size:15px">more..</a></div>
           <div id="advice_goods">
           <div id="colee_left" style="overflow:hidden;width:960px;">
<table cellpadding="0" cellspacing="0" border="0">
<tr><td id="colee_left1" valign="top" align="center">
<asp:DataList ID="DataList2" runat="server" RepeatColumns="5" 
        RepeatDirection="Horizontal" Width="977px">
                  <ItemTemplate>
                     <table cellpadding="0" cellspacing="0"  style="margin-left:1px;margin-top:5px;font-size:10pt;border:1px solid #ccc;width:190px;text-align:center">
                        <tr><td align="center" valign="middle" colspan="2" style="height:200px"><a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                            <asp:Image ID="imgGoodsPhoto" runat="server" 
                                ImageUrl='<%# Eval("phone_image") %>' Width="105px" Height="198px" 
                                CssClass="imgCss" /></a><!--显示商品图片--></td></tr>
                        <tr><td colspan="2" style="height:10px;text-align:center"><a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>"><%#Eval("phone_name")%></a><!--显示商品名称--></td></tr>
                        <tr><td colspan="2" style="height:10px;text-align:center"><font color="#f00">¥</font><%#Eval("price")%>元<!--显示商品价格--></tr>
                        <tr>
                           <td  style="height:20px;text-align:center"><asp:LinkButton ID="LinkButton1" 
                                   runat="server" style="color:Blue" onclick="LinkButton1_Click1" 
                                   PostBackUrl='<%#"~/public/GoodsInfo.aspx?PhoneId="+Eval("phone_id")%>'>详细信息</asp:LinkButton></td>
                           <td  style="height:20px;text-align:center">
                               <asp:LinkButton ID="lbtnInChart1" 
                                   runat="server" style="color:Blue" onclick="lbtnInChart1_Click" 
                                   CommandArgument='<%# Eval("phone_id") %>'>加入购物车</asp:LinkButton></td>
                        </tr>
                     </table>
                  </ItemTemplate>
               </asp:DataList>
</td>
<td id="colee_left2" valign="top"></td>
</tr>
</table>
</div>
<script type="text/javascript">
    //使用div时，请保证colee_left2与colee_left1是在同一行上.
    var speed = 30//速度数值越大速度越慢
    var colee_left2 = document.getElementById("colee_left2");
    var colee_left1 = document.getElementById("colee_left1");
    var colee_left = document.getElementById("colee_left");
    colee_left2.innerHTML = colee_left1.innerHTML
    function Marquee3() {
        if (colee_left2.offsetWidth - colee_left.scrollLeft <= 0)//offsetWidth 是对象的可见宽度
            colee_left.scrollLeft -= colee_left1.offsetWidth//scrollWidth 是对象的实际内容的宽，不包边线宽度
        else {
            colee_left.scrollLeft++
        }
    }
    var MyMar3 = setInterval(Marquee3, speed)
    colee_left.onmouseover = function () { clearInterval(MyMar3) }
    colee_left.onmouseout = function () { MyMar3 = setInterval(Marquee3, speed) }
</script>
               
                <div class="page">
               <div style="display:none;margin-left:560px">
                   总共页码为:[<asp:Label 
                       ID="Lbl_Count2" runat="server" Text="10"></asp:Label>]
                   当前页码为：[<asp:Label ID="Lbl_NowPage2" runat="server" Text="1"></asp:Label>]
                   <asp:LinkButton ID="LnkBtnFirst2" runat="server" Height="20px" 
                       onclick="LnkBtnFirst2_Click" ForeColor="Blue">第一页</asp:LinkButton>
                   <asp:LinkButton ID="LnkBtnFront2" runat="server" Height="20px" 
                       onclick="LnkBtnFront2_Click" ForeColor="Blue">上一页</asp:LinkButton>
                   <asp:LinkButton ID="LnkBtnNext2" runat="server" Height="20px" 
                       onclick="LnkBtnNext2_Click" ForeColor="Blue">下一页</asp:LinkButton>
                   <asp:LinkButton ID="LnkBtnlast2" runat="server" Height="20px" 
                       onclick="LnkBtnlast2_Click" ForeColor="Blue">最后一页</asp:LinkButton>
                </div>
                </div>
            </div>
         </div>
         <div id="new">
            <div id="new_info">新品上市</div>
            <div class="more"><a href="MoreGoods.aspx" style="font-size:15px">more..</a></div>
            <div id="new_goods">
               <asp:DataList ID="DataList3" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                  <ItemTemplate>
                     <table cellpadding="0" cellspacing="0"  style="margin-left:1px;margin-top:5px;font-size:10pt;border:1px solid #ccc;width:190px;text-align:center">
                        <tr><td align="center" valign="middle" colspan="2" style="height:200px"><a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                            <asp:Image ID="imgGoodsPhoto" runat="server" 
                                ImageUrl='<%# Eval("phone_image") %>' Width="105px" Height="198px" 
                                CssClass="imgCss" /></a><!--显示商品图片--></td></tr>
                        <tr><td colspan="2" style="height:10px;text-align:center"><a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>"><%#Eval("phone_name")%></a><!--显示商品名称--></td></tr>
                        <tr><td colspan="2" style="height:10px;text-align:center"><font color="#f00">¥</font><%#Eval("price")%>元<!--显示商品价格--></tr>
                        <tr>
                           <td  style="height:20px;text-align:center"><asp:LinkButton ID="LinkButton1" 
                                   runat="server" style="color:Blue" onclick="LinkButton1_Click2" 
                                   PostBackUrl='<%#"~/public/GoodsInfo.aspx?PhoneId="+Eval("phone_id")%>' >详细信息</asp:LinkButton></td>
                           <td  style="height:20px;text-align:center">
                               <asp:LinkButton ID="lbtnInChart2" 
                                   runat="server" style="color:Blue" onclick="lbtnInChart2_Click" 
                                   CommandArgument='<%# Eval("phone_id") %>'>加入购物车</asp:LinkButton></td>
                        </tr>
                     </table>
                  </ItemTemplate>
               </asp:DataList>
               <div class="page">
               <div style="display:none;margin-left:560px">
                   总共页码为:[<asp:Label 
                       ID="Lbl_Count3" runat="server" Text="10"></asp:Label>]
                   当前页码为：[<asp:Label ID="Lbl_NowPage3" runat="server" Text="1"></asp:Label>]
                   <asp:LinkButton ID="LnkBtnFirst3" runat="server" Height="20px" 
                       onclick="LnkBtnFirst3_Click" ForeColor="Blue">第一页</asp:LinkButton>
                   <asp:LinkButton ID="LnkBtnFront3" runat="server" Height="20px" 
                       onclick="LnkBtnFront3_Click" ForeColor="Blue">上一页</asp:LinkButton>
                   <asp:LinkButton ID="LnkBtnNext3" runat="server" Height="20px" 
                       onclick="LnkBtnNext3_Click" ForeColor="Blue">下一页</asp:LinkButton>
                   <asp:LinkButton ID="LnkBtnlast3" runat="server" Height="20px" 
                       onclick="LnkBtnlast3_Click" ForeColor="Blue">最后一页</asp:LinkButton>
                </div>
                </div>
               
            </div>
         </div>
      </div>
   </div>
</asp:Content>

