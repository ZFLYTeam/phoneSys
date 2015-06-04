<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true"
    CodeFile="goodsmanage.aspx.cs" Inherits="Admin_goodsmanage" %>

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
                商品信息审核</h2>
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
            <asp:ImageButton ID="Ibgoodsnsearch" runat="server" Height="34px" Width="75px" ImageUrl="~/images/usersearch.gif"
                OnClick="Ibgoodsnsearch_Click" />
        </div>
    </div>
    <center>
        <div style="text-align: center; min-height: 300px; float: left; clear: right;">
            <div style="text-align: center; min-height: 300px; margin-left: 10px; margin-top: 20px;
                float: left; clear: right;">
                <asp:GridView ID="gdvgoodsmana" runat="server" AutoGenerateColumns="False" DataSourceID="sdsgoodsmana"
                    DataKeyNames="phone_id" BackColor="White" BorderColor="#CC9966" BorderStyle="None"
                    BorderWidth="1px" CellPadding="4" Width="712px" OnRowDataBound="gdvgoodsmana_RowDataBound"
                    AllowPaging="True" PageSize="6">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbxselphoneid" runat="server" />
                                <asp:Label ID="lblgoods" runat="server" Visible="False" Text='<%# Bind("phone_id","{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Height="30px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
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
                    SelectCommand="SELECT distinct * FROM [phone_state_set_view1]"></asp:SqlDataSource>
            </div>
        </div>
        <div style="text-align: center; width: 100%; float: left; margin-top: 15px;">
            <asp:CheckBox ID="cbxselgoodsall" runat="server" AutoPostBack="True" OnCheckedChanged="cbxselgoodsall_CheckedChanged"
                Text="全选" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btngoodspass" runat="server" OnClick="btngoodspass_Click" Text="通过审核" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btngoodsdeny" runat="server" Text="拒绝" Width="40px" OnClick="btngoodsdeny_Click" />
        </div>
    </center>
</asp:Content>
