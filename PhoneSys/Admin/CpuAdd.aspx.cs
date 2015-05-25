using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminmaindatasetTableAdapters;
using System.Data;

public partial class Admin_CpuAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void IbnSave_Click(object sender, ImageClickEventArgs e)
    {
        DM_CPUTableAdapter dcpu = new DM_CPUTableAdapter();
        int addcpu = dcpu.InsertCpu(txtCPUid.Text, txtCPUname.Text, txtcommit.Text);
        if (addcpu > 0)
        {
            Response.Write("<script language=javascript>alert('温馨提示：\\n\\n手机内核类型添加成功！');</script>");
            txtCPUid.Text = "";
            txtCPUname.Text = "";
            txtcommit.Text = "";
            Response.Write("<script language=javascript>window.location.href='CpuAdd.aspx'</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('对不起！\\n\\n                          " + txtCPUname.Text + "添加失败！');", true);

        }
    }
}