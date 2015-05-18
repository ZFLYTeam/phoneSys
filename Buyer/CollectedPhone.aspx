<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="CollectedPhone.aspx.cs" Inherits="Buyer_CollectedPhone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width:250px;
        }
        .center_top
        {
            margin-top:10px;
            margin-left:250px;
            margin-right:250px;
            margin-bottom:0px;   
            height:20px;        
            width:830px;
            background-color:#EAEDF1;
            padding:10px;
            text-align:left;
        }
        .center_bottom
        {
            margin-top:0px;
            margin-left:250px;
            margin-right:250px;
            margin-bottom:10px;   
            height:auto;        
            width:830px;
            padding:20px;
            text-align:center;
        }
        .image
        {
            text-align:center;
            margin-left:250px;
            margin-right:250px;
         }
        .style2
        {
            height: 20px;
            text-align: center;
        }
        .style3
        {
            text-align: center;
        }
        .style4
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="center_top">
            <asp:CheckBox ID="cbAll" runat="server" Text=" 全选" 
                oncheckedchanged="cbAll_CheckedChanged" AutoPostBack="True" 
                ForeColor="Black" />
            <asp:ImageButton ID="imgbtnDel" runat="server" ImageUrl="~/images/delete.jpg" 
                onclick="imgbtnDel_Click" />
         </div>
         <div class="center_bottom">
            <asp:DataList ID="dlCPhone" runat="server" RepeatColumns="5" 
                RepeatDirection="Horizontal" Height="200px" Width="900px" 
                 onitemcommand="dlCPhone_ItemCommand" onitemdatabound="dlCPhone_ItemDataBound">
                <FooterTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                    <asp:Label ID="lblCount" runat="server"></asp:Label>
                    <asp:LinkButton ID="lbtnFirst" runat="server" CommandArgument="first">首页</asp:LinkButton>
                    <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next">下一页</asp:LinkButton>
                    <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last">尾页</asp:LinkButton>
                    <asp:Label ID="lblSkip" runat="server" Text="跳转至"></asp:Label>
                    <asp:TextBox ID="txtSkip" runat="server" Width="28px"></asp:TextBox>
                    <asp:Button ID="btnSkip" runat="server" CommandName="search" Text="Go" 
                        Width="25px" />
                </FooterTemplate>
                <ItemTemplate>
                    <table class="style1" align="left">
                        <tr>
                            <td class="style3" 
                                style="border-top-style: solid; border-top-width: thin; border-top-color: #C0C0C0; border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0; border-left-style: solid; border-left-width: thin; border-left-color: #C0C0C0">
                                <asp:ImageButton ID="imgbtnPhoto" runat="server" Height="150px" 
                                    ImageAlign="TextTop" onclick="imgbtnPhoto_Click" Width="100px" 
                                    CommandArgument='<%# Eval("phone_id") %>' 
                                    ImageUrl='<%# Eval("phone_image") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" 
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0; border-left-style: solid; border-left-width: thin; border-left-color: #C0C0C0">
                                <asp:LinkButton ID="lbtnPName" runat="server" Font-Size="Medium" 
                                    Font-Underline="True" ForeColor="#0033CC" onclick="lbtnPName_Click" 
                                    CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>'></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #C0C0C0; border-left-color: #C0C0C0; border-left-width: thin; border-left-style: solid; ">
                                <asp:Label ID="lblPrice" runat="server" ForeColor="Red" 
                                    Text='<%# "¥ "+Eval("price") %>'></asp:Label>
                                <asp:Label ID="lblHidden" runat="server" Text='<%# Eval("phone_id") %>' 
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" 
                                style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; border-right-color: #C0C0C0; border-right-width: thin; border-right-style: solid; border-left-style: solid; border-left-width: thin; border-left-color: #C0C0C0">
                                <asp:CheckBox ID="cbSel" runat="server"  AutoPostBack="True"/>
                                <asp:ImageButton ID="imgbtnDelOne" runat="server" 
                                    ImageUrl="~/images/deleteicon.gif" onclick="imgbtnDelOne_Click" 
                                    ToolTip="删除" CommandArgument='<%# Eval("phone_id") %>' 
                                    CommandName="delOne" />
                                <asp:ImageButton ID="imgbtnInCart" runat="server" 
                                    ImageUrl="~/images/inCart.jpg" onclick="imgbtnInCart_Click" 
                                    ToolTip="加入购物车" CommandArgument='<%# Eval("phone_id") %>' />
                                <asp:ImageButton ID="imgbtnEnterShop" runat="server" Height="19px" 
                                    ImageUrl="~/images/EnterShop.jpg" onclick="imgbtnEnterShop_Click" 
                                    ToolTip="进入店铺" CommandArgument='<%# Eval("shopId") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
             <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />

        </div>
        <div class="center_bottom">
            <asp:Panel ID="Panel1" runat="server">
            <div class="image">

                <table class="style4">
                    <tr>
                        <td rowspan="3">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/notfound.jpg" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Bold="False" Text="还没收藏任何商品！"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>

            </div>
            </asp:Panel>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

