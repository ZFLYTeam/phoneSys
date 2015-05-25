<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Findpwd.master" AutoEventWireup="true" CodeFile="FindPwd.aspx.cs" Inherits="Public_ResetPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <style type="text/css">
    #content
    {
        margin:0 auto;
        padding:0;
        height:510px;
        width:860px;
        border:1px solid #ff9900;
        margin-top:15px;
        margin-bottom:15px;
    }
    #info
    {
        height:40px;
        width:860px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:30px;
        color:#333;
        text-align:center;
    }
   
    #cont
    {
        height:470px;
        width:860px;
    }
    table
    {
        height:400px;
        width:860px;
    }
    tr
    {
        width:860px;
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
        .style10
        {
            width: 260px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="content">
      <div id="info">找回密码</div>
  
      <div id="cont">
      <table>
       <tr class="style3">
        <td class="style9"></td>
            <td class="style1">用户名：</td><td class="style10"><asp:TextBox ID="txtUserName" 
               runat="server" Height="21px" 
                    Width="210px" AutoPostBack="True" 
               ontextchanged="txtUserName_TextChanged" ></asp:TextBox>
             </td>
             <td></td>
         </tr>
         <tr class="style2">
         <td class="style9"></td>
            <td class="style1">问题：</td><td class="style10"><asp:TextBox ID="txtQuestion" runat="server" Height="21px" 
                    Width="210px"></asp:TextBox>
             </td>
            <td></td>
         </tr>
        
  
         <tr class="style6"> 
          <td class="style9"></td>
            <td class="style1">答案：</td>
            <td class="style10"><asp:TextBox ID="txtAnswer" runat="server" Height="21px" 
                    Width="210px"></asp:TextBox>
             </td>
              <td></td>
         </tr>
         <tr class="style6"> 
          <td class="style9"></td>
            <td class="style1">设置密码：</td><td class="style10">
             <asp:TextBox ID="txtNewPwd" 
                 runat="server" Height="21px" 
                    Width="210px" TextMode="Password"></asp:TextBox>
             </td>
              <td></td>
         </tr>
         <tr class="style6"> 
          <td class="style9"></td>
            <td class="style1">确认密码：</td><td class="style10">
             <asp:TextBox ID="txtConfirmPwd" 
                 runat="server" Height="21px" 
                    Width="210px" TextMode="Password"></asp:TextBox>
             </td>
              <td>
                  <asp:CompareValidator ID="CompareValidator1" runat="server" 
                      ControlToCompare="txtNewPwd" ControlToValidate="txtConfirmPwd" 
                      ErrorMessage="两次输入密码不一致!" ForeColor="Red"></asp:CompareValidator>
             </td>
         </tr>
         <tr class="style6"> 
          <td class="style9"></td>
            <td class="style1">&nbsp;</td>
            <td class="style10">           
                 <asp:ImageButton ID="ibtnSave" runat="server" 
                     ImageUrl="~/images/save.jpg" onclick="ibtnSave_Click" />
             </td>
              <td></td>
         </tr>
      
         </table>
      </div>
   </div>

  
</asp:Content>

