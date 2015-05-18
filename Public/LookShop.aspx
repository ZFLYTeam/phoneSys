<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="LookShop.aspx.cs" Inherits="Buyer_LookShop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
     .all
     {
         background-color:#E7D1C4;
      }
       .center_title
        {
            margin-top:20px;
            margin-left:250px;
            margin-right:150px;
            margin-bottom:2px;   
            height:25px;        
            width:900px;
            text-align:left;
        }
         .center_top
        {
            margin-top:0px;
            margin-left:250px;
            margin-right:150px;
            margin-bottom:5px;   
            height:150px;        
            width:900px;
            text-align:center;
            border-bottom:20px solid #AA857D; 
            background-color:#FAF0E6;
        }
         .center_middle
        {
            margin-top:0px;
            margin-left:250px;
            margin-right:150px;
            margin-bottom:5px;   
            height:50px;        
            width:900px;
            text-align:center;
            background-color:#CC9686;
        }
         .center_search
        {
            margin-top:0px;
            margin-left:178px;
            margin-right:150px;
            margin-bottom:5px;   
            height:50px;       
            width:722px;    
            background-color:#CC9686;
        }
           .center_recommend_title
        {
            margin-top:5px;
            margin-left:250px;
            margin-right:150px;
            margin-bottom:5px;   
            height:80px;        
            width:898px; 
            background-color:#E7D1C4;     
        }
          .center_recommend
        {
            margin-top:5px;
            margin-left:250px;
            margin-right:150px;
            margin-bottom:5px;   
            height:250px;        
            width:896px;
            text-align:center;
        }
         .center_photo_info
        { 
            height:40px;        
            width:150px;
            text-align:center;
         }
        .center_photo_left
        {
            margin-top:3px;
            margin-left:120px;
            margin-right:50px;
            margin-bottom:5px;   
            height:210px;        
            width:150px;
            text-align:center;
            float:left;
         }
          .center_photo_middle
        {
            margin-top:3px;
            margin-left:50px;
            margin-right:50px;
            margin-bottom:5px;   
            height:210px;        
            width:150px;
            text-align:center;
            float:left;
         }
           .center_photo_right
        {
            margin-top:3px;
            margin-left:50px;
            margin-right:120px;
            margin-bottom:5px;   
            height:210px;        
            width:150px;
            text-align:center;
            float:right;
         }
            .center_photo_little
        {     
            margin-top:5px;       
            margin-bottom:0px;   
            height:160px;        
            width:150px;
            text-align:center;
         }
        .center_show
        {
            border: 1px solid #FFFF00;
            margin: 5px 250px;
            height:auto;       
            width:857px;
            padding:20px;
            text-align:center;
        }
        .center_bottom
        {
            margin-top:5px;
            margin-left:250px;
            margin-right:150px;
            margin-bottom:10px;   
            height:auto;      
            width:900px;
            text-align:center;
        }
     .style1
     {
         width: 100%;
         height: 37px;
     }
     .style2
     {
         width: 75px;
     }
     .style3
     {
         width: 44px;
     }
     .style4
     {
         width: 40px;
     }
     .style5
     {
         width: 19px;
     }
     .style6
     {
         width: 54px;
     }
     .style7
     {
         width: 62px;
     }
     .style11
     {
         width: 100%;
         height: 37px;
     }
     .style12
     {
         width: 100%;
         height: 35px;
         background-color: #00FFFF;
     }
     .style13
     {
         width: 100%;
         height: 100%;
     }
     .style14
     {
          width: 300px;
     }
     .style15
     {
         width: 112px;
     }
     .style16
     {
         width: 12px;
     }
     .style17
     {
         width: 109px;
     }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
        <div class="all">
        <div class="center_title">
            <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="店铺："></asp:Label>
            <asp:Label ID="lblShopName" runat="server" ForeColor="Black"></asp:Label>
            &nbsp;<asp:Button ID="btnCollection" runat="server" BackColor="#FF8F59" 
                BorderStyle="None" ForeColor="White" Text="收藏店铺" 
                onclick="btnCollection_Click" />
        </div>
        <div class="center_top">
            <table class="style13">
                <tr>
                    <td class="style14" rowspan="4">
                        <asp:Image ID="imgShopLogo" runat="server" Height="127px" ImageAlign="Left" 
                            Width="150px" />
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="style17">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style16">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style16">
                        &nbsp;</td>
                    <td colspan="2" rowspan="2">
                       
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       
                        <asp:Image ID="Image9" runat="server" ImageUrl="~/images/logo.jpg" />
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
        <div class="center_recommend_title">
            <asp:Image ID="Image8" runat="server" ImageUrl="~/images/recommend.jpg" 
                Height="79px" />
        </div>
        <div class="center_recommend">
        <div class="center_photo_left">
        <div class="center_photo_little">
            <asp:Image ID="img1" runat="server" Height="150px" Width="100px" />
        </div>
        <div class="center_photo_info">

            <table class="style12">
                <tr>
                    <td>
                        <asp:LinkButton ID="lbtnName1" runat="server" ForeColor="White" 
                            CommandArgument="phone_id" onclick="lbtnName1_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>

        </div>
        </div>
        <div class="center_photo_middle">
         <div class="center_photo_little">
            <asp:Image ID="img2" runat="server" Height="150px" Width="100px" />
        </div>
        <div class="center_photo_info">
            <table class="style1">
                <tr>
                    <td style="background-color: #FF5050">
                        <asp:LinkButton ID="lbtnName2" runat="server" ForeColor="White" 
                            onclick="lbtnName2_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        </div>
        <div class="center_photo_right">
         <div class="center_photo_little">
            <asp:Image ID="img3" runat="server" Height="150px" Width="100px" />
        </div>
        <div class="center_photo_info">
            <table class="style11" style="background-color: #FF9428; text-align: center;">
                <tr>
                    <td>
                        <asp:LinkButton ID="lbtnName3" runat="server" ForeColor="White" 
                            onclick="lbtnName3_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
            </div> 
        </div>
      
        <div class="center_middle" >
              <div class="center_search">
            <table class="style1">
                <tr>
                    <td class="style5" rowspan="2">
                        &nbsp;</td>
                    <td class="style2" rowspan="2">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" 
                            ForeColor="#FFEB5B" Text="本店搜索" Width="70px"></asp:Label>
                    </td>
                    <td class="style3" rowspan="2">
                        <asp:TextBox ID="txtSearch" runat="server" BackColor="White" BorderStyle="None" 
                            Height="26px" Width="164px" Wrap="False"></asp:TextBox>
                    </td>
                    <td class="style7" rowspan="2">
                        &nbsp;<br />
                        &nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                            ForeColor="#FFEB5B" Text="价格"></asp:Label>
                        &nbsp;
                    </td>
                    <td class="style4" rowspan="2">
                        <asp:TextBox ID="txtLower" runat="server" BackColor="White" BorderStyle="None" 
                            Height="26px" Width="49px" Wrap="False"></asp:TextBox>
                    </td>
                    <td class="style5" rowspan="2">
                        <asp:Label ID="Label2" runat="server" ForeColor="Yellow" Text="—"></asp:Label>
                    </td>
                    <td class="style6" rowspan="2">
                        <asp:TextBox ID="txtHigher" runat="server" BackColor="White" BorderStyle="None" 
                            Height="26px" Width="49px" Wrap="False"></asp:TextBox>
                    </td>
                    <td rowspan="2" class="style15">
                        <asp:Button ID="btnSearch" runat="server" BackColor="#FFEB5B" 
                            BorderStyle="None" ForeColor="#7E0607" Height="30px" Text="搜索"
                            Width="50px" onclick="btnSearch_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
        </div>
  
        <div class="center_show">
            <asp:DataList ID="dlPhone" runat="server" RepeatColumns="4" 
                RepeatDirection="Horizontal" Width="720px" 
                onitemcommand="dlPhone_ItemCommand" 
                onitemdatabound="dlPhone_ItemDataBound">
                <FooterTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                    <asp:Label ID="lblCount" runat="server"></asp:Label>
                    <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first">首页</asp:LinkButton>
                    <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next">下一页</asp:LinkButton>
                    <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last">尾页</asp:LinkButton>
                    <asp:Label ID="lblSkip" runat="server" ForeColor="Black" Text="跳转至"></asp:Label>
                    <asp:TextBox ID="txtSkip" runat="server" Height="23px" Width="28px" 
                        Wrap="False"></asp:TextBox>
                    <asp:Button ID="btnSkip" runat="server" CommandName="search" ForeColor="Black" 
                        Height="23px" Text="Go" />
                </FooterTemplate>
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td style="text-align: center;">
                                <asp:ImageButton ID="imgbtnPhoto" runat="server"
                                    CommandArgument='<%# Eval("phone_id") %>' Height="150px" 
                                    ImageUrl='<%# Eval("phone_image") %>' Width="100px" 
                                    onclick="imgbtnPhoto_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <asp:LinkButton ID="lbtnPName" runat="server" 
                                    CommandArgument='<%# Eval("phone_id") %>' Text='<%# Eval("phone_name") %>' 
                                    onclick="lbtnPName_Click"></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <asp:Label ID="lblPrice" runat="server" Font-Size="X-Large" ForeColor="Firebrick" 
                                    Text='<%#"¥"+Eval("price") %>'></asp:Label>
                                &nbsp;&nbsp;
                                <asp:Image ID="Image6" runat="server" Height="20px" 
                                    ImageUrl="~/images/Free.jpg" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>
 
        <div class="center_bottom">
            <asp:Image ID="Image7" runat="server" Height="120px" 
                ImageUrl="~/images/shopbottom.jpg" Width="900px" />
        </div>
        </div>
   <%--     </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

