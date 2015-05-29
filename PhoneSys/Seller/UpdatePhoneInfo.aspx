<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true"
    CodeFile="UpdatePhoneInfo.aspx.cs" Inherits="Seller_UpdatePhoneInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="content">
            <div class="row">
                <div class="span12">
                    <div class="page-header">
                        <span style="font-size: 40px;">上传新头像</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span8 offset1">
                    手机名：<asp:Label ID="txtphonename" runat="server"></asp:Label><br />
                    <div style="text-align: center; width: 80%; height: 150px; margin-top: 20px; margin-bottom: 20px">
                        <div style="text-align: right; width: 53%; float: left; height: 30px;">
                            更改图像：</div>
                        <div style="text-align: left; width: 18%; float: left; height: 150px;">
                            <asp:Image ID="Imgpic" runat="server" Height="150px" Width="120px" />
                        </div>
                        <div style="text-align: left; width: 20%; float: left; height: 100px;">
                            <asp:FileUpload ID="fudImg" runat="server" Width="181px" Height="29px" />
                            <br />
                            <br />
                            <asp:Button ID="btnpreview" runat="server" Text="预览" CssClass="btn btn-danger" OnClick="btnpreview_Click" />
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <asp:Button ID="btnUpdate" CssClass="btn btn-danger" runat="server" Style="margin-left: 234px" 
                            Text="&nbsp;&nbsp;更新信息&nbsp;&nbsp;" OnClick="btnPublic_Click1" />
                        <asp:Button ID="btnCheck" CssClass="btn btn-success" runat="server" Text="去店铺查看"
                            OnClick="btnCheck_Click" />
                    </div>
                </div>
            </div>
        </div>
    </center>
</asp:Content>
