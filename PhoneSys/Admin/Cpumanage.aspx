<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true"
    CodeFile="Cpumanage.aspx.cs" Inherits="Admin_Cpumanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 50px; text-align: center; margin-top: 30px; font-size: 30px;
        font-family: @华文彩云; color: #000;">
        手机核心数管理
    </div>
    <div style="text-align: right;">
        <asp:Button ID="txtaddcpu" runat="server" Text="添加" OnClick="txtaddcpu_Click" CssClass="btn btn-success" />
    </div>
    <div>
        <center>
            <asp:GridView ID="gdvcpu" runat="server" AutoGenerateColumns="False" Height="150px"
                Width="519px" DataSourceID="sds_cpu" BorderColor="#CC9966" BorderStyle="None"
                CellPadding="4" DataKeyNames="cpuid" PageSize="8" OnRowDataBound="gdvcpu_RowDataBound"
                BackColor="White" BorderWidth="1px">
                <Columns>
                    <asp:BoundField HeaderText="内核编号" ReadOnly="True" DataField="cpuid">
                        <HeaderStyle Height="30px" />
                        <ItemStyle Height="30px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="核心数" DataField="meaning" />
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
    <asp:SqlDataSource ID="sds_cpu" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT [cpuid], [meaning], [comment] FROM [DM_CPU]" DeleteCommand="DELETE FROM [DM_CPU] WHERE [cpuid] = @cpuid"
        InsertCommand="INSERT INTO [DM_CPU] ([cpuid], [meaning], [comment]) VALUES (@cpuid, @meaning, @comment)"
        UpdateCommand="UPDATE [DM_CPU] SET [meaning] = @meaning, [comment] = @comment WHERE [cpuid] = @cpuid">
        <DeleteParameters>
            <asp:Parameter Name="cpuid" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="cpuid" Type="String" />
            <asp:Parameter Name="meaning" Type="String" />
            <asp:Parameter Name="comment" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="meaning" Type="String" />
            <asp:Parameter Name="comment" Type="String" />
            <asp:Parameter Name="cpuid" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
