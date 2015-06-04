<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="Osmanage.aspx.cs" Inherits="Admin_Osmanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:50px;text-align:center; margin-top:30px; font-size:30px; font-family:@华文彩云;color:#000;">
        操作系统管理
    </div>
        <div style=" text-align:right;">
        <asp:Button ID="txtaddos" runat="server" Text="添加" 
            onclick="txtaddos_Click" CssClass="btn btn-success" Width="85px"/>
    </div>
    <div>
    <center>
        <asp:GridView ID="gdvos" runat="server" AutoGenerateColumns="False" 
            Height="150px" Width="438px" DataSourceID="sds_os" 
            BorderColor="#CC9966" BorderStyle="None" 
            onrowdatabound="gdvos_RowDataBound" CellPadding="4" 
            DataKeyNames="osid" PageSize="8" BackColor="White" BorderWidth="1px">
            <Columns>
                <asp:BoundField HeaderText="系统编号" ReadOnly="True" DataField="osid" >
                <HeaderStyle Height="30px" />
                <ItemStyle Height="30px" Width="100px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="系统名称" DataField="meaning" />
                <asp:CommandField HeaderText="修改" ShowEditButton="True" >
                <ControlStyle ForeColor="#0066CC" />
                </asp:CommandField>
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                <ControlStyle ForeColor="#0066CC" />
                </asp:CommandField>
            </Columns>
            
        </asp:GridView>
    </center></div>
        <asp:SqlDataSource ID="sds_os" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            DeleteCommand="DELETE FROM [DM_os] WHERE [osid] = @osid" 
            InsertCommand="INSERT INTO [DM_os] ([osid], [meaning], [identification], [comment]) VALUES (@osid, @meaning, @identification, @comment)" 
            SelectCommand="SELECT * FROM [DM_os]" 
            
        UpdateCommand="UPDATE [DM_os] SET [meaning] = @meaning, [identification] = @identification, [comment] = @comment WHERE [osid] = @osid">
            <DeleteParameters>
                <asp:Parameter Name="osid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="osid" Type="String" />
                <asp:Parameter Name="meaning" Type="String" />
                <asp:Parameter Name="identification" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="meaning" Type="String" />
                <asp:Parameter Name="identification" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="osid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

