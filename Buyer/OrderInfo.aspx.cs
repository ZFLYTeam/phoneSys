using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

using DMDataSetTableAdapters;
using BuyerDataSetTableAdapters;

public partial class Buyer_OrderInfo : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();
    string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["name"] != null)
        {
            imgTubiao.Visible = false;
            lblShowMassage.Visible = false;

            BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
            DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
            if (userdDT.Rows.Count != 0)
            {
                Session["buyerID"] = userdDT.Rows[0][1].ToString();
            }
 
          SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();
            string SelectSql = "select * from View1 where goodsbuyer = '" +System.Guid.Parse( Session["buyerID"].ToString()) + "' order by orderId desc";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gvOrderInfo.DataSource = ds.Tables[0];
            gvOrderInfo.DataBind();
            int waitpay = 0, waitConfirm = 0;
            if (gvOrderInfo.Rows.Count > 0)
            {
                int i ;
                for (i = 0;i< gvOrderInfo.Rows.Count ; i++)
                {
                    CheckBox chbSelect = (CheckBox)gvOrderInfo.Rows[i].FindControl("chbSelect");
                    Label lblPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblPrice");
                    Label lblQuantity = (Label)gvOrderInfo.Rows[i].FindControl("lblQuantity");
                    Label lblTotalPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblTotalPrice");
                    int price = int.Parse(lblPrice.Text);
                    int quantity = int.Parse(lblQuantity.Text);
                    lblTotalPrice.Text = (price * quantity).ToString();
                    Label lblOrderID = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderID");
                    Label lblOrderState = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderState");
                    LinkButton lbtnPay = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnPay");
                    LinkButton lbtnCancel = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnCancel");
                    LinkButton lbtnConfirm = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnConfirm");
                    LinkButton lbtnAddEvaluation = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnAddEvaluation");
                    Label lblEvaluated = (Label)gvOrderInfo.Rows[i].FindControl("lblEvaluated");
                    LinkButton lbtnGoToEvaluate = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnGoToEvaluate");
                    //lbtnAddEvaluation
                    if (lblOrderState.Text == "待付款")
                    {
                        waitpay++;
                        lbtnConfirm.Enabled = false;
                        lbtnConfirm.Visible = false;
                        lbtnAddEvaluation.Enabled = false;
                        lbtnAddEvaluation.Visible = false;
                        lblEvaluated.Enabled = false;
                        lblEvaluated.Visible = false;
                        lbtnGoToEvaluate.Enabled = false;
                        lbtnGoToEvaluate.Visible = false;

                    }
                    else
                    {
                        if (lblOrderState.Text == "买家已付款")
                        {
                            waitConfirm++;
                            lbtnPay.Enabled = false;
                            lbtnPay.Visible = false;
                            chbSelect.Enabled = false;
                            lbtnAddEvaluation.Enabled = false;
                            lbtnAddEvaluation.Visible = false;
                            lblEvaluated.Enabled = false;
                            lblEvaluated.Visible = false;
                            lbtnGoToEvaluate.Enabled = false;
                            lbtnGoToEvaluate.Visible = false;
                            lbtnConfirm.Enabled = false;
                            lbtnConfirm.Visible = false;
                       
                        }
                        else
                        {
                            if (lblOrderState.Text == "卖家已发货")
                            {
                                waitConfirm++;
                                lbtnPay.Enabled = false;
                                lbtnPay.Visible = false;
                                chbSelect.Enabled = false;
                                lbtnAddEvaluation.Enabled = false;
                                lbtnAddEvaluation.Visible = false;
                                lblEvaluated.Enabled = false;
                                lblEvaluated.Visible = false;
                                lbtnGoToEvaluate.Enabled = false;
                                lbtnGoToEvaluate.Visible = false;
                                lbtnCancel.Enabled = false;
                                lbtnCancel.Visible = false;
                            }
                            else
                            {
                                if (lblOrderState.Text == "交易成功")
                                {
                                    lbtnPay.Enabled = false;
                                    lbtnPay.Visible = false;
                                    lbtnCancel.Enabled = false;
                                    lbtnCancel.Visible = false;
                                    lbtnConfirm.Enabled = false;
                                    lbtnConfirm.Visible = false;
                                    chbSelect.Enabled = false;
                                    EstimateInfoTableAdapter estimateDA = new EstimateInfoTableAdapter();
                                    DataTable estimateDT = estimateDA.GetEvaluationByOrderId(long.Parse(lblOrderID.Text));
                                    if (estimateDT.Rows.Count > 0)
                                    {
                                       
                                        lbtnGoToEvaluate.Enabled = false;
                                        lbtnGoToEvaluate.Visible = false;
                                    }
                                    else
                                    { 
                                        lblEvaluated.Enabled = false;
                                        lblEvaluated.Visible = false;
                                        lbtnAddEvaluation.Enabled = false;
                                        lbtnAddEvaluation.Visible = false;
                                    }
                                    
                                }
                                else 
                                {
                                    if (lblOrderState.Text == "退款中的订单")
                                    {
                                        lbtnPay.Enabled = false;
                                        lbtnPay.Visible = false;
                                        lbtnCancel.Enabled = false;
                                        lbtnCancel.Visible = false;
                                        lbtnConfirm.Enabled = false;
                                        lbtnConfirm.Visible = false;
                                        chbSelect.Enabled = false;
                                        lbtnAddEvaluation.Enabled = false;
                                        lbtnAddEvaluation.Visible = false;
                                        lblEvaluated.Enabled = false;
                                        lblEvaluated.Visible = false;
                                        lbtnGoToEvaluate.Enabled = false;
                                        lbtnGoToEvaluate.Visible = false;
                                    }
                                    else
                                    {
                                        if (lblOrderState.Text == "交易关闭")
                                        {
                                            lbtnPay.Enabled = false;
                                            lbtnPay.Visible = false;
                                            lbtnCancel.Enabled = false;
                                            lbtnCancel.Visible = false;
                                            lbtnConfirm.Enabled = false;
                                            lbtnConfirm.Visible = false;
                                            chbSelect.Enabled = false;
                                            lbtnAddEvaluation.Enabled = false;
                                            lbtnAddEvaluation.Visible = false;
                                            lblEvaluated.Enabled = false;
                                            lblEvaluated.Visible = false;
                                            lbtnGoToEvaluate.Enabled = false;
                                            lbtnGoToEvaluate.Visible = false;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    //Session["orderID"] = lblOrderID.Text;
                }
               
            }
            else
            {
                imgTubiao.Visible = true;
                lblShowMassage.Visible = true;
                lblShowMassage.Text = "没有找到相关订单";
            }
            lbtnWaitPay.Text = "待付款（" + waitpay.ToString() + ")";
            lbtnWaitConfirm.Text = "待确认收货（" + waitConfirm.ToString() + ")";
            Conn.Close();
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblShowMassage.Visible = false;
      
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        string SelectSql = "select * from View1 where goodsbuyer = '" + System.Guid.Parse(Session["buyerID"].ToString()) + "' and phone_name like '%" + txtPhoneName.Text + "%' order by orderId desc";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvOrderInfo.DataSource = ds.Tables[0];
        gvOrderInfo.DataBind();
        if (gvOrderInfo.Rows.Count > 0)
        {
            int i;
            for (i = 0; i < gvOrderInfo.Rows.Count; i++)
            {
                CheckBox chbSelect = (CheckBox)gvOrderInfo.Rows[i].FindControl("chbSelect");
                Label lblPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblPrice");
                Label lblQuantity = (Label)gvOrderInfo.Rows[i].FindControl("lblQuantity");
                Label lblTotalPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblTotalPrice");
                int price = int.Parse(lblPrice.Text);
                int quantity = int.Parse(lblQuantity.Text);
                lblTotalPrice.Text = (price * quantity).ToString();
                Label lblOrderID = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderID");
                Label lblOrderState = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderState");
                LinkButton lbtnPay = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnPay");
                LinkButton lbtnCancel = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnCancel");
                LinkButton lbtnConfirm = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnConfirm");
                LinkButton lbtnAddEvaluation = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnAddEvaluation");
                Label lblEvaluated = (Label)gvOrderInfo.Rows[i].FindControl("lblEvaluated");
                LinkButton lbtnGoToEvaluate = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnGoToEvaluate");
                //lbtnAddEvaluation
                if (lblOrderState.Text == "待付款")
                {
                  
                    lbtnConfirm.Enabled = false;
                    lbtnConfirm.Visible = false;
                    lbtnAddEvaluation.Enabled = false;
                    lbtnAddEvaluation.Visible = false;
                    lblEvaluated.Enabled = false;
                    lblEvaluated.Visible = false;
                    lbtnGoToEvaluate.Enabled = false;
                    lbtnGoToEvaluate.Visible = false;

                }
                else
                {
                    if (lblOrderState.Text == "买家已付款")
                    {
                        lbtnConfirm.Enabled = false;
                        lbtnConfirm.Visible = false;
                        lbtnPay.Enabled = false;
                        lbtnPay.Visible = false;
                        chbSelect.Enabled = false;
                        lbtnAddEvaluation.Enabled = false;
                        lbtnAddEvaluation.Visible = false;
                        lblEvaluated.Enabled = false;
                        lblEvaluated.Visible = false;
                        lbtnGoToEvaluate.Enabled = false;
                        lbtnGoToEvaluate.Visible = false;
                        lbtnConfirm.Enabled = false;
                        lbtnConfirm.Visible = false;
                       
                    }
                    else
                    {
                        if (lblOrderState.Text == "卖家已发货")
                        {
                          
                            lbtnPay.Enabled = false;
                            lbtnPay.Visible = false;
                            chbSelect.Enabled = false;
                            lbtnAddEvaluation.Enabled = false;
                            lbtnAddEvaluation.Visible = false;
                            lblEvaluated.Enabled = false;
                            lblEvaluated.Visible = false;
                            lbtnGoToEvaluate.Enabled = false;
                            lbtnGoToEvaluate.Visible = false;
                            lbtnCancel.Enabled = false;
                            lbtnCancel.Visible = false;
                        }
                        else
                        {
                            if (lblOrderState.Text == "交易成功")
                            {
                                lbtnPay.Enabled = false;
                                lbtnPay.Visible = false;
                                lbtnCancel.Enabled = false;
                                lbtnCancel.Visible = false;
                                lbtnConfirm.Enabled = false;
                                lbtnConfirm.Visible = false;
                                chbSelect.Enabled = false;
                                EstimateInfoTableAdapter estimateDA = new EstimateInfoTableAdapter();
                                DataTable estimateDT = estimateDA.GetEvaluationByOrderId(long.Parse(lblOrderID.Text));
                                if (estimateDT.Rows.Count > 0)
                                {

                                    lbtnGoToEvaluate.Enabled = false;
                                    lbtnGoToEvaluate.Visible = false;
                                }
                                else
                                {
                                    lblEvaluated.Enabled = false;
                                    lblEvaluated.Visible = false;
                                    lbtnAddEvaluation.Enabled = false;
                                    lbtnAddEvaluation.Visible = false;
                                }

                            }
                            else
                            {
                                if (lblOrderState.Text == "退款中的订单")
                                {
                                    lbtnPay.Enabled = false;
                                    lbtnPay.Visible = false;
                                    lbtnCancel.Enabled = false;
                                    lbtnCancel.Visible = false;
                                    lbtnConfirm.Enabled = false;
                                    lbtnConfirm.Visible = false;
                                    chbSelect.Enabled = false;
                                    lbtnAddEvaluation.Enabled = false;
                                    lbtnAddEvaluation.Visible = false;
                                    lblEvaluated.Enabled = false;
                                    lblEvaluated.Visible = false;
                                    lbtnGoToEvaluate.Enabled = false;
                                    lbtnGoToEvaluate.Visible = false;
                                }
                                else
                                {
                                    if (lblOrderState.Text == "交易关闭")
                                    {
                                        lbtnPay.Enabled = false;
                                        lbtnPay.Visible = false;
                                        lbtnCancel.Enabled = false;
                                        lbtnCancel.Visible = false;
                                        lbtnConfirm.Enabled = false;
                                        lbtnConfirm.Visible = false;
                                        chbSelect.Enabled = false;
                                        lbtnAddEvaluation.Enabled = false;
                                        lbtnAddEvaluation.Visible = false;
                                        lblEvaluated.Enabled = false;
                                        lblEvaluated.Visible = false;
                                        lbtnGoToEvaluate.Enabled = false;
                                        lbtnGoToEvaluate.Visible = false;
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }
              
        else
        {
            imgTubiao.Visible = true;
            lblShowMassage.Visible = true;
            lblShowMassage.Text = "没有找到相关订单";
        }
    }
    protected void lbtnDetail_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString(); 
        Session["orderID"] = id;
        Response.Redirect("~/Buyer/orderDetail.aspx?orderID=" + id);
       
    }
    protected void lbtnPay_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        View1TableAdapter orderDA = new View1TableAdapter();
        DataTable orderDT = orderDA.GetDataByorderID(long.Parse(id));
        if (orderDT.Rows.Count > 0)
        {
            Response.Redirect("~/Buyer/Pay.aspx?OrderId=" + id + "&OrderName=" + orderDT.Rows[0]["phone_name"].ToString() + "&Money=" + int.Parse(orderDT.Rows[0]["buy_quantity"].ToString()) * int.Parse(orderDT.Rows[0]["price"].ToString()) + "&RevName=" + Session["name"].ToString() + "&RevAddr=" + orderDT.Rows[0]["receiver_add"].ToString() + "&RevTel=" + orderDT.Rows[0]["receiver_phone"].ToString());
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('抱歉，由于某种原因未成功付款！');", true);
           // Response.Write("<script language=javascript>alert('');</script>");
        }
    }
    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        long orderID = new long();
        orderID=Convert.ToInt64(id);
        //修改库存
        View1TableAdapter V_order = new View1TableAdapter();
        DataTable oDT = V_order.GetDataByorderID(orderID);
        string phoneid = oDT.Rows[0][3].ToString();
        int store = int.Parse(oDT.Rows[0][25].ToString());
        int buyquantity = int.Parse(oDT.Rows[0][5].ToString());
        PhoneInfoTableAdapter phone = new PhoneInfoTableAdapter();
        phone.UpdateSellQuantity(store + buyquantity, long.Parse(phoneid));
        OrderInfoTableAdapter order = new OrderInfoTableAdapter();
        //int state = order.UpdateOrderState("5",orderID);


        int state = order.UpdateOrderState("5", orderID);
        if (state == 1)
        {
           ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('订单已取消！');", true);
            //Response.Write("<script language=javascript>alert('');</script>");
        }
        else
        {
          ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('订单未取消成功！');", true);
              //Response.Write("<script language=javascript>alert('');</script>");
        }
        gridviewBind();
               
    }
    protected void lbtnConfirm_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        long orderID = new long();
        orderID = Convert.ToInt64(id);
        
        //修改销量
        View1TableAdapter V_order = new View1TableAdapter();
        DataTable oDT = V_order.GetDataByorderID(orderID);
        string phoneid=oDT.Rows[0][3].ToString();
        int buyquantity = int.Parse(oDT.Rows[0][5].ToString());
        int sellquantity = int.Parse(oDT.Rows[0][26].ToString());
        PhoneInfoTableAdapter phone = new PhoneInfoTableAdapter();
        phone.UpdateSellQuantity(sellquantity + buyquantity, long.Parse(phoneid));

        OrderInfoTableAdapter orderDA = new OrderInfoTableAdapter();
        DM_orderstateTableAdapter state = new DM_orderstateTableAdapter();
        DataTable stateDt = state.GetStateIDByMeaning("交易成功");
        if (stateDt.Rows.Count > 0)
        {
            string stateID = stateDt.Rows[0][0].ToString();
            int Corder = orderDA.UpdateConfirmTime(stateID, DateTime.Now, orderID);
            if (Corder == 1)
            {
               ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('已成功确认收货！');", true);
                //Response.Write("<script language=javascript>alert('');</script>");
                Response.Redirect("~/Buyer/Evaluation.aspx?orderID=" + orderID);
            }
            else
            {
              ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('未成功确认！');", true);
                  //Response.Write("<script language=javascript>alert('');</script>");
            }
        }
        gridviewBind();
    }
    protected void lbtnComplaint_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        Session["orderID"] = id;
        Response.Redirect("~/Buyer/GoComplain.aspx?orderID=" + id);
    }
    protected void lbtnWaitPay_Click(object sender, EventArgs e)
    {
        imgTubiao.Visible = false;
        lblShowMassage.Visible = false;
        Guid guid = new Guid(Session["buyerID"].ToString());
        //string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        string SelectSql = "select * from View1 where goodsbuyer = '" + guid + "' and orderstate = '1' order by orderId desc";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvOrderInfo.DataSource = ds.Tables[0];
        gvOrderInfo.DataBind();
        if (gvOrderInfo.Rows.Count > 0)
        {
            int i;
            for (i = 0; i < gvOrderInfo.Rows.Count; i++)
            {
               
                Label lblPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblPrice");
                Label lblQuantity = (Label)gvOrderInfo.Rows[i].FindControl("lblQuantity");
                Label lblTotalPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblTotalPrice");
                int price = int.Parse(lblPrice.Text);
                int quantity = int.Parse(lblQuantity.Text);
                lblTotalPrice.Text = (price * quantity).ToString();
                Label lblOrderID = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderID");
                Label lblOrderState = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderState");
                LinkButton lbtnPay = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnPay");
                LinkButton lbtnCancel = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnCancel");
                LinkButton lbtnConfirm = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnConfirm");
                LinkButton lbtnAddEvaluation = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnAddEvaluation");

                Label lblEvaluated = (Label)gvOrderInfo.Rows[i].FindControl("lblEvaluated");
                LinkButton lbtnGoToEvaluate = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnGoToEvaluate");
                lbtnConfirm.Enabled = false;
                lbtnConfirm.Visible = false;
                lbtnAddEvaluation.Enabled = false;
                lbtnAddEvaluation.Visible = false;
                lblEvaluated.Enabled = false;
                lblEvaluated.Visible = false;
                lbtnGoToEvaluate.Enabled = false;
                lbtnGoToEvaluate.Visible = false;

            }

        }

        else
        {
            imgTubiao.Visible = true;
            lblShowMassage.Visible = true;
            lblShowMassage.Text = "没有要付款的订单";
        }
    }

    protected void lbtnWaitConfirm_Click(object sender, EventArgs e)
    {
        imgTubiao.Visible = false;
        lblShowMassage.Visible = false;
        Guid guid = new Guid(Session["buyerID"].ToString());
        //string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        string SelectSql = "select * from View1 where goodsbuyer = '" + guid + "' and orderstate = '3' order by orderId desc";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvOrderInfo.DataSource = ds.Tables[0];
        gvOrderInfo.DataBind();
        if (gvOrderInfo.Rows.Count > 0)
        {
            int i;
            for (i = 0; i < gvOrderInfo.Rows.Count; i++)
            {
                CheckBox chbSelect = (CheckBox)gvOrderInfo.Rows[i].FindControl("chbSelect");
                Label lblPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblPrice");
                Label lblQuantity = (Label)gvOrderInfo.Rows[i].FindControl("lblQuantity");
                Label lblTotalPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblTotalPrice");
                int price = int.Parse(lblPrice.Text);
                int quantity = int.Parse(lblQuantity.Text);
                lblTotalPrice.Text = (price * quantity).ToString();
                Label lblOrderID = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderID");
                Label lblOrderState = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderState");
                LinkButton lbtnPay = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnPay");
                LinkButton lbtnCancel = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnCancel");
                LinkButton lbtnConfirm = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnConfirm");
                LinkButton lbtnAddEvaluation = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnAddEvaluation");

                Label lblEvaluated = (Label)gvOrderInfo.Rows[i].FindControl("lblEvaluated");
                LinkButton lbtnGoToEvaluate = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnGoToEvaluate");
                lbtnPay.Enabled = false;
                lbtnPay.Visible = false;
                chbSelect.Enabled = false;
                lbtnAddEvaluation.Enabled = false;
                lbtnAddEvaluation.Visible = false;
                lblEvaluated.Enabled = false;
                lblEvaluated.Visible = false;
                lbtnGoToEvaluate.Enabled = false;
                lbtnGoToEvaluate.Visible = false;
            }


        }

        else
        {
            imgTubiao.Visible = true;
            lblShowMassage.Visible = true;
            lblShowMassage.Text = "没有要确认收货的订单";
        }
    }
    protected void lbtnSellerName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        Response.Redirect("~/Public/LookShop.aspx?ShopId=" + id);
    }
    
 
    protected void lbtnAddEvaluation_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        Session["orderID"] = id;
        Response.Redirect("~/Buyer/Evaluation.aspx?orderID=" + id);

    }
    protected void gvOrderInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrderInfo.PageIndex = e.NewPageIndex;
        gridviewBind();
    }
    public void gridviewBind()
    {
        string id = "";
        BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
        DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
        if (userdDT.Rows.Count != 0)
        {
            id = userdDT.Rows[0][1].ToString();
        }
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();        
        Guid guid = new Guid(id);
        string SelectSql = "select * from View1 where goodsbuyer = '" + guid + "' order by orderId desc";
       SqlDataAdapter da = new SqlDataAdapter();
       da.SelectCommand = new SqlCommand(SelectSql, Conn);
       DataSet ds = new DataSet();
        da.Fill(ds);
        gvOrderInfo.DataSource = ds.Tables[0];
        gvOrderInfo.DataBind();
        //int waitpay = 0, waitConfirm = 0;
        if (gvOrderInfo.Rows.Count > 0)
        {
            int i;
            for (i = 0; i < gvOrderInfo.Rows.Count; i++)
            {
                CheckBox chbSelect = (CheckBox)gvOrderInfo.Rows[i].FindControl("chbSelect");
                Label lblPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblPrice");
                Label lblQuantity = (Label)gvOrderInfo.Rows[i].FindControl("lblQuantity");
                Label lblTotalPrice = (Label)gvOrderInfo.Rows[i].FindControl("lblTotalPrice");
                int price = int.Parse(lblPrice.Text);
                int quantity = int.Parse(lblQuantity.Text);
                lblTotalPrice.Text = (price * quantity).ToString();
                Label lblOrderID = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderID");
                Label lblOrderState = (Label)gvOrderInfo.Rows[i].FindControl("lblOrderState");
                LinkButton lbtnPay = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnPay");
                LinkButton lbtnCancel = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnCancel");
                LinkButton lbtnConfirm = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnConfirm");
                LinkButton lbtnAddEvaluation = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnAddEvaluation");
                Label lblEvaluated = (Label)gvOrderInfo.Rows[i].FindControl("lblEvaluated");
                LinkButton lbtnGoToEvaluate = (LinkButton)gvOrderInfo.Rows[i].FindControl("lbtnGoToEvaluate");
                if (lblOrderState.Text == "待付款")
                {
                   
                    lbtnConfirm.Enabled = false;
                    lbtnConfirm.Visible = false;
                    lbtnAddEvaluation.Enabled = false;
                    lbtnAddEvaluation.Visible = false;
                    lblEvaluated.Enabled = false;
                    lblEvaluated.Visible = false;
                    lbtnGoToEvaluate.Enabled = false;
                    lbtnGoToEvaluate.Visible = false;

                }
                else
                {
                    if (lblOrderState.Text == "买家已付款")
                    {
                        lbtnConfirm.Enabled = false;
                        lbtnConfirm.Visible = false;
                        lbtnPay.Enabled = false;
                        lbtnPay.Visible = false;
                        chbSelect.Enabled = false;
                        lbtnAddEvaluation.Enabled = false;
                        lbtnAddEvaluation.Visible = false;
                        lblEvaluated.Enabled = false;
                        lblEvaluated.Visible = false;
                        lbtnGoToEvaluate.Enabled = false;
                        lbtnGoToEvaluate.Visible = false;
                    }
                    else
                    {
                        if (lblOrderState.Text == "卖家已发货")
                        {
                        
                            lbtnPay.Enabled = false;
                            lbtnPay.Visible = false;
                            chbSelect.Enabled = false;
                            lbtnAddEvaluation.Enabled = false;
                            lbtnAddEvaluation.Visible = false;
                            lblEvaluated.Enabled = false;
                            lblEvaluated.Visible = false;
                            lbtnGoToEvaluate.Enabled = false;
                            lbtnGoToEvaluate.Visible = false;
                            lbtnCancel.Enabled = false;
                            lbtnCancel.Visible = false;
                        }
                        else
                        {
                            if (lblOrderState.Text == "交易成功")
                            {
                                lbtnPay.Enabled = false;
                                lbtnPay.Visible = false;
                                lbtnCancel.Enabled = false;
                                lbtnCancel.Visible = false;
                                lbtnConfirm.Enabled = false;
                                lbtnConfirm.Visible = false;
                                chbSelect.Enabled = false;
                                EstimateInfoTableAdapter estimateDA = new EstimateInfoTableAdapter();
                                DataTable estimateDT = estimateDA.GetEvaluationByOrderId(long.Parse(lblOrderID.Text));
                                if (estimateDT.Rows.Count > 0)
                                {

                                    lbtnGoToEvaluate.Enabled = false;
                                    lbtnGoToEvaluate.Visible = false;
                                }
                                else
                                {
                                    lblEvaluated.Enabled = false;
                                    lblEvaluated.Visible = false;
                                    lbtnAddEvaluation.Enabled = false;
                                    lbtnAddEvaluation.Visible = false;
                                }

                            }
                            else
                            {
                                if (lblOrderState.Text == "退款中的订单")
                                {
                                    lbtnPay.Enabled = false;
                                    lbtnPay.Visible = false;
                                    lbtnCancel.Enabled = false;
                                    lbtnCancel.Visible = false;
                                    lbtnConfirm.Enabled = false;
                                    lbtnConfirm.Visible = false;
                                    chbSelect.Enabled = false;
                                    lbtnAddEvaluation.Enabled = false;
                                    lbtnAddEvaluation.Visible = false;
                                    lblEvaluated.Enabled = false;
                                    lblEvaluated.Visible = false;
                                    lbtnGoToEvaluate.Enabled = false;
                                    lbtnGoToEvaluate.Visible = false;
                                }
                                else
                                {
                                    if (lblOrderState.Text == "交易关闭")
                                    {
                                        lbtnPay.Enabled = false;
                                        lbtnPay.Visible = false;
                                        lbtnCancel.Enabled = false;
                                        lbtnCancel.Visible = false;
                                        lbtnConfirm.Enabled = false;
                                        lbtnConfirm.Visible = false;
                                        chbSelect.Enabled = false;
                                        lbtnAddEvaluation.Enabled = false;
                                        lbtnAddEvaluation.Visible = false;
                                        lblEvaluated.Enabled = false;
                                        lblEvaluated.Visible = false;
                                        lbtnGoToEvaluate.Enabled = false;
                                        lbtnGoToEvaluate.Visible = false;
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }
        else
        {
            imgTubiao.Visible = true;
            lblShowMassage.Visible = true;
            lblShowMassage.Text = "没有找到相关订单";
        }
        Conn.Close();

    }


    protected void ibtnHotPhone_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument.ToString();
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
    protected void lbtnHotPName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        //Session["phoneID"] = id;
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
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
                       // Response.Write("<script language=javascript>alert('');</script>");
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('页数不正确！');", true);

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

    protected void lbtnGoToEvaluate_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        Response.Redirect("~/Buyer/Evaluation.aspx?orderID=" + id);
    }
    protected void ibtnPhone_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument.ToString();
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
    protected void lbtnPhoneName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
}