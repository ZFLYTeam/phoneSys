using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using BuyerDataSetTableAdapters;
using DMDataSetTableAdapters;


public partial class Buyer_OrderDetail : System.Web.UI.Page
{

    protected static PagedDataSource pds = new PagedDataSource();
    string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
     
        if (Session["name"] != null)
        {
            lblOrderID.Text = Request.QueryString["orderID"].ToString();
            
            View1TableAdapter orderDA = new View1TableAdapter();
            DataTable orderDT = orderDA.GetDataByorderID(long.Parse(lblOrderID.Text));
            gvOrderInfo.DataSource = orderDT;
            gvOrderInfo.DataBind();
            if (orderDT.Rows.Count > 0)
            {
                lblAddress.Text = orderDT.Rows[0][10].ToString();
                lblOrderState.Text = orderDT.Rows[0][18].ToString();
                if (lblOrderState.Text == "交易成功")
                {
                    lblMsg1.Text = "1,如果没有收到货，或收到货后出现问题，您可以联系卖家协商解决。";
                    lblMsg2.Text = "2,如果卖家没有履行应尽的承诺，您可以“投诉维权”。";
                    lbtnConfirm.Enabled = false;
                    lbtnConfirm.Visible = false;
                    lbtnPay.Enabled = false;
                    lbtnPay.Visible = false;
                    lblReceiveTime.Text = "收货时间：" + orderDT.Rows[0][9].ToString();
                    lblSendTime.Text = "发货时间：" + orderDT.Rows[0][8].ToString();
                }
                else
                {
                    if (lblOrderState.Text == "交易关闭")
                    {

                        lblMsg1.Text = "交易已经关闭！";
                        lbtnConfirm.Enabled = false;
                        lbtnConfirm.Visible = false;
                        lbtnPay.Enabled = false;
                        lbtnPay.Visible = false;
                        lblReceiveTime.Enabled = false;
                        lblReceiveTime.Visible = false;
                        lblSendTime.Enabled = false;
                        lblSendTime.Visible = false;
                    }
                    else
                    {
                        if (lblOrderState.Text == "卖家已发货")
                        {
                            lblMsg1.Text = "1，卖家现在已经发货，请您注意物流信息，以便随时收货，";
                            lbtnConfirm.Enabled = true;
                            lbtnConfirm.Visible = true;
                            //lblReceiveTime.Text = ds.Tables[0].Rows[0][9].ToString();
                            lblSendTime.Text = "发货时间：" + orderDT.Rows[0][8].ToString();
                            lblReceiveTime.Enabled = false;
                            lblReceiveTime.Visible = false;
                            lblMsg2.Text = "2,如果卖家没有履行应尽的承诺，您可以“投诉维权”。";
                        }
                        else
                        {
                            if (lblOrderState.Text == "买家已付款")
                            {
                                lblMsg1.Text = "1，您已付款，正在等待卖家发货";
                                lbtnConfirm.Enabled = false;
                                lbtnConfirm.Visible = false;
                                lbtnPay.Enabled = false;
                                lbtnPay.Visible = false;
                                lblReceiveTime.Enabled = false;
                                lblReceiveTime.Visible = false;
                                lblSendTime.Enabled = false;
                                lblSendTime.Visible = false;
                                //lblReceiveTime.Text = ds.Tables[0].Rows[0][9].ToString();

                                lblMsg2.Text = "2,如果卖家没有履行应尽的承诺，您可以“投诉维权”。";
                            }
                            else
                            {
                                if (lblOrderState.Text == "待付款")
                                {

                                    lblMsg1.Text = "您还未付款，您可以现在就去付款。";

                                    lbtnConfirm.Enabled = false;
                                    lbtnConfirm.Visible = false;
                                    lbtnPay.Enabled = true;
                                    lbtnPay.Visible = true;
                                    lblReceiveTime.Enabled = false;
                                    lblReceiveTime.Visible = false;
                                    lblSendTime.Enabled = false;
                                    lblSendTime.Visible = false;
                                    lblMsg2.Text = "2,如果卖家没有履行应尽的承诺，您可以“投诉维权”。";
                                }
                                else
                                {
                                    if (lblOrderState.Text == "退款中的订单")
                                    {

                                        lblMsg1.Text = "正在申请退款，请及时查看您的账户，如果在交易关闭前您没有收到退款，请与我们联系。";

                                        lbtnConfirm.Enabled = false;
                                        lbtnConfirm.Visible = false;
                                        lbtnPay.Enabled = false;
                                        lbtnPay.Visible = false;
                                        lblReceiveTime.Enabled = false;
                                        lblReceiveTime.Visible = false;
                                        lblSendTime.Enabled = false;
                                        lblSendTime.Visible = false;
                                        lblMsg2.Text = "2,如果卖家没有履行应尽的承诺，您可以“投诉维权”。";
                                    }
                                }
                            }
                        }
                    }
                }
                lblTime.Text = orderDT.Rows[0][6].ToString();

                int oneprice = int.Parse(orderDT.Rows[0][16].ToString());
                int quantity = int.Parse(orderDT.Rows[0][5].ToString());
                lblPay.Text = (oneprice * quantity).ToString();

                string sellerid = orderDT.Rows[0][1].ToString();
                Guid guid = new Guid(sellerid);
                string SelectSql = "select * from V_UserInfo where UserId = '" + guid + "'";
                SqlConnection Conn = new SqlConnection(ConnSql);
                Conn.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(SelectSql, Conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblUserName.Text = ds.Tables[0].Rows[0][1].ToString();
                    lblRealName.Text = ds.Tables[0].Rows[0][8].ToString();
                    lblTelPhone.Text = ds.Tables[0].Rows[0][3].ToString();
                }
               
                Conn.Close();
            }
        }
        else
        {
            Response.Redirect("~/Public/Index.aspx");
        }
        if (!IsPostBack)
        {
            BindDatalist(0);
        }

    }
    private void BindDatalist(int currentpage)
    {
        pds.AllowPaging = true;
        pds.PageSize = 5;
        pds.CurrentPageIndex = currentpage;

        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        string SelectSql = "select top 20 * from PhoneInfo order by sell_quantity desc";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        pds.DataSource = ds.Tables[0].DefaultView;
        DataList1.DataSource = pds;
        DataList1.DataBind();
        Conn.Close();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "first":
                pds.CurrentPageIndex = 0;
                BindDatalist(pds.CurrentPageIndex);
                break;
            case "pre":
                pds.CurrentPageIndex = pds.CurrentPageIndex - 1;
                BindDatalist(pds.CurrentPageIndex);
                break;
            case "next":
                pds.CurrentPageIndex = pds.CurrentPageIndex + 1;
                BindDatalist(pds.CurrentPageIndex);
                break;
            case "last":
                pds.CurrentPageIndex = pds.PageCount - 1;
                BindDatalist(pds.CurrentPageIndex);
                break;
            case "search":
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int pageCount = int.Parse(pds.PageCount.ToString());
                    TextBox txtSkip = e.Item.FindControl("txtSkip") as TextBox;
                    int MyPageNum = 0;
                    if (!txtSkip.Text.Equals(""))
                    {
                        MyPageNum = Convert.ToInt32(txtSkip.Text.ToString());

                    }
                    if (MyPageNum <= 0 || MyPageNum > pageCount)
                    {
                        Response.Write("<script language=javascript>alert('页数不正确');</script>");
                    }
                    else
                    {
                        BindDatalist(MyPageNum - 1);
                    }
                }
                break;
        }

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label lblCurrent = e.Item.FindControl("lblCurrentPage") as Label;
            Label lblCount = e.Item.FindControl("lblCount") as Label;
            LinkButton lbtnFirst = e.Item.FindControl("lbtnFirst") as LinkButton;
            LinkButton lbtnPre = e.Item.FindControl("lbtnPre") as LinkButton;
            LinkButton lbtnNext = e.Item.FindControl("lbtnNext") as LinkButton;
            LinkButton lbtnLast = e.Item.FindControl("lbtnLast") as LinkButton;

            lblCurrent.Text = "第" + (pds.CurrentPageIndex + 1).ToString() + "页";
            lblCount.Text = "共" + pds.PageCount.ToString() + "页";
            if (pds.IsFirstPage)
            {
                lbtnFirst.Enabled = false;
                lbtnPre.Enabled = false;
            }
            if (pds.IsLastPage)
            {
                lbtnNext.Enabled = false;
                lbtnLast.Enabled = false;
            }
        }
    }

  

  
  
    protected void lbtnConfirm_Click(object sender, EventArgs e)
    {
        long orderID = new long();
        orderID = Convert.ToInt64(lblOrderID.Text);

        //修改销量
        View1TableAdapter V_order = new View1TableAdapter();
        DataTable oDT = V_order.GetDataByorderID(orderID);
        string phoneid = oDT.Rows[0][3].ToString();

        int sellquantity = int.Parse(oDT.Rows[0][26].ToString());
        PhoneInfoTableAdapter phone = new PhoneInfoTableAdapter();
        phone.UpdateSellQuantity(sellquantity + 1, long.Parse(phoneid));

        OrderInfoTableAdapter orderDA = new OrderInfoTableAdapter();
        DM_orderstateTableAdapter state = new DM_orderstateTableAdapter();
        DataTable stateDt = state.GetStateIDByMeaning("交易成功");
        if (stateDt.Rows.Count > 0)
        {
            string stateID = stateDt.Rows[0][0].ToString();
            int Corder = orderDA.UpdateConfirmTime(stateID, DateTime.Now, orderID);
            if (Corder == 1)
            {
               ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('已成功确认！');", true);
                //Response.Write("<script language=javascript>alert('已成功确认！');</script>");
                Response.Redirect("~/Buyer/Evaluation.aspx?orderID=" + orderID);
            }
            else
            {
               ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('未成功确认！');", true);
                 //Response.Write("<script language=javascript>alert('未成功确认！');</script>");
            }
        }
    }
    protected void lbtnPay_Click(object sender, EventArgs e)
    {
       // string id=Session["orderID"].ToString();
        View1TableAdapter orderDA = new View1TableAdapter();
        DataTable orderDT = orderDA.GetDataByorderID(long.Parse(lblOrderID.Text));
        if (orderDT.Rows.Count > 0)
        {
            Response.Redirect("~/Buyer/Pay.aspx?OrderId=" + lblOrderID.Text + "&OrderName=" + orderDT.Rows[0]["phone_name"].ToString() + "&Money=" + int.Parse(orderDT.Rows[0]["buy_quantity"].ToString()) * int.Parse(orderDT.Rows[0]["price"].ToString()) + "&RevName=" + Session["name"].ToString() + "&RevAddr=" + orderDT.Rows[0]["receiver_add"].ToString() + "&RevTel=" + orderDT.Rows[0]["receiver_phone"].ToString());
        }
        else
        {
            Response.Write("<script language=javascript>alert('抱歉，由于某种原因未成功付款！');</script>");
        }
    
    }


    protected void ibtnPhone_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument.ToString();
        //Session["phoneID"] = id;
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
    protected void lbtnPhoneName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        //Session["phoneID"] = id;
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }

    protected void ibtnPhonePhoto_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument.ToString();
        //Session["phoneID"] = id;
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
    protected void lbtnName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        //Session["phoneID"] = id;
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
}