<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="Buyer_ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
 #content
    {
        margin:0 auto;
        padding:0;
        min-height:200px;
        _height:200px;
        width:960px;
        border:3px solid #eeeee0;
        margin-top:15px;
        margin-bottom:15px;
    }
    .step
    {
        height:32px;
        width:960px;
        overflow:hidden;
        float:left;
        clear:right;
    }
        #info
    {
        height:32px;
        width:960px;
        float:left;
        clear:right;
        line-height:32px;
        font-family:黑体;
        font-size:16px;
        color:#333;
               
    }
           #info2
    {
        height:32px;
        width:960px;
        background-color:#eeeee0;
        float:left;
        clear:right;
        line-height:32px;
        font-family:黑体;
        font-size:16px;
        color:#333;
               
    }
            #info3
    {
        height:32px;
        width:960px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:16px;
        color:#333;
        float:left;
        clear:right;       
    }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <%--  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
<div id="content">
<div class="step"><img src="../images/cart.gif" alt=""/></div>
<div id="info">全部商品&nbsp;&nbsp; | &nbsp;购物车商品总数：<asp:Label ID="lblTotalNumber" runat="server" ForeColor="Blue" ></asp:Label></div>
<div style="text-align:left;float:left;height:10px; width:960px;"></div>
<asp:Panel ID="Panel1" runat="server">
<div style="text-align:left;float:left;height:5px; width:960px;background-color:#CC9900;border:1px solid #CC9900"></div>

<div style="text-align:left;float:left;height:32px; width:960px;background-color:#eeeee0;font-family:黑体;font-size:16px; color:#333;line-height:32px;border:1px solid #CC9900">
<div style="text-align:left;float:left;height:32px; width:110px;"><asp:CheckBox ID="chbAllSelect" runat="server" Text="全选" 
        oncheckedchanged="chbAllSelect_CheckedChanged" AutoPostBack="True" />  </div> 
<div style="text-align:left;float:left;height:32px; width:130px;">手机  </div> 
<div style="text-align:left;float:left;height:32px; width:40px;">  </div> 
<div style="text-align:left;float:left;height:32px; width:120px;"> 手机信息 </div> 
<div style="text-align:left;float:left;height:32px; width:20px;">  </div> 
<div style="text-align:left;float:left;height:32px; width:45px;">单价  </div> 
<div style="text-align:left;float:left;height:32px; width:70px;">  </div> 
<div style="text-align:left;float:left;height:32px; width:60px;"> 数量 </div> 
<div style="text-align:left;float:left;height:32px; width:36px;">  </div> 
<div style="text-align:left;float:left;height:32px; width:120px;">小计  </div> 
<div style="text-align:left;float:left;height:32px; width:40px;">操作  </div> 
</div>
 </asp:Panel>
<div style="text-align:left;float:left;height:20px; width:960px;">
    
 <asp:Label ID="lblMsg" runat="server" Text="您的购物车里还没有商品，"  ></asp:Label>
