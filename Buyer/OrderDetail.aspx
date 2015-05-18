<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Buyer_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
 #content
    {
        margin:0 auto;
        padding:0;
        height:100%;
        width:860px;
        border:1px solid #ff9900;
        margin-top:15px;
        margin-bottom:15px;
    }
     #info
    {
        height:32px;
        width:860px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:20px;
        color:#333;
               
    }
     #info1
    {
        height:32px;
        width:860px;
       
        line-height:32px;
      
        color:#333;
               
    }
       #info2
    {
        height:96px;
        width:860px;
    
        line-height:32px;
        font-family:黑体;
        font-size:16px;
        color:#333;
        border:1px solid #ff9900;       
    }
         #info3
    {
        height:96px;
        width:860px;
        line-height:32px;
        font-family:黑体;
        font-size:16px;
        color:#333;
         border:1px solid #ff9900;      
    }
    #cont
    {
        height:262px;
        width:860px;
         border:1px solid #ff9900; 
    }
        #info4
    {
        margin-top:15px;
        height:32px;
        width:860px;
           background-color:#eeeee0;    
        line-height:32px;
        font-family:黑体;
        font-size:20px;
        color:#333;
                 
    }
      #info5
    {
        height:64px;
        width:860px;
       
        line-height:32px;
      
        color:#333;
               
    }
 #cont1
    {
        height:200px;
        width:860px;
    } 
    
    .style2
    {
        font-size: large;
    }
    
  
    
    .style3
    {
        font-size: x-large;
    }
    .style4
    {
        font-family: 宋体, Arial, Helvetica, sans-serif;
    }
    
  
    
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

<div id="content">
<div id="info">您的位置&lt;&lt;我的淘宝&lt;&lt;订单详情</div>
<div id="info1"> 
        <span class="style2"> 
        <strong>当前订单状态：
        <asp:Label ID="lblOrderState" runat="server" ForeColor="Blue"></asp:Label></strong></span><br /> </div>
        <div id="info5">
       &nbsp;&nbsp;&nbsp; <asp:Label ID="lblMsg1" runat="server" Text=""></asp:Label> 
        <asp:LinkButton ID="lbtnConfirm" runat="server" onclick="lbtnConfirm_Click" Text="确认收货" ForeColor="Blue" />
        &nbsp;<asp:LinkButton ID="lbtnPay" runat="server"  
            Text="付款" ForeColor="Blue" onclick="lbtnPay_Click" />
        <br />&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMsg2" runat="server" Text=""></asp:Label> 
    </div>
  <div id="cont" >&nbsp;&nbsp; <span class="style3">
     
&nbsp;&nbsp; 订单详情 
      <br />
      </span>
  <br />
      <span class="style4"><strong>收货地址： </strong> </span> <strong> <asp:Label ID="lblAddress" runat="server" 
          Text="" CssClass="style4"></asp:Label>
      </strong>
      <br />
      <div id="info3">
      卖家信息<br />
      &nbsp;
      用户名：<asp:Label ID="lblUserName" runat="server" ></asp:Label>
      &nbsp;&nbsp;
      真实姓名：<asp:Label ID="lblRealName" runat="server" ></asp:Label>
      <br />
      &nbsp;
      联系电话：
   
      <asp:Label ID="lblTelPhone" runat="server" ></asp:Label>
   
      </div>
      <div id ="info2">
      订单信息<br />
      &nbsp;
      订单编号：<asp:Label ID="lblOrderID" runat="server" ></asp:Label>
      &nbsp;
      成交时间：<asp:Label ID="lblTime" runat="server" ></asp:Label>
      <br />
      &nbsp; <asp:Label ID="lblSendTime" runat="server" ></asp:Label>
          &nbsp;<asp:Label ID="lblReceiveTime" runat="server" ></asp:Label>
          <br />
          <asp:SqlDataSource ID="sdsOrderInfo" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
              SelectCommand="SELECT * FROM [View1] WHERE ([orderId] = @orderId)">
              <SelectParameters>
                  <asp:SessionParameter Name="orderId" SessionField="orderID" Type="Int64" />
              </SelectParameters>
          </asp:SqlDataSource>
           </div>
    </div>   
    <asp:GridView ID="gvOrderInfo" runat="server" AutoGenerateColumns="False"
          BackColor="#DEBA84" 
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        CellSpacing="2" Width="800px" PageSize="1"  >
        <Columns>
        
         <asp:TemplateField HeaderText="手机">
                <ItemTemplate>              
            <div style="text-align:center;float:left;height:90px; width:190px;">                     
                <asp:ImageButton ID="ibtnPhone" runat="server" 
                    CommandArgument='<%# Eval("phone_id") %>' 
                    ImageUrl='<%# Eval("phone_image") %>'  
                    height="90px" Width="70px" onclick="ibtnPhone_Click" />
                    </div> 
<div style="text-align:center;float:left;height:25px; width:190px;">
<div> 
    <asp:LinkButton ID="lbtnPhoneName" runat="server" 
                       CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>'  
                             ForeColor="Blue" onclick="lbtnPhoneName_Click" ></asp:LinkButton></div>
                             </div>
 </ItemTemplate>
 <ItemStyle Width="190px" />
 </asp:TemplateField>

