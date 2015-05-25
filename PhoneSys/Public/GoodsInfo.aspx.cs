using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BuyerDataSetTableAdapters;

public partial class Public_GoodInfo : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
       string phoneid = Request.QueryString["PhoneId"].ToString();
        if (!IsPostBack)
        {
            txtNum.Text = "1";
            BindDatalist(0);
        }
       
            string ConnSql = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
             SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();

            string SelectSql = "SELECT * FROM V_PhoneDetailInfo WHERE phone_id =" + long.Parse(phoneid) + "";
            SqlDataAdapter da = new SqlDataAdapter();
             da.SelectCommand = new SqlCommand(SelectSql, Conn);
             DataSet ds = new DataSet();
             da.Fill(ds);
             if (ds.Tables[0].Rows.Count > 0)
             {
                 lblGoodsName.Text = ds.Tables[0].Rows[0]["phone_name"].ToString().Trim();
                 ImgGoodsUrl.ImageUrl = ds.Tables[0].Rows[0]["phone_image"].ToString().Trim();
                 this.ImgGoodsUrl.ImageUrl = ds.Tables[0].Rows[0]["phone_image"].ToString().Trim();
                 this.ImgGoodsUrl1.ImageUrl = ds.Tables[0].Rows[0]["phone_image"].ToString().Trim();
                 lblquantity.Text = ds.Tables[0].Rows[0]["sell_quantity"].ToString().Trim();
                 this.lblGoodsPrice.Text = ds.Tables[0].Rows[0]["price"].ToString().Trim();
                 this.lblGoodsType.Text = ds.Tables[0].Rows[0]["brand"].ToString().Trim();
                
 
                 lbtnSellerName.Text = ds.Tables[0].Rows[0]["shop_name"].ToString().Trim();
                 lblPhoneBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString().Trim();
                 lblPhoneName.Text = ds.Tables[0].Rows[0]["phone_name"].ToString().Trim();
                 lblStore.Text=ds.Tables[0].Rows[0]["store_quantity"].ToString().Trim();
                 lblPhonescreen.Text = ds.Tables[0].Rows[0]["screen"].ToString().Trim();

                 lblPhonecolor.Text = ds.Tables[0].Rows[0]["color"].ToString().Trim();
                 lblIntroduce.Text = ds.Tables[0].Rows[0]["phone_introduction"].ToString().Trim();
                 lblAdreess.Text = ds.Tables[0].Rows[0]["shop_address"].ToString().Trim();
                 imgpicture.ImageUrl = ds.Tables[0].Rows[0]["phone_image"].ToString().Trim();
                 lblSalenumber.Text = ds.Tables[0].Rows[0]["sell_quantity"].ToString().Trim();
                 lblPhoneCpu.Text = ds.Tables[0].Rows[0]["cpu"].ToString().Trim();
                 lblPhoneOs.Text = ds.Tables[0].Rows[0]["os"].ToString().Trim();
                 lblPhonePixel.Text = ds.Tables[0].Rows[0]["pixel"].ToString().Trim()+"万像素";
                 lblAllPrice.Text = (int.Parse(txtNum.Text) * int.Parse(lblGoodsPrice.Text)).ToString();
             }

             if (int.Parse(lblStore.Text) <= 0)
             {
                 lblShow1.Enabled = false;
                 lblShow1.Visible = false;
                 lblShow2.Enabled = false;
                 lblShow2.Visible = false;
                 lblShow3.Enabled = false;
                 lblShow3.Visible = false;
                 lblShow4.Enabled = false;
                 lblShow4.Visible = false;
                 lblShow5.Enabled = false;
                 lblShow5.Visible = false;
                 ibtnBuyNow.Enabled = false;
                 ibtnBuyNow.Visible = false;
                 ibtnMoveCart.Enabled = false;
                 ibtnMoveCart.Visible = false;
                 ibtnCollect.Enabled = false;
                 ibtnCollect.Visible = false;
                 txtNum.Enabled = false;
                 txtNum.Visible = false;
                 lblStore.Enabled = false;
                 lblStore.Visible = false;
                 lblAllPrice.Enabled = false;
                 lblAllPrice.Visible = false;
               
             }
             else
             {
                 lblShow6.Enabled = false;
                 lblShow6.Visible = false;
             }
    }
    private void BindDatalist(int currentpage)
    {
        pds.AllowPaging = true;
        pds.PageSize = 5;
        pds.CurrentPageIndex = currentpage;

        BuyerDSTableAdapters.V_LookEstimateTableAdapter estimateDA = new BuyerDSTableAdapters.V_LookEstimateTableAdapter();
        DataTable estimateDT = estimateDA.GetDataByPhoneId(long.Parse(Request.QueryString["PhoneId"].ToString()));
        pds.DataSource = estimateDT.DefaultView;
        dlEstimate.DataSource = pds;
        dlEstimate.DataBind();
        if (estimateDT.Rows.Count == 0)
        {
            lblNo.Visible = true;
        }
        else
        {
            lblNo.Visible = false;
        }
    }
    protected void ibtnMoveCart_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["name"] != null)
        {
           string phoneid = Request.QueryString["PhoneId"].ToString();
            BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
            DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
            ShopCartTableAdapter shopcartDA = new ShopCartTableAdapter();
            string buyer = "";
            if (userdDT.Rows.Count > 0)
            {
                buyer = userdDT.Rows[0][1].ToString();
                DataTable shopcartDT = shopcartDA.GetDataBySCidPid(System.Guid.Parse(buyer), long.Parse(phoneid));
                if (shopcartDT.Rows.Count > 0)
                {
                    Response.Redirect("~/Buyer/ShoppingCart.aspx");
                }
                else
                {
                    string ConnSql = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
                    SqlConnection Conn = new SqlConnection(ConnSql);
                    Conn.Open();

                    string SelectSql = "SELECT * FROM V_PhoneDetailInfo WHERE phone_id =" + long.Parse(phoneid) + "";
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = new SqlCommand(SelectSql, Conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    string seller = "";

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        seller = ds.Tables[0].Rows[0]["sellerId"].ToString().Trim();
                        int DT = shopcartDA.AddShoppingCart(System.Guid.Parse(buyer), System.Guid.Parse(seller), long.Parse(phoneid), int.Parse(txtNum.Text.Trim()), int.Parse(lblAllPrice.Text.Trim()), DateTime.Now, "否");
                        if (DT > 0)
                        {
                            Response.Redirect("~/Buyer/ShoppingCart.aspx");
                        }
                        else
                        {
                            Response.Write("<Script>alert('未能成功加入购物车！')</Script>");
                        }
                    }

                }

            }
            else
            {

                Response.Write("<Script>alert('未能成功加入购物车！')</Script>");
            }

        }
        else
        {
            Session["lasturl"] = Server.UrlDecode(Request.Url.AbsoluteUri.ToString());
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>openDiv('newDiv');</script>");
            //Response.Write("<Script>alert('登录后才能加入购物车！')</Script>");
        }

    }
    protected void ibtnBuyNow_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["name"] != null)
        {
          string phoneid = Request.QueryString["PhoneId"].ToString();
            BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
            DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
            string buyer = "";
            ShopCartTableAdapter shopcartDA = new ShopCartTableAdapter();
            if (userdDT.Rows.Count > 0)
            {
                buyer = userdDT.Rows[0][1].ToString();
                DataTable shopcartDT = shopcartDA.GetDataBySCidPid(System.Guid.Parse(buyer), long.Parse(phoneid));
                if (shopcartDT.Rows.Count > 0)
                {
                    int Dt = shopcartDA.UpdateCartQuantity(int.Parse(txtNum.Text), int.Parse(lblAllPrice.Text), DateTime.Now, "是", long.Parse(shopcartDT.Rows[0][0].ToString()));
                    if (Dt == 1)
                    {
                        Response.Redirect("~/Buyer/SubmitOrder.aspx");
                    }
                    else
                    {
                        Response.Write("<Script>alert('未能成功结算！')</Script>");
                    }
                }
                else
                {
                    string ConnSql = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
                    SqlConnection Conn = new SqlConnection(ConnSql);
                    Conn.Open();

                    string SelectSql = "SELECT * FROM V_PhoneDetailInfo WHERE phone_id =" + long.Parse(phoneid) + "";
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = new SqlCommand(SelectSql, Conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    string seller = "";

                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        seller = ds.Tables[0].Rows[0]["sellerId"].ToString().Trim();
                        int DT = shopcartDA.AddShoppingCart(System.Guid.Parse(buyer), System.Guid.Parse(seller), long.Parse(phoneid), int.Parse(txtNum.Text.Trim()), int.Parse(lblAllPrice.Text.Trim()), DateTime.Now, "是");
                        if (DT > 0)
                        {
                            Response.Redirect("~/Buyer/SubmitOrder.aspx");
                        }
                        else
                        {
                            Response.Write("<Script>alert('未能成功结算！')</Script>");
                        }
                    }


                }

            }
            else
            {
                Response.Write("<Script>alert('未能成功结算！')</Script>");
            }
           
        }
        else
        {
            Session["lasturl"] = Server.UrlDecode(Request.Url.AbsoluteUri.ToString());
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>openDiv('newDiv');</script>");
            //Response.Write("<Script>alert('登录后才能购买！')</Script>");
        }
    }
  
    protected void lbtnSellerName_Click(object sender, EventArgs e)
    {
        string phoneid = Request.QueryString["PhoneId"].ToString();
        long id = long.Parse(phoneid);
        string ConnSql = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();

        string SelectSql = "SELECT * FROM V_PhoneDetailInfo WHERE phone_id =" + id + "";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string shop = "";
        if (ds.Tables[0].Rows.Count > 0)
        { 
            shop=ds.Tables[0].Rows[0]["shopId"].ToString().Trim();
            Response.Redirect("~/Public/LookShop.aspx?ShopId=" + shop);
        }
    }
    protected void ibtnCollect_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["name"] != null)
        {
          string phoneid = Request.QueryString["PhoneId"].ToString();
            BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
            DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
            CollectionTableAdapter collect = new CollectionTableAdapter();
            string buyer = "";
            if (userdDT.Rows.Count > 0)
            {
                buyer = userdDT.Rows[0][1].ToString();
                DataTable collectDT = collect.GetDataByUidPid(System.Guid.Parse(buyer), long.Parse(phoneid));
                if (collectDT.Rows.Count > 0)
                {
                    Response.Write("<Script>alert('您已收藏过此商品！')</Script>");
                }
                else
                {
                    string ConnSql = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
                    SqlConnection Conn = new SqlConnection(ConnSql);
                    Conn.Open();

                    string SelectSql = "SELECT * FROM V_PhoneDetailInfo WHERE phone_id =" + long.Parse(phoneid) + "";
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = new SqlCommand(SelectSql, Conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    string shopid = "";

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        shopid = ds.Tables[0].Rows[0]["shopId"].ToString().Trim();
                    }
                    int DT = collect.AddCollect(System.Guid.Parse(buyer), long.Parse(phoneid), long.Parse(shopid), DateTime.Now, "phone");
                    if (DT > 0)
                    {
                        Response.Write("<Script>alert('收藏成功！')</Script>");
                    }
                }
            }
          
        }
        else
        {            
            Response.Write("<Script>alert('登陆后才能收藏！')</Script>");
        }
    }
    protected void lbtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Public/PhoneSearch.aspx");
    }
    protected void txtNum_TextChanged(object sender, EventArgs e)
    {
        //if (int.Parse(lblStore.Text) == 0)
        //{

        //}
        //else
        //{
        //    if (int.Parse(lblStore.Text) == 1)
        //    {
        //        btnMin.Enabled = false;
        //        btnAdd.Enabled = false;
        //    }
        //    else
        //    {
        //        if (int.Parse(txtNum.Text) == 1)
        //        {
        //            btnMin.Enabled = false;
        //            btnAdd.Enabled = true;
        //        }
        //        else
        //        {
        //            if (1 < int.Parse(txtNum.Text) && int.Parse(txtNum.Text) < int.Parse(lblStore.Text))
        //            {
        //                btnMin.Enabled = true;
        //                btnAdd.Enabled = true;
        //            }
        //            else
        //            {
        //                if (int.Parse(txtNum.Text) == int.Parse(lblStore.Text))
        //                    btnAdd.Enabled = false;
        //            }
        //        }
        //    }
        //}     
    }
    protected void dlEstimate_ItemCommand(object source, DataListCommandEventArgs e)
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
                    TextBox txtSkip = (TextBox)e.Item.FindControl("txtSkip");
                    int MyPageNum = 0;
                    if (!txtSkip.Text.Equals(""))
                    {
                        MyPageNum = Convert.ToInt32(txtSkip.Text.ToString());

                    }
                    if (MyPageNum <= 0 || MyPageNum > pageCount)
                    {
                        Response.Write("<Script>alert('页数不正确！')</Script>");
                        //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('页数不正确！');", true);
                    }

                    else
                    {
                        BindDatalist(MyPageNum - 1);
                    }
                }
                break;
        }
    }
    protected void dlEstimate_ItemDataBound(object sender, DataListItemEventArgs e)
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
}