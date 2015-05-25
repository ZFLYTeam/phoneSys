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


public partial class Public_UpdateInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
            txtUserName.Text = Session["name"].ToString().Trim();

            string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();
            string SelectSql = "select * from V_UserInfo where UserName = '" + txtUserName.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtPhone.Text = ds.Tables[0].Rows[0]["user_tel"].ToString();
                txtAddress.Text = ds.Tables[0].Rows[0]["user_adress"].ToString();
                txtQuestion.Text = ds.Tables[0].Rows[0][5].ToString();
                txtAnswer.Text = ds.Tables[0].Rows[0][6].ToString();
                Session["date"] = ds.Tables[0].Rows[0][7].ToString();

                DateTime lastlogintime = Convert.ToDateTime(Session["date"].ToString());


            }
            Conn.Close();
            txtAddress.Enabled = false;
            txtAnswer.Enabled = false;
            txtEmail.Enabled = false;
            txtPhone.Enabled = false;
            txtQuestion.Enabled = false;
            txtUserName.Enabled = false;
        }
        else
        {
            Response.Redirect("../Public/Index.aspx");
        }
    }

    protected void BtnAlter_Click(object sender, ImageClickEventArgs e)
    {
        
        DateTime lastlogintime = Convert.ToDateTime(Session["date"].ToString());//Session["date"];
    
        string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("UpdateUserInfo", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ApplicationName", SqlDbType.NVarChar, 256));
        cmd.Parameters["@ApplicationName"].Value = "/";

        cmd.Parameters.Add(new SqlParameter("@UserName", SqlDbType.NVarChar, 256));
        cmd.Parameters["@UserName"].Value = txtUserName.Text;

        cmd.Parameters.Add(new SqlParameter("@IsPasswordCorrect", SqlDbType.Bit));
        cmd.Parameters["@IsPasswordCorrect"].Value = true;

        cmd.Parameters.Add(new SqlParameter("@UpdateLastLoginActivityDate", SqlDbType.Bit));
        cmd.Parameters["@UpdateLastLoginActivityDate"].Value = true;

        cmd.Parameters.Add(new SqlParameter("@MaxInvalidPasswordAttempts", SqlDbType.Int));
        cmd.Parameters["@MaxInvalidPasswordAttempts"].Value = 1;

        cmd.Parameters.Add(new SqlParameter("@PasswordAttemptWindow", SqlDbType.Int));
        cmd.Parameters["@PasswordAttemptWindow"].Value = 1;

        cmd.Parameters.Add(new SqlParameter("@CurrentTimeUtc", SqlDbType.DateTime));
        cmd.Parameters["@CurrentTimeUtc"].Value = DateTime.Now;
        //
        cmd.Parameters.Add(new SqlParameter("@LastLoginDate", SqlDbType.DateTime));
        cmd.Parameters["@LastLoginDate"].Value = lastlogintime;

        cmd.Parameters.Add(new SqlParameter("@LastActivityDate", SqlDbType.DateTime));
        cmd.Parameters["@LastActivityDate"].Value = lastlogintime;

        cmd.Parameters.Add(new SqlParameter("@EMAIL_", SqlDbType.NVarChar,100));
        cmd.Parameters["@EMAIL_"].Value = txtEmail.Text;

        cmd.Parameters.Add(new SqlParameter("@PASSWORDQUESTION_", SqlDbType.NVarChar, 100));
        cmd.Parameters["@PASSWORDQUESTION_"].Value = txtQuestion.Text;

        cmd.Parameters.Add(new SqlParameter("@PASSWORDANSWER_", SqlDbType.NVarChar, 100));
        cmd.Parameters["@PASSWORDANSWER_"].Value = txtAnswer.Text;

        cmd.Parameters.Add(new SqlParameter("@user_tel", SqlDbType.VarChar, 10));
        cmd.Parameters["@user_tel"].Value = txtPhone.Text;

        cmd.Parameters.Add(new SqlParameter("@user_adress", SqlDbType.VarChar, 500));
        cmd.Parameters["@user_adress"].Value = txtAddress.Text;

        int dr = cmd.ExecuteNonQuery();
        if (dr >0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('修改成功！');", true);
            //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('更新成功！')", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n信息修改失败！');", true);
            //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('更新失败！')", true);
        }
        Conn.Close();
    }
    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        txtAddress.Enabled = true;
        txtAnswer.Enabled = true;
        txtEmail.Enabled = true;
        txtPhone.Enabled = true;
        txtQuestion.Enabled = true;

    }
}