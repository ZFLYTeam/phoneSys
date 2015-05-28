<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="My_Shop.aspx.cs" Inherits="Seller_My_Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
   
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
  <div id="content">
    <div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    <br />
                   
                    &nbsp;
                    <asp:Button ID="btnPublish" runat="server" OnClick="btnPublish_Click"
                            Text=" 添加宝贝" Width="100px"  class="btn btn-green btn-publish"/>
                    <br />
                    <br />
        <asp:DataList ID="DataList1" runat="server" 
            onitemcommand="DataList1_ItemCommand" 
            onitemdatabound="DataList1_ItemDataBound" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" GridLines="Both" DataKeyField="phone_id" 
            oneditcommand="DataList1_EditCommand" 
            onupdatecommand="DataList1_UpdateCommand" Height="322px" Width="1012px" 
            oncancelcommand="DataList1_CancelCommand" 
                       >
            <EditItemTemplate>
                <table class="style1">
                    <tr>
                        <td rowspan="3">
                            <div style="height: 200px; width: 120px;">
                                <div style="margin: 0px, 5px">
                                    &nbsp;<asp:Image ID="imgPhone" runat="server" Height="160px" Width="110px"
                                        ImageUrl='<%# Eval("phone_image") %>' />
                                    <br />                                    
                                    <asp:Label ID="lblPhoneId" runat="server" Text='<%# Eval("phone_id") %>' 
                                        Visible="False" ></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td style="font-size: small">
                            名称：<asp:TextBox ID="txtName" runat="server" Height="23px" 
                                style="margin-bottom: 0px" Width="116px" Text='<%# Eval("phone_name") %>'></asp:TextBox>
                        </td>
                        <td>
                            品牌：<asp:DropDownList ID="ddlBrand" runat="server" DataSourceID="SqlDataSourceBrand" 
                                DataTextField="meaning" DataValueField="brandid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceBrand" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT [brandid], [meaning] FROM [DM_phonebrand]"></asp:SqlDataSource>
                        </td>
                        <td>
                            像素：<asp:DropDownList ID="ddlPixel" runat="server" DataSourceID="SqlDataSourcePiexl" 
                                DataTextField="meaning" DataValueField="pixelid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourcePiexl" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT [pixelid], [meaning] FROM [DM_pixel]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="5">
                            CPU:<asp:DropDownList ID="ddlCPU" runat="server" Height="16px" DataSourceID="SqlDataSourceCPU" 
                                DataTextField="meaning" DataValueField="cpuid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCPU" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT [cpuid], [meaning] FROM [DM_CPU]"></asp:SqlDataSource>
                            </td>
                        <td rowspan="3">
                            <div>
                                推荐：<br /> 
                                <asp:TextBox ID="txtIntroduction" runat="server" Height="170px" TextMode="MultiLine" 
                                    Width="107px" Text='<%# Eval("phone_introduction") %>'></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: small">
                            价格：<asp:TextBox ID="txtPrice" runat="server" Height="25px" 
                                style="margin-bottom: 0px" Width="84px" Text='<%# Eval("price") %>'></asp:TextBox>
                            元</td>
                        <td>
                            系统：<asp:DropDownList ID="ddlOS" runat="server" DataSourceID="SqlDataSourceOS" 
                                DataTextField="meaning" DataValueField="osid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceOS" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT [meaning], [osid] FROM [DM_os]"></asp:SqlDataSource>
                        </td>
                        <td>
                            屏幕：<asp:DropDownList ID="ddlScreenSize" runat="server" 
                                DataSourceID="SqlDataSourceScreen" DataTextField="meaning" 
                                DataValueField="screensizeid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceScreen" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT [screensizeid], [meaning] FROM [DM_screensize]">
                            </asp:SqlDataSource>
                        </td>
                        <td colspan="5">
                            颜色：<asp:DropDownList ID="ddlColor" runat="server" DataSourceID="SqlDataSourceColor" 
                                DataTextField="meaning" DataValueField="colorid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceColor" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT [colorid], [meaning] FROM [DM_color]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            库存：<asp:TextBox ID="txtStoreQuantity" runat="server" Height="25px" 
                                style="margin-bottom: 0px" Text='<%# Eval("store_quantity") %>' Width="84px"></asp:TextBox>
                            个</td>
                        <td>
                            版本：<asp:DropDownList ID="ddlVersion" runat="server" 
                                DataSourceID="SqlDataSourceVersion" DataTextField="meaning" 
                                DataValueField="versionid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceVersion" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT [versionid], [meaning] FROM [DM_version]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            类型：<asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSourceType" 
                                DataTextField="meaning" DataValueField="typeid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceType" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT [meaning], [typeid] FROM [DM_type]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp; </td>
                        <td>
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="更新" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </EditItemTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
<%--            <FooterTemplate>
                <div style="text-align: center">
                    <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                    /<asp:Label ID="lblPageCount" runat="server"></asp:Label>
                    &nbsp;
                    <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first">首页</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre">上一页</asp:LinkButton>
                    &nbsp;&nbsp;<asp:LinkButton ID="lbtnNext" runat="server" CommandName="next">下一页</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last">尾页</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:Label ID="lbl1" runat="server">跳转至</asp:Label>
                    第<asp:TextBox ID="txtPage" runat="server" Height="24px" Width="39px"></asp:TextBox>
                    页 
                    <asp:Button ID="btnGo" runat="server" CommandName="search" Text="GO" />
                </div>                                                                                              
            </FooterTemplate>--%>
                    <FooterTemplate>
                            <div style="text-align: center; padding-top: 20px">
                                <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                <div class="btn-group">
                                    <asp:LinkButton ID="lbtnFirst" runat="server" CommandArgument="first" CssClass="btn btn-info">首页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn btn-info">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn btn-info">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn btn-info">尾页</asp:LinkButton>
                                </div>
                                <asp:Label ID="lbl1" runat="server" Text="跳转至"></asp:Label>
                                <asp:TextBox ID="txtPage" runat="server" Width="28px"></asp:TextBox>
                                <asp:Button ID="btnGo" runat="server" CommandName="search" Text="Go" class="btn btn-primary btn-mini" />
                            </div>
                        </FooterTemplate>

            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <br />
                店铺名：<asp:Label ID="lblShopName" runat="server" ></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp; 
                开始营业时间：<asp:Label ID="lblShopStartTime" runat="server"></asp:Label>
                <br />
                <br />
                下面是店铺的所有商品信息：
            </HeaderTemplate>
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td rowspan="4" class="style2">
                            <div>
                                <br />
                                <asp:ImageButton ID="ibtnPhone" runat="server" 
                                    Height="200px" ImageUrl='<%# Eval("phone_image") %>' Width="120px" />
                                <br />
                                <br />
                                <asp:Label ID="lblPhoneId" runat="server" Text='<%# Eval("phone_id") %>' 
                                    Visible="<%# false %>"></asp:Label>
                                <br />
                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>
                                <br />
                                <asp:Button ID="btnLoad" runat="server" CommandName="load" Height="20px" 
                                    Text="上传新图片" Width="116px" />
                            </div>
                        </td>
                        <td class="style2">
                            价格</td>
                        <td class="style2">
                            库存</td>
                        <td class="style2">
                            已售</td>
                        <td class="style2">
                            品牌</td>
                        <td class="style2">
                            像素</td>
                        <td class="style2">
                            尺寸</td>
                        <td class="style2">
                            颜色</td>
                        <td class="style2">
                            操作</td>
                    </tr>
                    <tr>
                        <td class="style2" 
                            style="border-bottom-color: #8C4510; border-bottom-width: thin; border-bottom-style: solid;">
                            <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                        </td>
                        <td class="style2" 
                            style="border-bottom-color: #8C4510; border-bottom-width: thin; border-bottom-style: solid;">
                            <asp:Label ID="lblRemain" runat="server" Text='<%#Eval("store_quantity") %>'></asp:Label>
                        </td>
                        <td class="style2" 
                            style="border-bottom-color: #8C4510; border-bottom-width: thin; border-bottom-style: solid;">
                            <asp:Label ID="lblSold" runat="server" Text='<%# Eval("sell_quantity") %>'></asp:Label>
                        </td>
                        <td class="style2" 
                            style="border-bottom-color: #8C4510; border-bottom-width: thin; border-bottom-style: solid;">
                            <asp:Label ID="lblBrand" runat="server" Text='<%# Eval("brand") %>'></asp:Label>
                        </td>
                        <td class="style2" 
                            style="border-bottom-color: #8C4510; border-bottom-width: thin; border-bottom-style: solid;">
                            <asp:Label ID="lblPiexl" runat="server" Text='<%# Eval("piexl") %>'></asp:Label>
                        </td>
                        <td class="style2" 
                            style="border-bottom-color: #8C4510; border-bottom-width: thin; border-bottom-style: solid;">
                            <asp:Label ID="lblSize" runat="server" Text='<%# Eval("screenSize") %>'></asp:Label>
                        </td>
                        <td class="style2" 
                            style="border-bottom-color: #8C4510; border-bottom-width: thin; border-bottom-style: solid;">
                            <asp:Label ID="lblColor" runat="server" Text='<%# Eval("color") %>'></asp:Label>
                        </td>
                        <td class="style2" rowspan="3">
                            <asp:Button ID="btnEdit" runat="server" Height="28px"  
                                Text="编辑" Width="46px" CommandName="Edit" />
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="btnDel" runat="server" Height="28px"  
                                Text="下架" Width="46px" CommandName="Delete" 
                                onclientclick="return confirm(&quot;该商品确认要下架吗？&quot;)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            类型</td>
                        <td class="style2">
                            版本</td>
                        <td class="style2">
                            CPU</td>
                        <td class="style2">
                            系统</td>
                        <td class="style2">
                            推荐</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="lblType" runat="server" Text='<%# Eval("mobiletype") %>'></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="lblVersion" runat="server" Text='<%# Eval("phoneVersion") %>'></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="lblCPU" runat="server" Text='<%# Eval("cpu") %>'></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="lblOS" runat="server" Text='<%# Eval("os") %>'></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                                Text='<%# Eval("phone_introduction") %>' TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div></div>
    </div>
    </center>
</asp:Content>

