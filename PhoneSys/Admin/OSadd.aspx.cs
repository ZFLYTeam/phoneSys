using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminmaindatasetTableAdapters;
using System.Data;

public partial class Admin_Osadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DM_osTableAdapter dos = new DM_osTableAdapter();
        int addos = dos.InsertOs(txtosid.Text,txtosname.Text,txtcommit.Text);
        if (addos > 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "MyScript", "<script>alert('添加成功');window.close();</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n                          " + txtosname.Text + "添加失败！');", true);
        }
    }
    protected void IbnSave_Click(object sender, ImageClickEventArgs e)
    {
        DM_osTableAdapter dos = new DM_osTableAdapter();
        int addos = dos.InsertOs(txtosid.Text, txtosname.Text, txtcommit.Text);
        if (addos > 0)
        {
            Response.Write("<script language=javascript>alert('温馨提示：\\n\\n手机操作系统类型添加成功！');</script>");
            txtosid.Text = "";
            txtosname.Text = "";
            txtcommit.Text = "";
            Response.Write("<script language=javascript>window.location.href='OSAdd.aspx'</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n                          " + txtosname.Text + "添加失败！');", true);
        }
    }
}