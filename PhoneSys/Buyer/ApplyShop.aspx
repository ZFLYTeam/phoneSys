<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="ApplyShop.aspx.cs" Inherits="Buyer_ApplyShop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .center_top
        {
            margin-top:10px;
            margin-left:350px;
            margin-right:350px;
            margin-bottom:0px;   
            height:80px;        
            width:690px;
            border-bottom:5px solid #FFFF00; 
            padding-left:80px;
            padding-bottom:5px;                    
        }
        .center_bottom
        {
            margin-top:10px;
            margin-left:450px;
            margin-right:200px;
            margin-bottom:50px;   
            height:auto;        
            width:600px;
            padding:20px;
            text-align:right;
        }
    .style1
    {
        width: 100%;
    }
    .style2
    {
        height: 35px;
    }
    .style3
    {
        height: 36px;
    }
    .style4
    {
        height: 36px;
        text-align: right;
    }
    .style5
    {
        height: 35px;
        text-align: right;
    }
    .style7
    {
        height: 40px;
        text-align: left;
    }
    .style8
    {
        height: 36px;
        text-align: left;
    }
    .style9
    {
        height: 35px;
        text-align: left;
    }
    .style10
    {
        height:135px;
        width:250px;
        padding:15px;
        text-align:center;
    }
    .style11
    {
        text-align:center;
        font-size:x-large;
        height: 25px;
    }
    .style12
    {
        height: 25px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <%--  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>--%>
        <div class="center_top">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/ApplyShop.jpg"
                Width="600px" Height="80px" />
        </div>
        <div class="center_bottom">

            <table class="style1">
                <tr>
                    <td class="style12">
                        </td>
                    <td class="style11" colspan="2">
                        <asp:Label ID="lblTips" runat="server" Text="为了保证您的申请能尽快通过，请认真填写以下信息：" 
                            Font-Size="Large" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        </td>
                    <td class="style5">
                        <asp:Label runat="server" Font-Size="Medium" Text="店铺名："></asp:Label>
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="txtShopName" runat="server" Height="25px" Width="170px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style5">
                        <asp:Label ID="Label1" runat="server" Text="店铺Logo："></asp:Label>
                    </td>
                    <td class="style9">                    
                        <asp:FileUpload ID="fulShopLogo" runat="server" />
                        &nbsp;<asp:Button ID="btnPreViewLogo" runat="server" onclick="btnPreViewLogo_Click" 
                            Text="预览" Width="70px" />
                        &nbsp;
                     </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style9">
                      <fieldset class="style10">
                    <legend>图片预览</legend>                        
                          <asp:Image ID="imgLogo" runat="server" Height="120px" Width="150px" 
                              Visible="False" />                        
                    </fieldset>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        </td>
                    <td class="style3">
                        <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="身份证照："></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:FileUpload ID="fulIdPhoto" runat="server" EnableViewState="False" />
                        <asp:Button ID="btnPreViewId" runat="server" onclick="btnPreViewId_Click" 
                            Text="预览" Width="70px" />
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style8">
                        <fieldset class="style10">
                    <legend>图片预览</legend>
                        
                          <asp:Image ID="imgIdPhoto" runat="server" Height="120px" Width="150px" 
                                Visible="False" />
                        
                    </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style7">
                        </td>
                    <td class="style7">
                        </td>
                    <td class="style7">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSubmit" runat="server" BackColor="#F17E3D" 
                            BorderColor="#F86D1C" Font-Bold="True" Font-Size="Large" ForeColor="White" 
                            Height="33px" Text="提交" Width="81px" onclick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>

        </div>
   <%--     </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

