<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="goodscompmanage.aspx.cs" Inherits="Admin_goodscompmanage" %>

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
            <h2>投诉管理</h2>
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
            <asp:Button ID="btncompsearch" runat="server" class="btn btn-success"
                OnClick="btncompsearch_Click" Text="搜索" />
        </div>
    </div>
    <center style="min-height: 600px;">
        
        
        <div style="text-align: center; min-height: 300px; margin-top: 20px;">

            <asp:GridView ID="gdvcompmana" runat="server" AutoGenerateColumns="False"
                DataSourceID="sdsgoodsmana" DataKeyNames="complaint_id" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" Width="712px" OnRowDataBound="gdvcompmana_RowDataBound"
                OnRowUpdating="gdvcompmana_RowUpdating" EmptyDataText="查询结果为空">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbxselphoneid" runat="server" />
                            <asp:Label ID="lblgoods" runat="server" Visible="False"
                                Text='<%# Bind("complaint_id","{0}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="40px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="text-align: left; float: left; height: 150px; width: 100px; border-bottom-width: 5px; border-bottom-color: Purple;">
                                <div style="text-align: left; float: left; height: auto;">
                                    <asp:Image ID="imgphone" runat="server" Height="80px" Width="90px"
                                        ImageUrl='<%# Bind("phone_image","{0}") %>' />
                                </div>
                                <div>
                                    手机名：<%# DataBinder.Eval(Container.DataItem,"phone_name")%></div>
                            </div>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="text-align: left; float: left; height: 30px; width: 500px; border-bottom-width: 5px; border-bottom-color: Purple;">
                                <div style="text-align: left; float: left; height: 30px; width: 150px;">买家：<%# DataBinder.Eval(Container.DataItem,"UserName") %></div>
                                <div style="text-align: left; float: left; height: 30px; width: 150px;">店铺:<%# DataBinder.Eval(Container.DataItem,"shop_name")%></div>
                                <div style="text-align: left; float: left; height: 30px; width: 150px;">投诉时间：<%# DataBinder.Eval(Container.DataItem,"comptime")%></div>
                            </div>
                            <div style="text-align: left; float: left; height: 90px; width: 500px; border-bottom-width: 5px; border-bottom-color: Purple;">
                                投诉内容：<%# DataBinder.Eval(Container.DataItem,"compinfo")%></div>
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
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" Font-Size="Large"
                    ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsgoodsmana" runat="server"
                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                SelectCommand="SELECT * FROM [phone_complaint_manage_view1]"></asp:SqlDataSource>

        </div>
        <div style="margin-left: 20%; height: 40px;">

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

