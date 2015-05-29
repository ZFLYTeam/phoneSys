<%@ Page Title="" Language="C#" MasterPageFile="~/Public/Admin.master" AutoEventWireup="true" CodeFile="phonecompmanage.aspx.cs" Inherits="Admin_phonecompmanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 389px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="page-header span9 offset1">
            <h2>
            商品投诉管理
        </div>
        </h2>
    </div>
    <div class="span8" style="padding-top: 10px; text-align: right">
        <asp:DropDownList ID="ddlseltype" class="selectpicker" data-style="btn-primary" runat="server">
            <asp:ListItem>全部手机</asp:ListItem>
            <asp:ListItem>手机编号</asp:ListItem>
            <asp:ListItem>手机名</asp:ListItem>
            <asp:ListItem>手机品牌</asp:ListItem>
            <asp:ListItem>手机卖家</asp:ListItem>
            <asp:ListItem>店铺名</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtcondition" runat="server" class="input-medium search-query"></asp:TextBox>
        <asp:ImageButton ID="Iblbngoodssearch" runat="server" Height="29px" Width="75px"
            ImageUrl="~/images/usersearch.gif" />
    </div>
    <center>
        <asp:DataList ID="dlphonecomp" runat="server" Width="800px"
            DataKeyField="complaint_id" DataSourceID="sdscomphonemana"
            BackColor="LightGoldenrodYellow" BorderColor="#FF9900" BorderWidth="2px"
            CellPadding="2" ForeColor="Black"
            OnUpdateCommand="dlphonecomp_UpdateCommand"
            OnItemCommand="dlphonecomp_ItemCommand"
            OnItemDataBound="dlphonecomp_ItemDataBound"
            OnEditCommand="dlphonecomp_EditCommand">
            <AlternatingItemStyle BackColor="PaleGoldenrod" />
            <FooterStyle BackColor="Tan" />
            <FooterTemplate>
                <table id="Page" border="1" cellpadding="0" cellspacing="0"
                    style="font-size: 12px; width: 610px">
                    <tr>
                        <td>
                            <asp:Label ID="labCurrentPage" runat="server"></asp:Label>
                            /
                        <asp:Label ID="labPageCount" runat="server"></asp:Label>
                            <asp:LinkButton ID="lnkbtnFirst" runat="server" CommandName="first"
                                Font-Underline="False" ForeColor="Black">首页</asp:LinkButton>
                            <asp:LinkButton ID="lnkbtnFront" runat="server" CommandName="pre"
                                Font-Underline="False" ForeColor="Black">上一页</asp:LinkButton>
                            <asp:LinkButton ID="lnkbtnNext" runat="server" CommandName="next"
                                Font-Underline="False" ForeColor="Black">下一页</asp:LinkButton>
                            <asp:LinkButton ID="lnkbtnLast" runat="server" CommandName="last"
                                Font-Underline="False" ForeColor="Black">尾页</asp:LinkButton>
                            &nbsp;&nbsp; 跳转至：<asp:TextBox ID="txtPage" runat="server" Height="21px" Width="35px"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" CommandName="search" Height="19px"
                                Text="GO" />
                            <br />
                        </td>
                    </tr>
                </table>
            </FooterTemplate>
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <ItemTemplate>
                <div style="text-align: left; float: left; height: 150px; width: 40px; border-bottom-width: 5px; border-bottom-color: Purple;">
                    <asp:CheckBox ID="cbx" runat="server" />
                </div>
                <div style="text-align: left; float: left; height: auto;">
                    <div style="text-align: left; float: left; height: 150px; width: 100px; border-bottom-width: 5px; border-bottom-color: Purple;">
                        <div style="text-align: left; float: left; height: auto;">
                            <asp:Image ID="imgphone" runat="server" Height="80px" Width="90px"
                                ImageUrl='<%# Bind("phone_image","{0}") %>' />
                        </div>
                        <div>
                            手机名：<%# DataBinder.Eval(Container.DataItem,"phone_name")%></div>
                    </div>
                    <div style="text-align: left; float: left; height: 30px; width: 500px; border-bottom-width: 5px; border-bottom-color: Purple;">
                        <div style="text-align: left; float: left; height: 30px; width: 150px;">买家：<%# DataBinder.Eval(Container.DataItem,"UserName") %></div>
                        <div style="text-align: left; float: left; height: 30px; width: 150px;">店铺:<%# DataBinder.Eval(Container.DataItem,"shop_name")%></div>
                        <div style="text-align: left; float: left; height: 30px; width: 150px;">投诉时间：<%# DataBinder.Eval(Container.DataItem,"comptime")%></div>
                    </div>
                    <div style="text-align: left; float: left; height: 90px; width: 500px; border-bottom-width: 5px; border-bottom-color: Purple;">
                        投诉内容：<%# DataBinder.Eval(Container.DataItem,"compinfo")%><asp:LinkButton
                            ID="LinkButton1" runat="server" CommandName="Edit">LinkButton</asp:LinkButton>
                    </div>
                    <div style="text-align: left; float: left; height: 30px; width: 500px; border-bottom-width: 5px; border-bottom-color: Purple;">
                        <div style="text-align: left; float: left; height: 30px; width: 150px;"></div>
                        <div style="text-align: left; float: left; height: 30px; width: 150px;">投诉状态：<%# DataBinder.Eval(Container.DataItem,"meaning")%></div>
                        <div style="text-align: right; float: right; height: 30px; width: 180px;">
                            <asp:LinkButton ID="lbnupstate" runat="server" CommandName="Update">设为已读</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        </asp:DataList>
        <br />
        <asp:SqlDataSource ID="sdscomphonemana" runat="server"
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT * FROM [phone_complaint_manage_view1]"></asp:SqlDataSource>
    </center>
</asp:Content>

