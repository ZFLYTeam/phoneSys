<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="OrderManage.aspx.cs" Inherits="Seller_OrderManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div class="row">
        <div class="span12">
            <div class="page-header">
                <h1>
                    订单信息</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span4 offset3">
            <div class="form-horizontal">
                <div class="control-group">
                    <asp:Button ID="btnUnfinished" runat="server" Text="未完成订单" OnClick="btnUnfinished_Click"
                        CssClass="btn btn-success" />
                    <asp:Button ID="btnFinished" runat="server" Text="已完成订单" OnClick="btnFinished_Click"
                        CssClass="btn btn-success" />
                    <asp:Button ID="btnShowBoth" runat="server" Text="全部显示" OnClick="btnShowBoth_Click"
                        CssClass="btn btn-success" />
                </div>
            </div>
        </div>
        <div id="content">
            <fieldset>
                <div class="row">
                    <div class="span8 offset2 ">
                        <strong>
                            <asp:Label ID="lblTest" runat="server" Visible="False"></asp:Label>
                        </strong>
                        <asp:DataList ID="dlistUnfinished" runat="server" OnCancelCommand="dlistUnfinished_CancelCommand"
                            OnEditCommand="dlistUnfinished_EditCommand" OnItemCommand="dlistUnfinished_ItemCommand"
                            OnItemDataBound="dlistUnfinished_ItemDataBound" OnUpdateCommand="dlistUnfinished_UpdateCommand"
                            DataKeyField="orderId">
                            <EditItemTemplate>
                            <hr />
                                订单编号：<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>&nbsp;&nbsp;
                                订单提交时间：<asp:Label ID="lblTime" runat="server" Text='<%# Convert.ToDateTime(Eval("ordercreatetime")).ToString("yyyy年MM月dd日") %>'></asp:Label>&nbsp;&nbsp;
                                买家：<asp:Label ID="lblBuyer" runat="server" Text='<%# Eval("buyerName") %>'></asp:Label>&nbsp;&nbsp;
                                <asp:Button ID="btnSure" runat="server" Text="确认" CommandName="Update" CssClass="btn btn-danger " />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="取消" CssClass="btn btn-success" />
                            </EditItemTemplate>
                            <HeaderTemplate>
                                下面是未发货的订单信息：<br />
                            </HeaderTemplate>
                            <ItemTemplate>
                            <hr />
                                店铺名：<asp:Label ID="Label2" runat="server" Text='<%# Eval("shop_name") %>'></asp:Label>
                                <asp:Image ID="Image1" runat="server" Height="107px" Width="99px" ImageUrl='<%# Eval("phone_image") %>' /><br />
                                <br />
                                订单编号：<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>&nbsp;&nbsp;
                                
                                成交时间：<asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("ordercreatetime")).ToString("yyyy年MM月dd日") %>'></asp:Label>&nbsp;&nbsp;
                                
                                手机名称：<asp:Label ID="lblName" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>&nbsp;&nbsp;
                                
                                成交单钱:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'>元 </asp:Label>&nbsp;&nbsp;

                                个数:<asp:Label ID="lblCount" runat="server" Text='<%# Eval("buy_quantity") %>'></asp:Label>&nbsp;&nbsp;

                                买家姓名:<asp:Label ID="lblBuyerName" runat="server" Text='<%# Eval("buyername") %>'></asp:Label><br />

                                订单状态:<asp:Label ID="lblState" runat="server" Text='<%# Eval("oderstate_content") %>'></asp:Label>&nbsp;&nbsp;

                                <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="取消订单" CssClass="btn btn-danger" />
                                <asp:Button ID="Button2" runat="server" CommandName="Redirect" Text="现在发货" CssClass="btn btn-success"
                                    Visible='<%# Convert .ToInt32 (Eval("orderstate"))==2?true:false %>' />
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
                    </div>
                </div>
                <div class="row">
                    <div class="span8 offset2">
                        <strong>
                            <asp:Label ID="lblTest0" runat="server" Visible="False"></asp:Label>
                        </strong>
                        <asp:DataList ID="dlistFinished" runat="server" DataKeyField="orderId" OnItemCommand="dlistFinished_ItemCommand"
                            OnItemDataBound="dlistFinished_ItemDataBound">
                            <EditItemTemplate>
                            <hr />
                                订单编号：<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>
                                提交时间：<asp:Label ID="lblTime" runat="server" Text='<%# Convert.ToDateTime(Eval("ordercreatetime")).ToString("yyyy年MM月dd日") %>'></asp:Label>
                                买家：<asp:Label ID="lblBuyer" runat="server" Text='<%# Eval("buyerName") %>'></asp:Label>
                                输入取消订单的理由：<asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="753px"></asp:TextBox>
                                <asp:Button ID="btnSure" runat="server" Text="确认" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="取消" />
                            </EditItemTemplate>
                            <HeaderTemplate>
                                下面是已完成的订单信息：<br />
                            </HeaderTemplate>
                            <ItemTemplate>
                            <hr />
                                店铺名：<asp:Label ID="Label2" runat="server" Text='<%# Eval("shop_name") %>'></asp:Label>
                                <asp:Image ID="imgPhone" runat="server" Height="107px" Width="99px" ImageUrl='<%# Eval("phone_image") %>' /><br />
                                <br />
                                订单编号：<asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>&nbsp;&nbsp;
                                
                                成交时间：<asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("ordercreatetime")).ToString("yyyy年MM月dd日") %>'></asp:Label>&nbsp;&nbsp;
                               
                                手机名称：<asp:Label ID="lblName" runat="server" Text='<%# Eval("phone_name") %>'></asp:Label>&nbsp;&nbsp;
                                
                                成交单钱：<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>&nbsp;&nbsp;
                            
                                个数：<asp:Label ID="lblCount" runat="server" Text='<%# Eval("buy_quantity") %>'>元</asp:Label>&nbsp;&nbsp;
                               
                                买家昵称：<asp:Label ID="lblBuyerName" runat="server" Text='<%# Eval("buyername") %>'></asp:Label><br />
                               
                                订单状态：<asp:Label ID="lblState" runat="server" Text='<%# Eval("oderstate_content") %>'></asp:Label>
                                <br />
                                <br />
                                <br />
                                <br />
                                <asp:Button ID="btnAgree" runat="server" CommandName="agree" Text="同意退款" Visible='<%# Convert .ToInt32 (Eval("orderstate"))==6?true:false %>' />
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
                            </FooterTemplate> <FooterTemplate>
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
                        </p>
                        <p>
                            &nbsp;</p>
                        <p>
                            <br />
                        </p>
                    </div>
                </div>
            </fieldset>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
