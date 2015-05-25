<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="UpdatePhoneInfo.aspx.cs" Inherits="Seller_UpdatePhoneInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../css/seller_display.css" rel="stylesheet" type="text/css" />  
 <style type="text/css">
                
        .main
        {
            text-align:center;width:80%
        }
        .main1
        {
            text-align:center;
            width:80%;
            height:30px;
        }
        .mainleft
        {
            text-align:right;
            width:36%;
            float:left;
            height:30px;
         }
         .mainright
         {
          text-align:left;
          width:60%;
          float:left;
          height:30px;
          }
           #content
    {
        margin:0 auto;
        padding:0;
        height:100%;
        width:1035px;
        border:1px solid #ff9900;
        text-align:center;
        margin-left: 3px;
        margin-top:15px;
        margin-bottom:15px;
        background-image:url('../images/seller2.jpg');
        font-family: 微软雅黑;    
    }    
        
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center style="min-height:800px;">
<div id="content">
<div style="text-align:center;width:80%;font-size:40px;margin-top:30px;">
</div>
<div class="main">
 <div class="main1">
<div class="mainleft">手&nbsp; 机 名：</div>
<div class="mainright">
    <asp:TextBox ID="txtphonename" runat="server" Width="246px" Height="27px"></asp:TextBox>
 </div>
 </div>
 
 <div style="text-align:center;width:80%;height:204px;">
<div style="text-align:right;width:36%; float:left;height:30px;">更改图像：</div>
<div style="text-align:left;width:22%; float:left;height:156px;">
     <asp:Image ID="Imgpic" runat="server" Height="152px" Width="137px" />
 </div>
<div style="text-align:left;width:39%; float:left;height:136px;">
    <asp:FileUpload ID="fudImg" runat="server" Width="157px" />
    <br />
    <br />
    <asp:Button ID="btnpreview" runat="server" Text="预览" Height="30px" 
        Width="60px" onclick="btnpreview_Click" />
 </div>
 </div>
 
 <div class="control-group">
                <div class="controls">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" class="btn btn-green btn-publish" runat="server" Text="更新信息" 
                           BackColor="#006600" 
                            BorderColor="#006600" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" 
                            Height="38px" Width="123px" onclick="btnPublic_Click1"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCheck" class="btn btn-green btn-publish" runat="server" Text="去店铺查看" 
                           BackColor="#006600" 
                            BorderColor="#006600" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" 
                            Height="38px" Width="123px" onclick="btnCheck_Click"/>
                    <br />
                    <br />
                </div>
            </div>
</div>
</div>
</center>
</asp:Content>

