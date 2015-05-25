<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="SubmitOrder.aspx.cs" Inherits="Buyer_SubmitOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/cart_info.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 91px;
        }
        .choose
        {
            height:25px;
            width:840px;
        }
        .order_bottom
        {
            width:360px;
            height:69px;
            margin-left:480px;
            clear:right;
            border:2px solid #ff0000;
            text-align:right;
        }
         .order_button
        {
            width:300px;
            height:35px;
            clear:right;
            margin-left:540px;
            text-align:right;
            margin-bottom:0px;
        }
        .style4
        {
            height: 22px;
            text-align: right;
        }
        .style5
        {
            text-align: right;
        }
        .style8
        {
            width: 175px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div id="contanier">
      <div id="cart_info_step">
         <img src="../images/cart_info.gif" alt=""/>
      </div>
 <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>--%>
      <div id="address">
         <div id="address_left">
            <br />
            <h4>收货地址</h4>
         </div>
         <div id="address_right">
            <table cellpadding="2px" cellspacing="0">
            <tr><td class="td3">寄送至:&nbsp;<asp:Label ID="lblAddr" runat="server"></asp:Label>
                <asp:Button ID="btnNewAddr" runat="server" Text="使用新地址" BorderStyle="None" 
                    Font-Underline="True" ForeColor="#0033CC" Width="84px" 
                    onclick="btnNewAddr_Click" BackColor="White" />
                </td></tr>
               <tr><td class="td1">
                   <asp:Label ID="lblStreet" runat="server" Text="街道地址："></asp:Label>
                   </td><td class="td2">
                   <asp:TextBox ID="txtStreet" runat="server" Width="250px" Height="23px"></asp:TextBox></td></tr>
               <tr><td class="td1">
                   <asp:Label ID="lblCode" runat="server" Text="邮政编码："></asp:Label>
                   </td><td class="td2">
                   <asp:TextBox ID="txtCode" runat="server" Width="100px" Height="23px"></asp:TextBox>
                   </td></tr>
               <tr><td class="td1">
                   <asp:Label ID="lblRevName" runat="server" Text="收货人："></asp:Label>
                   </td><td class="td2">
                   <asp:TextBox ID="txtRevName" runat="server" Width="100px" Height="23px"></asp:TextBox>
                   </td></tr>
               <tr><td class="td1">
                   <asp:Label ID="lblTelPhone" runat="server" Text="联系电话："></asp:Label>
                   </td><td class="td2">
                   <asp:TextBox ID="txtTelPhone" runat="server" Width="132px" Height="23px"></asp:TextBox>
                   </td></tr>
               
               <tr><td class="td1"></td><td class="td2">
                   <asp:Button ID="btnAddress" runat="server" Text="确认收货地址" BackColor="#006600" 
                       ForeColor="White" Width="100px" Height="30px" BorderColor="#006600" 
                       BorderStyle="Solid" onclick="btnAddress_Click" />
                   &nbsp;&nbsp;
                   <asp:Button ID="btnCancel" runat="server" BackColor="#006600" 
                       BorderColor="#006600" BorderStyle="None" ForeColor="White" Height="28px" 
                       onclick="btnCancel_Click" Text="取消" Width="80px" />
                   </td></tr>
            </table>
         </div>
      </div>
      <div id="over">
         <div id="over_left">
            <br />
            <h4>确认订单</h4><br />   
         </div>
         <div id="over_right">
         <div class="choose">
             <asp:Label ID="Label11" runat="server" Font-Size="Medium" Height="25px" 
                 Text="选择订单："></asp:Label>
             <asp:DropDownList ID="ddlSelectId" runat="server" Height="25px" Width="180px" 
                 AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="phone_name" 
                 DataValueField="phone_id" 
                 onselectedindexchanged="ddlSelectId_SelectedIndexChanged">
             </asp:DropDownList>
             </div>
             <asp:DataList ID="dlOrder" runat="server" Height="297px" RepeatColumns="1" 
                 RepeatDirection="Horizontal">
                 <ItemTemplate>
                     <table class="style1">
                         <tr>
                             <td colspan="2" 
                                 style="border-bottom: medium solid #33CCCC; text-align: center; border-top-style: solid; border-bottom-style: solid; border-top-width: medium; border-bottom-width: medium; border-top-color: #33CCCC; border-bottom-color: #33CCCC;">
                                 店铺宝贝</td>
                             <td 
                                 
                                 style="border-bottom: medium solid #33CCCC; text-align: center; border-top-style: solid; border-bottom-style: solid; border-top-width: medium; border-bottom-width: medium; border-top-color: #33CCCC; border-bottom-color: #33CCCC;">
                                 单价（元）</td>
                             <td 
                                 
                                 style="border-bottom: medium solid #33CCCC; text-align: center; border-top-style: solid; border-bottom-style: solid; border-top-width: medium; border-bottom-width: medium; border-top-color: #33CCCC; border-bottom-color: #33CCCC;">
                                 数量</td>
                             <td 
                                 
                                 style="border-bottom: medium solid #33CCCC; text-align: center; border-top-style: solid; border-bottom-style: solid; border-top-width: medium; border-bottom-width: medium; border-top-color: #33CCCC; border-bottom-color: #33CCCC;">
                                 小计（元）</td>
                         </tr>
                         <tr>
                             <td colspan="2">
                                 <asp:Label ID="Label1" runat="server" Text="店铺："></asp:Label>
                                 <asp:LinkButton ID="lbtnSName" runat="server" 
                                     CommandArgument='<%# Eval("shop_id") %>' ForeColor="#0033CC" 
                                     onclick="lbtnSName_Click" Text='<%# Eval("shop_name") %>'></asp:LinkButton>
                             </td>
                             <td style="border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0; border-left-style: solid; border-left-width: thin; border-left-color: #C0C0C0;">
                                 &nbsp;</td>
                             <td style="border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0">
                                 &nbsp;</td>
                             <td>
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td class="style2" rowspan="2" 
                                 style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0">
                                 &nbsp;<asp:ImageButton ID="imgbtnPhoto" runat="server" 
                                     CommandArgument='<%# Eval("phone_id") %>' Height="100px" 
                                     ImageUrl='<%# Eval("phone_image") %>' Width="70px" />
                             </td>
                             <td class="style8">
                                 <asp:LinkButton ID="lbtnPName" runat="server" 
                                     CommandArgument='<%# Eval("phone_id") %>' ForeColor="#0033CC" 
                                     Text='<%# Eval("phone_name") %>' onclick="lbtnPName_Click"></asp:LinkButton>
                             </td>
                             <td rowspan="2" 
                                 style="border-left: thin solid #C0C0C0; border-right: thin solid #C0C0C0; border-bottom: thin solid #C0C0C0; text-align: center;">
                                 <asp:Label ID="lblPerPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                             </td>
                             <td rowspan="2" 
                                 style="border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; text-align: center;">
                                 <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("buy_quantity") %>'></asp:Label>
                             </td>
                             <td rowspan="2" 
                                 style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; text-align: center;">
                                 <asp:Label ID="lblPrice" runat="server" Font-Bold="True" ForeColor="Red" 
                                     Text='<%# Eval("amount") %>'></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="style8" 
                                 style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0">
                                 <asp:Label ID="lblProperity" runat="server"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="style4" colspan="5" 
                                 style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0">
                                 <asp:Label ID="Label5" runat="server" Text="运送方式:   快递  免邮"></asp:Label>
                                 &nbsp;
                                 <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" 
                                     Text="0.00    "></asp:Label>
                                 &nbsp;&nbsp; &nbsp;
                             </td>
                         </tr>
                         <tr>
                             <td class="style5" colspan="5" 
                                 style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0">
                                 &nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label7" runat="server" Text="店铺合计(含运费,服务费):"></asp:Label>
                                 <asp:Label ID="lblAllPrice" runat="server" Font-Bold="True" ForeColor="Red" 
                                     Text='<%# "¥"+Eval("amount") %>'></asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                             </td>
                         </tr>
                     </table>
                 </ItemTemplate>
             </asp:DataList> 
             <div class="order_bottom">
                 <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="实付款："></asp:Label>
                 <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="X-Large" 
                     ForeColor="Red"></asp:Label>
                 &nbsp;<br />
                 <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="地址："></asp:Label>
                 <asp:Label ID="lblRevAddr" runat="server" Font-Size="Medium"></asp:Label>
                 <br />
                 <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="收货人："></asp:Label>
                 <asp:Label ID="lblRevInfo" runat="server" Font-Size="Medium"></asp:Label>
             </div>
             <div class="order_button">
                 &nbsp;&nbsp;&nbsp;
                 <asp:ImageButton ID="imgbtnReChart" runat="server" 
                     ImageUrl="~/images/ReturnChart.jpg" onclick="imgbtnReChart_Click" />
                 &nbsp;<asp:ImageButton ID="imgbtnSubmit" runat="server" 
                     ImageUrl="~/images/SubmitOrder.jpg" onclick="imgbtnSubmit_Click1" />
                 &nbsp;
             </div>
         </div>
      
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:PHONESYSConnectionString %>" 
              
              SelectCommand="SELECT DISTINCT [phone_id], [phone_name] FROM [View_ChartDetail] WHERE (([buyer] = @buyer) AND ([state] = @state))">
              <SelectParameters>
                  <asp:SessionParameter Name="buyer" SessionField="BuyerId" Type="Object" />
                  <asp:SessionParameter Name="state" SessionField="State" Type="String" />
              </SelectParameters>
          </asp:SqlDataSource>
      
     <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
   </div>   
    </div>
</asp:Content>

