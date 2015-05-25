<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="OrderManage.aspx.cs" Inherits="Seller_OrderManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 122px;
        }
         #content
    {
        margin:0 auto;
        padding:10;
        height: auto;
        width:980px;
        border:1px solid #ff9900;
        border-bottom-style:none;
        margin-top:15px; 
        background-image:url('../images/seller2.jpg');
        font-family: 微软雅黑;  
        font-size: small; 
        margin-bottom:20px;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="content" >
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
        <fieldset> 
     
            <p>
                <strong>
                <asp:Label ID="lblTest" runat="server" Visible="False"></asp:Label>
            </strong></p>                                 
        <legend class="style9"><strong>
            <asp:Button ID="btnUnfinished" runat="server" Text="未完成订单" 
                onclick="btnUnfinished_Click" />
            <asp:Button ID="btnFinished" runat="server" Text="已完成订单" 
                onclick="btnFinished_Click" Height="26px" />
            <asp:Button ID="btnShowBoth" runat="server" Text="全部显示" 
                onclick="btnShowBoth_Click" />
            </strong></legend> 
                                      
                                       
                                 
    <p>
        <asp:DataList ID="dlistUnfinished" runat="server" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" GridLines="Both" Width="968px" 
            oncancelcommand="dlistUnfinished_CancelCommand" 
            oneditcommand="dlistUnfinished_EditCommand" 
            onitemcommand="dlistUnfinished_ItemCommand" 
            onitemdatabound="dlistUnfinished_ItemDataBound" 
            onupdatecommand="dlistUnfinished_UpdateCommand" DataKeyField="orderId" >
            <EditItemTemplate>
                <table class="style1">
                    <tr>
                        <td style="background-color: #E8F2FF">
                            订单编号：<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 订单提交时间：<asp:Label ID="lblTime" runat="server" Text='<%# Convert.ToDateTime(Eval("ordercreatetime")).ToString("yyyy年MM月dd日") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 买家：<asp:Label ID="lblBuyer" runat="server" 
                                Text='<%# Eval("buyerName") %>'></asp:Label>
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
                <br />
                下面是未发货的订单信息：<div>
                </div>
                <br />
            </HeaderTemplate>
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td colspan="6" style="background-color: #D29269; color: #333333;">
                            &nbsp; 订单编号：<asp:Label ID="lblOrderId" runat="server" 
                                Text='<%# Eval("orderId") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 成交时间：<asp:Label ID="Label1" runat="server" 
                                Text='<%# Convert.ToDateTime(Eval("ordercreatetime")).ToString("yyyy年MM月dd日") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 店铺名：<asp:Label ID="Label2" runat="server" 
                                Text='<%# Eval("shop_name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3">
                            <asp:Image ID="Image1" runat="server" Height="107px" Width="99px" 
                                ImageUrl='<%# Eval("phone_image") %>' />
                            <br />
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>
                        </td>
                        <td>
                            成交单钱</td>
                        <td>
                            个数</td>
                        <td>
                            买家姓名</td>
                        <td>
                            订单状态</td>
                        <td>
                            操作</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                            元</td>
                        <td>
                            <asp:Label ID="lblCount" runat="server" Text='<%# Eval("buy_quantity") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBuyerName" runat="server" Text='<%# Eval("buyername") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblState" runat="server" Text='<%# Eval("oderstate_content") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="取消订单" />
                            <br />
                            <br />
                            <asp:Button ID="Button2" runat="server" CommandName="Redirect" Text="现在发货" 
                                Visible='<%# Convert .ToInt32 (Eval("orderstate"))==2?true:false %>' />
                        </td>
                    </tr>
                </table>
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
    </p>
            <strong>
            <asp:Label ID="lblTest0" runat="server" Visible="False"></asp:Label>
            </strong>
            <br />
    <p>
        <asp:DataList ID="dlistFinished" runat="server" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" GridLines="Both" Width="978px" DataKeyField="orderId" 
            
            onitemcommand="dlistFinished_ItemCommand" 
            onitemdatabound="dlistFinished_ItemDataBound">
            <EditItemTemplate>
                <table class="style1">
                    <tr>
                        <td style="background-color: #E8F2FF">
                            订单编号：<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 提交时间：<asp:Label ID="lblTime" runat="server" Text='<%# Convert.ToDateTime(Eval("ordercreatetime")).ToString("yyyy年MM月dd日") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 买家：<asp:Label ID="lblBuyer" runat="server" Text='<%# Eval("buyerName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            输入取消订单的理由：<asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="753px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSure" runat="server" Text="确认" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <br />
                下面是已完成的订单信息：<br /> 
                <div>
                    <br />
                </div>
            </HeaderTemplate>
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td colspan="6" style="background-color: #D29269; color: #333333;">
                            &nbsp; 订单编号：<asp:Label ID="lblOrderId" runat="server" 
                                Text='<%# Eval("orderId") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 成交时间：<asp:Label ID="Label1" runat="server" 
                                Text='<%# Convert.ToDateTime(Eval("ordercreatetime")).ToString("yyyy年MM月dd日") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp; 店铺名：<asp:Label ID="Label2" runat="server" 
                                Text='<%# Eval("shop_name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3">
                            <asp:Image ID="imgPhone" runat="server" Height="107px" Width="99px" 
                                ImageUrl='<%# Eval("phone_image") %>' />
                            <br />
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>
                        </td>
                        <td>
                            成交单钱</td>
                        <td>
                            个数</td>
                        <td>
                            买家昵称</td>
                        <td colspan="2">
                            订单状态</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                            元</td>
                        <td>
                            <asp:Label ID="lblCount" runat="server" Text='<%# Eval("buy_quantity") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBuyerName" runat="server" Text='<%# Eval("buyername") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblState" runat="server" Text='<%# Eval("oderstate_content") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnAgree" runat="server" CommandName="agree" Text="同意退款" 
                                Visible='<%# Convert .ToInt32 (Eval("orderstate"))==6?true:false %>' />
                        </td>
                    </tr>
                </table>
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
    </p>
            <p> &nbsp;</p>    
            <p><br/>  </p>
      </fieldset>
      </div>
</asp:Content>

