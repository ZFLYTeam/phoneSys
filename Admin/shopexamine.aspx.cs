using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdminmaindatasetTableAdapters;
using ViewDateSetTableAdapters;

public partial class Admin_shopexamine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtexamcondition.ToolTip = "请输入店铺名";
        if (gdvexamshop.Rows.Count<=0)
        {
            cbxselall.Enabled = false;
            cbxselall.Visible = false;
            btnnopass.Enabled = false;
            btnnopass.Visible = false;
            btnpass.Enabled = false;
            btnpass.Visible = false;
            btnresetpass.Visible = false;
            btnresetpass.Enabled = false;
            btnsearchexam.Enabled = false;
            btnsearchexam.Visible = false;
        }
        
    }
    protected void btnsearchexam_Click(object sender, ImageClickEventArgs e)
    {
        string cmdstate = "";
        string examcondition = txtexamcondition.Text;
        if (txtexamcondition.Text=="")
        {
            switch (ddlexamtype.SelectedItem.Text)
            {
                case "--全部--":cmdstate="SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view";break;
                case "未审核":cmdstate="SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='"
                                        +ddlexamtype.SelectedItem.Text+"'";break;
                case "通过审核": cmdstate = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='"
                    +ddlexamtype.SelectedItem.Text+"'"; break;
                case "未通过": cmdstate = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='"
                    +ddlexamtype.SelectedItem.Text+"'"; break;
            }
        }
        else
        {
            switch (ddlexamtype.SelectedItem.Text)
            {
                case "--全部--": cmdstate = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where shop_name like '%"+examcondition+"%'"; break;
                case "未审核": cmdstate = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='"
                    +ddlexamtype.SelectedItem.Text+"' and shop_name like '%"+examcondition+"%'"; break;
                case "通过审核": cmdstate = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='"
                    +ddlexamtype.SelectedItem.Text+"' and shop_name like '%"+examcondition+"%'"; break;
                case "未通过": cmdstate = "SELECT shop_id, shop_name, shop_jianjie, shop_owner, UserName, realname, Idcard_photo, meaning FROM dbo.examshop_shopinfo_extend_view where meaning='"
                    +ddlexamtype.SelectedItem.Text+"' and shop_name like '%"+examcondition+"%'"; break;
            }
        }
        if (ddlexamtype.SelectedItem.Text=="未通过")
        {
            cbxselall.Visible = true;
            pnlexam.Visible = false;
            btnresetpass.Visible = true;
           sdsexamshop.SelectCommand = cmdstate;
        }
        else if (ddlexamtype.SelectedItem.Text=="通过审核")
        {
            cbxselall.Visible = false;
            pnlexam.Visible = false;
            btnresetpass.Visible = false;
            sdsexamshop.SelectCommand = cmdstate;
        }
        else
        {
            cbxselall.Visible = true;
            pnlexam.Visible = true;
            btnresetpass.Visible = false;
            sdsexamshop.SelectCommand = cmdstate;
        }
       
        
        gdvexamshop.Visible = true;
        
    }
    protected void btnpass_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvexamshop.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvexamshop.Rows[i].FindControl("cbxselshop");
            Label lblshopid = (Label)gdvexamshop.Rows[i].FindControl("lblsign");
            if (cbox.Checked == true)
            {
                long shopid = new long();
                shopid = Convert.ToInt64(lblshopid.Text);
                QueriesTableAdapter qta = new QueriesTableAdapter();
                int count =qta.proc_updaterolesandshop("2", shopid);

                if (count==-1)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n用户店铺审核通过！');</script>");
                    Response.Write("<script language=javascript>window.location.href='shopexamine.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }
                
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因审核失败！');", true);
                        //Response.Write("<script language=javascript>window.location.href='shopexamine.aspx'</script>");
                    }
                }
        }
    }
    protected void cbxselall_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvexamshop.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvexamshop.Rows[i].FindControl("cbxselshop");
            if (cbxselall.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }
    }
    protected void btnnopass_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvexamshop.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvexamshop.Rows[i].FindControl("cbxselshop");
            Label lblshopid = (Label)gdvexamshop.Rows[i].FindControl("lblsign");
            if (cbox.Checked == true)
            {
                ShopInfoTableAdapter upshopif = new ShopInfoTableAdapter();

                long shopid = new long();
                shopid = Convert.ToInt64(lblshopid.Text);
                QueriesTableAdapter qta = new QueriesTableAdapter();
                int count = qta.proc_updaterolesandshop("4", shopid);

                if (count==-1)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n用户店铺审核已经设置未通过！');</script>");
                    Response.Write("<script language=javascript>window.location.href='shopexamine.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因设置失败！');", true);
                }
            }
        }
    }
    protected void btnresetpass_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvexamshop.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvexamshop.Rows[i].FindControl("cbxselshop");
            Label lblshopid = (Label)gdvexamshop.Rows[i].FindControl("lblsign");
            if (cbox.Checked == true)
            {
                long shopid = new long();
                shopid = Convert.ToInt64(lblshopid.Text);
                QueriesTableAdapter qta = new QueriesTableAdapter();
                int count = qta.proc_updaterolesandshop("2", shopid);

                if (count==-1)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n用户店铺状态已改为通过！');</script>");
                    Response.Write("<script language=javascript>window.location.href='shopexamine.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因设置失败！');", true);
                }
            }
        }
    }
    protected void gdvexamshop_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;

        //执行循环，保证每条数据都可以更新
        for (i = 0; i < gdvexamshop.Rows.Count; i++)
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