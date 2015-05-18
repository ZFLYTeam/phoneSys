using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

public partial class Public_PwdReset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        { 
            Response.Write("<Script>alert('请登录后再修改密码！')</Script>");
            Response.Redirect("~/Public/Index.aspx");
           
        }
        btnConfirm.Attributes.Add("onclick", "return confirm('确定修改吗？');");
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        if (txtNPwd0.Text != "" && txtNPwd1.Text != "" && txtOPwd.Text != "")
        {
            register_addpwd common = new register_addpwd();
            string salt = common.GenerateSalt().ToString();
            string pwd = common.EncodePassword(txtNPwd1.Text, 1, salt);
       
            string connStr = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("aspnet_Membership_SetPassword", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@ApplicationName", Membership.ApplicationName));
            cmd.Parameters.Add(new SqlParameter("@UserName", Session["name"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@NewPassword", pwd));
            cmd.Parameters.Add(new SqlParameter("@PasswordSalt", salt));
            cmd.Parameters.Add(new SqlParameter("@CurrentTimeUtc", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@PasswordFormat", Membership.Provider.PasswordFormat.GetHashCode()));
            SqlParameter returnValue = new SqlParameter();
            returnValue.ParameterName = "returnValue";
            returnValue.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(returnValue);

            //=== 执行预存程序 ===     
            cmd.ExecuteNonQuery();
            conn.Close();

            if (returnValue.Value.ToString() == "0")
            {
                Response.Write("<Script>alert('恭喜您！密码设置成功！')</Script>");
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('恭喜您！密码设置成功！');", true);
            }
            else
                Response.Write("<Script>alert('密码设置失败，请重试！')</Script>");
               // ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('密码设置失败，请重试！');", true);
        }
        else
        {
            Response.Write("<Script>alert('请确保填写完整！')</Script>");
           // ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请确保填写完整！');", true);
        }
    }
            
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtOPwd.Text = "";
        txtNPwd0.Text = "";
        txtNPwd1.Text = "";
    }
}