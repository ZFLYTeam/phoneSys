using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Public_style : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] != null)
            {
                lblMsg.Text = "欢迎您，" + Session["name"].ToString();
                btnQuit.Visible = true;
                Menu2.Visible = true;
            }
            else
            {
                Response.Redirect("~Public/Index.aspx");
            }
        }
    }
    protected void btnQuit_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Public/index.aspx");
    }
    protected void lbtnFirstPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Public/Index.aspx");
    }
}
