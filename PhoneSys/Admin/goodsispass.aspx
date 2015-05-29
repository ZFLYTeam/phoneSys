<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="goodsispass.aspx.cs" Inherits="Admin_goodsispass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .selectitem {
            border-color: Red;
            border-style: solid;
            border-left-width: 2px;
            border-top-width: 2px;
            border-bottom-width: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="page-header span9 offset1">
                    <h2>热销商品</h2>
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
                    <asp:ImageButton ID="Ibgoodsnsearch" runat="server" Height="34px" Width="75px"
                        ImageUrl="~/images/usersearch.gif" OnClick="Ibgoodsnsearch_Click" />
                </div>
            </div>
            <center>

                <div style="text-align: center; min-height: 300px; margin-top: 10px; float: left; clear: right;">
                    <div style="text-align: center; min-height: 300px; margin-left: 5px; margin-top: 0px; float: left; clear: right;">
                        <asp:GridView ID="gdvgoodspass" runat="server" AutoGenerateColumns="False"
                            DataSourceID="sdsgoodsmana" DataKeyNames="phone_id" BackColor="White"
                            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                            Width="712px" OnRowDataBound="gdvgoodspass_RowDataBound"
                            AllowPaging="True" PageSize="5" EmptyDataText="您查询的结果不存在，请检查查询条件！">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbxselphoneid" runat="server" />
                                        <asp:Label ID="lblgoods" runat="server" Visible="False"
                                            Text='<%# Bind("phone_id","{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Height="30px" />
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="手机图片">
                                    <ItemTemplate>
                                        <asp:Image ID="imgphone" runat="server" Height="60px"
                                            ImageUrl='<%# Bind("phone_image","{0}") %>' Width="60px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="手机名" DataField="phone_name" />
                                <asp:BoundField HeaderText="品牌" DataField="brand" />
                                <asp:BoundField HeaderText="卖家" DataField="realname" />
                                <asp:BoundField HeaderText="价格" DataField="price" />
                                <asp:BoundField HeaderText="类型" DataField="mobiletype" />
                                <asp:BoundField HeaderText="上架时间" DataField="phoneselltime"
                                    DataFormatString="{0:d}" />
                                <asp:BoundField HeaderText="状态" DataField="mobilestate" />
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" Font-Size="Large"
                                ForeColor="#FFFFCC" />
                            <PagerStyle ForeColor="#330099" HorizontalAlign="Center" BackColor="#FFFFCC" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsgoodsmana" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                            SelectCommand="SELECT * FROM [phone_state_set_view1] where mobilestate='正在热销'"></asp:SqlDataSource>
                    </div>
                </div>
                <div style="height: 40px; margin-top: 20px; float: left; width: 100%">

                    <asp:CheckBox ID="cbxselgoodsall" runat="server" AutoPostBack="True"
                        OnCheckedChanged="cbxselgoodsall_CheckedChanged" Text="全选" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btngoodtemfreeze" runat="server" OnClick="btngoodtemfreeze_Click"
        Text="临时冻结" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnfreezelong" runat="server" Text="永久冻结" Width="64px"
        OnClick="btnfreezelong_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                </div>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

