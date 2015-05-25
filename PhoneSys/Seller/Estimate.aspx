<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="Estimate.aspx.cs" Inherits="Seller_Estimate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">       
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: right;
        }
         #content
    {
        margin:0 auto;
        padding:0;
        height: auto;
        width:980px;
        border:1px solid #ff9900;
        border-bottom-style:none;
        margin-top:15px;
        margin-bottom:20px; 
        background-image:url('../images/seller2.jpg');
        font-family: 微软雅黑;   
        font-size:small;       
    }
        .style3
        {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <p> &nbsp;</p>    
 <div id="content">     
     <center>
      <fieldset> 
     
        <legend class="style9"><strong>
            <asp:Button ID="btnOnlyBuyer" runat="server" Text="买家已评" 
                BorderColor="#009933" BorderStyle="Solid" 
                onclick="btnOnlyBuyer_Click" BackColor="#009933" Font-Italic="False" 
                Font-Names="微软雅黑" Font-Size="Medium" ForeColor="White" />
            &nbsp;<asp:Button ID="btnBoth" runat="server" Text="双方互评" 
                BorderColor="#009933" BorderStyle="Solid" onclick="btnBoth_Click" 
                BackColor="#009933" Font-Names="微软雅黑" Font-Size="Medium" 
                ForeColor="White" />
            </strong></legend> 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><br />
          <br />
            </strong>&nbsp;<strong><asp:Label ID="lblShowMsg" runat="server"></asp:Label>
            <br />
            </strong>
          <br />
        <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" GridLines="Both" Width="827px"  
              oncancelcommand="DataList1_CancelCommand" oneditcommand="DataList1_EditCommand" 
              onitemcommand="DataList1_ItemCommand" onitemdatabound="DataList1_ItemDataBound" 
              onupdatecommand="DataList1_UpdateCommand" DataKeyField="estimate_id" 
               >
            <EditItemTemplate>
                <table class="style1">
                    <tr>
                        <td style="background-color: #E8F2FF">
                            订单编号：<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 买家：<asp:Label ID="lblBuyer" runat="server" 
                                Text='<%# Eval("estiname") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            输入评价内容：<asp:TextBox ID="txtReply" runat="server" Height="30px" Width="753px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSure" runat="server" Text="确认" CommandName="Update" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                &nbsp;&nbsp;<br />下面是买家已评，等待回复的评价内容：<br /><div style="width:440px;"></div>
            </HeaderTemplate>
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td rowspan="2">
                            买家评价:<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                                Text='<%# Eval("estinfo") %>' Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            买家：<asp:Label ID="lblBuyer" runat="server" Text='<%# Eval("estiname") %>'></asp:Label>
                            </td>
                        <td>
                            <asp:Label ID="lblGoodsName" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>
                        </td>
                        <td rowspan="2">
                            <asp:Button ID="btnResponse" runat="server" Text="回复" CommandName="Edit" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEstiTime" runat="server" Text='<%# Eval("esttime") %>'></asp:Label>
                        </td>
                        <td>
                            订单号：<asp:Label ID="lblOrderID" runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
                <div class="style2">
                    <br />
                    <asp:Label ID="lblEstId" runat="server" Text='<%# Eval("estimate_id") %>' 
                        Visible="False"></asp:Label>
                </div>
            </ItemTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <FooterTemplate>
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
            </FooterTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:DataList ID="DataList2" runat="server" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" GridLines="Both" Width="832px" 
              onitemcommand="DataList1_ItemCommand" 
              onitemdatabound="DataList1_ItemDataBound" DataKeyField="estimate_id" >
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <div></div><br /> 下面是双方互评的评价内容：<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
            </HeaderTemplate>
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            买家评价:<asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("estinfo") %>' 
                                TextMode="MultiLine" Width="197px" ReadOnly="True" Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblBuyer" runat="server" Text='<%# Eval("estiname") %>'></asp:Label>
                            ：<asp:Label ID="lblEstiTime" runat="server" Text='<%# Eval("esttime") %>'></asp:Label>
                            </td>
                        <td>
                            商品名:<asp:Label ID="lblGoodsName" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
                <div class="style2">
                    <table class="style1">
                        <tr>
                            <td rowspan="2">
                                本人回复:<asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("replyInfo") %>' 
                                    TextMode="MultiLine" Width="197px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td rowspan="2">
                                回复时间：<asp:Label ID="lblReplyTime" runat="server" 
                                    Text='<%# Eval("replytime") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                订单号:<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                                <asp:Label ID="lblEstId" runat="server" Text='<%# Eval("estimate_id") %>' 
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>
            </ItemTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <FooterTemplate>
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
            </FooterTemplate>  
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
    </fieldset>
    </center>
    </div>
</asp:Content>

