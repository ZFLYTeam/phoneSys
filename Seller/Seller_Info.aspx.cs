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

public partial class Seller_Seller_Info : System.Web.UI.Page
{
    static string strCon = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
    public SqlConnection conn = new SqlConnection(strCon);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            conn.Open();
            string SelectSql = "select * from V_UserInfo where UserName = '" + Session["name"].ToString() + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(SelectSql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["userId"] = ds.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                Response.Write("<Script>alert('运行错误!')</Script>");
            }
            Init_BindData();
            txtShopName.Visible = false;
            txtShopTele.Visible = false;
            txtShopAddr.Visible = false;
            btnUpdate.Visible = false;
            if (Session["name"] == null)
            {
                Response.Redirect("~/Public/Index.aspx");
            }
            
        }
    }
    private void Init_BindData()
    {
        string strSql = "select * from vw_phone_shop_user where sellerId='" + System.Guid.Parse(Session["userId"].ToString()) + "'";
        SqlDataAdapter sda = new SqlDataAdapter(strSql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            imgShop.ImageUrl = ds.Tables[0].Rows[0][24].ToString();
            lblSellerName.Text = Session["name"].ToString();
            lblSellerRealName.Text = ds.Tables[0].Rows[0][14].ToString();

            lblShopName.Text = ds.Tables[0].Rows[0][16].ToString();
            txtShopName.Text = ds.Tables[0].Rows[0][16].ToString();

            lblShopTele.Text = ds.Tables[0].Rows[0][21].ToString();
            txtShopTele.Text = ds.Tables[0].Rows[0][21].ToString();

            lblShopAddr.Text = ds.Tables[0].Rows[0][22].ToString();
            txtShopAddr.Text = ds.Tables[0].Rows[0][22].ToString();

            txtIntroduction.Text = ds.Tables[0].Rows[0][20].ToString();
            lblShopStartTime.Text = Convert.ToDateTime( ds.Tables[0].Rows[0][23]).ToString("yyyy年MM月dd日");

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('加载出现错误！');", true);
        }

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        txtShopName.Visible = true;
        txtShopTele.Visible = true;
        txtShopAddr.Visible = true;

        lblShopName.Visible = false;
        lblShopTele.Visible = false;
        lblShopAddr.Visible = false;

        btnUpdate.Visible = true;
        txtIntroduction.ReadOnly = false;

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string sql = "update shopinfo set shop_name ='" + txtShopName.Text.ToString()
                                  + "',shop_telephone='" + txtShopTele.Text.ToString()
                                  + "',shop_address='" + txtShopAddr.Text.ToString()
                                  + "',shop_jianjie='" + txtIntroduction.Text.ToString()
                                  + "' where shop_owner = '" + System.Guid.Parse(Session["userId"].ToString()) + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('商铺信息修改成功！');", true);
        }
        catch (Exception err)
        {
            Response.Write(err.ToString());
        }
        finally
        {
            conn.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('信息更新成功！');", true);
            Init_BindData();
            txtShopName.Visible = false;
            lblShopName.Visible = true;

            txtShopTele.Visible = false;
            lblShopTele.Visible = true;

            txtShopAddr.Visible = false;
            lblShopAddr.Visible = true;

            txtIntroduction.ReadOnly = true;
            btnUpdate.Visible = false;
        }
    }
}