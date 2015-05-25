using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdminmaindatasetTableAdapters;

public partial class Admin_userunlock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cbxsellockuser_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvuserislock.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvuserislock.Rows[i].FindControl("cbxseluser");
            if (cbxsellockuser.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }
    }
    protected void btnunlock_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvuserislock.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)gdvuserislock.Rows[i].FindControl("cbxseluser");
            //Label lblshopid = (Label)gdvuserisvilid.Rows[i].FindControl("lblfzusersign");
            if (cbox.Checked == true)
            {

                Guid guid = Guid.Parse(gdvuserislock.Rows[i].Cells[1].Text.Trim());
                aspnet_MembershipTableAdapter amem = new aspnet_MembershipTableAdapter();
                int count = amem.Updateisapproved(true, guid);

                if (count > 0)
                {
                    Response.Write("<script language=javascript>alert('温馨提示：\\n\\n当前用户已成功解除锁定！');</script>");
                    Response.Write("<script language=javascript>window.location.href='userunlock.aspx'</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n" + GridView1.Rows[i].Cells[2].Text.Trim() + "您已经选择！');", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n用户店铺由于一些原因审核失败！');", true);
                }
            }
        }
    }
    protected void gdvuserislock_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;

        //执行循环，保证每条数据都可以更新
        for (i = 0; i < gdvuserislock.Rows.Count; i++)
        {
           
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                //当鼠标停留时更改背景色
                //e.Row.Attributes.Add("onmouseover",Convert.ToString(cbxsel.Checked=true));

                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abc937'");
                // 当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }
    }
    protected void Ibnsearch_Click(object sender, ImageClickEventArgs e)
    {
        string cmdsource = "";
        string condition = txtcondition.Text;

        switch (ddlselectuser.SelectedItem.Text)
        {
            case "--全部--": cmdsource = "SELECT UserID, UserName, Email, user_adress, user_tel, LastLoginDate,IsApproved FROM dbo.users_extend_view1 where IsApproved='false'"; break;
            case "用户名": cmdsource = "SELECT UserID, UserName, Email, user_adress, user_tel, LastLoginDate,IsApproved FROM dbo.users_extend_view1 where UserName like '%" + condition + "%' and IsApproved='false'"; break;
        }

        //if (cmdsource == "")
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请输入关键字')</script>");
        //    cmdsource = "";
        //}
        //else
        //{
            sdsunlock.SelectCommand= cmdsource;
            gdvuserislock.Visible = true;

        //}
    }
}