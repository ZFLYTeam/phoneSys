<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="shopcommanage.aspx.cs" Inherits="Admin_shopcommanage" %>

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
<div style="text-align:center;height:40px;margin-top:20px;font-size:40px;">
    店铺投诉管理
</div>
<div style="text-align:center;margin-top:20px;width:80%;margin-bottom:20px;">
    <div style="width:100px;float:left;">
    <asp:DropDownList ID="ddlseltype" class="selectitem" runat="server" Height="34px" 
        Width="100px" Font-Size="Medium">
        <asp:ListItem>全部手机</asp:ListItem>
        <asp:ListItem>待处理</asp:ListItem>
        <asp:ListItem>已处理</asp:ListItem>
        <asp:ListItem>手机名</asp:ListItem>
        <asp:ListItem>店铺名</asp:ListItem>
    </asp:DropDownList>
    </div>
    <div style="width:280px;float:left;">
    <asp:TextBox ID="txtcondition"  runat="server" Height="30px" Width="280px" 
        BorderColor="Red" BorderWidth="2px"></asp:TextBox>
        </div>
        <div style="width:75px;float:left;">
    <asp:ImageButton ID="lbncompsearch" runat="server" Height="34px" Width="75px" 
        ImageUrl="~/images/usersearch.gif" onclick="lbncompsearch_Click" />
        </div>
</div>
<div style="text-align:center;min-height:300px;margin-top:20px;float:left;clear:right;">
<div style="text-align:center;min-height:300px;margin-left:20px;margin-top:20px;float:left;clear:right;">
    <asp:GridView ID="gdvcompmana" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sdsgoodsmana" DataKeyNames="complaint_id" BackColor="White" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        Width="712px" onrowdatabound="gdvcompmana_RowDataBound" 
        AllowPaging="True" PageSize="3">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="cbxselphoneid" runat="server" />
                    <asp:Label ID="lblgoods" runat="server" Visible="False" 
                        Text='<%# Bind("complaint_id","{0}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Height="0px" />
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
            店铺名：<%# DataBinder.Eval(Container.DataItem,"shop_name")%>
                </ItemTemplate>
                <HeaderStyle Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
            <div style="text-align:left;float:left;height:30px;width:500px;border-bottom-width:5px; border-bottom-color:Purple;" >
            <div style="text-align:left;float:left;height:30px;width:250px;">买家：<%# DataBinder.Eval(Container.DataItem,"UserName") %></div>
            <div style="text-align:left;float:left;height:30px;width:200px;">投诉时间：<%# DataBinder.Eval(Container.DataItem,"comptime")%></div>
            </div>
            <div style="text-align:left;float:left;height:90px;width:500px;border-bottom-width:5px; border-bottom-color:Purple;">
            投诉内容：<%# DataBinder.Eval(Container.DataItem,"compinfo")%></div>
            <div style="text-align:left;float:left;height:30px;width:500px;border-bottom-width:5px; border-bottom-color:Purple;">
            <div style="text-align:left;float:left;height:30px;width:150px;"></div>
            <div style="text-align:left;float:left;height:30px;width:150px;">投诉状态：<%# DataBinder.Eval(Container.DataItem,"meaning")%></div>
            <div style="text-align:right;float:right;height:30px;width:180px;">
                <asp:LinkButton ID="lbnupstate" runat="server" CommandName="Update">设为已读</asp:LinkButton></div>
            </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" Font-Size="Large" 
            ForeColor="#FFFFCC" Height="0px" />
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
        
        SelectCommand="SELECT * FROM [shop_complaint_manage_view1]"></asp:SqlDataSource>
</div>
</div>
<div style="height:40px;margin-top:10px;width:100%;float:left;">

    <asp:CheckBox ID="cbxselcompsall" runat="server" AutoPostBack="True" 
        Text="全选" oncheckedchanged="cbxselcompsall_CheckedChanged" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btngoodscomp" runat="server" 
        Text="设为已读" onclick="btngoodscomp_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</div>
</center>
</asp:Content>

