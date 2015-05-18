using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdminmaindatasetTableAdapters;

public partial class Admin_shopcommanage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (gdvcompmana.Rows.Count<=0)
        {
            cbxselcompsall.Enabled = false;
            cbxselcompsall.Visible = false;
            btngoodscomp.Enabled = false;
            btngoodscomp.Visible = false;
        }
    }
    protected void gdvcompmana_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;

        //执行循环，保证每条数据都可以更新
        for (i = 0; i < gdvcompmana.Rows.Count; i++)
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
    protected void lbncompsearch_Click(object sender, ImageClickEventArgs e)
    {
        string cmdgoods = "";
        string goodscondition = txtcondition.Text;

        if (txtcondition.Text == "")
        {
            switch (ddlseltype.SelectedItem.Text)
            {
                case "全部店铺": cmdgoods = "SELECT complaint_id, UserName, shop_name, compInfo, comptime, meaning FROM dbo.shop_complaint_manage_view1"; break;
                case "待处理": cmdgoods = "SELECT complaint_id, UserName, shop_name, compInfo, comptime, meaning FROM dbo.shop_complaint_manage_view1 where meaning='待处理'"; break;
                case "已处理": cmdgoods = "SELECT complaint_id, UserName, shop_name, compInfo, comptime, meaning FROM dbo.shop_complaint_manage_view1 where meaning='已处理'"; break;
            }
        }
        else
        {
            switch (ddlseltype.SelectedItem.Text)
            {
                case "全部店铺": cmdgoods = "SELECT complaint_id, UserName, shop_name, compInfo, comptime, meaning FROM dbo.shop_complaint_manage_view1"; break;
                case "待处理": cmdgoods = "SELECT complaint_id, UserName, shop_name, compInfo, comptime, meaning FROM dbo.shop_complaint_manage_view1 where  meaning='待处理' and shop_name like '%"
                    + txtcondition.Text + "%'"; break;
                case "已处理": cmdgoods = "SELECT complaint_id, UserName, shop_name, compInfo, comptime, meaning FROM dbo.shop_complaint_manage_view1  where meaning='已处理' and shop_name like '%"
                    + txtcondition.Text + "%'"; break;
                case "店铺名": cmdgoods = "SELECT complaint_id, UserName, shop_name, compInfo, comptime, meaning FROM dbo.shop_complaint_manage_view1 where shop_name like '%"
                    + txtcondition.Text + "%'"; break;
            }
        }
        sdsgoodsmana.SelectCommand = cmdgoods;
        gdvcompmana.Visible = true;
    }
    protected void cbxselcompsall_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvcompmana.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvcompmana.Rows[i].FindControl("cbxselphoneid");
            if (cbxselcompsall.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }
    }
    protected void btngoodscomp_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvcompmana.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvcompmana.Rows[i].FindControl("cbxselphoneid");
            Label lblid = (Label)gdvcompmana.Rows[i].FindControl("lblgoods");
            if (cbox.Checked == true)
            {
                string compid = lblid.Text;
                ComplaintInfoTableAdapter compstate = new ComplaintInfoTableAdapter();
                long id = new long();
                id = Convert.ToInt64(compid);
                int result = compstate.Updatecomplaintstate("2", id);
                if (result ==-1)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n用户店铺状态已改为通过！');</script>");
                    Response.Write("<script language=javascript>window.location.href='goodscompmanage.aspx'</script>");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n投诉状态由于一些原因设置失败！');", true);

                }
            }
        }
    }
}