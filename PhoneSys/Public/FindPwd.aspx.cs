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

public partial class Public_ResetPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        if (Request.QueryString["name"].ToString() != "")
        {
            txtUserName.Text = Request.QueryString["name"].ToString();
            string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();
            string SelectSql = "select * from V_UserInfo where UserName = '" + txtUserName.Text + "'";//Session["name"].ToString()
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {

                txtQuestion.Text = ds.Tables[0].Rows[0][5].ToString();
            }
            else
            {
                // Response.Write("<Script>alert('')</Script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n用户名不存在，请重新输入！');", true);
            }
        }
    }
   
  
   
    protected void txtUserName_TextChanged(object sender, EventArgs e)
    {
        string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        string SelectSql = "select * from V_UserInfo where UserName = '" + txtUserName.Text + "'";//Session["name"].ToString()
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {

            txtQuestion.Text = ds.Tables[0].Rows[0][5].ToString();
        }
        else
        {
            // Response.Write("<Script>alert('')</Script>");
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n用户名不存在，请重新输入！');", true);
        }
    }



    protected void ibtnSave_Click(object sender, EventArgs e)
    {
        register_addpwd common = new register_addpwd();
        string salt = common.GenerateSalt().ToString();
        string pwd = common.EncodePassword(txtNewPwd.Text, 1, salt);

        QueriesTableAdapter amtup = new QueriesTableAdapter();
        int count = amtup.aspnet_Membership_ResetPassword("/", txtUserName.Text, pwd, 1, 1, salt, DateTime.Now, 1, txtAnswer.Text);
        if (count != 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('恭喜您！\\n\\n密码设置成功！');", true);
            txtUserName.Text = "";
            txtNewPwd.Text = "";
            txtConfirmPwd.Text = "";
            txtAnswer.Text = "";
            //  Response.Write("<Script>alert('')</Script>");

            Response.Redirect("../Public/Index.aspx");
        }
        else
        {
            txtUserName.Text = "";
            txtNewPwd.Text = "";
            txtConfirmPwd.Text = "";
            txtAnswer.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n用户名和答案不匹配，请重新输入！');", true);
        }
    }
}