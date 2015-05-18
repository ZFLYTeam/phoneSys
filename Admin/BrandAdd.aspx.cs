using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdminmaindatasetTableAdapters;

public partial class Admin_BrandAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void IbnSave_Click(object sender, ImageClickEventArgs e)
    {
        DM_phonebrandTableAdapter dmbrand = new DM_phonebrandTableAdapter();
        int addb = dmbrand.Insertbrand(txtbrandid.Text, txtbrandname.Text, txtcommit.Text);
        if (addb > 0)
        {
            Response.Write("<script language=javascript>alert('温馨提示：\\n\\n手机品牌添加成功！');</script>");
            txtbrandid.Text = "";
            txtbrandname.Text = "";
            txtcommit.Text = "";
            Response.Write("<script language=javascript>window.location.href='BrandAdd.aspx'</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n                          " + txtbrandname.Text + "添加失败！');", true);
        }
    }
}