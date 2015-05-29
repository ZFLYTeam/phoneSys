<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="shopcommanage.aspx.cs" Inherits="Admin_shopcommanage" %>

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
            <h2>店铺投诉管理</h2>
        </div>
        <div class="span8" style="padding-top: 10px; text-align: right">
            <asp:DropDownList ID="ddlseltype" class="selectpicker" data-style="btn-primary" runat="server">
                <asp:ListItem>全部手机</asp:ListItem>
                <asp:ListItem>待处理</asp:ListItem>
                <asp:ListItem>已处理</asp:ListItem>
                <asp:ListItem>手机名</asp:ListItem>
                <asp:ListItem>店铺名</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtcondition" runat="server" class="input-medium search-query"></asp:TextBox>
            <asp:ImageButton ID="lbncompsearch" runat="server" Height="34px" Width="75px"
                ImageUrl="~/images/usersearch.gif" OnClick="lbncompsearch_Click" />
        </div>
    </div>
    <center>
        <div style="text-align: center; min-height: 300px; margin-top: 20px; float: left; clear: right;">
            <div style="text-align: center; min-height: 300px; margin-left: 20px; margin-top: 20px; float: left; clear: right;">
                <asp:GridView ID="gdvcompmana" runat="server" AutoGenerateColumns="False"
                    DataSourceID="sdsgoodsmana" DataKeyNames="complaint_id" BackColor="White"
                    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                    Width="712px" OnRowDataBound="gdvcompmana_RowDataBound"
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
                                <div style="text-align: left; float: left; height: 30px; width: 500px; border-bottom-width: 5px; border-bottom-color: Purple;">
                                    <div style="text-align: left; float: left; height: 30px; width: 250px;">买家：<%# DataBinder.Eval(Container.DataItem,"UserName") %></div>
                                    <div style="text-align: left; float: left; height: 30px; width: 200px;">投诉时间：<%# DataBinder.Eval(Container.DataItem,"comptime")%></div>
                                </div>
                                <div style="text-align: left; float: left; height: 90px; width: 500px; border-bottom-width: 5px; border-bottom-color: Purple;">
                                    投诉内容：<%# DataBinder.Eval(Container.DataItem,"compinfo")%>
                                </div>
                                <div style="text-align: left; float: left; height: 30px; width: 500px; border-bottom-width: 5px; border-bottom-color: Purple;">
                                    <div style="text-align: left; float: left; height: 30px; width: 150px;"></div>
                                    <div style="text-align: left; float: left; height: 30px; width: 150px;">投诉状态：<%# DataBinder.Eval(Container.DataItem,"meaning")%></div>
                                    <div style="text-align: right; float: right; height: 30px; width: 180px;">
                                        <asp:LinkButton ID="lbnupstate" runat="server" CommandName="Update">设为已读</asp:LinkButton>
                                    </div>
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
        <div style="height: 40px; margin-top: 10px; width: 100%; float: left;">

            <asp:CheckBox ID="cbxselcompsall" runat="server" AutoPostBack="True"
                Text="全选" OnCheckedChanged="cbxselcompsall_CheckedChanged" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btngoodscomp" runat="server"
        Text="设为已读" OnClick="btngoodscomp_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        </div>
    </center>
</asp:Content>

