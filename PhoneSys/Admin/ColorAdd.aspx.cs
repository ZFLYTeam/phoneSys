using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminmaindatasetTableAdapters;
using System.Data;

public partial class Admin_ColorAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DM_colorTableAdapter dcolor = new DM_colorTableAdapter();
        int incolor = dcolor.Insertcolor(txtcolorid.Text,txtcolorname.Text,txtcommit.Text);
        if (incolor > 0)
        {
            Response.Write("<script language=javascript>alert('温馨提示：\\n\\n手机颜色添加成功！');</script>");
            txtcolorid.Text = "";
            txtcolorname.Text= "";
            txtcommit.Text = "";
            Response.Write("<script language=javascript>window.location.href='ColorAdd.aspx'</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n                          " + txtcolorname.Text + "添加失败！');", true);
        }
    }
}