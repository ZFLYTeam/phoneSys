using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdminmaindatasetTableAdapters;

public partial class Admin_goodsmanage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (gdvgoodsmana.Rows.Count <= 0)
        {
            cbxselgoodsall.Enabled = false;
            cbxselgoodsall.Visible = false;
            btngoodsdeny.Enabled = false;
            btngoodsdeny.Visible = false;
            btngoodspass.Enabled = false;
            btngoodspass.Visible = false;
        }
    }
    protected void Ibgoodsnsearch_Click(object sender, ImageClickEventArgs e)
    {
        string cmdgoods = "";
        string goodscondition = txtcondition.Text;

        if (txtcondition.Text=="")
        {
            cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1";
        }
        else
        {
            switch (ddlseltype.SelectedItem.Text)
            {
                case "全部手机": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1"; break;
                case "手机编号": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where phone_id like'%"
                                  +goodscondition+"%'"; break;
                case "手机名": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where phone_name like'%"
                                  + goodscondition + "%'"; break;
                case "手机品牌": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where brand like'%"
                                  + goodscondition + "%'"; break;
                case "手机卖家": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where realname like'%"
                                  + goodscondition + "%'"; break;
                case "店铺名": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where shop_name like'%"
                              + goodscondition + "%'"; break;
            }
        }
        sdsgoodsmana.SelectCommand = cmdgoods;
        gdvgoodsmana.Visible = true;
    }
    protected void cbxselgoodsall_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvgoodsmana.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvgoodsmana.Rows[i].FindControl("cbxselphoneid");
            if (cbxselgoodsall.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }
    }
    protected void gdvgoodsmana_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;

        //执行循环，保证每条数据都可以更新
        for (i = 0; i < gdvgoodsmana.Rows.Count; i++)
        {

            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#ffa042'");
                // 当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }
    }
    protected void btngoodspass_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvgoodsmana.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvgoodsmana.Rows[i].FindControl("cbxselphoneid");
            Label lblid=(Label)gdvgoodsmana.Rows[i].FindControl("lblgoods");
            //Label lblshopid = (Label)gdvuserisvilid.Rows[i].FindControl("lblfzusersign");
            if (cbox.Checked == true)
            {
                PhoneInfoTableAdapter goodspass = new PhoneInfoTableAdapter();
                long goodid = new long();
                goodid = Convert.ToInt64(lblid.Text);
                int count = goodspass.Updatephonestate("2",DateTime.Now,goodid);

                if (count>0)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n当前用户已通过审核！');</script>");
                    Response.Write("<script language=javascript>window.location.href='goodsmanage.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因审核失败！');", true);
                }
            }
        }
    }
    protected void btngoodsdeny_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvgoodsmana.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvgoodsmana.Rows[i].FindControl("cbxselphoneid");
            Label lblid = (Label)gdvgoodsmana.Rows[i].FindControl("lblgoods");
            //Label lblshopid = (Label)gdvuserisvilid.Rows[i].FindControl("lblfzusersign");
            if (cbox.Checked == true)
            {
                PhoneInfoTableAdapter goodspass = new PhoneInfoTableAdapter();
                long goodid = new long();
                goodid = Convert.ToInt64(lblid.Text);
                int count = goodspass.Updatephonestate("3",null,goodid);

                if (count>0)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n当前用户已设为不通过！');</script>");
                    Response.Write("<script language=javascript>window.location.href='goodsmanage.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因审核失败！');", true);
                }
            }
        }
    }
}