<%@ Page Title="" Language="C#" MasterPageFile="~/Public/index.master" AutoEventWireup="true"
    CodeFile="MoreGoods.aspx.cs" Inherits="Public_MoreGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid">
        <asp:DataList ID="dlPhone" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
            OnItemCommand="dlPhone_ItemCommand" OnItemDataBound="dlPhone_ItemDataBound">
            <ItemTemplate>
                <div style="text-align: center;width:280px">
                    <div class="thumbnail" style="margin-top: 5px">
                        <asp:ImageButton ID="imgbtnPhoto" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                            Height="198px" ImageUrl='<%# Eval("phone_image") %>'  OnClick="imgbtnPhoto_Click" />
                        <div class="caption">
                            <div style="height: 40px">
                                <h5>
                                    <asp:LinkButton ID="lbtnPName" runat="server" CommandArgument='<%# Eval("phone_id") %>'
                                        Text='<%# Eval("phone_name") %>' OnClick="lbtnPName_Click"></asp:LinkButton>
                                    <asp:Label ID="lblPrice" runat="server" Font-Size="X-Large" ForeColor="Firebrick"
                                        Text='<%#"¥"+Eval("price") %>'></asp:Label>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
            </ItemTemplate>
            <FooterTemplate>
                <div class="row">
                    <div class="span2">
                    </div>
                    <div class="span2">
                        <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                        <asp:Label ID="lblCount" runat="server"></asp:Label></div>
                    <div class="span4">
                        <div class="btn-toolbar">
                            <div class="btn-group" style="display: inline">
                            </div>
                            <div class="btn-group">
                                <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="first" CssClass="btn">首页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnPre" runat="server" CommandName="pre" CssClass="btn">上一页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnNext" runat="server" CommandName="next" CssClass="btn">下一页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnLast" runat="server" CommandName="last" CssClass="btn">尾页</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="span3">
                        <asp:Label ID="lblSkip" runat="server" ForeColor="Black" Text="跳转至"></asp:Label>
                        <asp:TextBox ID="txtSkip" runat="server" Width="35px" Wrap="False" BorderWidth="1px"></asp:TextBox>
                        &nbsp;<asp:Button ID="btnSkip" runat="server" CommandName="search" Text="Go" CssClass="btn btn-small btn-primary" /></div>
                </div>
            </FooterTemplate>
        </asp:DataList>
    </div>
</asp:Content>
