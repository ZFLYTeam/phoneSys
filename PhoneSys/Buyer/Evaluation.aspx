<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="Evaluation.aspx.cs" Inherits="Buyer_Evaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
 #content
    {
        margin:0 auto;
        padding:0;
        height:100%;
        width:860px;
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
        font-size:16px;
        color:#333;
               
    }
     #info1
    {
        height:32px;
        width:860px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:16px;
        color:#333;
               
    }
       #info2
    {
        height:96px;
        width:860px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:16px;
        color:#333;
               
    }
         #info3
    {
        height:36px;
        width:860px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:20px;
        color:#333;
               
    }
    #cont
    {
        height:300px;
        width:860px;
    }
     #cont1
    {
        height:200px;
        width:860px;
        text-align:center;
        float:left;
    }
    
    .style1
    {
        color: #FF0000;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<div id="content">
<br />
    <asp:Label ID="lblSellerID" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblBuyerID" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblPhoneID" runat="server" Visible="False"></asp:Label>
<br />
<div id="info">评价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    卖家：<asp:LinkButton ID="lbtnSeller" runat="server" onclick="lbtnSeller_Click"></asp:LinkButton>
    &nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="评价须知" ForeColor="Blue" ToolTip="评价须知(2009-2-15开始实行)

请您根据本次交易，给予真实、客观、仔细地评价。您的评价将是其他会员的参考，也将影响卖家的信用。

累积信用计分规则： 中评不计分，但会影响卖家的好评率，请慎重给予。 评价后30天内，您有一次机会删除给对方的中评或差评，或者修改成好评。"></asp:Label>
    </div>
    <div id="cont">
    <div style="text-align:left;float:left;height:200px; width:800px;">
    <div style="text-align:left;float:left;height:200px; width:130px;"></div>
     <div style="text-align:left;float:left;height:160px; width:110px;"><br /><br />
     <asp:DataList ID="dlPhone" runat="server" DataSourceID="sdsPhoneByOrderID" 
            RepeatDirection="Horizontal" >
               <ItemTemplate>
               <div style="text-align:center;float:left;height:110px; width:100px;">
                  <%-- <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("phone_image","{0}") %>' Height="100px" Width="100px" />--%>
                   <asp:ImageButton ID="ibtnPhone" runat="server" 
                       ImageUrl='<%# Bind("phone_image","{0}") %>' Height="100px" Width="80px" 
                       CommandArgument='<%# Eval("phone_id") %>' onclick="ibtnPhone_Click" />
                   </div>
                   <br />
                   &nbsp;&nbsp;
                    <div style="text-align:center;float:left;height:30px; width:100px;">
                   <asp:LinkButton ID="lbtnPhoneName" runat="server" 
                       CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>'  
                             ForeColor="Blue" Font-Names="宋体" Font-Size="Medium" 
                            onclick="lbtnPhoneName_Click"></asp:LinkButton></div>
               </ItemTemplate>
           </asp:DataList>
                </div>
           <div style="text-align:left;float:left;height:200px; width:70px;"></div>   
         <div style="text-align:left;float:left;height:200px; width:450px;"> 
         <br /><br />
         <div>评价内容<span class="style1">(限500字)</span>：<br />
             <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" 
                 Height="121px" Width="434px"></asp:TextBox>  <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             </div>       
          </div>            
               
        <br />
           <div style="text-align:left;float:left;height:10px; width:850px;"></div>
<div style="text-align:center;">
        <asp:ImageButton ID="ibtnConfirmEvaluation" runat="server" 
            ImageUrl="~/images/confirm.jpg" onclick="ibtnConfirmEvaluation_Click" /></div>
                <asp:SqlDataSource ID="sdsPhoneByOrderID" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT * FROM [View1] WHERE ([orderId] = @orderId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="orderId" SessionField="orderID" Type="Int64" />
                    </SelectParameters>
        </asp:SqlDataSource>
                </div> 
    </div>
 
 <div id="info3">热销商品</div>
  <div style="text-align:left;float:left;height:10px; width:850px;"></div>
 <asp:DataList ID="DataList1" runat="server" 
            RepeatDirection="Horizontal" onitemcommand="DataList1_ItemCommand" 
                onitemdatabound="DataList1_ItemDataBound" >
                    <FooterTemplate>
                        <div style="text-align: center; margin-top: 50px">
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
                            <asp:Button ID="btnSkip" runat="server" CommandName="search" CssClass="btn btn-danger"
                                Text="Go" />
                        </div>
                    </FooterTemplate>
               <ItemTemplate>
               <div style="text-align:center;float:left;height:100px; width:150px;">
                <asp:ImageButton ID="ibtnPhonePhoto" runat="server" 
                    CommandArgument='<%# Eval("phone_id") %>' 
                    ImageUrl='<%# Eval("phone_image") %>' 
                       Height="95px" Width="75px" onclick="ibtnPhonePhoto_Click" />

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

</div>
</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

