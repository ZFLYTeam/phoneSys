using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Buyer_CollectedShop : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
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
        imgbtnDelete.Attributes.Add("onclick", "return confirm('确定要删除吗？');");
    }
    private void BindDatalist(int currentpage)
    {
        pds.AllowPaging = true;
        pds.PageSize = 1;
        pds.CurrentPageIndex = currentpage;

        BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
        DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
        if (userdDT.Rows.Count != 0)
        {
            Session["Uid"] = userdDT.Rows[0][1].ToString();
            BuyerDSTableAdapters.View_Collection_ShopTableAdapter csDA = new BuyerDSTableAdapters.View_Collection_ShopTableAdapter();
            DataTable csDT = csDA.GetDataByUid(System.Guid.Parse(userdDT.Rows[0][1].ToString()),"shop");
            if (csDT.Rows.Count > 0)
            {
                cbAll.Visible = true;
                cbAll.Enabled = true;
                imgbtnDelete.Visible = true;
                imgbtnDelete.Enabled = true;
                Panel1.Visible = false;
                pds.DataSource = csDT.DefaultView;
                dlShop.DataSource = pds;
                dlShop.DataBind();
            }
            else
            {
                cbAll.Visible = false;
                cbAll.Enabled = false;
                imgbtnDelete.Visible = false;
                imgbtnDelete.Enabled = false;
                Panel1.Visible = true;
                //Response.Write("<Script>alert('您未收藏任何店铺！')</Script>");
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('您未收藏任何店铺！');", true);
            }
        }
    }

    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        if (cbAll.Checked)
        {
            for (int i = 0; i < dlShop.Items.Count; i++)
            {
                Label lblHidden = (Label)dlShop.Items[i].FindControl("lblHidden");
                CheckBox cbSel = (CheckBox)dlShop.Items[i].FindControl("cbSel");
                if (lblHidden.Text != "")
                {
                    if (cbSel.Checked == true)
                    {
                        BuyerDSTableAdapters.CollectionTableAdapter delDA = new BuyerDSTableAdapters.CollectionTableAdapter();
                        int delDT = delDA.DeleteSelectedShop(long.Parse(lblHidden.Text), System.Guid.Parse(Session["Uid"].ToString()), "shop");
                        if (delDT != 0)
                        {
                             //Response.Write("<Script>alert('删除成功！')</Script>");
                           ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('删除成功！');", true);
                        }
                    }
                    else
                    {
                        if (i == dlShop.SelectedIndex)
                        {
                           // Response.Write("<Script>alert('请先选择！')</Script>");
                            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请先选择！');", true);
                        }
                    }
                }
            }         
        }
        else
        {
            //Response.Write("<Script>alert('请先选择！')</Script>");
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请先选择！');", true);
        }
        cbAll.Checked = false;
        BindDatalist(pds.CurrentPageIndex);
        dlShop.DataBind();
    }
    protected void imgbtnDelOne_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < dlShop.Items.Count; i++)
        {
            string ShopId = (((ImageButton)sender).CommandArgument.ToString()).ToString();
            CheckBox cbSel = (CheckBox)dlShop.Items[i].FindControl("cbSel");
            if (ShopId != "")
            {
                if (cbSel.Checked == true)
                {
                    BuyerDSTableAdapters.CollectionTableAdapter delDA = new BuyerDSTableAdapters.CollectionTableAdapter();
                    int delDT = delDA.DeleteSelectedShop(long.Parse(ShopId), System.Guid.Parse(Session["Uid"].ToString()), "shop");
                    if (delDT != 0)
                    {
                         // Response.Write("<Script>alert('删除成功！')</Script>");
                      ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('删除成功！');", true);
                    }
                }
                else
                {
                    if (i == dlShop.SelectedIndex)
                    {
                       //  Response.Write("<Script>alert('请先选择！')</Script>");
                       ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请先选择！');", true);
                    }
                }
            }
        }
        BindDatalist(pds.CurrentPageIndex);
        dlShop.DataBind();
    }
    protected void lbtnShopName_Click(object sender, EventArgs e)
    {
        string ShopId = ((LinkButton)sender).CommandArgument.ToString();
        if (ShopId != "")
        {
            Response.Redirect("~/Public/LookShop.aspx?ShopId=" + ShopId);
        }
    }

    protected void imgbtnPhoto_Click(object sender, ImageClickEventArgs e)
    {
        string PhoneId = ((ImageButton)sender).CommandArgument.ToString();
        if (PhoneId != null)
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
    protected void dlShop_ItemDataBound(object sender, DataListItemEventArgs e)
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
        else
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataList dlPhoneInShop = (DataList)e.Item.FindControl("dlPhoneInShop");

                string ShopId = dlShop.DataKeys[e.Item.ItemIndex].ToString().Trim();

                if (ShopId != "")
                {
                    BuyerDSTableAdapters.View_Phone_ShopTableAdapter phoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
                    DataTable phoneDT = phoneDA.GetHotByShopId(long.Parse(ShopId));
                    if (phoneDT.Rows.Count > 0)
                    {
                        dlPhoneInShop.DataSource = phoneDT;
                        dlPhoneInShop.DataBind();
                    }
                }
            }
        }
    }
    protected void cbAll_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < dlShop.Items.Count; i++)
        {
            CheckBox cbSel = (CheckBox)dlShop.Items[i].FindControl("cbSel");
            if (cbAll.Checked)
            {
                cbSel.Checked = true;
            }
            else
            {
                cbSel.Checked = false;
            }
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
    protected void dlShop_ItemCommand(object source, DataListCommandEventArgs e)
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
                       // Response.Write("<Script>alert('页数不正确！')</Script>");
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
}