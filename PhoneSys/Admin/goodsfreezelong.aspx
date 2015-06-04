<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true"
    CodeFile="goodsfreezelong.aspx.cs" Inherits="Admin_goodsfreezelong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .selectitem
        {
            border-color: Red;
            border-style: solid;
            border-left-width: 2px;
            border-top-width: 2px;
            border-bottom-width: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="page-header span9 offset1">
            <h2>
                永久冻结商品</h2>
        </div>
        <div class="span8" style="padding-top: 10px; text-align: right">
            <asp:DropDownList ID="ddlseltype" class="selectpicker" data-style="btn-primary" runat="server">
                <asp:ListItem>全部手机</asp:ListItem>
                <asp:ListItem>手机编号</asp:ListItem>
                <asp:ListItem>手机名</asp:ListItem>
                <asp:ListItem>手机品牌</asp:ListItem>
                <asp:ListItem>手机卖家</asp:ListItem>
                <asp:ListItem>店铺名</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtcondition" runat="server" class="input-medium search-query"></asp:TextBox>
            <asp:Button ID="btngoodssearch" runat="server" Text="搜索" class="btn btn-success" />
        </div>
    </div>
    <center>
        <div style="text-align: center; min-height: 300px; margin-top: 20px;">
            <div style="text-align: center; min-height: 300px; margin-left: 0; margin-top: 20px;">
                <asp:GridView ID="gdvgoodsfrelong" runat="server" AutoGenerateColumns="False" DataSourceID="sdsgoodsmana"
                    DataKeyNames="phone_id" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
                    BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="712px" OnRowDataBound="gdvgoodsfrelong_RowDataBound"
                    EmptyDataText="没有查到您要的结果，请检查查询条件！">
                    <Columns>
                        <asp:TemplateField HeaderText="手机图片">
                            <ItemTemplate>
                                <asp:Image ID="imgphone" runat="server" Height="60px" ImageUrl='<%# Bind("phone_image","{0}") %>'
                                    Width="60px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="手机名" DataField="phone_name" />
                        <asp:BoundField HeaderText="品牌" DataField="brand" />
                        <asp:BoundField HeaderText="卖家" DataField="realname" />
                        <asp:BoundField HeaderText="价格" DataField="price" />
                        <asp:BoundField HeaderText="类型" DataField="mobiletype" />
                        <asp:BoundField HeaderText="上架时间" DataField="phoneselltime" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="状态" DataField="mobilestate" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsgoodsmana" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                    SelectCommand="SELECT [phone_id], [phone_image], [phone_name], [brand], [shop_name], [realname], [price], [mobiletype], [mobilestate], [phoneselltime] FROM [phone_state_set_view1] where mobilestate='永久冻结'">
                </asp:SqlDataSource>
            </div>
        </div>
    </center>
</asp:Content>
