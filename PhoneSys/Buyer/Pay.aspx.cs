using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;
using Com.Alipay;

public partial class Buyer_Pay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         Session["OrderId"] = Request.QueryString["OrderId"].ToString();         
         Session["OrderName"] = Request.QueryString["OrderName"].ToString();
         Session["Money"] = Request.QueryString["Money"].ToString();
         Session["RevName"] = Request.QueryString["RevName"].ToString();
         Session["RevAddr"] = Request.QueryString["RevAddr"].ToString();
         Session["RevTel"]  = Request.QueryString["RevTel"].ToString();
         if (Session["Money"] != null && Session["OrderId"] != null && Session["OrderName"] != null && Session["RevName"] != null && Session["RevAddr"] != null && Session["RevTel"]!=null)
        {
            lblOrderId.Text = Session["OrderId"].ToString();
            lblMoney.Text = Session["Money"].ToString();
        }
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        BuyerDSTableAdapters.OrderInfoTableAdapter orderDA = new BuyerDSTableAdapters.OrderInfoTableAdapter();
        int  orderDT = orderDA.UpdateOrderState("2", long.Parse(Session["OrderId"].ToString()));
        Response.Redirect("PaySuccess.aspx");
    }
    protected void lbtnOrderInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/OrderInfo.aspx");
    }
}