using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class Public_index : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] != null)
            {
                lblMsg.Text = "欢迎您，" + Session["name"].ToString();
                btnQuit.Visible = true;
                lblLogin.Visible = false;
                lblRegister.Visible = false;
                Menu1.Visible = true;
                Menu1.Enabled = true;
            }
            else
            {
                lblMsg.Text = "亲，欢迎光临!";
                btnQuit.Visible = false;
                lblRegister.Visible = true;
                lblLogin.Visible = true;
                Menu1.Enabled = false;
                Menu1.Visible = false;
            }
        }
    }
    protected void btnUserLogin_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(txtUser.Text, txtPwd.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(txtUser.Text, true);
            Session["name"] = txtUser.Text;
            if (Session["lasturl"]== null)
            {
                Response.Redirect("~/Public/Index.aspx?name=" + txtUser.Text);
            }
            else
            {
                Response.Redirect(Session["lasturl"].ToString());//未登录前想要进入的页面
            }
        }
        else
        {
            Response.Write("<Script>alert('用户名或密码错误！')</Script>");
            //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('用户名或密码错误！');", true);
        }
    }
    protected void lbtnFindPwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Public/FindPwd.aspx?name=" + txtUser.Text);
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text != "" && txtRealName.Text != "" && txtQuestion.Text != "" && txtNewPwd.Text != "" && txtTelPhone.Text != "" && txtEmail.Text != "" && txtAnswer.Text != "" && txtStreet.Text != ""&&txtAckPwd.Text!="")
        {            
            string Password = txtAckPwd.Text;
            string roleId = "";

            //获取买家角色的ID
            PSysDSTableAdapters.aspnet_RolesTableAdapter roleDA = new PSysDSTableAdapters.aspnet_RolesTableAdapter();
            DataTable roleDT = roleDA.GetDataByRoleName("买家");
            if (roleDT.Rows.Count > 0)
            {
                roleId = roleDT.Rows[0][1].ToString();

            }

            //密码加密
            register_addpwd common = new register_addpwd();
            string salt = common.GenerateSalt();
            Password = common.EncodePassword(Password, 1, salt);
            string address =  txtStreet.Text;

            PSysDSTableAdapters.QueriesTableAdapter registerDA = new PSysDSTableAdapters.QueriesTableAdapter();
            int result = registerDA.P_INSERT_USER_ROLES("/", txtUserName.Text, "", Password, salt,  txtEmail.Text, txtQuestion.Text, txtAnswer.Text, 1, DateTime.UtcNow, DateTime.Now, 0, 1, roleId, txtRealName.Text, txtTelPhone.Text, address);

            if (result == -1)
            {
                Response.Write("<Script>alert('对不起！\\n用户名已存在！')</Script>");
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n用户名已存在！');", true);
            }
            else
            {
                Response.Write("<Script>alert('恭喜您！注册成功！')</Script>");
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('恭喜您！注册成功！');", true);
            }
        }
        else
        {
            Response.Write("<Script>alert('请填写完整信息！')</Script>");
            //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请填写完整信息！');", true);
        }
    }       
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string text = txtSearch.Text;
        if (ddlcondition.SelectedValue == "手机")
        {
            ddlcondition.Visible = false;
            Response.Redirect("~/Public/PhoneSearch.aspx?phonekeyword=" + txtSearch.Text);
        }
        else
        {
            ddlcondition.Visible = false;
            Response.Redirect("~/Public/ShopSearch.aspx?shopshkeyword=" + txtSearch.Text);
        }
    }
    protected void btnQuit_Click1(object sender, EventArgs e)
    {
        Context.Session.Clear();
        Response.Redirect("~/Public/Index.aspx");
    }
    protected void lbtnFirstPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Public/Index.aspx");
    }
}
