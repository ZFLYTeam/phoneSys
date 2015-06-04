<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="Screenmanage.aspx.cs" Inherits="Admin_Screenmanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:50px;text-align:center;color:#000; margin-top:30px; font-size:30px; font-family:@华文彩云">
        屏幕尺寸管理
    </div>
        <div style=" text-align:right;">
        <asp:Button ID="txtaddscreen" runat="server" Text="添加" 
            onclick="txtaddscreen_Click" CssClass="btn btn-success"/>
    </div>
    <div>
    <center>
        <asp:GridView ID="gdvscreen" runat="server" AutoGenerateColumns="False" 
            Height="150px" Width="420px" DataSourceID="sds_screen" 
            BorderColor="#CC9966" BorderStyle="None" CellPadding="4" 
            DataKeyNames="screensizeid" PageSize="8" 
            onrowdatabound="gdvscreen_RowDataBound" BackColor="White" 
            BorderWidth="1px">
            <Columns>
                <asp:BoundField HeaderText="尺寸编号" ReadOnly="True" DataField="screensizeid" >
                <HeaderStyle Height="30px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="尺寸大小" DataField="meaning" />
                <asp:CommandField HeaderText="修改" ShowEditButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>

        </asp:GridView>
    </center></div>
        <asp:SqlDataSource ID="sds_screen" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            DeleteCommand="DELETE FROM [DM_screensize] WHERE [screensizeid] = @screensizeid" 
            InsertCommand="INSERT INTO [DM_screensize] ([screensizeid], [meaning], [identification], [comment]) VALUES (@screensizeid, @meaning, @identification, @comment)" 
            SelectCommand="SELECT * FROM [DM_screensize]" 
            
        UpdateCommand="UPDATE [DM_screensize] SET [meaning] = @meaning, [identification] = @identification, [comment] = @comment WHERE [screensizeid] = @screensizeid">
            <DeleteParameters>
                <asp:Parameter Name="screensizeid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="screensizeid" Type="String" />
                <asp:Parameter Name="meaning" Type="String" />
                <asp:Parameter Name="identification" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="meaning" Type="String" />
                <asp:Parameter Name="identification" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="screensizeid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

