using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using BuyerDataSetTableAdapters;

public partial class Public_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.DataList1Bind();
            this.DataList2Bind();
            this.DataList3Bind();
        }
    }

    private void DataList1Bind()
    {
        string ConnStr = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            int currentPage = Convert.ToInt32(lbl_NowPage.Text);   //获取当前页
            PagedDataSource pds = new PagedDataSource();
            conn.Open();   //建立数据库连接
            string SqlStr = "select distinct * from PhoneInfo,aspnet_Users,ShopInfo where PhoneInfo.sellerId=aspnet_Users.UserId and PhoneInfo.shopId=ShopInfo.shop_id and PhoneInfo.phonestate='2' and shopstate='2' order by sell_quantity desc ";
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = new SqlCommand(SqlStr, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            pds.DataSource = ds.Tables[0].DefaultView;

            pds.AllowPaging = true;
            pds.PageSize = 4;
            pds.CurrentPageIndex = currentPage - 1;

            LnkBtnFirst.Enabled = true;
            LnkBtnFront.Enabled = true;
            LnkBtnNext.Enabled = true;
            LnkBtnlast.Enabled = true;

            if (currentPage == 1)
            {
                LnkBtnFirst.Enabled = false;
                LnkBtnFront.Enabled = false;
            }
            if (currentPage == pds.PageCount)
            {
                LnkBtnNext.Enabled = false;
                LnkBtnlast.Enabled = false;
            }
            Lbl_Count.Text = pds.PageCount.ToString();

            DataList1.DataSource = pds;
            DataList1.DataKeyField = "phone_id";
            DataList1.DataBind();
        }
    }
    private void DataList2Bind()
    {
        int currentPage2 = Convert.ToInt32(Lbl_NowPage2.Text);   //获取当前页
        PagedDataSource pds2 = new PagedDataSource();
        string ConnStr = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            string SqlStr = "select distinct * from PhoneInfo,aspnet_Users,ShopInfo where PhoneInfo.sellerId=aspnet_Users.UserId and PhoneInfo.shopId=ShopInfo.shop_id and PhoneInfo.phonestate='2' and shopstate='2' order by phoneselltime desc";
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = new SqlCommand(SqlStr, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            pds2.DataSource = ds.Tables[0].DefaultView;

            pds2.AllowPaging = true;
            pds2.PageSize = 4;
            pds2.CurrentPageIndex = currentPage2 - 1;

            LnkBtnFirst2.Enabled = true;
            LnkBtnFront2.Enabled = true;
            LnkBtnNext2.Enabled = true;
            LnkBtnlast2.Enabled = true;

            if (currentPage2 == 1)
            {
                LnkBtnFirst2.Enabled = false;
                LnkBtnFront2.Enabled = false;
            }
            if (currentPage2 == pds2.PageCount)
            {
                LnkBtnNext2.Enabled = false;
                LnkBtnlast2.Enabled = false;
            }
            Lbl_Count2.Text = pds2.PageCount.ToString();

            DataList2.DataSource = pds2;
            DataList2.DataKeyField = "phone_id";
            DataList2.DataBind();
        }
    }
    private void DataList3Bind()
    {
        int currentPage3 = Convert.ToInt32(Lbl_NowPage3.Text);   //获取当前页
        PagedDataSource pds3 = new PagedDataSource();
        string ConnStr = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            string SqlStr = "select distinct * from PhoneInfo,aspnet_Users,ShopInfo where PhoneInfo.sellerId=aspnet_Users.UserId and PhoneInfo.shopId=ShopInfo.shop_id and PhoneInfo.phonestate='2' and shopstate='2' order by passtime desc ";
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = new SqlCommand(SqlStr, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            pds3.DataSource = ds.Tables[0].DefaultView;

            pds3.AllowPaging = true;
            pds3.PageSize = 4;
            pds3.CurrentPageIndex = currentPage3 - 1;

            LnkBtnFirst3.Enabled = true;
            LnkBtnFront3.Enabled = true;
            LnkBtnNext3.Enabled = true;
            LnkBtnlast3.Enabled = true;

            if (currentPage3 == 1)
            {
                LnkBtnFirst3.Enabled = false;
                LnkBtnFront3.Enabled = false;
            }
            if (currentPage3 == pds3.PageCount)
            {
                LnkBtnNext3.Enabled = false;
                LnkBtnlast3.Enabled = false;
            }
            Lbl_Count3.Text = pds3.PageCount.ToString();

            DataList3.DataSource = pds3;
            DataList3.DataKeyField = "phone_id";
            DataList3.DataBind();
        }
    }
    protected void LnkBtnFirst_Click(object sender, EventArgs e)
    {

        lbl_NowPage.Text = "1";
        this.DataList1Bind();
    }
    protected void LnkBtnFront_Click(object sender, EventArgs e)
    {
        lbl_NowPage.Text = (Convert.ToInt32(lbl_NowPage.Text) - 1).ToString();
        this.DataList1Bind();
    }
    protected void LnkBtnNext_Click(object sender, EventArgs e)
    {
        lbl_NowPage.Text = (Convert.ToInt32(lbl_NowPage.Text) + 1).ToString();
        this.DataList1Bind();
    }
    protected void LnkBtnlast_Click(object sender, EventArgs e)
    {
        lbl_NowPage.Text = Lbl_Count.Text;
        this.DataList1Bind();
    }
    protected void LnkBtnFirst2_Click(object sender, EventArgs e)
    {
        Lbl_NowPage2.Text = "1";
        this.DataList2Bind();
    }
    protected void LnkBtnFront2_Click(object sender, EventArgs e)
    {
        Lbl_NowPage2.Text = (Convert.ToInt32(Lbl_NowPage2.Text) - 1).ToString();
        this.DataList2Bind();
    }
    protected void LnkBtnNext2_Click(object sender, EventArgs e)
    {
        Lbl_NowPage2.Text = (Convert.ToInt32(Lbl_NowPage2.Text) + 1).ToString();
        this.DataList2Bind();
    }
    protected void LnkBtnlast2_Click(object sender, EventArgs e)
    {
        Lbl_NowPage2.Text = Lbl_Count2.Text;
        this.DataList2Bind();
    }
    protected void LnkBtnFirst3_Click(object sender, EventArgs e)
    {
        Lbl_NowPage3.Text = "1";
        this.DataList3Bind();
    }
    protected void LnkBtnFront3_Click(object sender, EventArgs e)
    {
        Lbl_NowPage3.Text = (Convert.ToInt32(Lbl_NowPage3.Text) - 1).ToString();
        this.DataList3Bind();
    }
    protected void LnkBtnNext3_Click(object sender, EventArgs e)
    {
        Lbl_NowPage3.Text = (Convert.ToInt32(Lbl_NowPage3.Text) + 1).ToString();
        this.DataList3Bind();
    }
    protected void LnkBtnlast3_Click(object sender, EventArgs e)
    {
        Lbl_NowPage3.Text = Lbl_Count3.Text;
        this.DataList3Bind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Public/GoodsInfo.aspx");
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("../Public/GoodsInfo.aspx");
    }
    protected void LinkButton1_Click2(object sender, EventArgs e)
    {
        Response.Redirect("../Public/GoodsInfo.aspx");
    }

    protected void lbtnInChart1_Click(object sender, EventArgs e)
    {
        string phoneid = ((LinkButton)sender).CommandArgument.ToString();
        if (Session["name"] != null)
        {
            BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
            DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
            ShopCartTableAdapter shopcartDA = new ShopCartTableAdapter();
            if (userdDT.Rows.Count > 0)
            {
                DataTable shopcartDT = shopcartDA.GetDataBySCidPid(System.Guid.Parse(userdDT.Rows[0][1].ToString()), long.Parse(phoneid));
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
                        int DT = shopcartDA.AddShoppingCart(System.Guid.Parse(userdDT.Rows[0][1].ToString()), System.Guid.Parse(seller), long.Parse(phoneid), 1, int.Parse(ds.Tables[0].Rows[0]["price"].ToString().Trim()), DateTime.Now, "否");
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
    protected void lbtnInChart2_Click(object sender, EventArgs e)
    {
        string phoneid = ((LinkButton)sender).CommandArgument.ToString();
        if (Session["name"] != null)
        {
            BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
            DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
            ShopCartTableAdapter shopcartDA = new ShopCartTableAdapter();

            if (userdDT.Rows.Count > 0)
            {

                DataTable shopcartDT = shopcartDA.GetDataBySCidPid(System.Guid.Parse(userdDT.Rows[0][1].ToString()), long.Parse(phoneid));
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
                        int DT = shopcartDA.AddShoppingCart(System.Guid.Parse(userdDT.Rows[0][1].ToString()), System.Guid.Parse(seller), long.Parse(phoneid), 1, int.Parse(ds.Tables[0].Rows[0]["price"].ToString().Trim()), DateTime.Now, "否");
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
}