<asp:TemplateField HeaderText="属性">
 <ItemTemplate>  
 <div style="text-align:center;float:left;height:115px; width:190px;"> 
 <div style="text-align:center;float:left;height:10px; width:190px;"> </div>
<div style="text-align:center;float:left;height:30px; width:190px;"> <asp:Label ID="lblPhone1" runat="server" Text='<%# Bind("screensize","{0}") %>'></asp:Label> </div> 
<div style="text-align:center;float:left;height:30px; width:190px;"><asp:Label ID="lblPhone2" runat="server" Text='<%# Bind("phone_type","{0}") %>'></asp:Label></div>
<div style="text-align:center;float:left;height:30px; width:190px;"><asp:Label ID="lblPhone3" runat="server" Text='<%# Bind("pixel","{0}") %>'></asp:Label>
<asp:Label ID="Label2" runat="server" Text="万像素"></asp:Label></div>
</div>

 </ItemTemplate>
 <ItemStyle Width="190px" />
 </asp:TemplateField>

 <asp:TemplateField HeaderText="单价">
 <ItemTemplate> 
 <div style="text-align:center;float:left;height:115px; width:80px;">
 <div style="text-align:center;float:left;height:30px; width:80px;"></div> 
<div style="text-align:center;float:left;height:30px; width:80px;"><asp:Label ID="lblPrice" runat="server"  Text='<%# Bind("price","{0}") %>'></asp:Label></div>
<%--<div style="text-align:center;float:left;height:40px; width:70px;"> </div>--%>
</div>
</ItemTemplate>
 <ItemStyle Width="80px" />
 </asp:TemplateField>

 <asp:TemplateField HeaderText="数量">
 <ItemTemplate> 
  <div style="text-align:center;float:left;height:115px; width:70px;">
 <div style="text-align:center;float:left;height:30px; width:70px;"> </div>
<div style="text-align:center;float:left;height:30px; width:70px;"><asp:Label ID="lblQuantity" runat="server"  Text='<%# Bind("buy_quantity","{0}") %>'></asp:Label></div>
<%--<div style="text-align:center;float:left;height:40px; width:60px;"> </div>--%>
</div>
</ItemTemplate>
 <ItemStyle Width="70px" />
</asp:TemplateField>

<asp:TemplateField HeaderText="订单状态" >
 <ItemTemplate> 
  <div style="text-align:center;float:left;height:115px; width:100px;">
 <div style="text-align:center;float:left;height:30px; width:100px;"></div> 
  <div style="text-align:center;float:left;height:30px; width:100px;"> <asp:Label ID="lblOrderState" runat="server" Text='<%# Bind("meaning","{0}") %>' ></asp:Label>    
   </div>   
   </div>
  </ItemTemplate>
 <ItemStyle Width="100px"  />
</asp:TemplateField> 
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" Font-Size="Large" 
            ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <br />
    <div style="text-align:right;float:left;height:30px; width:860px; border:1px solid #ff9900;  margin-bottom:2px;">   商品总价：<asp:Label 
            ID="lblPay" runat="server" ForeColor="Blue"></asp:Label>
          元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
   
<br />
<div id="info4">热卖商品</div>

           <asp:DataList ID="DataList1" runat="server" 
            RepeatDirection="Horizontal" onitemcommand="DataList1_ItemCommand" 
                onitemdatabound="DataList1_ItemDataBound"  >
               <FooterTemplate>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                   <asp:Label ID="lblCount" runat="server"></asp:Label>
                   <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first">首页</asp:LinkButton>
                   <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre">上一页</asp:LinkButton>
                   <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next">下一页</asp:LinkButton>
                   <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last">尾页</asp:LinkButton>
                   <asp:Label ID="lblSkip" runat="server">跳转至</asp:Label>
                   <asp:TextBox ID="txtSkip" runat="server" Height="16px" Width="30px"></asp:TextBox>
                   <asp:Button ID="btnSkip" runat="server" CommandName="search" Text="Go" />
               </FooterTemplate>
               <ItemTemplate>
               <div style="text-align:center;float:left;height:100px; width:150px;">
                <asp:ImageButton ID="ibtnPhonePhoto" runat="server" 
                    CommandArgument='<%# Eval("phone_id") %>' 
                    ImageUrl='<%# Eval("phone_image") %>' 
                       Height="100px" Width="90px" onclick="ibtnPhonePhoto_Click" />

                  <%-- <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("phone_image","{0}") %>' Height="80px" Width="90px" />--%>
                   </div>
                   <br />
                   &nbsp;&nbsp;
                    <div style="text-align:center;float:left;height:40px; width:150px;">
                   <asp:LinkButton ID="lbtnName" runat="server" 
                       CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>'  
                             ForeColor="Blue" Font-Names="宋体" Font-Size="Medium" 
                            onclick="lbtnName_Click"></asp:LinkButton></div>
               </ItemTemplate>
           </asp:DataList>
         
<br />  
 
          
</div>

</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

