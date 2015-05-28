<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="ApplyShop.aspx.cs" Inherits="Buyer_ApplyShop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="page-header span12">
                    <h1>
                        个人开店</h1>
                </div>
            </div>
            <div class="row span6 offset2">
                <div class="alert alert-error">
                    <button type="button" class="close" data-dismiss="alert">
                        &times;</button>
                    <strong>提示!</strong>
                    <asp:Label ID="lblTips" runat="server" Text="为了保证您的申请能尽快通过，请认真填写以下信息："></asp:Label>
                </div>
                <table class="style1">
                    <tr>
                        <td class="style12">
                        </td>
                        <td class="style11" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                        </td>
                        <td class="style5">
                            <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="店铺名："></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:TextBox ID="txtShopName" runat="server" Height="25px" Width="170px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td class="style5">
                            <asp:Label ID="Label2" runat="server" Text="店铺Logo："></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:FileUpload ID="fulShopLogo" runat="server" />
                            &nbsp;<asp:Button ID="btnPreViewLogo" runat="server" OnClick="btnPreViewLogo_Click"
                                Text="预览" CssClass="btn btn-success"  Width="70px" />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td class="style5">
                            &nbsp;
                        </td>
                        <td class="style9">
                            <fieldset class="style10">
                                <legend>图片预览</legend>
                                <asp:Image ID="imgLogo" runat="server" Height="120px" Width="150px" Visible="False" />
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td class="style3">
                            <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="身份证照："></asp:Label>
                        </td>
                        <td class="style8">
                            <asp:FileUpload ID="fulIdPhoto" runat="server" EnableViewState="False" />
                            <asp:Button ID="btnPreViewId" runat="server" OnClick="btnPreViewId_Click" Text="预览"
                               CssClass="btn btn-success" Width="70px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style8">
                            <fieldset class="style10">
                                <legend>图片预览</legend>
                                <asp:Image ID="imgIdPhoto" runat="server" Height="120px" Width="150px" Visible="False" />
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                        </td>
                        <td class="style7">
                        </td>
                        <td class="style7">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSubmit" runat="server" BackColor="#F17E3D" BorderColor="#F86D1C"
                                Font-Bold="True" Font-Size="Large" ForeColor="White" Height="33px" Text="提交"
                                Width="81px" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
