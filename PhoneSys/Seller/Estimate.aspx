<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="Estimate.aspx.cs" Inherits="Seller_Estimate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="span12">
            <div class="page-header">
                <span style="font-size: 40px;">评价管理 </span>
                <asp:Button ID="btnOnlyBuyer" runat="server" Text="买家已评" OnClick="btnOnlyBuyer_Click"
                    Width="110px" CssClass="btn btn-success" Style="float: right; margin-left: 10px;" />
                <asp:Button ID="btnBoth" runat="server" Text="双方互评" OnClick="btnBoth_Click" Width="110px"
                    CssClass="btn btn-success" Style="float: right; padding-left: 10px" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6 offset3">
            <asp:DataList ID="DataList1" runat="server" OnCancelCommand="DataList1_CancelCommand"
                OnEditCommand="DataList1_EditCommand" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound"
                OnUpdateCommand="DataList1_UpdateCommand" DataKeyField="estimate_id">
                <HeaderTemplate>
                    下面是买家已评，等待回复的评价内容：<br />
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="well">
                        买家：<asp:Label ID="lblBuyer" runat="server" Text='<%# Eval("estiname") %>'></asp:Label>
                        商品：<asp:Label ID="lblGoodsName" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>
                        订单号：<asp:Label ID="lblOrderID" runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblEstiTime" runat="server" Text='<%# Eval("esttime") %>'></asp:Label>
                        买家评价:<asp:Label ID="TextBox1" runat="server" ReadOnly="True" Text='<%# Eval("estinfo") %>'></asp:Label>
                        <asp:Label ID="lblEstId" runat="server" Text='<%# Eval("estimate_id") %>' Visible="False"></asp:Label>
                        <asp:Button ID="btnResponse" runat="server" Text="回复" class="btn btn-info" CommandName="Edit" />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="well">
                        订单编号：<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                        买家：<asp:Label ID="lblBuyer" runat="server" Text='<%# Eval("estiname") %>'></asp:Label><br />
                        输入评价内容：<asp:TextBox ID="txtReply" runat="server" TextMode="MultiLine" Width="380px"></asp:TextBox><br />
                        <asp:Button ID="btnSure" runat="server" Text="确认" CommandName="Update" CssClass="btn btn-success" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger"
                            Text="取消" />
                    </div>
                </EditItemTemplate>
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
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </div>
    </div>
    <div id="content">
        <center>
            <fieldset>
                <div class="row">
                    <div class="span6 offset3">
                        <strong>
                            <asp:Label ID="lblShowMsg" runat="server"></asp:Label>
                            <br />
                        </strong>
                        <br />
                        <asp:DataList ID="DataList2" runat="server" OnItemCommand="DataList1_ItemCommand"
                            OnItemDataBound="DataList1_ItemDataBound" DataKeyField="estimate_id">
                            <HeaderTemplate>
                                下面是双方互评的评价内容：<br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                商品名:<asp:Label ID="lblGoodsName" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label><br />
                                订单号:<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("order_id") %>'></asp:Label><br />
                                买家评价:<asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("estinfo") %>' TextMode="MultiLine"
                                    Width="197px" ReadOnly="True" Enabled="False"></asp:TextBox>
                                <asp:Label ID="lblBuyer" runat="server" Text='<%# Eval("estiname") %>'></asp:Label>
                                回复时间：<asp:Label ID="lblEstiTime" runat="server" Text='<%# Eval("esttime") %>'></asp:Label><br />
                                本人回复:<asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("replyInfo") %>' TextMode="MultiLine"
                                    Width="197px" ReadOnly="True"></asp:TextBox>
                                回复时间：<asp:Label ID="lblReplyTime" runat="server" Text='<%# Eval("replytime") %>'></asp:Label>
                                <asp:Label ID="lblEstId" runat="server" Text='<%# Eval("estimate_id") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
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
                        </asp:DataList>
            </fieldset>
        </center>
    </div>
</asp:Content>
