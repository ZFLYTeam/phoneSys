using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using AdminmaindatasetTableAdapters;
using System.Configuration;
using ViewDateSetTableAdapters;


public partial class Public_PhoneSearch : System.Web.UI.Page
{
    string strlast = "shop_id";
    string keyword = null;
    string strkeyword = "SELECT * FROM dbo.shopinfo_phoneinfo_query_view1 where shop_id like % ";
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
            if (Request.QueryString["phonekeyword"] != null)
            {
                dlodsphone.Visible = true;
                dlPhone.Visible = false;
                keyword = Request.QueryString["phonekeyword"].ToString();
                txtSearch.Text = keyword;

                shopinfo_phoneinfo_query_view1TableAdapter sct = new shopinfo_phoneinfo_query_view1TableAdapter();
                DataTable dacondition = sct.GetDataBycondition('%' + keyword + '%');

                dlodsphone.DataSource = dacondition;
                dlodsphone.DataBind();
                if (dacondition.Rows.Count == 0)
                {
                    Response.Write("<Script>alert('没有找到相关商品！')</Script>");
                 }
            }
            else
            {
                dlodsphone.Visible = false;
                dlPhone.Visible = true ;
            }
            Button[] button = { Button1, Button2, Button3, Button4, Button5, Button6, Button7, Button8, Button9,Button10,Button11, Button12, Button13, Button14, Button15,
                              Button16, Button17, Button18, Button19, Button20, Button21, Button22, Button23, Button24, Button25, Button26, Button27, Button28, Button29, Button30,
                              Button31, Button32, Button33, Button34, Button35, Button36, Button37, Button38, Button39, Button40, Button41, Button42,Button43, Button44, 
                              Button45, Button46, Button47, Button48, Button49, Button50};
            /*品牌*/
            DM_phonebrandTableAdapter brandDa = new DM_phonebrandTableAdapter();
            DataTable brandTable = brandDa.GetData();
            for (int i = 0; i < brandTable.Rows.Count; i++)
            {
                button[i].Visible = true;
                button[i].Text = brandTable.Rows[i]["meaning"].ToString();
            }
            /*操作系统*/
            DM_osTableAdapter osDa = new DM_osTableAdapter();
            DataTable osTable = osDa.GetData();
            for (int i = 0; i < osTable.Rows.Count; i++)
            {
                int j = 20;
                button[j + i].Visible = true;
                button[j + i].Text = osTable.Rows[i]["meaning"].ToString();
            }

            /*手机颜色*/
            DM_colorTableAdapter colorDa = new DM_colorTableAdapter();
            DataTable colorTable = colorDa.GetData();
            for (int i = 0; i < colorTable.Rows.Count; i++)
            {
                int j = 30;
                button[j + i].Visible = true;
                button[j + i].Text = colorTable.Rows[i]["meaning"].ToString();
            }

            /*屏幕尺寸*/
            DM_screensizeTableAdapter screenSizeDa = new DM_screensizeTableAdapter();
            DataTable screenSizeTable = screenSizeDa.GetData();
            for (int i = 0; i < screenSizeTable.Rows.Count; i++)
            {
                int j = 40;
                button[j + i].Visible = true;
                button[j + i].Text = screenSizeTable.Rows[i]["meaning"].ToString();
            }

