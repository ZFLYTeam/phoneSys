using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Xml.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class Seller_SendGoods : System.Web.UI.Page
{
    static string strCon = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
    public SqlConnection conn = new SqlConnection(strCon);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            if (Session["name"] == null)
            {
                    Response.Redirect("~/Public/Index.aspx");
            }
            InitData();
        }

    }
    private void InitData()
    {
        lblOrderId.Text = Request.QueryString["orderId"].ToString();
        string strSql1 = "select * from OrderInfo where orderId='" + Request.QueryString["orderId"].ToString() + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlDataAdapter sda1 = new SqlDataAdapter(strSql1, conn);
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            lblOrderId.Text = ds1.Tables[0].Rows[0][0].ToString();
            lblBuyerName.Text = ds1.Tables[0].Rows[0][11].ToString();
            lblBuyerPhone.Text = ds1.Tables[0].Rows[0][10].ToString();
            lblBuyerAddress.Text = ds1.Tables[0].Rows[0][9].ToString();
        }
        string strSql2 = "select * from UsersExtend where UserID='" + System.Guid.Parse(Session["userId"].ToString()) + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlDataAdapter sda2 = new SqlDataAdapter(strSql2, conn);
        DataSet ds2 = new DataSet();
        sda2.Fill(ds2);
        if (ds2.Tables[0].Rows.Count > 0)
        {
            txtSellerName.Text = ds2.Tables[0].Rows[0][1].ToString();
            txtSellerPhone.Text = ds2.Tables[0].Rows[0][2].ToString();
            txtSellerAddr.Text = ds2.Tables[0].Rows[0][3].ToString();
        }

        conn.Close();
    }
    protected void btnSendGoods_Click(object sender, EventArgs e)
    {
        conn.Open();
        string sql = "update OrderInfo set senttime ='" + DateTime.Now + "',orderstate='3'" + " where orderId='" + Request.QueryString["orderId"].ToString() + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            if (Convert.ToInt32(cmd.ExecuteNonQuery()) > 0)
                Response.Write("<script>alert('确认发货成功！')</script>");
        }
        catch (Exception err)
        {
            Response.Write(err.ToString());
        }
        finally
        {
            conn.Close();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Seller/OrderManage.aspx");
    }
}