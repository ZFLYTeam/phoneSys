using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Buyer_LookShop : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {       
        if (!IsPostBack)
        {
                Session["ShopId"] = Request.QueryString["ShopId"].ToString();
                BindDatalist(0);
                              
        }
    }
    private void BindDatalist(int currentpage)
    {
        pds.AllowPaging = true;
        pds.PageSize = 8;
        pds.CurrentPageIndex = currentpage;

        if (Session["ShopId"] != null)
        {
            BuyerDSTableAdapters.View_Phone_ShopTableAdapter HotPhoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
            DataTable HotPhoneDT = HotPhoneDA.GetHotByShopId(long.Parse(Session["ShopId"].ToString()));
            if (HotPhoneDT.Rows.Count != 0)
            {
                lblShopName.Text = HotPhoneDT.Rows[0][22].ToString();
                imgShopLogo.ImageUrl = HotPhoneDT.Rows[0][29].ToString();
                for (int i = 0; i < HotPhoneDT.Rows.Count; i++)
                {
                    switch (i)
                    {
                        case 0:
                            {
                                img1.ImageUrl = HotPhoneDT.Rows[i][16].ToString();
                                lbtnName1.Text = HotPhoneDT.Rows[i][1].ToString();
                                lbtnName1.CommandArgument = HotPhoneDT.Rows[i][0].ToString();
                                break;
                            }
                        case 1:
                            {
                                img2.ImageUrl = HotPhoneDT.Rows[i][16].ToString();
                                lbtnName2.Text = HotPhoneDT.Rows[i][1].ToString();
                                lbtnName2.CommandArgument = HotPhoneDT.Rows[i][0].ToString();
                                break;
                            }
                        case 2:
                            {
                                img3.ImageUrl = HotPhoneDT.Rows[i][16].ToString();
                                lbtnName3.Text = HotPhoneDT.Rows[i][1].ToString();
                                lbtnName3.CommandArgument = HotPhoneDT.Rows[i][0].ToString();
                                break;
                            }
                    }
                }
            }
            BuyerDSTableAdapters.View_Phone_ShopTableAdapter AllPhoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
            DataTable AllPhoneDT = AllPhoneDA.GetDataByShopId(long.Parse(Session["ShopId"].ToString()));
            if (AllPhoneDT.Rows.Count != 0)
            {
                pds.DataSource = AllPhoneDT.DefaultView;
                dlPhone.DataSource = pds;
                dlPhone.DataBind();
            }
        }       
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        dlPhone.Visible = true;
        if (txtLower.Text == "" && txtHigher.Text == "" && txtSearch.Text == "")
        {
            Response.Write("<Script>alert('请输入查询条件！')</Script>");
            //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请输入查询条件！');", true);
        }
        else
        {
            if (txtSearch.Text != "")
            {
                if (txtLower.Text == "" && txtHigher.Text == "")
                {
                    BuyerDSTableAdapters.View_Phone_ShopTableAdapter phoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
                    DataTable phoneDT = phoneDA.GetDataByInPhone(long.Parse(Session["ShopId"].ToString()), txtSearch.Text);
                    dlPhone.DataSource = phoneDT;
                    dlPhone.DataBind();
                    if (phoneDT.Rows.Count == 0)
                    {
                        dlPhone.Visible = false;
                        Response.Write("<Script>alert('没有满足条件的商品！')</Script>");
                        //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('没有满足条件的商品！');", true);
                    }
                }
                else
                {
                    if (txtHigher.Text != "" && txtLower.Text != "")
                    {
                        BuyerDSTableAdapters.View_Phone_ShopTableAdapter phoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
                        DataTable phoneDT = phoneDA.GetDataByPriceAndName(long.Parse(Session["ShopId"].ToString()), txtSearch.Text, int.Parse(txtLower.Text.Trim()), int.Parse(txtHigher.Text.Trim()));
                        dlPhone.DataSource = phoneDT;
                        dlPhone.DataBind();
                        if (phoneDT.Rows.Count == 0)
                        {
                            dlPhone.Visible = false;
                            Response.Write("<Script>alert('没有满足条件的商品！')</Script>");
                            //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('没有满足条件的商品！');", true);
                        }
                    }
                    else
                    {
                        if (txtHigher.Text == "" && txtLower.Text != "")
                        {
                            BuyerDSTableAdapters.View_Phone_ShopTableAdapter phoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
                            DataTable phoneDT = phoneDA.GetDataByPriceAndName(long.Parse(Session["ShopId"].ToString()), txtSearch.Text, int.Parse(txtLower.Text.Trim()), 10000);
                            dlPhone.DataSource = phoneDT;
                            dlPhone.DataBind();
                            if (phoneDT.Rows.Count == 0)
                            {
                                dlPhone.Visible = false;
                                Response.Write("<Script>alert('没有满足条件的商品！')</Script>");
                                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('没有满足条件的商品！');", true);
                            }
                        }
                        else
                        {
                            BuyerDSTableAdapters.View_Phone_ShopTableAdapter phoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
                            DataTable phoneDT = phoneDA.GetDataByPriceAndName(long.Parse(Session["ShopId"].ToString()), txtSearch.Text, 0, int.Parse(txtHigher.Text.Trim()));
                            dlPhone.DataSource = phoneDT;
                            dlPhone.DataBind();
                            if (phoneDT.Rows.Count == 0)
                            {
                                dlPhone.Visible = false;
                                Response.Write("<Script>alert('没有满足条件的商品！')</Script>");
                                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('没有满足条件的商品！');", true);
                            }
                        } 
                    }

                }
            }
            else
            {
                if (txtLower.Text != "" && txtHigher.Text != "")
                {
                    BuyerDSTableAdapters.View_Phone_ShopTableAdapter phoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
                    DataTable phoneDT = phoneDA.GetDataByPrice(long.Parse(Session["ShopId"].ToString()), int.Parse(txtLower.Text.Trim()), int.Parse(txtHigher.Text.Trim()));
                    dlPhone.DataSource = phoneDT;
                    dlPhone.DataBind();
                    if (phoneDT.Rows.Count == 0)
                    {
                        dlPhone.Visible = false;
                        Response.Write("<Script>alert('没有满足条件的商品！')</Script>");
                       //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('没有满足条件的商品！');", true);
                    }
                }
                else
                {
                    if (txtHigher.Text == "" && txtLower.Text != "")
                    {
                        BuyerDSTableAdapters.View_Phone_ShopTableAdapter phoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
                        DataTable phoneDT = phoneDA.GetDataByPrice(long.Parse(Session["ShopId"].ToString()), int.Parse(txtLower.Text.Trim()), 10000);
                        dlPhone.DataSource = phoneDT;
                        dlPhone.DataBind();
                        if (phoneDT.Rows.Count == 0)
                        {
                            dlPhone.Visible = false;
                            Response.Write("<Script>alert('没有满足条件的商品！')</Script>");
                            //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('没有满足条件的商品！');", true);
                        }
                    }
                    else
                    {
                        BuyerDSTableAdapters.View_Phone_ShopTableAdapter phoneDA = new BuyerDSTableAdapters.View_Phone_ShopTableAdapter();
                        DataTable phoneDT = phoneDA.GetDataByPrice(long.Parse(Session["ShopId"].ToString()), 0, int.Parse(txtHigher.Text.Trim()));
                        dlPhone.DataSource = phoneDT;
                        dlPhone.DataBind();
                        if (phoneDT.Rows.Count == 0)
                        {
                            dlPhone.Visible = false;
                            Response.Write("<Script>alert('没有满足条件的商品！')</Script>");
                            //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('没有满足条件的商品！');", true);
                        }
                    }  
                }
            }
        }
    }
    protected void btnCollection_Click(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
        BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
        DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
        if (userdDT.Rows.Count != 0)
        {
            Session["Uid"] = userdDT.Rows[0][1].ToString();
            BuyerDSTableAdapters.CollectionTableAdapter collectDA = new BuyerDSTableAdapters.CollectionTableAdapter();
            DataTable collectDT = collectDA.GetDataByUid(System.Guid.Parse(Session["Uid"].ToString()),"shop");
            if (collectDT.Rows.Count != 0)
            {
                Response.Write("<Script>alert('您已收藏过该店铺！')</Script>");
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('您已收藏过该店铺！');", true);
            }
            else
            {
                int insertDT = collectDA.InsertCollectedShop(System.Guid.Parse(Session["Uid"].ToString()), long.Parse(Session["ShopId"].ToString()),DateTime.Now,"shop");
                if (insertDT != 0)
                {
                    Response.Write("<Script>alert('成功加入收藏！')</Script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('成功加入收藏！');", true);
                }
            }
        }
        }
        else
        {
            Session["lasturl"] = Server.UrlDecode(Request.Url.AbsoluteUri.ToString());
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>openDiv('newDiv');</script>");
            //Response.Write("<Script>alert('登录后才能加入购物车！')</Script>");
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
                        Response.Write("<Script>alert('页数不正确！')</Script>");
                        //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('页数不正确！');", true);
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
    protected void lbtnName1_Click(object sender, EventArgs e)
    {
        string PhoneId = ((LinkButton)sender).CommandArgument.ToString();
        if (PhoneId != null)
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
    protected void lbtnName2_Click(object sender, EventArgs e)
    {
        string PhoneId = ((LinkButton)sender).CommandArgument.ToString();
        if (PhoneId != null)
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
    protected void lbtnName3_Click(object sender, EventArgs e)
    {
        string PhoneId = ((LinkButton)sender).CommandArgument.ToString();
        if (PhoneId != null)
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
}