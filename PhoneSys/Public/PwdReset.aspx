<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="PwdReset.aspx.cs" Inherits="Public_PwdReset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .content
        {
            margin:0 auto;
            padding:0;
            width:960px;
            border:1px solid #cc0000;
            margin-bottom:10px;
        }
        .style1
        {
            font-size: x-large;
            text-align:center;
            font-size:20px;
        }
        .style2
        {
            height: 35px;
        }
        .style3
        {
            text-align: center;
            width:960px;
            height:30px;
            line-height:30px;
            background-color:#eeeee0;
            font-family:黑体;
            color:#333;
        }
        .update
        {
            margin-right:450px;
            margin-left:320px; 
            height:250px;  
            width:500px;  
            text-align:center;      
         }
        .style4
        {
            height: 26px;
        }
        .style5
        {
            height: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
    <div class="content">
    <div class="style3">
        <span class="style1">修改密码</span>
    </div>
    <div class="update">
       <table>
       <tr>
       <td class="style2">旧密码：</td>
       <td class="style2">
           <asp:TextBox ID="txtOPwd" runat="server" Height="26px" TextMode="Password" ></asp:TextBox>
           </td>
       <td class="style2">
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
               ControlToValidate="txtOPwd" ErrorMessage="RequiredFieldValidator" 
               ForeColor="Red">*必填项</asp:RequiredFieldValidator>
           </td>
       </tr>
       <tr>
       <td class="style2">新密码：</td>
       <td class="style2">
           <asp:TextBox ID="txtNPwd0" runat="server" TextMode="Password" Height="26px"></asp:TextBox>
           </td>
       <td class="style2"></td>
       </tr>
       <tr>
       <td class="style2">确认密码：</td>
       <td class="style2">
           <asp:TextBox ID="txtNPwd1" runat="server" TextMode="Password" Height="26px"></asp:TextBox>
           </td>
       <td class="style2">
           <asp:CompareValidator ID="CompareValidator1" runat="server" 
               ControlToCompare="txtNPwd0" ControlToValidate="txtNPwd1" 
               ErrorMessage="CompareValidator" ForeColor="Red">两次输入的密码不一致！</asp:CompareValidator>
           </td>
       </tr>
       <tr>
       <td class="style5"></td>
       <td class="style5"></td>
       <td class="style5"></td>
       </tr>
           <tr style="height: 38px">
               <td>
                   &nbsp;</td>
               <td>
                   <asp:Button ID="btnConfirm" runat="server" Height="30px" 
                       onclick="btnConfirm_Click" Text=" 确认" Width="70px" />
                   &nbsp;
                   <asp:Button ID="btnReset" runat="server" Height="30px" onclick="btnReset_Click" 
                       Text=" 重置" Width="70px" />
               </td>
               <td>
                   &nbsp;</td>
           </tr>
       </table>
    </div>
    </div>
   <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

