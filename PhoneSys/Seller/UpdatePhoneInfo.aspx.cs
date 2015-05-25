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

public partial class Seller_UpdatePhoneInfo : System.Web.UI.Page
{
    static string strCon = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
    public SqlConnection conn = new SqlConnection(strCon);
    static string img = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitData();
            if (Session["name"].ToString() == "")
            {
                Response.Redirect("~/Public/Index.aspx");
            }
        }

    }
    private void InitData()
    {
        string id = Request.QueryString["phoneId"].ToString();
        string strSql1 = "select * from PhoneInfo where phone_id=" + int.Parse(Request.QueryString["phoneId"].ToString());
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlDataAdapter sda1 = new SqlDataAdapter(strSql1, conn);
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            txtphonename.Text = ds1.Tables[0].Rows[0][1].ToString();
            Imgpic.ImageUrl = ds1.Tables[0].Rows[0][17].ToString();
        }       
        conn.Close();
    }

    protected void btnPublic_Click1(object sender, EventArgs e)
    {
        string id = Request.QueryString["phoneId"].ToString();
        string strSql1 = "update PhoneInfo set phone_name='" + txtphonename.Text.ToString() + "',phone_image='" + img + "' where phone_id=" + int.Parse(Request.QueryString["phoneId"].ToString());
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlCommand cmd = new SqlCommand(strSql1, conn);
        try
        {
            if (Convert.ToInt32(cmd.ExecuteNonQuery()) > 0)
                Response.Write("<script>alert('图像更新成功！')</script>");
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
    protected void btnCheck_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Seller/My_Shop.aspx");
    }
    protected void btnpreview_Click(object sender, EventArgs e)
    {        
        if (fudImg.HasFile)
        {
            if (txtphonename.Text == "")
            {
                txtphonename.Text = "123456";
            }
            //获取上传头像的名称
            img = fudImg.FileName;
            //更该头像名称
            img = img.Replace(img.Substring(0, img.LastIndexOf(".")), txtphonename.Text);
            //设置保存路径
            img = "images_phone/" + img;
            //保存上传的头像
            fudImg.SaveAs(Server.MapPath("~/") + img);
            //显示头像
            Imgpic.ImageUrl = "~/" + img;
            img = Imgpic.ImageUrl;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请选择文件！');", true);
        }
    }
}