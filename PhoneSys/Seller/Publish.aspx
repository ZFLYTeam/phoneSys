<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="Publish.aspx.cs" Inherits="Seller_Publish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="span12">
            <div class="page-header">
                <h1>
                    发布宝贝</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span4 offset3">
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="txtphonename">
                        手机名</label>
                    <div class="controls">
                        <asp:TextBox ID="txtphonename" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtphonename"
                            ErrorMessage="请输入手机名！！"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddlbrand">
                        品牌</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddlbrand" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdsbrand" DataTextField="meaning" DataValueField="brandid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddlcolor">
                        颜色</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddlcolor" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdscolor" DataTextField="meaning" DataValueField="colorid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddlversion">
                        版本</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddlversion" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdsversion" DataTextField="meaning" DataValueField="versionid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddlpriceinterval">
                        价格区间</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddlpriceinterval" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdspriceinterval" DataTextField="priceinterval" DataValueField="priceintid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddlos">
                        操作系统</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddlos" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdsos" DataTextField="meaning" DataValueField="osid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddlcpu">
                        核心数</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddlcpu" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdscpu" DataTextField="meaning" DataValueField="cpuid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddltype">
                        手机类型</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddltype" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdstype" DataTextField="meaning" DataValueField="typeid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddlpixel">
                        像素</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddlpixel" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdspixel" DataTextField="meaning" DataValueField="pixelid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="ddlscreensize">
                        屏幕尺寸</label>
                    <div class="controls">
                        <asp:DropDownList ID="ddlscreensize" runat="server" class="selectpicker" data-style="btn-primary"
                            DataSourceID="sdsscreen" DataTextField="meaning" DataValueField="screensizeid">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtprice">
                        价格</label>
                    <div class="controls">
                        <div class="input-append">
                            <asp:TextBox ID="txtprice" Width="178px" runat="server"></asp:TextBox>
                            <span class="add-on">元</span>
                        </div>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtprice"
                            ErrorMessage="价格输入不正确" MaximumValue="10000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtquantity">
                        库存量</label>
                    <div class="controls">
                        <div class="input-append">
                            <asp:TextBox ID="txtquantity" Width="178px" runat="server"></asp:TextBox>
                            <span class="add-on">件</span>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtquantity"
                            ErrorMessage="请输入库存量！！"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtintroduce">
                        商品简介</label>
                    <div class="controls">
                        <asp:TextBox ID="txtintroduce" runat="server" TextMode="MultiLine" Width="369px"
                            Height="52px"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center; width: 80%; height: 150px;">
            <div style="text-align: right; width: 53%; float: left; height: 30px;">
                图片：</div>
            <div style="text-align: left; width: 18%; float: left; height: 150px;">
                <asp:Image ID="Imgpic" runat="server" Height="150px" Width="120px" />
            </div>
            <div style="text-align: left; width: 20%; float: left; height: 100px;">
                <asp:FileUpload ID="fudImg" runat="server" Width="181px" Height="29px" />
                <br />
                <br />
                <asp:Button ID="btnpreview" runat="server" Text="预览"  Width="60px" OnClick="btnpreview_Click" CssClass="btn btn-info"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="sapn4 offset4"style="margin-top:20px;">
            <div class="control-group">
                <div class="controls" style="margin-left:78px">
                    <asp:Button ID="btnPublic" runat="server" OnClick="btnPublic_Click1" Text=" 立刻发布"
                        Width="110px" class="btn btn-success" />
                    <asp:Button ID="btnRedirct" runat="server" OnClick="btnRedirct_Click1" Text=" 去店铺查看"
                        Width="110px" class="btn btn-success" />
                </div>
            </div>
        </div>
    </div>
    <center style="min-height: 750px;">
        <div class="main">
            <div class="control-group" style="margin-top: 10px;">
                <div class="controls">
                    <div style="margin: 0 auto; text-align: center; width: 40%;">
                        <div style="text-align: center; float: left">
                        </div>
                        <div style="text-align: center; width: 112px; float: right">
                        </div>
                    </div>
                    <br />
                    <asp:SqlDataSource ID="sdsbrand" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT * FROM [DM_phonebrand]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdscolor" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT [colorid], [meaning], [identification], [comment] FROM [DM_color]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsversion" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT [versionid], [meaning], [identification], [comment] FROM [DM_version]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdspriceinterval" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="select priceintid,CONVERT(varchar,low)+'-'+CONVERT(varchar,high) priceinterval from DM_priceinterval">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsos" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT [osid], [meaning], [identification], [comment] FROM [DM_os]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdscpu" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT [meaning], [cpuid], [identification], [comment] FROM [DM_CPU]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdstype" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT [typeid], [meaning], [identification], [comment] FROM [DM_type]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdspixel" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT [pixelid], [meaning], [identification], [comment] FROM [DM_pixel]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsscreen" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT [screensizeid], [meaning], [identification], [comment] FROM [DM_screensize]">
                    </asp:SqlDataSource>
                    <br />
                </div>
            </div>
        </div>
    </center>
</asp:Content>
