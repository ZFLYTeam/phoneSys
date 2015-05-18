<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="goodsfreezelong.aspx.cs" Inherits="Admin_goodsfreezelong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
.selectitem
{
    border-color:Red;
    border-style:solid;border-left-width:2px;border-top-width:2px;border-bottom-width:2px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<div style="text-align:center;height:40px;margin-top:40px;font-size:40px;width:80%">
    永久冻结商品
</div>
<div style="text-align:center;margin-top:50px;width:80%;height:30px;">
<div style="width:100px;float:left;">
<asp:DropDownList ID="ddlseltype" class="selectitem" runat="server" Height="34px" 
        Width="100px" Font-Size="Medium">
        <asp:ListItem>全部手机</asp:ListItem>
        <asp:ListItem>手机编号</asp:ListItem>
        <asp:ListItem>手机名</asp:ListItem>
        <asp:ListItem>手机品牌</asp:ListItem>
        <asp:ListItem>手机卖家</asp:ListItem>
        <asp:ListItem>店铺名</asp:ListItem>
    </asp:DropDownList>
    </div>
    <div style="width:280px;float:left;">
    <asp:TextBox ID="txtcondition" class="selecttext" runat="server" Height="30px" Width="280px" 
        BorderColor="Red" BorderWidth="2px"></asp:TextBox>
        </div>
        <div style="width:75px;float:left;">
            <asp:Button ID="btngoodssearch"  runat="server" Text="搜索" Height="34px" 
                Width="75px" BackColor="Red" />
        </div>
</div>
<div style="text-align:center;min-height:300px;margin-top:20px;">
<div style="text-align:center;min-height:300px;margin-left:0;margin-top:20px;">
    <asp:GridView ID="gdvgoodsfrelong" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sdsgoodsmana" DataKeyNames="phone_id" BackColor="#DEBA84" 
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        CellSpacing="2" Width="712px" 
        onrowdatabound="gdvgoodsfrelong_RowDataBound" 
        EmptyDataText="没有查到您要的结果，请检查查询条件！">
        <Columns>
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
        <EmptyDataRowStyle BackColor="White" Font-Size="Large" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" Font-Size="Large" 
            ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsgoodsmana" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        
        
        SelectCommand="SELECT [phone_id], [phone_image], [phone_name], [brand], [shop_name], [realname], [price], [mobiletype], [mobilestate], [phoneselltime] FROM [phone_state_set_view1] where mobilestate='永久冻结'"></asp:SqlDataSource>
</div>
</div>
</center>
</asp:Content>

