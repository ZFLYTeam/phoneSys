<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="OrderInfo.aspx.cs" Inherits="Buyer_OrderInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
 #content
    {
        margin:0 auto;
        padding:0;
        height:100%;
        width:820px;
        margin-top:15px;
        margin-bottom:15px;
    }
     #info
    {
        height:32px;
        width:820px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:16px;      
    }
     #info1
    {
        height:32px;
        width:820px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:16px; 
    }
       #info2
    {
        height:32px;
        width:820px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:16px;  
    }
         #info3
    {
        height:32px;
        width:820px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:16px;     
    }
      #info4
    {
        height:36px;
        width:820px;
        background-color:#eeeee0;     
        line-height:32px;
        font-family:黑体;
        font-size:20px;  
        margin-top:20px;  
    }
    #cont
    {
        height:600px;
        width:820px;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
<div id="content">
<div id="info">我的订单&lt;&lt;已买到的手机</div>
<div id="info1">交易提醒：<asp:LinkButton ID="lbtnWaitPay" runat="server" 
        ForeColor="Blue" onclick="lbtnWaitPay_Click">待付款</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbtnWaitConfirm" runat="server" ForeColor="Blue" 
        onclick="lbtnWaitConfirm_Click">待确认收货</asp:LinkButton>
&nbsp;
    </div>
    <div id="info2">手机名称:
        <asp:TextBox ID="txtPhoneName" runat="server" Width="174px"></asp:TextBox>
&nbsp;
        <asp:Button ID="btnSearch" runat="server" class="btn btn-success" Text="搜索" onclick="btnSearch_Click" />
    </div>
    <div id="info3">
   <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 手机信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 单价&nbsp;&nbsp; 数量&nbsp; 售后&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;实付款（元）&nbsp;交易状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        操作--%>
 <div style="text-align:left;float:left;height:32px; width: 100px;"></div>
 <div style="text-align:left;float:left;height:32px; width: 215px;">手机信息</div>
 <div style="text-align:left;float:left;height:32px; width: 62px;">单价</div>
 <div style="text-align:left;float:left;height:32px; width: 70px;">数量</div>
 <div style="text-align:left;float:left;height:32px; width: 80px;">售后</div>
 <div style="text-align:left;float:left;height:32px; width: 83px;">总价</div>
 <div style="text-align:left;float:left;height:32px; width: 120px;">交易状态</div>
 <div style="text-align:left;float:left;height:32px; width: 60px;">操作</div>
        </div>
<div id="cont">
<div style="text-align:left;float:left;height:70px; width: 860px;">   
    <div style="text-align:left;float:left;height:70px; width: 110px;">
    <asp:Image ID="imgTubiao" runat="server" ImageUrl="~/images/tubiao.jpg" 
        Height="70px" Width="65px" /></div>
        <div style="text-align:left;float:left;height:70px; width: 170px;">
        <asp:Label  ID="lblShowMassage" runat="server" Font-Size="Large" ></asp:Label></div>
</div>
 <div style="text-align:left;float:left; width: 860px;">
    <asp:GridView ID="gvOrderInfo" runat="server" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        CellSpacing="2" Width="815px" AllowPaging="True" 
        onpageindexchanging="gvOrderInfo_PageIndexChanging" PageSize="3"  >
        <Columns>
        
            <asp:TemplateField>
                <ItemTemplate>
                <div style="text-align:left;float:left;height:155px;width:810px; border-bottom-width:5px; border-bottom-color:Purple;">
                <div style="text-align:left;float:left;height:35px; width: 810px;">
                    <asp:CheckBox ID="chbSelect" runat="server" />
                    <asp:Label ID="lblShow" runat="server" Text="订单编号:"></asp:Label>
                    <asp:Label ID="lblOrderID" runat="server"  
                        Text='<%# Bind("orderID","{0}") %>'></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="lblShowTime" runat="server" Text="成交时间:"></asp:Label>
             <asp:Label ID="lblTime" runat="server" Text='<%# Bind("ordercreatetime","{0}") %>'></asp:Label>
             &nbsp;&nbsp;&nbsp;&nbsp;店铺：
             <asp:LinkButton ID="lbtnSellerName" runat="server" 
                        Text='<%# Bind("shop_name","{0}") %>'  ForeColor="Blue" 
                        CommandArgument='<%# Eval("shop_id") %>' onclick="lbtnSellerName_Click"></asp:LinkButton>
             </div>
              <div style="text-align:left;float:left;height:10px; width: 810px;"></div>
             <div style="text-align:left;float:left;height:100px;width:810px; border-bottom-width:5px; border-bottom-color:Purple;">
              <div style="text-align:left;float:left;height:100px; width:10px;"></div>
            <div style="text-align:left;float:left;height:100px; width:100px;">
            <div style="text-align:left;float:left;height:5px; width:100px;"></div>
             <asp:ImageButton ID="ibtnPhone" runat="server" 
                      CommandArgument='<%# Eval("phone_id") %>' 
                    ImageUrl='<%# Eval("phone_image") %>' onclick="ibtnPhone_Click" Height="80px" Width="60px"/>
            </div> 
<div style="text-align:left;float:left;height:100px; width:200px;">
<div style="text-align:left;float:left;height:15px; width:200px;"></div>
<div><asp:LinkButton ID="lbtnPhoneName" runat="server" 
                       CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>'  
                            onclick="lbtnPhoneName_Click" ForeColor="Blue" ></asp:LinkButton></div>
<div> <asp:Label ID="lblPhone1" runat="server" Text='<%# Bind("screensize","{0}") %>'></asp:Label>  
<asp:Label ID="lblPhone2" runat="server" Text='<%# Bind("phone_type","{0}") %>'></asp:Label>
<div><asp:Label ID="lblPhone3" runat="server" Text='<%# Bind("pixel","{0}") %>'></asp:Label>
<asp:Label ID="Label2" runat="server" Text="万像素"></asp:Label></div></div>
</div>

<div style="text-align:left;float:left;height:100px; width:70px;">
<div style="text-align:left;float:left;height:15px; width:70px;"></div>
<asp:Label ID="lblPrice" runat="server"  
                        Text='<%# Bind("price","{0}") %>'></asp:Label></div>
<div style="text-align:left;float:left;height:100px; width:50px;">
<div style="text-align:left;float:left;height:15px; width:50px;"></div>
<asp:Label ID="lblQuantity" runat="server"  
                        Text='<%# Bind("buy_quantity","{0}") %>'></asp:Label></div>
<div style="text-align:left;float:left;height:100px; width:100px;">
<div style="text-align:left;float:left;height:15px; width:100px;"></div>
<div><asp:LinkButton ID="lbtnComplaint" runat="server"  CommandArgument='<%# Eval("orderid") %>' Text="我要投诉" onclick="lbtnComplaint_Click" ForeColor="Blue" /></div></div>
<div style="text-align:left;float:left;height:100px; width:70px;">
<div style="text-align:left;float:left;height:15px; width:70px;"></div>
<asp:Label ID="lblTotalPrice" runat="server" ForeColor="Blue" ></asp:Label></div>
<div style="text-align:left;float:left;height:100px; width:110px;">
<div style="text-align:left;float:left;height:15px; width:110px;"></div>
<div><asp:Label ID="lblOrderState" runat="server" Text='<%# Bind("meaning","{0}") %>' ForeColor="Blue"></asp:Label></div>
<div><asp:LinkButton  ID="lbtnDetail" runat="server"
                             
                          onclick="lbtnDetail_Click"  Text="订单详情" ForeColor="Blue" 
        CommandArgument='<%# Eval("orderid") %>' /></div>
        <div><asp:Label  ID="lblEvaluated" runat="server"  Text="我已评价" ForeColor="Blue"  /></div>
     
</div>
<div style="text-align:left;float:left;height:100px; width:80px;">
<div style="text-align:left;float:left;height:15px; width:80px;"></div>
<div>
    <asp:LinkButton ID="lbtnPay" runat="server"  
        CommandArgument='<%# Eval("orderid") %>'  onclick="lbtnPay_Click" Text="付款" 
        ForeColor="#FF3300" /></div>
<div><asp:LinkButton ID="lbtnCancel" runat="server"  
        CommandArgument='<%# Eval("orderid") %>' onclick="lbtnCancel_Click" Text="取消订单" 
        ForeColor="#FF3300" /></div>
<div>
    <asp:LinkButton ID="lbtnConfirm" runat="server"  
        CommandArgument='<%# Eval("orderid") %>' onclick="lbtnConfirm_Click" 
        Text="确认收货" ForeColor="#FF3300" /></div>
  <div>
      <asp:LinkButton  ID="lbtnGoToEvaluate" runat="server" 
          onclick="lbtnGoToEvaluate_Click"  Text="现在评价" ForeColor="Red" 
        CommandArgument='<%# Eval("orderid") %>' /></div>
<div>
    <asp:LinkButton ID="lbtnAddEvaluation" runat="server"  
        CommandArgument='<%# Eval("orderid") %>' onclick="lbtnAddEvaluation_Click" 
        Text="追加评价" ForeColor="Red" /></div>
</div>
            </div>
                </ItemTemplate>
                <ItemStyle Width="40px" />
            </asp:TemplateField>
          
   
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle  ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle  />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>

  </div> 
    </div>
   <div id="info4">热卖商品</div>
<div style="text-align:left;float:left;height:10px; width:860px;"></div>
      <asp:DataList ID="DataList1" runat="server" 
            RepeatDirection="Horizontal" onitemcommand="DataList1_ItemCommand" 
                onitemdatabound="DataList1_ItemDataBound" BorderColor="Yellow" >
               <FooterTemplate>
               <div style="text-align:center; margin-top:20px">
                   <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                   <asp:Label ID="lblCount" runat="server"></asp:Label>
                   <div class="btn-group">
                   <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first" CssClass="btn btn-primary">首页</asp:LinkButton>
                   <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn btn-primary">上一页</asp:LinkButton>
                   <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn btn-primary">下一页</asp:LinkButton>
                   <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn btn-primary">尾页</asp:LinkButton>
                   </div>
                   <asp:Label ID="lblSkip" runat="server">跳转至</asp:Label>
                   <asp:TextBox ID="txtSkip" runat="server" Height="16px" Width="30px"></asp:TextBox>
                   <asp:Button ID="btnSkip" runat="server" CommandName="search" CssClass="btn btn-danger" Text="Go" />
                   </div>
               </FooterTemplate>
               <ItemTemplate>
               <div style="text-align:center;float:left;height:100px; width:150px;">
                <asp:ImageButton ID="ibtnHotPhone" runat="server" 
                    CommandArgument='<%# Eval("phone_id") %>' 
                    ImageUrl='<%# Eval("phone_image") %>'  
                       Height="100px" Width="80px" onclick="ibtnHotPhone_Click"/>
 
                   </div>
                   <br />
                   &nbsp;&nbsp;
              
                    <div style="text-align:center;float:left;height:40px; width:150px;">
                
                   <asp:LinkButton ID="lbtnHotPName" runat="server" 
                       CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>'  
                            onclick="lbtnHotPName_Click" ForeColor="Blue" Font-Names="宋体" Font-Size="Medium"></asp:LinkButton>
                            <div style="text-align:left;float:left;height:30px; width:20px;"></div>
                            </div>
               </ItemTemplate>
           </asp:DataList>

  <div style="text-align:left;float:left;height:20px; width:860px;"></div>
</div>
</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

