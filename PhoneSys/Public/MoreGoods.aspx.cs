using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdminmaindatasetTableAdapters;
using System.Data;
using System.Configuration;
using ViewDateSetTableAdapters;

public partial class Public_MoreGoods : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
            
            if (!IsPostBack) {
                BindDatalist(0);
            }
    }

    private void BindDatalist(int currentpage)
    {
            pds.AllowPaging = true;
            pds.PageSize =20;
            pds.CurrentPageIndex = currentpage;
            searchgoods_view1TableAdapter phoneda=new searchgoods_view1TableAdapter ();
            DataTable phonedt =phoneda.Getphoneinfo();
            if (phonedt.Rows.Count > 0)
            {
                pds.DataSource = phonedt.DefaultView;
                dlPhone.DataSource = pds;
                dlPhone.DataBind();
            }
    }


    protected void dlPhone_ItemCommand(object source, DataListCommandEventArgs e)
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
    protected void dlPhone_ItemDataBound(object sender, DataListItemEventArgs e)
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

    //protected void lbtnShopName_Click(object sender, EventArgs e)
    //{
    //    string ShopId = ((LinkButton)sender).CommandArgument.ToString();
    //    if (ShopId != "")
    //    {
    //        Response.Redirect("~/Public/LookShop.aspx?ShopId=" + ShopId);
    //    }
    //}
    protected void imgbtnPhoto_Click(object sender, ImageClickEventArgs e)
    {
        string PhoneId = ((ImageButton)sender).CommandArgument.ToString();
        if (PhoneId != null)
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
    protected void lbtnPName_Click(object sender, EventArgs e)
    {
        string PhoneId = ((LinkButton)sender).CommandArgument.ToString();
        if (PhoneId != null)
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
}