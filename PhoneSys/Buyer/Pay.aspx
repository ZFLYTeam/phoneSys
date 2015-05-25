<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="Pay.aspx.cs" Inherits="Buyer_Pay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/order_success.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            height: 35px;
        }
        bottom_table
       {
           margin-left:100px;
           height:100px;
           width:360px;
           border:none;
       }
        .style3
        {
            width: 213px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div id="contanier">
      <div id="order_success_step">
         <img src="../images/order_success.gif" alt=""/>
      </div>
      <div id="content">
         <div id="top">
            <div id="right_icon">
               <img src="../images/righticon.gif" alt=""/>
            </div>
            <div id="right">您的订单已提交，请尽快付款！<br />
             </div>
     <div class ="bottom">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <table class="bottom_table">
                 <tr>
                     <td class="style3" rowspan="4">
                         &nbsp;</td>
                     <td class="style2" colspan="2">
                         订单编号：<asp:Label ID="lblOrderId" runat="server" Font-Bold="True"></asp:Label>
                     </td>
                     <td class="style2" colspan="2">
                         <asp:LinkButton ID="lbtnOrderInfo" runat="server" ForeColor="#0066FF" 
                             onclick="lbtnOrderInfo_Click">查看订单详情</asp:LinkButton>
                     </td>
                 </tr>
                 <tr>
                     <td class="style2" colspan="2">
                         付款金额：<asp:Label ID="lblMoney" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td rowspan="2">
                         &nbsp;</td>
                     <td>
             <asp:Button ID="btnPay" runat="server" BackColor="#0066FF" 
                       BorderColor="#0066FF" BorderStyle="Solid" ForeColor="White" Height="31px" 
                       Text="去付款" Width="80px" onclick="btnPay_Click" />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
&nbsp;&nbsp;
             <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <br />
&nbsp;&nbsp;&nbsp;&nbsp;
             <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </div>
         </div>
      </div>
   </div>
</asp:Content>

