<%@ Page Title="" Language="C#" MasterPageFile="~/Public/style.master" AutoEventWireup="true" CodeFile="LookEvaluation.aspx.cs" Inherits="Buyer_LookEvaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
 #content
    {
        margin:0 auto;
        padding:0;
        height:100%;
        width:860px;
 
        margin-top:15px;
        margin-bottom:15px;
        text-align:center;
    }
         #info
    {
        height:32px;
        width:860px;
        background-color:#eeeee0;
        line-height:32px;
        font-family:黑体;
        font-size:32px;
        color:#333;
        border:1px solid #ff9900;       
    }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<div id="content">
<div id="info">所有评价</div>
<asp:GridView ID="gvEvaluation" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" onpageindexchanging="gvEvaluation_PageIndexChanging" 
        PageSize="6" BorderColor="#DEBA84" BackColor="#DEBA84" BorderStyle="None" 
        BorderWidth="1px" CellPadding="3" CellSpacing="2"  >
    <Columns>
        <asp:TemplateField HeaderText="评价信息" >
            <ItemTemplate >   
             <div style="text-align:left;float:left;height:80px;width:200px;"> 
                <div style="text-align:left;float:left;height:10px;width:200px;"> </div>
            <div> <asp:Label ID="lblEvaluationInfo" runat="server" Text='<%# Bind("estinfo","{0}") %>' ></asp:Label></div>
              <div> [<asp:Label ID="lblETime" runat="server" Text='<%# Bind("esttime","{0}") %>' ></asp:Label>]</div>
                    </div>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="被评价人">
            <ItemTemplate>   
             <div style="text-align:left;float:left;height:80px;width:100px;"> 
              <div style="text-align:left;float:left;height:20px;width:200px;"> </div>
                <asp:LinkButton ID="lbtnShop" runat="server"  CommandArgument='<%# Eval("shopId") %>' Text='<%# Bind("shop_name","{0}") %>' ForeColor="Blue" onclick="lbtnShop_Click"
                   ></asp:LinkButton>
                   </div>
            </ItemTemplate>
        </asp:TemplateField>
    
 <asp:TemplateField HeaderText="手机信息">
            <ItemTemplate>   
             <div style="text-align:left;float:left;height:80px;width:200px;"> 
              <div style="text-align:left;float:left;height:10px;width:200px;"> </div>
               <div> <asp:LinkButton ID="lbtnPhone" runat="server" ForeColor="Blue"  CommandArgument='<%# Eval("phone_id") %>' Text='<%# Bind("phone_name","{0}") %>' onclick="lbtnPhone_Click" ></asp:LinkButton></div>
                <div> <asp:Label ID="lblPhonePrice" runat="server" Text='<%# Bind("price","{0}") %>' 
                    ></asp:Label>元</div>
                    </div>
            </ItemTemplate>
        </asp:TemplateField>
<asp:TemplateField HeaderText="卖家回复">
            <ItemTemplate>   
             <div style="text-align:left;float:left;height:80px;width:200px;"> 
              <div style="text-align:left;float:left;height:5px;width:200px;"> </div>
                   <div>       <asp:Label ID="lblReply" runat="server" Text='<%# Bind("replyInfo","{0}") %>' ></asp:Label></div>
                    <div> <asp:Label ID="lblRTime" runat="server"  ></asp:Label></div>
                    </div>
              <div>   <asp:Label ID="lblShow" runat="server" ForeColor="Red" Text="还未回复" ></asp:Label></div>
                    </div>
            </ItemTemplate>
        </asp:TemplateField>
      
    </Columns>
    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#FFF1D4" />
    <SortedAscendingHeaderStyle BackColor="#B95C30" />
    <SortedDescendingCellStyle BackColor="#F1E5CE" />
    <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
</div>
</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

