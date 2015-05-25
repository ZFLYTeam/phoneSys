<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="shopfreeze.aspx.cs" Inherits="Admin_shopfreeze" %>

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
    <div style="text-align:center;margin-top:20px;width:80%;margin-bottom:30px;height:40px;color:#ff2d2d;font-size:40px;">
    店铺冻结管理
    </div>
<div style="text-align:center;margin-top:20px;width:70%;margin-bottom:30px;height:40px;">
    <div style="width:100px;float:left;">
    <asp:DropDownList ID="ddlfreezeshopstate" class="selectitem" runat="server" Height="34px" 
        Width="100px" Font-Size="Medium">
        <asp:ListItem>--全部--</asp:ListItem>
        <asp:ListItem>运营店铺</asp:ListItem>
        <asp:ListItem>已冻结</asp:ListItem>
    </asp:DropDownList>
    </div>
    <div style="width:280px;float:left;">
    <asp:TextBox ID="txtfscondition" runat="server" Height="30px" Width="280px" 
        BorderColor="Red" BorderWidth="2px"></asp:TextBox>
        </div>
        <div style="width:75px;float:left;">
    <asp:ImageButton ID="Ibnfssearch" runat="server" Height="34px" Width="75px" 
        ImageUrl="~/images/usersearch.gif" onclick="Ibnfssearch_Click" />
        </div>
</div>
<div style="text-align:center;margin-top:30px;width:95%; margin-left:5px;">
    <asp:SqlDataSource ID="sdsfzshop" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        
        
        SelectCommand="SELECT [shop_id], [shop_name], [shop_jianjie], [shop_owner], [UserName], [realname], [Idcard_photo], [meaning] FROM [examshop_shopinfo_extend_view]"></asp:SqlDataSource>
<asp:GridView ID="gdvfzshop" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="shop_id" DataSourceID="sdsfzshop" Height="180px" 
        Width="697px" CellPadding="4" ForeColor="#333333" 
        EmptyDataText="你查询的结果不存在，请查看查询条件！" BorderStyle="Solid" BorderWidth="4px" 
        onrowdatabound="gdvfzshop_RowDataBound" AllowPaging="True" PageSize="5">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="cbxselshop" runat="server" />
                <asp:Label ID="lblsign" runat="server" Text='<%# Bind("shop_id","{0}") %>' 
                    Visible="False"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Height="30px" />
            <ItemStyle Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="店主图片">
            <ItemTemplate>
            <div style="margin-top:2px;margin-bottom:2px;">
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl='<%# Bind("Idcard_photo","{0}") %>' Height="80px" Width="60px" />
             </div>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="用户名" DataField="UserName" />
        <asp:BoundField HeaderText="真实姓名" DataField="realname" />
        <asp:BoundField HeaderText="店铺名" DataField="shop_name" >
        <ItemStyle Width="150px" />
        </asp:BoundField>
        <asp:BoundField HeaderText="店铺状态" DataField="meaning" />
    </Columns>
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
        Font-Size="Medium" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <SortedAscendingCellStyle BackColor="#FDF5AC" />
    <SortedAscendingHeaderStyle BackColor="#4D0000" />
    <SortedDescendingCellStyle BackColor="#FCF6C0" />
    <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    </div>
    <div style="min-height:200px;margin-top:30px;width:100%; height: 53px;">
<div style="float:left;margin-left:15%;width:70px; height: 26px;">

    <asp:CheckBox ID="cbxselfzall" runat="server" Text="全选" AutoPostBack="True" 
        oncheckedchanged="cbxselfzall_CheckedChanged" />

</div>
<div style="float:left;width:231px; height: 26px;">
 <asp:Button ID="btnfzpass" runat="server" Text="冻结店铺" onclick="btnfzpass_Click" />
    &nbsp;&nbsp;&nbsp;
       
</div>
    <asp:Button ID="btncalfreeze" runat="server" Text="解除冻结" 
        onclick="btncalfreeze_Click" />
   
</div>
</center>
</asp:Content>

