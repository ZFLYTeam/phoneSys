<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="Priceintervalmanage.aspx.cs" Inherits="Admin_Priceintervalmanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:50px;text-align:center;color:#000; margin-top:30px; font-size:30px; font-family:@华文彩云">
        价格区间管理
    </div>
        <div style=" text-align:right;">
        <asp:Button ID="txtaddprival" runat="server" Text="添加区间" 
            onclick="txtaddprival_Click" BackColor="#CC0000" ForeColor="White" />
    </div>
    <div>
    <center>
        <asp:GridView ID="gdvprival" runat="server" AutoGenerateColumns="False" 
            Height="150px" Width="519px" DataSourceID="sds_prival" 
            BorderColor="#CC9966" BorderStyle="None" 
            onrowdatabound="gdvprival_RowDataBound" CellPadding="4" 
            DataKeyNames="priceintid" PageSize="8" BackColor="White" BorderWidth="1px">
            <Columns>
                <asp:BoundField HeaderText="区间编号" ReadOnly="True" DataField="priceintid" />
                <asp:BoundField HeaderText="价格下限" DataField="low" />
                <asp:BoundField HeaderText="价格上限" DataField="high" />
                <asp:CommandField HeaderText="修改" ShowEditButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </center></div>
        <asp:SqlDataSource ID="sds_prival" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            DeleteCommand="DELETE FROM [DM_priceinterval] WHERE [priceintid] = @priceintid" 
            InsertCommand="INSERT INTO [DM_priceinterval] ([priceintid], [low], [high], [identification], [comment]) VALUES (@priceintid, @low, @high, @identification, @comment)" 
            SelectCommand="SELECT [priceintid], [low], [high], [identification], [comment] FROM [DM_priceinterval]" 
            
        
        UpdateCommand="UPDATE [DM_priceinterval] SET [low] = @low, [high] = @high, [identification] = @identification, [comment] = @comment WHERE [priceintid] = @priceintid">
            <DeleteParameters>
                <asp:Parameter Name="priceintid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="priceintid" Type="String" />
                <asp:Parameter Name="low" Type="Int32" />
                <asp:Parameter Name="high" Type="Int32" />
                <asp:Parameter Name="identification" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="low" Type="Int32" />
                <asp:Parameter Name="high" Type="Int32" />
                <asp:Parameter Name="identification" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="priceintid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

