<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="userunlock.aspx.cs" Inherits="Admin_userunlock" %>

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
    <div style="height:50px;font-size:40px;">
        已冻结用户
        </div>
<div style="text-align:center;margin-top:10px;margin-bottom:30px;width:70%;">
    <div style="width:100px;float:left;">
    <asp:DropDownList ID="ddlselectuser" class="selectitem" runat="server" Height="34px" 
        Width="100px" Font-Size="Medium">
        <asp:ListItem>--全部--</asp:ListItem>
        <asp:ListItem>用户名</asp:ListItem>
    </asp:DropDownList>
    </div>
    <div style="width:280px;float:left;">
    <asp:TextBox ID="txtcondition" runat="server" Height="30px" Width="280px" 
        BorderColor="Red" BorderWidth="2px"></asp:TextBox>
        </div>
        <div style="width:75px;float:left;">
    <asp:ImageButton ID="Ibnsearch" runat="server" Height="34px" Width="75px" 
        ImageUrl="~/images/usersearch.gif" onclick="Ibnsearch_Click" />
        </div>
</div>
    <div style="margin-top:10px;width:100%;min-height:300px;text-align:center;float:left;clear:right;">
    <asp:GridView ID="gdvuserislock" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="UserId" DataSourceID="sdsunlock" 
            Width="716px" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        onrowdatabound="gdvuserislock_RowDataBound" EmptyDataText="您查询的结果不存在！" 
            AllowPaging="True" PageSize="8">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="cbxseluser" runat="server" />
                        <asp:Label ID="lblulusersign" runat="server" Visible="False"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Height="30px" />
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserID" HeaderText="用户编号" >
                <HeaderStyle Height="30px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="用户名" />
                <asp:BoundField DataField="Email" HeaderText="邮箱" />
                <asp:BoundField DataField="user_tel" HeaderText="联系方式" />
                <asp:BoundField DataField="user_adress" HeaderText="地址" />
                <asp:BoundField DataField="LastLoginDate" HeaderText="上次登录时间" 
                    DataFormatString="{0:d}" />
                <asp:CheckBoxField DataField="IsApproved" HeaderText="用户状态" 
                    SortExpression="IsApproved" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" 
                Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" HorizontalAlign="Center" 
                VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </div>
</center>
    <div style="text-align:center;margin-top:40px;Width:100%;">
    <asp:CheckBox ID="cbxsellockuser" runat="server" AutoPostBack="True" 
            BorderColor="Red" Text="全选" 
            oncheckedchanged="cbxsellockuser_CheckedChanged" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnunlock" runat="server" Text="解除锁定" 
            onclick="btnunlock_Click" />
    </div>

        <asp:SqlDataSource ID="sdsunlock" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT [UserID], [UserName], [Email], [user_adress], [LastLoginDate], [user_tel], [IsApproved] FROM [users_extend_view1] where IsApproved='false'">
        </asp:SqlDataSource>
</asp:Content>

