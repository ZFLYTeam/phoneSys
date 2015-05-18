using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class Buyer_CollectedPhone : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] != null)
            {
                BindDatalist(0);
                cbAll.Checked = false;
            }
            else
            {
                Response.Redirect("~/Public/Index.aspx");
            }
        }
       imgbtnDel.Attributes.Add("onclick", "return confirm('确定要删除吗？');");
      
    }
    private void BindDatalist(int currentpage)
    {
        pds.AllowPaging = true;
        pds.PageSize = 5;
        pds.CurrentPageIndex = currentpage;

        BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
        DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
        if (userdDT.Rows.Count != 0)
        {
            Session["Uid"] = userdDT.Rows[0][1].ToString();
            BuyerDSTableAdapters.View_Collection_PhoneTableAdapter cpDA = new BuyerDSTableAdapters.View_Collection_PhoneTableAdapter();
            DataTable cpDT = cpDA.GetDataByUid(System.Guid.Parse(userdDT.Rows[0][1].ToString()), "phone");
            if (cpDT.Rows.Count > 0)
            {
                cbAll.Visible = true;
                cbAll.Enabled = true;
                imgbtnDel.Visible = true;
                imgbtnDel.Enabled = true;
                Panel1.Visible = false;
                pds.DataSource = cpDT.DefaultView;
                dlCPhone.DataSource = pds;
                dlCPhone.DataBind();
            }
            else
            {
                cbAll.Visible = false;
                cbAll.Enabled = false;
                imgbtnDel.Visible = false;
                imgbtnDel.Enabled = false;
                Panel1.Visible = true;
               // Response.Write("<Script>alert('您未收藏任何商品！')</Script>");
              //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('您未收藏任何商品！');", true);
            }
        }
    }
    protected void imgbtnDelOne_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < dlCPhone.Items.Count; i++)
        {
            string Pid = (((ImageButton)sender).CommandArgument.ToString()).ToString();
            CheckBox cbSel = (CheckBox)dlCPhone.Items[i].FindControl("cbSel");
            if (Pid != "")
            {
                if (cbSel.Checked == true)
                {
                    BuyerDSTableAdapters.CollectionTableAdapter delDA = new BuyerDSTableAdapters.CollectionTableAdapter();
                    int delDT = delDA.DeleteSelectedPhone(System.Guid.Parse(Session["Uid"].ToString()), long.Parse(Pid), "phone");
                    if (delDT != 0)
                    {
                       //  Response.Write("<Script>alert('删除成功！')</Script>");
                       ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('删除成功！');", true);
                    }
                }
                else
                {
                    if (i == dlCPhone.SelectedIndex)
                    {
                        //Response.Write("<Script>alert('请先选择！')</Script>");
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请先选择！');", true);
                    }
                }
            }
        }
        BindDatalist(pds.CurrentPageIndex);
        dlCPhone.DataBind();
    }
    protected void imgbtnInCart_Click(object sender, ImageClickEventArgs e)
    {
        string PhoneId = ((ImageButton)sender).CommandArgument.ToString();
        if (PhoneId != "")
        {
            BuyerDSTableAdapters.PhoneInfoTableAdapter phoneDA = new BuyerDSTableAdapters.PhoneInfoTableAdapter();
            DataTable phoneDT = phoneDA.GetDataByPhoneId(long.Parse(PhoneId));
            if (phoneDT.Rows.Count != 0)
            {
                BuyerDSTableAdapters.ShopCartTableAdapter chartDA = new BuyerDSTableAdapters.ShopCartTableAdapter();
                int chartDT = chartDA.InsertShopChart(System.Guid.Parse(Session["Uid"].ToString()), System.Guid.Parse(phoneDT.Rows[0][2].ToString()), long.Parse(PhoneId), 1, int.Parse(phoneDT.Rows[0][14].ToString()), DateTime.Now, "否");
                if (chartDT != 0)
                {
                    Response.Redirect("~/Buyer/ShoppingCart.aspx?PhoneId=" + PhoneId);
                }
            }
        }
    }
    protected void imgbtnEnterShop_Click(object sender, ImageClickEventArgs e)
    {
        string ShopId = ((ImageButton)sender).CommandArgument.ToString();
        if (ShopId != "")
        {
            Response.Redirect("~/Public/LookShop.aspx?ShopId=" + ShopId);
        }
    }
    protected void imgbtnPhoto_Click(object sender, ImageClickEventArgs e)
    {
        string PhoneId = ((ImageButton)sender).CommandArgument.ToString();
        if (PhoneId != "")
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
    protected void lbtnPName_Click(object sender, EventArgs e)
    {
        string PhoneId = ((LinkButton)sender).CommandArgument.ToString();
        if (PhoneId != "")
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
    protected void cbAll_CheckedChanged(object sender, EventArgs e)
    {
        if (cbAll.Checked)
        {
            Session["cbAll"] = "true";
            for (int i = 0; i < dlCPhone.Items.Count; i++)
            {
                CheckBox cbSel = (CheckBox)dlCPhone.Items[i].FindControl("cbSel");
                cbSel.Checked = true;
            }
            imgbtnDel.Enabled = true;
        }
        else
        {
            Session["cbAll"] = "false";
            for (int i = 0; i < dlCPhone.Items.Count; i++)
            {
                CheckBox cbSel = (CheckBox)dlCPhone.Items[i].FindControl("cbSel");
                cbSel.Checked = false;
            }
            imgbtnDel.Enabled = false;
        }
    }
    protected void dlCPhone_ItemCommand(object source, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "first":
                pds.CurrentPageIndex = 0;
                BindDatalist(pds.CurrentPageIndex);
                break;
            case "pre":
                pds.CurrentPageIndex = pds.CurrentPageIndex - 1;
                BindDatalist(pds.CurrentPageIndex);
                break;
            case "next":
                pds.CurrentPageIndex = pds.CurrentPageIndex + 1;
                BindDatalist(pds.CurrentPageIndex);
                break;
            case "last":
                pds.CurrentPageIndex = pds.PageCount - 1;
                BindDatalist(pds.CurrentPageIndex);
                break;
            case "search":
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int pageCount = int.Parse(pds.PageCount.ToString());
                    TextBox txtSkip = (TextBox)e.Item.FindControl("txtSkip");
                    int MyPageNum = 0;
                    if (!txtSkip.Text.Equals(""))
                    {
                        MyPageNum = Convert.ToInt32(txtSkip.Text.ToString());

                    }
                    if (MyPageNum <= 0 || MyPageNum > pageCount)
                    {
                         //Response.Write("<Script>alert('页数不正确！')</Script>");
                       ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('页数不正确！');", true);
                    }

                    else
                    {
                        BindDatalist(MyPageNum - 1);
                    }
                }
                break;
        }
    }
    protected void dlCPhone_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label lblCurrent = e.Item.FindControl("lblCurrentPage") as Label;
            Label lblCount = e.Item.FindControl("lblCount") as Label;
            LinkButton lbtnFirst = e.Item.FindControl("lbtnFirst") as LinkButton;
            LinkButton lbtnPre = e.Item.FindControl("lbtnPre") as LinkButton;
            LinkButton lbtnNext = e.Item.FindControl("lbtnNext") as LinkButton;
            LinkButton lbtnLast = e.Item.FindControl("lbtnLast") as LinkButton;

            lblCurrent.Text = "第" + (pds.CurrentPageIndex + 1).ToString() + "页";
            lblCount.Text = "共" + pds.PageCount.ToString() + "页";
            if (pds.IsFirstPage)
            {
                lbtnFirst.Enabled = false;
                lbtnPre.Enabled = false;
            }
            if (pds.IsLastPage)
            {
                lbtnNext.Enabled = false;
                lbtnLast.Enabled = false;
            }
        }
    }
    protected void imgbtnDel_Click(object sender, ImageClickEventArgs e)
    {
        int flag = 0;
        if (cbAll.Checked)
        {
            for (int i = 0; i < dlCPhone.Items.Count; i++)
            {

                Label lblHidden = (Label)dlCPhone.Items[i].FindControl("lblHidden");
                CheckBox cbSel = (CheckBox)dlCPhone.Items[i].FindControl("cbSel");
                if (lblHidden.Text != "")
                {
                    if (cbSel.Checked == true)
                    {
                        BuyerDSTableAdapters.CollectionTableAdapter delDA = new BuyerDSTableAdapters.CollectionTableAdapter();
                        int delDT = delDA.DeleteSelectedPhone(System.Guid.Parse(Session["Uid"].ToString()), long.Parse(lblHidden.Text), "phone");
                        if (delDT != 0)
                        {
                            flag++;
                        }
                    }
                }
            }
            if (flag != 0)
            {
                // Response.Write("<Script>alert('删除成功！')</Script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('删除成功！');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请先选择！');", true);
            // Response.Write("<Script>alert('请先选择！')</Script>");
        }
        cbAll.Checked = false;
        BindDatalist(pds.CurrentPageIndex);
        dlCPhone.DataBind();
    }
}