<asp:LinkButton ID="lbtnGo" runat="server" Text="去看看" ForeColor="Blue" 
        onclick="lbtnGo_Click"  ></asp:LinkButton></div> 
       
    <asp:DataList ID="dlCartShop" runat="server" DataKeyField="shop_id" 
        onitemdatabound="dlCartShop_ItemDataBound" DataSourceID="SqlDataSource1">
     
        <ItemTemplate>
            <asp:CheckBox ID="chbSelectShop" runat="server" AutoPostBack="True" 
                oncheckedchanged="chbSelectShop_CheckedChanged" />
            店铺:<asp:LinkButton ID="lbtnShopName" runat="server" 
                CommandArgument='<%# Eval("shop_id") %>' Text='<%# Eval("shop_name") %>' 
                onclick="lbtnShopName_Click"></asp:LinkButton>
                <asp:Label ID="lblShopID" runat="server" Text='<%# Eval("shop_id") %>' 
                Visible="False" ></asp:Label>
            <br />
            <asp:DataList ID="dlCartPhone" runat="server" BackColor="White" 
                BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
                CellSpacing="1" >
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
                <ItemTemplate>
                <div style="text-align:left;float:left;height:135px;width:950px; border-bottom-width:5px;border:1px solid #ff9900; "><%--border-bottom-color:Purple;--%>
                <div style="text-align:left;float:left;height:116px;width:950px; ">
                  <div style="text-align:left;float:left;height:116px; width:10px;"> </div>  
                  <div style="text-align:left;float:left;height:116px; width:20px;">
                  <div style="text-align:left;float:left;height:50px; width:20px;"></div>
                  <div><asp:CheckBox ID="chbSelectPhone" runat="server" AutoPostBack="True" oncheckedchanged="chbSelectPhone_CheckedChanged" /></div>
                  </div>
                  <div style="text-align:left;float:left;height:116px; width:10px;"></div>
                  <div style="text-align:left;float:left;height:116px; width:100px;"> 
                      <asp:ImageButton ID="ibtnPhone" CommandArgument='<%# Eval("phoneid") %>' ImageUrl='<%# Eval("phone_image") %>' 
                          Height="110px" Width="80px"   runat="server" onclick="ibtnPhone_Click" /></div>
 <div style="text-align:left;float:left;height:116px; width:10px;"></div>
                  <div style="text-align:left;float:left;height:120px; width:100px;"><br />
                    <asp:LinkButton ID="lbtnPhoneName" runat="server" ForeColor="Blue"
                          CommandArgument='<%# Eval("phoneid") %>' Text='<%# Eval("phone_name") %>' 
                          onclick="lbtnPhoneName_Click"></asp:LinkButton></div>
                    <div style="text-align:left;float:left;height:116px; width:180px;">
                    <div style="text-align:left;float:left;height:10px; width:180px;"></div>
                   <div> 颜色：<asp:Label ID="lblColor" runat="server" Text='<%# Eval("color") %>' ></asp:Label>
                        </div>
                    <div>    操作系统：<asp:Label ID="lblOs" runat="server" Text='<%# Eval("os") %>'></asp:Label>
                        
                        </div>
                       <div> 像素：<asp:Label ID="lblPixel" runat="server" Text='<%# Eval("pixel") %>'></asp:Label>
                        万像素
                        </div>
                      <div>  屏幕尺寸：<asp:Label ID="lblSize" runat="server" Text='<%# Eval("screensize") %>'></asp:Label>
                        </div>                                                                 
                        </div>
                    <div style="text-align:left;float:left;height:116px; width:80px;">
                    <div style="text-align:left;float:left;height:40px; width:80px;"></div>
                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>' ></asp:Label></div>
                    <div style="text-align:left;float:left;height:116px; width:120px;">
                    <div style="text-align:left;float:left;height:40px; width:120px;"></div>
                    <div><%--<asp:Button ID="btnSub" runat="server" Text="-" CommandArgument='<%# Eval("card_id") %>' onclick="btnSub_Click" Width="20px" height="20px" />--%>
                        <asp:LinkButton ID="lbtnSub" runat="server" onclick="lbtnSub_Click" CommandArgument='<%# Eval("card_id") %>' >-</asp:LinkButton>
                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("buy_quantity") %>' 
                            Width="20px" height="20px" Enabled="False"></asp:TextBox>
                       <%-- <asp:Button ID="btnAdd" runat="server" Text="+" onclick="btnAdd_Click" />--%>
                      
                        <asp:LinkButton
                            ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click" CommandArgument='<%# Eval("card_id") %>' >+</asp:LinkButton>

                    <%--<asp:Button ID="btnAdd" runat="server" Text="+" CommandArgument='<%# Eval("card_id") %>' onclick="btnAdd_Click" Width="20px" height="20px" />--%></div>
                    <div><asp:Label ID="lblStroeQuantity" runat="server" Visible="False" Text='<%# Eval("store_quantity") %>'></asp:Label></div>
                    </div>
                    <div style="text-align:left;float:left;height:116px; width:90px;">
                    <div style="text-align:left;float:left;height:40px; width:90px;"></div>
                    <asp:Label ID="lblTotalPrice" Text='<%# Eval("amount") %>' runat="server"  ></asp:Label></div>
                    <div style="text-align:left;float:left;height:116px; width:110px;">
                    <div style="text-align:left;float:left;height:30px; width:110px;"></div>
                    <div><asp:LinkButton ID="lbtnRemove" runat="server" 
                          CommandArgument='<%# Eval("card_id") %>' Text="移入收藏夹"  ForeColor="Blue"
                            onclick="lbtnRemove_Click"></asp:LinkButton> </div>                       
                     <div>
                        <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="Blue"
                            CommandArgument='<%# Eval("card_id") %>' onclick="lbtnDelete_Click" Text="删除"></asp:LinkButton>
                        
                       </div>
                    </div>
                    </div>
                    <div style="text-align:left;float:left;height:10px;width:950px;  ">
                    <asp:Label ID="lblCartId" runat="server" Text='<%# Eval("card_id") %>' Visible="False" ></asp:Label>
                    <asp:Label ID="lblPhoneId" runat="server" Text='<%# Eval("phoneid") %>' Visible="False" ></asp:Label>
                    </div>
</div>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
   <br />  
        </ItemTemplate>
    </asp:DataList>
    <br />
<asp:Panel ID="Panel2" runat="server">
  
<div id="info3">
<div style="text-align:left;float:left;height:32px; width:70px;"></div>

<div style="text-align:left;float:left;height:32px; width:60px;">
<asp:LinkButton ID="lbtnAllDelete" runat="server"  onclick="lbtnAllDelete_Click" ForeColor="Blue" Text="删除"></asp:LinkButton></div>
<div style="text-align:left;float:left;height:32px; width:90px;">
<asp:LinkButton ID="lbtnAllRemove" runat="server" Text="移入收藏夹"  ForeColor="Blue" onclick="lbtnAllRemove_Click"></asp:LinkButton></div> 
    <div style="text-align:right;float:right;height:32px; width:90px;  border:1px solid #ff9900;">
        <asp:LinkButton ID="lbtnSettlement" runat="server" Height="32px" Width="90px" 
            Font-Size="X-Large" onclick="lbtnSettlement_Click" 
            CommandArgument="Eval(&quot;cart_id&quot;)">结算</asp:LinkButton>
    </div>
      <div style="text-align:right;float:right;height:32px; width:200px; border:1px solid #ff9900;">合计（免运费）：<asp:Label 
              ID="lblTotal" runat="server" ForeColor="Red" ></asp:Label> 元
    </div>
<div style="text-align:right;float:right;height:32px; width:160px;border:1px solid #ff9900;">已选商品<asp:Label 
        ID="lblSelected" runat="server" ForeColor="Red" ></asp:Label>件 </div>
</div>

  </asp:Panel>
  <br />
  <br />
    <asp:Panel ID="Panel3" runat="server">
    <asp:ImageButton ID="ImageButton1" runat="server" 
        onclick="ibtnContinue_Click" Visible="False" />
</asp:Panel>



<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        
        SelectCommand="SELECT DISTINCT [shop_id], [shop_name] FROM [V_ShopCart] WHERE ([buyer] = @buyer)">
        <SelectParameters>
            <asp:SessionParameter Name="buyer" SessionField="buyerID" Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>                               

    </div>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

