<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="Publish.aspx.cs" Inherits="Seller_Publish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <link href="../css/seller_display.css" rel="stylesheet" type="text/css" />  
 <style type="text/css">
                
        .main
        {
            margin:0 auto;
            text-align:center;
            width:960px;
            background-image:url('../images/seller2.jpg');
            font-family: 微软雅黑;
        }
        .main1
        {
            text-align:center;
            width:960px;
            height:30px;
        }
        .mainleft
        {
            text-align:right;
            width:40%;
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
        
     </style>
</asp:Content>

<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="min-height:750px;">

<div class="main"><div style="text-align:center;width:960px;margin:0 auto;font-size:40px;margin-top:10px; background-image:url('../images/seller2.jpg')">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/seller3.jpg" /></div>
 <div class="main1">
<div class="mainleft">手机名：</div>
<div class="mainright">
    <asp:TextBox ID="txtphonename" runat="server" Width="178px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtphonename" ErrorMessage="请输入手机名！！"></asp:RequiredFieldValidator>
 </div>
 </div>
 <div class="main1">
<div class="mainleft">品牌：</div>
<div class="mainright">
    <asp:DropDownList ID="ddlbrand" runat="server" Width="150px" 
        DataSourceID="sdsbrand" DataTextField="meaning" DataValueField="brandid">
    </asp:DropDownList>
 </div>
 </div>
 <div class="main1">
<div class="mainleft">颜色：</div>
<div class="mainright">
    <asp:DropDownList ID="ddlcolor" runat="server" Width="150px" 
        DataSourceID="sdscolor" DataTextField="meaning" DataValueField="colorid">
    </asp:DropDownList>
 </div>
</div>

<div class="main1">
<div class="mainleft">版本：</div>
<div class="mainright">
    <asp:DropDownList ID="ddlversion" runat="server" Width="150px" 
        DataSourceID="sdsversion" DataTextField="meaning" DataValueField="versionid">
    </asp:DropDownList>
 </div>
</div>

<div class="main1">
<div class="mainleft">价格区间：</div>
<div class="mainright">
    <asp:DropDownList ID="ddlpriceinterval" runat="server" Width="150px" 
        DataSourceID="sdspriceinterval" DataTextField="priceinterval" 
        DataValueField="priceintid">
    </asp:DropDownList>
 </div>
</div>

<div class="main1">
<div class="mainleft">操作系统：</div>
<div class="mainright">
    <asp:DropDownList ID="ddlos" runat="server" Width="150px" DataSourceID="sdsos" 
        DataTextField="meaning" DataValueField="osid">
    </asp:DropDownList>
 </div>
</div>

<div class="main1">
<div class="mainleft">核心数：</div>
<div class="mainright">
    <asp:DropDownList ID="ddlcpu" runat="server" Width="150px" 
        DataSourceID="sdscpu" DataTextField="meaning" DataValueField="cpuid">
    </asp:DropDownList>
 </div>
</div>

<div class="main1">
<div class="mainleft">手机类型：</div>
<div class="mainright">
    <asp:DropDownList ID="ddltype" runat="server" Width="150px" 
        DataSourceID="sdstype" DataTextField="meaning" DataValueField="typeid">
    </asp:DropDownList>
 </div>
</div>

<div class="main1">
<div class="mainleft">像素：</div>
<div class="mainright">
    <asp:DropDownList ID="ddlpixel" runat="server" Width="150px" 
        DataSourceID="sdspixel" DataTextField="meaning" DataValueField="pixelid">
    </asp:DropDownList>
 </div>
</div>

<div class="main1">
<div class="mainleft">屏幕尺寸：</div>
<div class="mainright">
    <asp:DropDownList ID="ddlscreensize" runat="server" Width="150px" 
        DataSourceID="sdsscreen" DataTextField="meaning" DataValueField="screensizeid">
    </asp:DropDownList>
 </div>
</div>

<div class="main1">
<div class="mainleft">价格：</div>
<div class="mainright">
    <asp:TextBox ID="txtprice" runat="server" Width="136px"></asp:TextBox>
    元&nbsp;
    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="txtprice" ErrorMessage="价格输入不正确" MaximumValue="10000" 
        MinimumValue="0" Type="Integer"></asp:RangeValidator>
 </div>
</div>

<div class="main1">
<div class="mainleft">库存量：</div>
<div class="mainright">
    <asp:TextBox ID="txtquantity" runat="server" Width="135px"></asp:TextBox>
    件&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtquantity" ErrorMessage="请输入库存量！！"></asp:RequiredFieldValidator>
 </div>
 </div>

 <div style="text-align:center;width:80%;height:60px;">
<div style="text-align:right;width:40%;float:left;height:30px;">商品简介：</div>
<div style="text-align:left;width:60%;float:left;height:60px;">
    <asp:TextBox ID="txtintroduce" runat="server" TextMode="MultiLine" Width="369px" 
        Height="52px"></asp:TextBox>
 </div>
 </div>
 
 <div style="text-align:center;width:80%;height:150px;">
<div style="text-align:right;width:40%;float:left;height:30px;">图片：</div>
<div style="text-align:left;width:20%;float:left;height:150px;">
     <asp:Image ID="Imgpic" runat="server" Height="150px" Width="120px" />
 </div>
<div style="text-align:left;width:35%;float:left;height:100px;">
    <asp:FileUpload ID="fudImg" runat="server" Width="181px" Height="29px" />
    <br />
    <br />
    <asp:Button ID="btnpreview" runat="server" Text="预览" Height="30px" 
        Width="60px" onclick="btnpreview_Click" />
 </div>
 </div>
 
 <div class="control-group" style="margin-top:10px;">
                <div class="controls">                    
                <div style="margin:0 auto;text-align:center;width:40%;">   
                         <div style="text-align:center;width:112px; float:left">             
                             <asp:Button ID="btnPublic" runat="server" Text="立刻发布" 
                            BackColor="#006600" 
                            BorderColor="#006600" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" Font-Size="Medium"
                            Height="38px" Width="112px" onclick="btnPublic_Click1" CssClass="btnCss"/>
                         </div>
                         <div style="text-align:center;width:112px; float:right">
                           <asp:Button ID="btnRedirct" runat="server" Text="去店铺查看" 
                           BackColor="#006600" 
                            BorderColor="#006600" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" Font-Size="Medium"
                            Height="38px" Width="112px" onclick="btnRedirct_Click1" CssClass="btnCss"/>
                         </div>
                </div>
                    <br />
                    <asp:SqlDataSource ID="sdsbrand" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        SelectCommand="SELECT * FROM [DM_phonebrand]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdscolor" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        
                        SelectCommand="SELECT [colorid], [meaning], [identification], [comment] FROM [DM_color]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsversion" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        
                        SelectCommand="SELECT [versionid], [meaning], [identification], [comment] FROM [DM_version]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdspriceinterval" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        SelectCommand="select priceintid,CONVERT(varchar,low)+'-'+CONVERT(varchar,high) priceinterval from DM_priceinterval"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsos" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        
                        SelectCommand="SELECT [osid], [meaning], [identification], [comment] FROM [DM_os]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdscpu" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        
                        SelectCommand="SELECT [meaning], [cpuid], [identification], [comment] FROM [DM_CPU]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdstype" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        
                        SelectCommand="SELECT [typeid], [meaning], [identification], [comment] FROM [DM_type]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdspixel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        
                        SelectCommand="SELECT [pixelid], [meaning], [identification], [comment] FROM [DM_pixel]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsscreen" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        
                        SelectCommand="SELECT [screensizeid], [meaning], [identification], [comment] FROM [DM_screensize]"></asp:SqlDataSource>
                    <br />
                </div>
            </div>
</div>
</center>
</asp:Content>


