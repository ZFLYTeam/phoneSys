using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AdminmaindatasetTableAdapters;
using ViewDateSetTableAdapters;

public partial class Admin_shopfreeze : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Ibnfssearch_Click(object sender, ImageClickEventArgs e)
    {
        string cmdbind = "";
        string fzcondition = txtfscondition.Text;

        if (txtfscondition.Text=="")
        {
            switch (ddlfreezeshopstate.SelectedItem.Text)
        {
            case "--全部--": cmdbind = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view"; break;
            case "运营店铺": cmdbind = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='通过审核'"; break;
            case "已冻结": cmdbind = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='店铺冻结'"; break;
        }
        }
        else
        {
            switch (ddlfreezeshopstate.SelectedItem.Text)
            {
                case "--全部--": cmdbind = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where shop_name like '%" + fzcondition + "%'"; break;
                case "运营店铺": cmdbind = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='通过审核' and shop_name like '%" + fzcondition + "%'"; break;
                case "已冻结": cmdbind = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='店铺冻结' and shop_name like '%" + fzcondition + "%'"; break;
            }
        }
        if (ddlfreezeshopstate.SelectedItem.Text == "--全部--")
        {
            cbxselfzall.Visible = true;
            btncalfreeze.Visible = true;
            btnfzpass.Visible = true;
        }
        else if (ddlfreezeshopstate.SelectedItem.Text=="运营店铺")
        {
            cbxselfzall.Visible = true;
            btncalfreeze.Visible = false;
            btnfzpass.Visible = true;
        }
        else
        {
            cbxselfzall.Visible = true;
            btncalfreeze.Visible = true;
            btnfzpass.Visible = false;
        }

        sdsfzshop.SelectCommand = cmdbind;
        gdvfzshop.Visible = true;
    }
    protected void cbxselfzall_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvfzshop.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvfzshop.Rows[i].FindControl("cbxselshop");
            if (cbxselfzall.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }
    }
    protected void btncalfreeze_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvfzshop.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvfzshop.Rows[i].FindControl("cbxselshop");
            Label lblshopid = (Label)gdvfzshop.Rows[i].FindControl("lblsign");
            if (cbox.Checked == true)
            {
                long shopid = new long();
                shopid = Convert.ToInt64(lblshopid.Text);
                QueriesTableAdapter qta = new QueriesTableAdapter();
                int count = qta.proc_updaterolesandshop("2", shopid);

                if (count==-1)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n用户店铺已经取消冻结！');</script>");
                    Response.Write("<script language=javascript>window.location.href='shopfreeze.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因设置失败！');", true);
                }
            }
        }
    }
    protected void btnfzpass_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvfzshop.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvfzshop.Rows[i].FindControl("cbxselshop");
            Label lblshopid = (Label)gdvfzshop.Rows[i].FindControl("lblsign");
            if (cbox.Checked == true)
            {
                ShopInfoTableAdapter upshopstate = new ShopInfoTableAdapter();

                long shopid = new long();
                shopid = Convert.ToInt64(lblshopid.Text);
                QueriesTableAdapter qta = new QueriesTableAdapter();
                int count = qta.proc_updaterolesandshop("3", shopid);

                if (count==-1)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n用户店铺已经冻结！');</script>");
                    Response.Write("<script language=javascript>window.location.href='shopfreeze.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因设置失败！');", true);
                }
            }
        }
    }
    protected void gdvfzshop_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;

        //执行循环，保证每条数据都可以更新
        for (i = 0; i < gdvfzshop.Rows.Count; i++)
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
}