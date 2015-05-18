<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="UpdateInfo.aspx.cs" Inherits="Public_UpdateInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    #content
    {
        margin:0 auto;
        padding:0;
        height:510px;
        width:960px;
        border:1px solid #cc0000;
        margin-top:15px;
        margin-bottom:15px;
    }
    #info
    {
        height:32px;
        width:960px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:20px;
        color:#333;
    }
      #info1
    {
        height:32px;
        width:960px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:20px;
        color:#333;
    }
    #cont
    {
        height:470px;
        width:960px;
    }
    table
    {
        height:400px;
        width:960px;
    }
    tr
    {
        width:960px;
        height:41px;
    }
    td
    {
        line-height:40px;
        font-family:黑体;
        font-size:15px;
        color:#555;
        text-align:left;
    }
    td a
    {
        color:#bb00ff;   
    }
        .style1
        {
            text-align: right;
        }
         .style9
        {
            width:180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
      <div id="info"></div>
  <div id="info1">&nbsp;&nbsp;个人信息维护&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/images/Edit.jpg" 
                    onclick="ibtnEdit_Click" />
             </div>
      <div id="cont">
      <table>
       <tr class="style3">
        <td class="style9"></td>
            <td class="style1">用户名：</td><td><asp:TextBox ID="txtUserName" runat="server" Height="21px" 
                    Width="210px" Enabled="False"></asp:TextBox>
             </td>
             <td></td>
         </tr>
         <tr class="style2">
         <td class="style9"></td>
            <td class="style1">邮箱：</td><td><asp:TextBox ID="txtEmail" runat="server" Height="21px" 
                    Width="210px"></asp:TextBox>
             </td>
            <td></td>
         </tr>
        
  
         <tr class="style6"> 
          <td class="style9"></td>
            <td class="style1">联系方式：</td>
            <td><asp:TextBox ID="txtPhone" runat="server" Height="21px" 
                    Width="210px"></asp:TextBox>
             </td>
              <td></td>
         </tr>
         <tr class="style6"> 
          <td class="style9"></td>
            <td class="style1">地址：</td><td><asp:TextBox ID="txtAddress" runat="server" Height="21px" 
                    Width="210px"></asp:TextBox>
             </td>
              <td></td>
         </tr>
         <tr class="style6"> 
          <td class="style9"></td>
            <td class="style1">问题：</td><td><asp:TextBox ID="txtQuestion" runat="server" Height="21px" 
                    Width="210px"></asp:TextBox>
             </td>
              <td></td>
         </tr>
         <tr class="style6"> 
          <td class="style9"></td>
            <td class="style1">答案：</td><td><asp:TextBox ID="txtAnswer" runat="server" Height="21px" 
                    Width="210px"></asp:TextBox>
             </td>
              <td></td>
         </tr>
      
         <tr class="style8">
          <td class="style9"></td>
            <td>  
                &nbsp;</td><td>           
                 <asp:ImageButton ID="ibtnAlter" runat="server" 
                     ImageUrl="~/images/AlterUserInfo.jpg" />
             </td>
              <td></td>
         </tr>
      </table>
      </div>
   </div>
</asp:Content>