            ///*价格区间*/
            //DM_priceintervalTableAdapter priceIntervalDa = new DM_priceintervalTableAdapter();
            //DataTable priceIntervalTable = priceIntervalDa.GetData();
            //for (int i = 0; i < priceIntervalTable.Rows.Count; i++)
            //{
            //    int j = 50;
            //    button[j + i].Visible = true;
            //    button[j + i].Text = priceIntervalTable.Rows[i]["low"].ToString() + "-" + priceIntervalTable.Rows[i]["high"].ToString();
            //}
        }


    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text.Trim()!=null)
        {
                dlodsphone.Visible = true;
                dlPhone.Visible = false;
                keyword = txtSearch.Text.Trim();
                shopinfo_phoneinfo_query_view1TableAdapter sct = new shopinfo_phoneinfo_query_view1TableAdapter();
                DataTable dacondition = sct.GetDataBycondition('%' + keyword + '%');

                dlodsphone.DataSource = dacondition;
                dlodsphone.DataBind();
                if (dacondition.Rows.Count == 0)
                {
                    Response.Write("<Script>alert('没有找到相关商品！')</Script>");
                }
        }
        else
        {
            dlodsphone.Visible = false;
            dlPhone.Visible = true;
        }
    }

    protected void imgbtnPhoto_Click(object sender, ImageClickEventArgs e)
    {
        string pid = (((ImageButton)sender).CommandArgument.ToString()).ToString();
        if (pid != "")
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + pid);
        }
    }
    protected void lbtnPName_Click(object sender, EventArgs e)
    {
        string pid = (((LinkButton)sender).CommandArgument.ToString()).ToString();
        if (pid != "")
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + pid);
        }
    }
    protected void lbtnSName_Click(object sender, EventArgs e)
    {
        string sid = (((LinkButton)sender).CommandArgument.ToString()).ToString();
        if (sid != "")
        {
            Response.Redirect("~/Public/LookShop.aspx?ShopId=" + sid);
        }
    }
    protected void btnUserLogin_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(txtUser.Text, txtPwd.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(txtUser.Text, true);
            Session["name"] = txtUser.Text;
            Response.Redirect("~/Public/PhoneSearch.aspx?name=" + txtUser.Text);
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
            string address =  txtStreet.Text;

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
            }
        }
        else
        {
            Response.Write("<Script>alert('请填写完整信息！')</Script>");
            //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请填写完整信息！');", true);
        }
    } 
    protected void btnQuit_Click(object sender, EventArgs e)
    {
        Session["name"] = null;
        Response.Redirect("~/Public/index.aspx");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        #region 按条件查询
        string strstar = "SELECT shop_id, phone_id, phone_name, mobilebrand, phoneos, screensize, price, color, cpu, pixel, phonetype, shopstate, phone_image, phone_introduction, store_quantity, shop_address, shop_name, phonestate FROM dbo.shopinfo_phoneinfo_query_view1 where ( shop_id like '%'";
        string strbrand = "";
        for (int i = 0; i < cblBrand.Items.Count; i++)
        {
            if (cblBrand.Items[i].Selected)
            {
                if (strlast == "mobilebrand")
                {
                    strbrand += "or mobilebrand like '%" + cblBrand.Items[i].Text.Trim() + "%'";
                    strlast = "mobilebrand";
                }
                else
                {
                    strbrand += ")  and ( mobilebrand like '%" + cblBrand.Items[i].Text.Trim() + "%'";
                    strlast = "mobilebrand";
                }
            }
        }

        string stros = "";
        for (int i = 0; i < cblOS.Items.Count; i++)
        {
            if (cblOS.Items[i].Selected)
            {
                if (strlast == "phoneos")
                {
                    stros += "or phoneos like '%" + cblOS.Items[i].Text.Trim() + "%'";
                    strlast = "phoneos";
                }
                else
                {
                    stros += ")  and ( phoneos like '%" + cblOS.Items[i].Text.Trim() + "%'";
                    strlast = "phoneos";
                }
            }

        }

        string strsreen = "";
        for (int i = 0; i < cblSreen.Items.Count; i++)
        {
            if (cblSreen.Items[i].Selected)
            {
                if (strlast == "screensize")
                {
                    strsreen += "or screensize like '%" + cblSreen.Items[i].Text.Trim() + "%'";
                    strlast = "screensize";
                }
                else
                {
                    strsreen += ")  and  ( screensize like '%" + cblSreen.Items[i].Text.Trim() + "%'";
                    strlast = "screensize";
                }
            }
        }

        string strcolor = "";
        for (int i = 0; i < cblcolor.Items.Count; i++)
        {
            if (cblcolor.Items[i].Selected)
            {
                if (strlast == "color")
                {
                    strcolor += "or color like '%" + cblcolor.Items[i].Text.Trim() + "%'";
                    strlast = "color";
                }
                else
                {
                    strcolor += ")  and  ( color like '%" + cblcolor.Items[i].Text.Trim() + "%'";
                    strlast = "color";
                }
            }
        }
        string strpriceint = "";
        for (int i = 0; i < cblPrice.Items.Count; i++)
        {
            if (cblPrice.Items[i].Selected)
            {
                string price = cblPrice.Items[i].Text.Trim();
                string[] sArray = price.Split('-');
                string str1 = sArray[0].ToString().Trim();
                string str2 = sArray[1].ToString().Trim();
                int low = Convert.ToInt32(str1.ToString());
                int high = Convert.ToInt32(str2.ToString());
                if (strlast == "price")
                {
                    strpriceint += "or ( price >=" + low + " and price<" + high + ")";
                    strlast = "price";
                }
                else
                {
                    strpriceint += ") and ( ( price >=" + low + " and price<" + high + ")";
                    strlast = "price";
                }
            }
        }
        //dlPhone.Visible = true ;
        dlodsphone.Visible = false;
        dlPhone.Visible = true;
        sdsresult.SelectCommand = strstar + strbrand + stros + strsreen + strcolor + strpriceint + ")";
        #endregion
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        pnlcondition.Visible = false;
        pnlbtncondition.Visible = true;
    }
    protected void filter_Click(object sender, EventArgs e)
    {
        dlodsphone.Visible= true;//显示筛选查询的控件显示
        dlPhone.Visible=false;
        Button[] button = { Button1, Button2, Button3, Button4, Button5, Button6, Button7, Button8, Button9,Button10,Button11, Button12, Button13, Button14, Button15,
                              Button16, Button17, Button18, Button19, Button20, Button21, Button22, Button23, Button24, Button25, Button26, Button27, Button28, Button29, Button30,
                              Button31, Button32, Button33, Button34, Button35, Button36, Button37, Button38, Button39, Button40, Button41, Button42,Button43, Button44, 
                              Button45, Button46, Button47, Button48, Button49, Button50};
        Button btn = (Button)sender;
        for (int i = 0; i < 60; i++)
        {
            if (btn == button[i])
            {
                string keyword = btn.Text;
                if (i >= 30 && i < 40)//摄头像筛选
                    if (i >= 40 && i < 50)//屏幕尺寸筛选
                        keyword = keyword.Substring(0, keyword.LastIndexOf("寸"));
                dlodsphone.DataSource = query.queryByKeyword(keyword, i / 10);
                dlodsphone.DataBind();
                break;
            }
        }
    }
    protected void btnmoreselect_Click(object sender, EventArgs e)
    {
        pnlbtncondition.Visible = false;
        pnlcondition.Visible = true;
    }
    protected void lbtnFirstPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Public/Index.aspx");
    }
}