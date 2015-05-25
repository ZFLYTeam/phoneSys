using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using AdminmaindatasetTableAdapters;
using ViewDateSetTableAdapters;

public partial class Public_ShopSearch : System.Web.UI.Page
{
    String keywords ="";
    protected static PagedDataSource pds = new PagedDataSource();
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
                if (Session["name"].ToString().Equals("admin"))
                {
                    publicNav.Visible = false;
                    adminNav.Visible = true;
                }
                else
                {
                    publicNav.Visible = true;
                    adminNav.Visible = false;
                }
            }
            else
            {
                lblMsg.Text = "亲，欢迎光临!";
                btnQuit.Visible = false;
                lblRegister.Visible = true;
                lblLogin.Visible = true;
                publicNav.Visible = false;
                adminNav.Visible = false;
            }
            keywords = Context.Request["shopshkeyword"].ToString();
            BindDatalist(0);
        }
    }

    private void BindDatalist(int currentpage)
    {
        pds.AllowPaging = true;
        pds.PageSize = 5;
        pds.CurrentPageIndex = currentpage;

        if (keywords == "")
        {
            searchshopinfo_view1TableAdapter userDA = new searchshopinfo_view1TableAdapter();
            DataTable userdt = userDA.GetData();
            if (userdt.Rows.Count > 0)
            {
                pds.DataSource = userdt.DefaultView;
                dlShop.DataSource = pds;
                dlShop.DataBind();
            }
        }
        else
        {
            shop_selectinfo_view1TableAdapter shopinfoda = new shop_selectinfo_view1TableAdapter();
            DataTable shopinfodt = shopinfoda.Getshopinfobylike('%' + keywords + '%');
            if (shopinfodt.Rows.Count > 0)
            {
                pds.DataSource = shopinfodt.DefaultView;
                dlShop.DataSource = pds;
                dlShop.DataBind();
            }
        }


    }

    protected void dlShop_ItemCommand(object source, DataListCommandEventArgs e)
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
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('页数不正确！');", true);
                    }

                    else
                    {
                        BindDatalist(MyPageNum - 1);
                    }
                }
                break;
        }
    }

    protected void dlShop_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        #region 分页及嵌套datalist显示
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
        else
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataList dlPhoneInShop = (DataList)e.Item.FindControl("dlPhoneInShop");

                string ShopId = dlShop.DataKeys[e.Item.ItemIndex].ToString().Trim();

                shop_phone_byshopid_view1TableAdapter phoneDA = new shop_phone_byshopid_view1TableAdapter();
                DataTable phoneDT = phoneDA.Getphoneinfobyid(long.Parse(ShopId));
                if (phoneDT.Rows.Count > 0)
                {
                    dlPhoneInShop.DataSource = phoneDT;
                    dlPhoneInShop.DataBind();
                }
            }
        }
        #endregion
    }

    protected void lbtnShopName_Click(object sender, EventArgs e)
    {
        string ShopId = ((LinkButton)sender).CommandArgument.ToString();
        if (ShopId != "")
        {
            Response.Redirect("~/Public/LookShop.aspx?ShopId=" + ShopId);
        }
    }
    protected void imgbtnPhoto_Click(object sender, ImageClickEventArgs e)
    {
        string PhoneId = ((ImageButton)sender).CommandArgument.ToString();
        if (PhoneId != null)
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
    protected void lbtnPName_Click(object sender, EventArgs e)
    {
        string PhoneId = ((LinkButton)sender).CommandArgument.ToString();
        if (PhoneId != null)
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }

    protected void btnUserLogin_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(txtUser.Text, txtPwd.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(txtUser.Text, true);
            Session["name"] = txtUser.Text;
            Response.Redirect("~/Public/Index.aspx?name=" + txtUser.Text);
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
        if (txtUserName.Text != "" && txtRealName.Text != "" && txtQuestion.Text != "" && txtNewPwd.Text != "" && txtTelPhone.Text != "" && txtEmail.Text != "" && txtAnswer.Text != "" && txtStreet.Text != "" && txtAckPwd.Text != "")
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
            string address = txtStreet.Text;

            PSysDSTableAdapters.QueriesTableAdapter registerDA = new PSysDSTableAdapters.QueriesTableAdapter();
            int result = registerDA.P_INSERT_USER_ROLES("/", txtUserName.Text, "", Password, salt, txtEmail.Text, txtQuestion.Text, txtAnswer.Text, 1, DateTime.UtcNow, DateTime.Now, 0, 1, roleId, txtRealName.Text, txtTelPhone.Text, address);

            if (result == -1)
            {
                Response.Write("<Script>alert('对不起！\\n用户名已存在！')</Script>");
               //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n用户名已存在！');", true);
            }
            else
            {
                Response.Write("<Script>alert('恭喜您！注册成功！')</Script>");
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('恭喜您！注册成功！');", true);
                //Response.Redirect("~/Public/Index.aspx");
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
        keywords = txtSearch.Text;
        BindDatalist(0);
    }
    protected void btnQuit_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Public/Index.aspx");
    }
    protected void lbtnFirstPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Public/Index.aspx");
    }
}