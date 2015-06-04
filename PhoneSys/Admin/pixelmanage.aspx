<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="pixelmanage.aspx.cs" Inherits="Admin_pixelmanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="height:50px;text-align:center;color:#000; margin-top:30px; font-size:30px; font-family:@华文彩云">
    手机分辨率管理
    </div>
        <div style=" text-align:right;">
        <asp:Button ID="txtaddpixel" runat="server" Text="添加" 
            onclick="txtaddpixel_Click" CssClass="btn btn-success"/>
    </div>
    <div>
    <center>
        <asp:GridView ID="gdvpixel" runat="server" AutoGenerateColumns="False" 
            Height="150px" Width="362px" DataSourceID="sds_pixel" 
            BorderColor="#CC9966" BorderStyle="None"  CellPadding="4" 
            DataKeyNames="pixelid" PageSize="8" onrowdatabound="gdvpixel_RowDataBound" 
            BackColor="White" BorderWidth="1px">
            <Columns>
                <asp:BoundField HeaderText="分辨率编号" ReadOnly="True" DataField="pixelid" >
                <HeaderStyle Height="30px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="分辨率含义" DataField="meaning" />
                <asp:CommandField HeaderText="修改" ShowEditButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            
        </asp:GridView>
    </center></div>
        <asp:SqlDataSource ID="sds_pixel" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            DeleteCommand="DELETE FROM [DM_pixel] WHERE [pixelid] = @pixelid" 
            InsertCommand="INSERT INTO [DM_pixel] ([pixelid], [meaning], [identification], [comment]) VALUES (@pixelid, @meaning, @identification, @comment)" 
            SelectCommand="SELECT * FROM [DM_pixel]" 
            
        UpdateCommand="UPDATE [DM_pixel] SET [meaning] = @meaning, [identification] = @identification, [comment] = @comment WHERE [pixelid] = @pixelid">
            <DeleteParameters>
                <asp:Parameter Name="pixelid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pixelid" Type="String" />
                <asp:Parameter Name="meaning" Type="String" />
                <asp:Parameter Name="identification" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="meaning" Type="String" />
                <asp:Parameter Name="identification" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="pixelid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

