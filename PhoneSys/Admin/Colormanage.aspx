<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true"
    CodeFile="Colormanage.aspx.cs" Inherits="Admin_Colormanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 50px; text-align: center; margin-top: 30px; font-size: 30px;
        color: #000; font-family: 华文行楷">
        手机颜色设置
    </div>
    <div style="text-align: right;">
        <asp:Button ID="txtaddcolor" runat="server" Text="添加" OnClick="txtaddcolor_Click"
            CssClass="btn btn-success" />
    </div>
    <div>
        <center>
            <asp:GridView ID="gdvcolor" runat="server" AutoGenerateColumns="False" Height="150px"
                Width="523px" DataSourceID="sdscolor" BorderColor="#CC9966" BorderStyle="None"
                CellPadding="4" DataKeyNames="colorid" PageSize="8" OnRowDataBound="gdvcolor_RowDataBound"
                BackColor="White" BorderWidth="1px">
                <Columns>
                    <asp:BoundField HeaderText="颜色编号" ReadOnly="True" DataField="colorid">
                        <HeaderStyle Height="30px" />
                        <ItemStyle Height="30px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="颜色名" DataField="meaning" />
                    <asp:CommandField HeaderText="修改" ShowEditButton="True">
                        <ControlStyle ForeColor="#0066FF" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                        <ControlStyle ForeColor="#0066FF" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
    <asp:SqlDataSource ID="sdscolor" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT * FROM [DM_color]" DeleteCommand="DELETE FROM [DM_color] WHERE [colorid] = @colorid"
        InsertCommand="INSERT INTO [DM_color] ([colorid], [meaning], [identification], [comment]) VALUES (@colorid, @meaning, @identification, @comment)"
        UpdateCommand="UPDATE [DM_color] SET [meaning] = @meaning, [identification] = @identification, [comment] = @comment WHERE [colorid] = @colorid">
        <DeleteParameters>
            <asp:Parameter Name="colorid" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="colorid" Type="String" />
            <asp:Parameter Name="meaning" Type="String" />
            <asp:Parameter Name="identification" Type="String" />
            <asp:Parameter Name="comment" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="meaning" Type="String" />
            <asp:Parameter Name="identification" Type="String" />
            <asp:Parameter Name="comment" Type="String" />
            <asp:Parameter Name="colorid" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
