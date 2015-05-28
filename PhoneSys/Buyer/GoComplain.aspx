<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="GoComplain.aspx.cs" Inherits="Buyer_GoComplain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #content
        {
            margin: 0 auto;
            padding: 0;
            height: 940px;
            width: 860px;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        #info
        {
            height: 32px;
            width: 860px;
            background-color: #eeeee0;
            line-height: 32px;
            font-family: 黑体;
            font-size: 16px;
            color: #333;
        }
        #info1
        {
            height: 32px;
            width: 860px;
            background-color: #eeeee0;
            line-height: 32px;
            font-family: 黑体;
            font-size: 16px;
            color: #333;
        }
        #info2
        {
            height: 96px;
            width: 860px;
            background-color: #eeeee0;
            line-height: 32px;
            font-family: 黑体;
            font-size: 16px;
            color: #333;
        }
        #info3
        {
            height: 32px;
            width: 860px;
            background-color: #eeeee0;
            line-height: 32px;
            font-family: 黑体;
            font-size: 16px;
            color: #333;
        }
        #cont
        {
            height: 300px;
            width: 860px;
        }
        
        .style1
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="content">
                <br />
                <asp:Label ID="lblSellerID" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblBuyerID" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblPhoneID" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblShopID" runat="server" Visible="False"></asp:Label>
                <br />
                <div id="info">
                    投诉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    卖家：<asp:LinkButton ID="lbtnSeller" runat="server" OnClick="lbtnSeller_Click" ForeColor="Blue"></asp:LinkButton>
                </div>
                <div id="cont">
                    <div style="text-align: left; float: left; height: 200px; width: 800px;">
                        <div style="text-align: left; float: left; height: 200px; width: 130px;">
                        </div>
                        <div style="text-align: left; float: left; height: 160px; width: 110px;">
                            <br />
                            <br />
                            <asp:DataList ID="dlPhone" runat="server" DataSourceID="sdsPhoneByOrderID" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <div style="text-align: left; float: left; height: 110px; width: 100px;">
                                        <asp:ImageButton ID="ibtnPhone" runat="server" OnClick="ibtnPhone_Click" ImageUrl='<%# Bind("phone_image","{0}") %>'
                                            Height="100px" Width="80px" CommandArgument='<%# Eval("phone_id") %>' />
                                    </div>
                                    <br />
                                    &nbsp;&nbsp;
                                    <div style="text-align: left; float: left; height: 30px; width: 100px;">
                                        <asp:LinkButton ID="lbtnPhoneName" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                            Text='<%# Eval("phone_name") %>' OnClick="lbtnPhoneName_Click" ForeColor="Blue"
                                            Font-Names="宋体" Font-Size="Medium"></asp:LinkButton></div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                        <div style="text-align: left; float: left; height: 200px; width: 70px;">
                        </div>
                        <div style="text-align: left; float: left; height: 200px; width: 450px;">
                            <br />
                            <br />
                            <div>
                                投诉内容：<br />
                                <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Height="121px" Width="434px"></asp:TextBox>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span class="style1">限500字</span></div>
                        </div>
                        <br />
                        <div style="text-align: left; float: left; height: 5px; width: 850px;">
                        </div>
                        <div style="text-align: center;">
                            <asp:ImageButton ID="ibtnComplain" runat="server" ImageUrl="~/images/botton_004.jpg"
                                OnClick="ibtnComplain_Click" Height="36px" /></div>
                        &nbsp;<asp:SqlDataSource ID="sdsPhoneByOrderID" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                            SelectCommand="SELECT * FROM [View1] WHERE ([orderId] = @orderId)">
                            <SelectParameters>
                                <asp:SessionParameter Name="orderId" SessionField="orderID" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div id="info3">
                    热销商品
                </div>
                <br />
                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand"
                    OnItemDataBound="DataList1_ItemDataBound">
                    <ItemTemplate>
                        <div style="text-align: left; float: left; height: 200px; width: 150px;">
                            <asp:ImageButton ID="ibtnPhonePhoto" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                ImageUrl='<%# Eval("phone_image") %>' nclick="ibtnPhonePhoto_Click" Height="95px"
                                Width="70px" />
                            <%-- <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("phone_image","{0}") %>' Height="80px" Width="90px" />--%>
                        </div>
                        <br />
                        &nbsp;&nbsp;
                        <div style="text-align: left; float: left; height: 40px; width: 90px;">
                            <asp:LinkButton ID="lbtnName" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                Text='<%# Eval("phone_name") %>' OnClick="lbtnName_Click" ForeColor="Blue" Font-Names="宋体"
                                Font-Size="Medium"></asp:LinkButton></div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div style="text-align: center; margin-top: 50px">
                            <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                            <asp:Label ID="lblCount" runat="server"></asp:Label>
                            <div class="btn-group">
                                <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first" CssClass="btn btn-primary">首页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn btn-primary">上一页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn btn-primary">下一页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn btn-primary">尾页</asp:LinkButton>
                            </div>
                            <asp:Label ID="lblSkip" runat="server">跳转至</asp:Label>
                            <asp:TextBox ID="txtSkip" runat="server" Height="16px" Width="30px"></asp:TextBox>
                            <asp:Button ID="btnSkip" runat="server" CommandName="search" CssClass="btn btn-danger"
                                Text="Go" />
                        </div>
                    </FooterTemplate>
                </asp:DataList>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
