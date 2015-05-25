<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="PaySuccess.aspx.cs" Inherits="Buyer_PaySuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/order_success.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
     .image
     {
         margin-left:300px;
         margin-right:100px;
         width:740px;
         height:180px; 
      }
      .text
     {
         margin-left:500px;
         margin-right:300px;
         width:300px;
         height:180px; 
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class ="contanier">
 <div class="image">
     <asp:Image ID="Image1" runat="server" ImageUrl="~/images/PaySuccess.jpg" 
         Height="100%" Width="100%" />
 </div>
 <div class="text">
 &nbsp;
     <br />
&nbsp; 现在您可以：<asp:Button ID="btnOrderInfo" runat="server" BackColor="#0066FF" 
         BorderColor="#0066FF" BorderStyle="Solid" ForeColor="White" 
         onclick="btnOrderInfo_Click" Text="查看订单详情" />
     <br />

     <br />
     <br />
 </div>
  </div>
</asp:Content>

