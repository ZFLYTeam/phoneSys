using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using ViewDateSetTableAdapters;


public partial class Seller_Publish : System.Web.UI.Page
{
    public static string img = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] == null)
                Response.Redirect("~/Public/Index.aspx");
        }        
    }   
    

   protected void btnPublic_Click(object sender, EventArgs e)
    {
        #region MyRegion
        //string sellName=Session["name"].ToString().Trim();
        //string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        //SqlConnection Conn = new SqlConnection(ConnSql);
        //Conn.Open();
        //string SelectSql = "select * from asp_Users where UserName = '" + sellName + "'";
        //SqlDataAdapter da = new SqlDataAdapter();
        //da.SelectCommand = new SqlCommand(SelectSql, Conn);
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    txtTitle.Text = ds.Tables[0].Rows[0][2].ToString();
        //    txtPhone.Text = ds.Tables[0].Rows[0][3].ToString();
        //    txtAddress.Text = ds.Tables[0].Rows[0][4].ToString();
        //    txtQuestion.Text = ds.Tables[0].Rows[0][5].ToString();
        //    txtAnswer.Text = ds.Tables[0].Rows[0][6].ToString();
        //    Session["date"] = ds.Tables[0].Rows[0][7].ToString();

        //    DateTime lastlogintime = Convert.ToDateTime(Session["date"].ToString());
        //    lblshow.Text = lastlogintime.ToString();
        //    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('宝贝发布成功！');", true);

        //}
        //else
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('宝贝发布失败，请稍后重试！');", true);
        //}
        //Conn.Close();
        #endregion
    }

   protected void btnpreview_Click(object sender, EventArgs e)
   {
       if (txtphonename.Text.ToString() == null)
       {
           txtphonename.Text = fudImg.FileName.ToString();
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
       btnpreview.Visible = false;
   }
   protected void btnPublic_Click1(object sender, EventArgs e)
   {
       string phonename = txtphonename.Text.ToString();

       string uname = Session["name"].ToString();
       select_id_viewTableAdapter selid = new select_id_viewTableAdapter();
       DataTable dtid = selid.selectidbyuname(uname);
       string owner = dtid.Rows[0][0].ToString();
       Guid sellerid = new Guid();
       sellerid = Guid.Parse(owner);
       string shopname = dtid.Rows[0][1].ToString();
       string brand = ddlbrand.SelectedItem.Text;
       string version = ddlversion.SelectedItem.Text;
       string color = ddlcolor.SelectedItem.Text;

       string priceint = ddlpriceinterval.SelectedItem.Text;
       string[] sArray = priceint.Split('-');
       string str1 = sArray[0].ToString().Trim();
       string str2 = sArray[1].ToString().Trim();
       int low = Convert.ToInt32(str1.ToString());
       int high = Convert.ToInt32(str2.ToString());
       

       string os = ddlos.SelectedItem.Text;
       string cpu = ddlcpu.SelectedItem.Text;
       string type = ddltype.SelectedItem.Text;
       string piexl = ddlpixel.SelectedItem.Text;
       string screen = ddlscreensize.SelectedItem.Text;
       int quantity = Convert.ToInt32(txtquantity.Text);
       int price = Convert.ToInt32(txtprice.Text);
       string introduction = txtintroduce.Text;
       string image = img;
       DateTime starttime =  DateTime.Today;
       DateTime selltime = DateTime.Today;
       string state = "1";

       if (price > high || price < low)
       {
           ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n您输入的商品价格与选择的价格区间不符！\\n请重新选择区间');", true);
           return;
       }

       QueriesTableAdapter insertinfo = new QueriesTableAdapter();
       int result = insertinfo.proc_insertphoneinfo(phonename,sellerid,shopname,brand,version,color,low,high,os,cpu,type,piexl,screen,quantity,price,introduction,image,starttime,selltime,state);

       if (result==-1)
       {
           ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n商品插入成功！');", true);
           
       }
       else
       {
           ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n商品信息由于一些原因审核失败！');", true);

       }
   }
   protected void btnRedirct_Click1(object sender, EventArgs e)
   {
       Response.Redirect("~/Seller/My_Shop.aspx");
   }
}