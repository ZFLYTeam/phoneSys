<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="shopexamine.aspx.cs" Inherits="Admin_shopexamine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .selectitem {
            border-color: Red;
            border-style: solid;
            border-left-width: 2px;
            border-top-width: 2px;
            border-bottom-width: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="page-header span9 offset1">
            <h2>店铺审核管理</h2>
        </div>
        <div class="span8" style="padding-top: 10px; text-align: right">
            <asp:DropDownList ID="ddlexamtype" class="selectpicker" data-style="btn-primary" runat="server">
                <asp:ListItem>--全部--</asp:ListItem>
                <asp:ListItem>未审核</asp:ListItem>
                <asp:ListItem>通过审核</asp:ListItem>
                <asp:ListItem>未通过</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtexamcondition" runat="server" class="input-medium search-query"></asp:TextBox>
            <asp:ImageButton ID="btnsearchexam" runat="server" Height="34px" Width="75px"
                ImageUrl="~/images/usersearch.gif" OnClick="btnsearchexam_Click" />
        </div>
    </div>
    <center>
        <div style="text-align: center; height: 40px; margin-top: 20px; font-size: 40px; margin-bottom: 20px;">
        </div>

        <div style="text-align: center; margin-top: 20px; width: 92%; height: auto;">
            <asp:SqlDataSource ID="sdsexamshop" runat="server"
                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                SelectCommand="SELECT [shop_id], [shop_name], [shop_jianjie], [shop_owner], [UserName], [realname], [Idcard_photo], [meaning] FROM [examshop_shopinfo_extend_view]"></asp:SqlDataSource>
            <asp:GridView ID="gdvexamshop" runat="server" AutoGenerateColumns="False"
                DataKeyNames="shop_id" DataSourceID="sdsexamshop" Height="180px"
                Width="667px" CellPadding="4" ForeColor="#333333"
                EmptyDataText="你查询的结果不存在，请查看查询条件！" AllowPaging="True" BorderStyle="Double"
                BorderWidth="4px" PageSize="4" OnRowDataBound="gdvexamshop_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbxselshop" runat="server" />
                            <asp:Label ID="lblsign" runat="server" Text='<%# Bind("shop_id","{0}") %>'
                                Visible="False"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Height="30px" />
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="图片">
                        <ItemTemplate>
                            <div style="margin-top: 5px; margin-bottom: 5px;">
                                <asp:Image ID="Image1" runat="server"
                                    ImageUrl='<%# Bind("Idcard_photo", "{0}") %>' Height="80px" Width="75px" />
                            </div>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="用户名" DataField="UserName" />
                    <asp:BoundField HeaderText="真实姓名" DataField="realname" />
                    <asp:BoundField HeaderText="店铺名" DataField="shop_name">
                        <ItemStyle Width="200px" />
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
            <br />
        </div>


        <div style="min-height: 200px; float: left; width: 100%; height: 53px;">
            <div style="float: left; margin-left: 15%; width: 70px; height: 26px;">

                <asp:CheckBox ID="cbxselall" runat="server" Text="全选" AutoPostBack="True"
                    OnCheckedChanged="cbxselall_CheckedChanged" />

            </div>
            <div style="float: left; width: 231px; height: 26px;">
                <asp:Panel ID="pnlexam" runat="server" Width="198px">
                    <asp:Button ID="btnpass" runat="server" Text="通过审核" OnClick="btnpass_Click" />
                    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnnopass" runat="server" Text="不通过" OnClick="btnnopass_Click" />
                </asp:Panel>

            </div>
            <div style="float: left; width: 140px; height: 26px;">

                <asp:Button ID="btnresetpass" runat="server" OnClick="btnresetpass_Click"
                    Text="设为通过" Visible="False" />

            </div>
        </div>
    </center>
</asp:Content>

