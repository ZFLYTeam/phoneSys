using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminmaindatasetTableAdapters;
using System.Data;

public partial class Admin_PriceintervalAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Ibnsave_Click(object sender, ImageClickEventArgs e)
    {
        DM_priceintervalTableAdapter dprice = new DM_priceintervalTableAdapter();
        int addpri = dprice.InsertPriceinterval(txtpriceid.Text, Convert.ToInt32(txtpricelow.Text.ToString()), Convert.ToInt32(txtpricehigh.Text.ToString()), txtcommit.Text);
        if (addpri > 0)
        {
            Response.Write("<script language=javascript>alert('温馨提示：\\n\\n价格区间添加成功！');</script>");
            txtpricehigh.Text = "";
            txtpriceid.Text = "";
            txtpricelow.Text = "";
            txtcommit.Text = "";
            Response.Write("<script language=javascript>window.location.href='PriceintervalAdd.aspx'</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n                          编号为" + txtpriceid.Text + "添加失败！');", true);
        }
    }
}