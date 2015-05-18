using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminmaindatasetTableAdapters;
using System.Data;

public partial class Admin_ScreenAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
    protected void IbnSave_Click(object sender, ImageClickEventArgs e)
    {
        DM_screensizeTableAdapter dscreen = new DM_screensizeTableAdapter();
        int addscreen = dscreen.InsertScreensize(txtsizeid.Text, txtsizename.Text, txtcommit.Text);
        if (addscreen > 0)
        {
            Response.Write("<script language=javascript>alert('温馨提示：\\n\\n屏幕尺寸类型添加成功！');</script>");
            txtsizeid.Text = "";
            txtsizename.Text = "";
            txtcommit.Text = "";
            Response.Write("<script language=javascript>window.location.href='ScreenAdd.aspx'</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n                          " + txtsizename.Text + "添加失败！');", true);
        }
    }
}