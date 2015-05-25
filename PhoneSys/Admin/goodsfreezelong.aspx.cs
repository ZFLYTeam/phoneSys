using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_goodsfreezelong : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Iblbngoodssearch_Click(object sender, ImageClickEventArgs e)
    {
        string cmdgoods = "";
        string goodscondition = txtcondition.Text;

        if (txtcondition.Text == "")
        {
            cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='永久冻结'";
        }
        else
        {
            switch (ddlseltype.SelectedItem.Text)
            {
                case "全部手机": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='永久冻结'"; break;
                case "手机编号": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='永久冻结' and phone_id like'%"
                                  + goodscondition + "%'"; break;
                case "手机名": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='永久冻结' and  phone_name like'%"
                                  + goodscondition + "%'"; break;
                case "手机品牌": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where  mobilestate='永久冻结' and brand like'%"
                                  + goodscondition + "%'"; break;
                case "手机卖家": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1  where  mobilestate='永久冻结' and  realname like'%"
                                  + goodscondition + "%'"; break;
                case "店铺名": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='永久冻结' and  shop_name like'%"
                              + goodscondition + "%'"; break;
            }
        }
        sdsgoodsmana.SelectCommand = cmdgoods;
        gdvgoodsfrelong.Visible = true;
    }
    protected void gdvgoodsfrelong_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;

        //执行循环，保证每条数据都可以更新
        for (i = 0; i < gdvgoodsfrelong.Rows.Count; i++)
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abc937'");
                // 当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }
    }
}