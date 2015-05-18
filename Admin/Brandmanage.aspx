<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="Brandmanage.aspx.cs" Inherits="Admin_BrandAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <div style="height:50px;text-align:center; margin-top:30px; font-size:30px; font-family:@华文彩云;color:#000;">
    手机品牌管理
    </div>
    <asp:SqlDataSource ID="sdsbrand" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [DM_phonebrand] WHERE [brandid] = @brandid" 
        InsertCommand="INSERT INTO [DM_phonebrand] ([brandid], [meaning], [identification], [comment]) VALUES (@brandid, @meaning, @identification, @comment)" 
        SelectCommand="SELECT * FROM [DM_phonebrand]" 
        UpdateCommand="UPDATE [DM_phonebrand] SET [meaning] = @meaning, [identification] = @identification, [comment] = @comment WHERE [brandid] = @brandid">
        <DeleteParameters>
            <asp:Parameter Name="brandid" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="brandid" Type="String" />
            <asp:Parameter Name="meaning" Type="String" />
            <asp:Parameter Name="identification" Type="String" />
            <asp:Parameter Name="comment" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="meaning" Type="String" />
            <asp:Parameter Name="identification" Type="String" />
            <asp:Parameter Name="comment" Type="String" />
            <asp:Parameter Name="brandid" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div style="text-align:right;">
        <asp:Button ID="txtaddbrand" runat="server" Text="添加品牌" 
            onclick="txtaddbrand_Click" BackColor="#CC0000" ForeColor="White" />
    </div>
    <div>

    <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="brandid" DataSourceID="sdsbrand" Height="161px" Width="504px" 
            onrowdatabound="GridView1_RowDataBound" BackColor="White" 
            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField DataField="brandid" HeaderText="品牌代号" >
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="meaning" HeaderText="名称" />
                <asp:CommandField HeaderText="修改" ShowEditButton="True" >
                <ControlStyle ForeColor="#0066FF" />
                </asp:CommandField>
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                <ControlStyle ForeColor="#0066FF" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" 
                Height="30px" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
      
        <br />
     </ContentTemplate>
    </asp:UpdatePanel>
    </center></div>
</asp:Content>

