using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminmaindatasetTableAdapters;
using System.Data;

public partial class Admin_PixelAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Ibnsave_Click(object sender, ImageClickEventArgs e)
    {
        DM_pixelTableAdapter dpixel = new DM_pixelTableAdapter();
        int addpixel = dpixel.InsertPixel(txtpixelid.Text, txtpixelname.Text, txtcommit.Text);

        if (addpixel > 0)
        {
            Response.Write("<script language=javascript>alert('温馨提示：\\n\\n手机像素类型添加成功！');</script>");
            txtpixelid.Text = "";
            txtpixelname.Text= "";
            txtcommit.Text = "";
            Response.Write("<script language=javascript>window.location.href='PixelAdd.aspx'</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n                          " + txtpixelname.Text + "添加失败！');", true);
        }
    }
}