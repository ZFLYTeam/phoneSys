<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="CollectedShop.aspx.cs" Inherits="Buyer_CollectedShop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
        }
        .center_bottom
        {
            margin-top:0px;
            margin-left:250px;
            margin-right:300px;
            margin-bottom:10px;   
            height:auto;        
            width:830px;
            padding:20px;
        }
        .image
        {
            margin-left:250px;
            margin-right:250px;
            text-align:center;
         }
        .style1
     {
         width: 100%;
         border: 1px solid #DDE4EC;
         height:150px;
     }
     .style3
     {}
     .style4
     {
         width: 120px;
         height: 160px;
     }
        .style5
     {
         width: 129px;
         margin-top:0px;
         padding-top:0px;
     }
       .style6
     {
         width: 360px;
         height: 128px;
     }
        .style7
     {
         text-align: center;
         width:120px;
         height:150px;
     }
        .style9
     {
         text-align: center;
         height: 30px;
         width:120px;
     }
        .style10
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
                oncheckedchanged="cbAll_CheckedChanged" AutoPostBack="True" />
            <asp:ImageButton ID="imgbtnDelete" runat="server" Height="24px" 
                ImageUrl="~/images/delete.jpg" onclick="imgbtnDelete_Click" />
         </div>
         <div class="center_bottom">
             <asp:DataList ID="dlShop" runat="server" RepeatColumns="1" 
                 RepeatDirection="Horizontal" onitemdatabound="dlShop_ItemDataBound" 
                 DataKeyField="shop_id" Height="200px" Width="900px" 
                 onitemcommand="dlShop_ItemCommand">

                 <FooterTemplate>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                     <asp:Label ID="lblCount" runat="server"></asp:Label>
                     <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first">首页</asp:LinkButton>
                     <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre">上一页</asp:LinkButton>
                     <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next">下一页</asp:LinkButton>
                     <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last">尾页</asp:LinkButton>
                     <asp:Label ID="lblSkip" runat="server" Text="跳转至"></asp:Label>
                     <asp:TextBox ID="txtSkip" runat="server" Width="30px"></asp:TextBox>
                     <asp:Button ID="btnSkip" runat="server" CommandName="search" Text="Go" />
                 </FooterTemplate>

                 <ItemTemplate>
                     <table class="style1">
                         <tr>
                             <td class="style5" rowspan="2">
                                 <table class="style4">
                                     <tr>
                                         <td dir="ltr" valign="middle">
                                             <asp:CheckBox ID="cbSel" runat="server" />
                                             <asp:ImageButton ID="imgbtnDelOne" runat="server" 
                                                 CommandArgument='<%# Eval("shop_id") %>' ImageUrl="~/images/deleteicon.gif" 
                                                 onclick="imgbtnDelOne_Click" ToolTip="删除" />
                                             <br />
                                             <asp:Image ID="imgLogo" runat="server" AlternateText="淘" BorderColor="#CCCCCC" 
                                                 BorderStyle="Solid" BorderWidth="1px" ForeColor="#FF8000" 
                                                 GenerateEmptyAlternateText="True" Height="90px" ImageAlign="Middle" 
                                                 ImageUrl='~/images/tao.jpg' Width="100px" />
                                             <br />
                                         </td>
                                     </tr>
                                     <tr>
                                         <td dir="ltr" valign="middle">
                                             <asp:LinkButton ID="lbtnShopName" runat="server" 
                                                 CommandArgument='<%# Eval("shop_id") %>' Font-Underline="True" 
                                                 ForeColor="#CC6600" onclick="lbtnShopName_Click" 
                                                 Text='<%# Eval("shop_name") %>'></asp:LinkButton>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td dir="ltr" valign="middle">
                                             <asp:Label ID="lblHidden" runat="server" Text='<%# Eval("shop_id") %>' 
                                                 Visible="False"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td dir="ltr" valign="middle">
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td dir="ltr" valign="middle">
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td dir="ltr" valign="middle">
                                             &nbsp;</td>
                                     </tr>
                                 </table>
                                
                             </td>
                             <td>
                                 <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-Bold="False" 
                                     Font-Names="楷体" Font-Size="Large" ForeColor="Red" Height="19px" Text="【本店热销】" 
                                     Width="117px"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="style3">
                                 <table class="style6">
                                     <tr>
                                         <td>
                                             <asp:DataList ID="dlPhoneInShop" runat="server" 
                                                 RepeatColumns="3" 
                                                 RepeatDirection="Horizontal" Width="800px" Height="146px">
                                                 <ItemTemplate>
                                                     <table class="style4">
                                                         <tr>
                                                             <td class="style7">
                                                                 <asp:ImageButton ID="imgbtnPhoto" runat="server" 
                                                                     CommandArgument='<%# Eval("phone_id") %>' Height="150px" 
                                                                     ImageUrl='<%# Eval("phone_image") %>' onclick="imgbtnPhoto_Click" 
                                                                     Width="100px" />
                                                             </td>
                                                         </tr>
                                                         <tr>
                                                             <td class="style9">
                                                                 <asp:LinkButton ID="lbtnPName" runat="server" 
                                                                     CommandArgument='<%# Eval("phone_id") %>' ForeColor="#0033CC" 
                                                                     onclick="lbtnPName_Click" Text='<%# Eval("phone_name") %>' 
                                                                     Font-Underline="True"></asp:LinkButton>
                                                             </td>
                                                         </tr>
                                                         <tr>
                                                             <td class="style9">
                                                                 <asp:Label ID="lblPrice" runat="server" ForeColor="Red" 
                                                                     Text='<%# "¥ "+Eval("price") %>'></asp:Label>
                                                             </td>
                                                         </tr>
                                                     </table>
                                                 </ItemTemplate>
                                             </asp:DataList>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                 </table>
                             </td>
                         </tr>
                     </table>
                 </ItemTemplate>

             </asp:DataList>
         </div>
         <div class="center_bottom">
             <asp:Panel ID="Panel1" runat="server">
             <div class="image">

                 <table class="style10">
                     <tr>
                         <td rowspan="3">
                             <asp:Image ID="Image1" runat="server" ImageUrl="~/images/notfound.jpg" />
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label3" runat="server" Text="您还未收藏店铺！"></asp:Label>
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

