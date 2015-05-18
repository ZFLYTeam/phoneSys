<%@ Page Title="" Language="C#" MasterPageFile="~/Public/index.master" AutoEventWireup="true" CodeFile="MoreGoods.aspx.cs" Inherits="Public_MoreGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <script src="../js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="../js/scrollToTop.js" type="text/javascript"></script>

    <link href="../css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function MInitDiv() {

            var obj1 = document.getElementById("divBoxImage");
            var obj2 = document.getElementById(event.srcElement.id);
            obj1.src = obj2.src;

            if (obj1.width <= 380) {
                obj1.width = 600;
            }

            if (obj1.height <= 380) {
                obj1.height = 700;
            }

        }
        function MMove() {

            var div = document.getElementById("divBox");
            div.style.display = "";
            var obj = document.getElementById("divBoxImage");

            var offx = obj.width / event.srcElement.width;
            var offy = obj.height / event.srcElement.height;

            div.scrollLeft = (event.offsetX * offx);
            div.scrollTop = (event.offsetY * offy);

        }

        function MHide() {

            var div = document.getElementById("divBox");
            div.style.display = "none";
        }

        function changePic() {
            getdoc("targetImage").src = event.srcElement.src;
            $(".spimg").each(function () {
                $(this).removeClass("spimg");
            })
            $(this).addClass("spimgborder");

        }


        //end 放大镜js代码

        function getdoc(id) {
            return document.getElementById(id);
        }
        function showStar(index) {
            for (var i = 1; i <= 5; i++) {
                var obj = getdoc("star" + i);
                if (i <= index) {
                    obj.src = "images/star.png";
                }
                else {
                    obj.src = "images/unstar.png";
                }
            }
        }
</script>
    <style type="text/css">
       .center_bottom
        {
            margin-top:10px;
            margin-bottom:50px;            
            width:950px;
            border:2px solid #cc0000;
            padding:20px;
            font:normal 12px "楷体";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
     <div class="scroll" id="scroll" style="display:none;">
		    回<br/>到<br/>顶<br/>部
	     </div>
     <div class="center_bottom">
    <asp:DataList ID="dlPhone" runat="server" RepeatColumns="5" 
                RepeatDirection="Horizontal" Width="949px" 
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
                    <asp:TextBox ID="txtSkip" runat="server" Height="23px" Width="35px" 
                        Wrap="False" BorderWidth="1px"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnSkip" runat="server" CommandName="search" ForeColor="Black" 
                        Height="23px" Text="Go" BackColor="#FF3300" BorderColor="#669900" 
                        BorderWidth="1px" Width="35px" />
                </FooterTemplate>
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td style="text-align: center;">
                                <asp:ImageButton ID="imgbtnPhoto" runat="server" 
                                    CommandArgument='<%# Eval("phone_id") %>' Height="150px" ImageUrl='<%# Eval("phone_image") %>' Width="100px" 
                                    onclick="imgbtnPhoto_Click"/>
<%--                                    <a href="GoodsInfo.aspx?PhoneId=<%#Eval("phone_id") %>">
                                    <img  alt="" id="" height="150px" onload="MInitDiv();" onmousemove="MMove();" onmouseout="MHide();" 
                                        src='<%#Eval("phone_image") %>' width="100px" /></a>--%>
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
        </div>
</asp:Content>

