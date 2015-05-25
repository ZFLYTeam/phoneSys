using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdminmaindatasetTableAdapters;

public partial class Admin_goodstempfreeze : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (gdvgoodstemfreeze.Rows.Count<=0)
        {
            cbxselgoodsall.Enabled = false;
            cbxselgoodsall.Visible = false;
            btnfreezelong.Enabled = false;
            btnfreezelong.Visible = false;
            btngoodtemfreeze.Enabled = false;
            btngoodtemfreeze.Visible = false;
        }
    }
    protected void Iblbngoodssearch_Click(object sender, ImageClickEventArgs e)
    {
        string cmdgoods = "";
        string goodscondition = txtcondition.Text;

        if (txtcondition.Text == "")
        {
            cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='暂时冻结'";
        }
        else
        {
            switch (ddlseltype.SelectedItem.Text)
            {
                case "全部手机": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='暂时冻结'"; break;
                case "手机编号": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='暂时冻结' and phone_id like'%"
                                  + goodscondition + "%'"; break;
                case "手机名": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='暂时冻结' and  phone_name like'%"
                                  + goodscondition + "%'"; break;
                case "手机品牌": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where  mobilestate='暂时冻结' and brand like'%"
                                  + goodscondition + "%'"; break;
                case "手机卖家": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1  where  mobilestate='暂时冻结' and  realname like'%"
                                  + goodscondition + "%'"; break;
                case "店铺名": cmdgoods = "SELECT phone_id, phone_image, phone_name, brand, realname, shop_name, price, mobiletype, phoneselltime, mobilestate FROM dbo.phone_state_set_view1 where mobilestate='暂时冻结' and  shop_name like'%"
                              + goodscondition + "%'"; break;
            }
        }
        sdsgoodsmana.SelectCommand = cmdgoods;
        gdvgoodstemfreeze.Visible = true;
    }
    protected void gdvgoodstemfreeze_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;

        //执行循环，保证每条数据都可以更新
        for (i = 0; i < gdvgoodstemfreeze.Rows.Count; i++)
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
    protected void cbxselgoodsall_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvgoodstemfreeze.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvgoodstemfreeze.Rows[i].FindControl("cbxselphoneid");
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
    protected void btngoodtemfreeze_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvgoodstemfreeze.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvgoodstemfreeze.Rows[i].FindControl("cbxselphoneid");
            Label lblid = (Label)gdvgoodstemfreeze.Rows[i].FindControl("lblgoods");
            if (cbox.Checked == true)
            {
                PhoneInfoTableAdapter goodspass = new PhoneInfoTableAdapter();
                long goodid = new long();
                goodid = Convert.ToInt64(lblid.Text);
                int count = goodspass.Updatephonestatebyid("3", goodid);

                if (count==-1)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n当前用户已设为解除冻结！');</script>");
                    Response.Write("<script language=javascript>window.location.href='goodstempfreeze.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因审核失败！');", true);
                }
            }
        }
    }
    protected void btnfreezelong_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvgoodstemfreeze.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvgoodstemfreeze.Rows[i].FindControl("cbxselphoneid");
            Label lblid = (Label)gdvgoodstemfreeze.Rows[i].FindControl("lblgoods");
            if (cbox.Checked == true)
            {
                PhoneInfoTableAdapter goodspass = new PhoneInfoTableAdapter();
                long goodid = new long();
                goodid = Convert.ToInt64(lblid.Text);
                int count = goodspass.Updatephonestatebyid("6", goodid);

                if (count==-1)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n当前用户已设为永久冻结！');</script>");
                    Response.Write("<script language=javascript>window.location.href='goodstempfreeze.aspx'</script>");
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