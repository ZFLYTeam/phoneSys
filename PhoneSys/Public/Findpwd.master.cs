﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Findpwd : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        publicNav.Visible = false;
        adminNav.Visible = false;
    }
    protected void lbtnFirstPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Public/Index.aspx");
    }
}
