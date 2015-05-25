using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using BuyerDataSetTableAdapters;

public partial class Buyer_ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblSelected.Text = "0";
        if (Session["name"] != null)
        {
            string id = "";
         BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
        DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
        if (userdDT.Rows.Count != 0)
        {
            id = userdDT.Rows[0][1].ToString();
            Session["buyerID"] = System.Guid.Parse(id);
            V_ShopCartTableAdapter shop = new V_ShopCartTableAdapter();
            ShopCartTableAdapter shopcart = new ShopCartTableAdapter();
            DataTable shopDT = shop.GetShopCartInfoByBuyer(System.Guid.Parse(Session["buyerID"].ToString()));
            if (shopDT.Rows.Count > 0)
            {
                for (int i = 0; i < shopDT.Rows.Count; i++)
                {
                    if (int.Parse(shopDT.Rows[i]["store_quantity"].ToString()) == 0)
                    {
                        shopcart.DeleteShoppingCart(long.Parse(shopDT.Rows[0][0].ToString()));
                    }
                    else
                    {

                        if (int.Parse(shopDT.Rows[i]["buy_quantity"].ToString()) > int.Parse(shopDT.Rows[i]["store_quantity"].ToString()))
                        {
                            shopcart.UpdateCartPhoneQuantity(int.Parse(shopDT.Rows[i]["store_quantity"].ToString()), int.Parse(shopDT.Rows[i]["price"].ToString()) * int.Parse(shopDT.Rows[i]["store_quantity"].ToString()), long.Parse(shopDT.Rows[0][0].ToString()));
                        }
                    }
                }
            }
        }
              
        int number = 0;
        if (dlCartShop.Items.Count > 0)
        {
            for (int i = 0; i < dlCartShop.Items.Count; i++)
            {

                DataList dlCartPhone = dlCartShop.Items[i].FindControl("dlCartPhone") as DataList;

                for (int j = 0; j < dlCartPhone.Items.Count; j++)
                {

                    TextBox txtQuantity = dlCartPhone.Items[j].FindControl("txtQuantity") as TextBox;
                    number += int.Parse(txtQuantity.Text);


                }
            }
            lblMsg.Visible = false;
            lblMsg.Enabled = false;
            lbtnGo.Enabled = false;
            lbtnGo.Visible = false;
            Panel2.Visible = true;
            Panel1.Visible = true;
            Panel3.Visible = true;
            lblTotalNumber.Text = number.ToString();
            lbtnSettlement.Enabled = false;
        }
        else
        {
            lblTotalNumber.Text = "0";
            lblMsg.Visible = true;
            lbtnGo.Enabled = true;
            lbtnGo.Visible = true;
            Panel1.Visible = false;
            lbtnSettlement.Enabled = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
        }
        }
        else
        {
            Response.Redirect("~/Public/Index.aspx");
        }
       
    }
    protected void lbtnShopName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        Session["shopID"] = id;
        Response.Redirect("~/Public/LookShop.aspx?ShopId=" + id);
    }
    protected void lbtnPhoneName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        //Session["phoneID"] = id;
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
    protected void ibtnPhone_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        //Session["phoneID"] = id;
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
    protected void lbtnRemove_Click(object sender, EventArgs e)
    {
        //Guid buyer = new Guid(Session["buyerID"].ToString());
        string id = ((LinkButton)sender).CommandArgument.ToString();
        long cartID = new long();
        cartID = Convert.ToInt64(id);
        V_ShopCartTableAdapter cartInfo = new V_ShopCartTableAdapter();
        DataTable cartInfoDT = cartInfo.GetCartInfoByCid(cartID);
        //long phoneid = new long();
       string  phoneid =cartInfoDT.Rows[0][4].ToString();
        long shopid = new long();
        shopid = Convert.ToInt64(cartInfoDT.Rows[0][3].ToString());
        CollectionTableAdapter collectDA = new CollectionTableAdapter();
        DataTable collectDT = collectDA.GetCollectByPidUid(System.Guid.Parse(Session["buyerID"].ToString()), long.Parse(phoneid), "phone");
        if (collectDT.Rows.Count > 0)
        {
            Response.Write("<Script>alert('您已收藏过该商品！')</Script>");
        }
        else
        {
           collectDA.InsertCollectedPhone(System.Guid.Parse(Session["buyerID"].ToString()), long.Parse(phoneid), shopid, DateTime.Now, "phone");
           
        }
        ShopCartTableAdapter cartDA = new ShopCartTableAdapter();
        int Dcart = cartDA.DeleteShoppingCart(cartID);        
        dlCartShop.DataBind();
    }
    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        long cartID = new long();
        cartID = Convert.ToInt64(id);
        ShopCartTableAdapter cartDA = new ShopCartTableAdapter();
        int  Dcart = cartDA.DeleteShoppingCart(cartID);
        if (Dcart != 1)
        {
            Response.Write("<Script>alert('未删除！')</Script>");
        }
       
        dlCartShop.DataBind();
     
    }
  

    protected void dlCartShop_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //CheckBox chbSelectShop = e.Item.FindControl("chbSelectPhone") as CheckBox;
        //Guid buyer = new Guid(Session["buyerID"].ToString());
        string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        long shopid = new long();
        Label lblShopID = e.Item.FindControl("lblShopID") as Label;
        shopid = Convert.ToInt64(lblShopID.Text);
        string SelectSql = "select * from V_ShopCart where buyer = '" + System.Guid.Parse(Session["buyerID"].ToString()) + "' and shop_id=" + shopid;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataList dlCartPhone = e.Item.FindControl("dlCartPhone") as DataList;
        dlCartPhone.DataSource = ds.Tables[0];
        dlCartPhone.DataBind();
        for (int i = 0; i < dlCartPhone.Items.Count; i++)
        {
         
            TextBox txtQuantity = dlCartPhone.Items[i].FindControl("txtQuantity") as TextBox;   
            CheckBox chbSelectPhone = dlCartPhone.Items[i].FindControl("chbSelectPhone") as CheckBox;
            LinkButton lbtnSub = dlCartPhone.Items[i].FindControl("lbtnSub") as LinkButton;
            LinkButton lbtnAdd = dlCartPhone.Items[i].FindControl("lbtnAdd") as LinkButton;
            Label lblStroeQuantity = dlCartPhone.Items[i].FindControl("lblStroeQuantity") as Label;
  
            if (int.Parse(txtQuantity.Text) <= 1)
            {
                lbtnSub.Enabled = false;
            }
          
            if (int.Parse(txtQuantity.Text) >= int.Parse(lblStroeQuantity.Text))
            {
                lbtnAdd.Enabled = false;
            }         

        }
            Conn.Close();
    }
    protected void lbtnSettlement_Click(object sender, EventArgs e)
    {
        ShopCartTableAdapter cartDA = new ShopCartTableAdapter();
        int Numcart = 0;
        int select = 0;
        long cartID = new long();
        for (int i = 0; i < dlCartShop.Items.Count; i++)
        {
            DataList dlCartPhone = dlCartShop.Items[i].FindControl("dlCartPhone") as DataList;
            for (int j = 0; j < dlCartPhone.Items.Count; j++)
            {
                CheckBox chbSelectPhone = dlCartPhone.Items[j].FindControl("chbSelectPhone") as CheckBox;
                Label lblCartID = dlCartPhone.Items[j].FindControl("lblCartId") as Label;
                if (chbSelectPhone.Checked)
                {
                    select++;                  
                    cartID = Convert.ToInt64(lblCartID.Text);
                    Numcart += cartDA.UpdateCartState("是",cartID);
                }
            }
        }
        if (Numcart == select)
        {
            Response.Redirect("~/Buyer/SubmitOrder.aspx");
        }
    
    }
    protected void lbtnAllRemove_Click(object sender, EventArgs e)
    {
        Guid buyer = new Guid(Session["buyerID"].ToString());
        int Numcart = 0;
        int select = 0;
        long cartID = new long();
        long phoneid = new long();
        long shopid = new long();
        ShopCartTableAdapter cartDA = new ShopCartTableAdapter();
        CollectionTableAdapter collectDA = new CollectionTableAdapter();
        int addcollect=0 ;
        for (int i = 0; i < dlCartShop.Items.Count; i++)
        {
            DataList dlCartPhone = dlCartShop.Items[i].FindControl("dlCartPhone") as DataList;
            Label lblShopID = dlCartShop.Items[i].FindControl("lblShopId") as Label;
            shopid = Convert.ToInt64(lblShopID.Text);
            for (int j = 0; j < dlCartPhone.Items.Count; j++)
            {
                CheckBox chbSelectPhone = dlCartPhone.Items[j].FindControl("chbSelectPhone") as CheckBox;
                Label lblCartID = dlCartPhone.Items[j].FindControl("lblCartId") as Label;
                Label lblPhoneID = dlCartPhone.Items[j].FindControl("lblPhoneId") as Label;
                if (chbSelectPhone.Checked)
                {
                    select++;
                    cartID = Convert.ToInt64(lblCartID.Text);
                    phoneid = Convert.ToInt64(lblPhoneID.Text);
                    DataTable collectDT = collectDA.GetCollectByPidUid(System.Guid.Parse(Session["buyerID"].ToString()), long.Parse(lblPhoneID.Text),"phone");
               
                    if (collectDT.Rows.Count > 0)
                    {
                        addcollect++;
                    }
                    else
                    {
                        addcollect += collectDA.InsertCollectedPhone(buyer, phoneid, shopid, DateTime.Now, "phone");
                    }
                    Numcart += cartDA.DeleteShoppingCart(cartID);
                }
            }
        }
        if (select == 0)
        {
            Response.Write("<Script>alert('请选择物品！')</Script>");
           // ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('');", true);
        }
        else
        {
            if (Numcart == select && addcollect==select)
            {
                Response.Write("<Script>alert('已成功收藏！')</Script>");
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('');", true);
            }
            else
            {
                Response.Write("<Script>alert('未成功收藏')</Script>");
               // ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('！');", true);
            }
        }
        dlCartShop.DataBind();
    }
    protected void lbtnAllDelete_Click(object sender, EventArgs e)
    {
        Guid buyer = new Guid(Session["buyerID"].ToString());
        int Numcart = 0;
        int select = 0;
        long cartID = new long();
        ShopCartTableAdapter cartDA = new ShopCartTableAdapter();
        if (chbAllSelect.Checked)
        {
            int allcart = cartDA.DeleteAll(buyer);
            if (allcart == 1)
            {
                Response.Write("<Script>alert('已成功从购物车删除！')</Script>");
               // ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('');", true);
            }
            else
            {
                Response.Write("<Script>alert('未成功从购物车删除！！')</Script>");
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('');", true);
            }
        }
        else
        {
            for (int i = 0; i < dlCartShop.Items.Count; i++)
            {
                DataList dlCartPhone = dlCartShop.Items[i].FindControl("dlCartPhone") as DataList;
                for (int j = 0; j < dlCartPhone.Items.Count; j++)
                {
                    CheckBox chbSelectPhone = dlCartPhone.Items[j].FindControl("chbSelectPhone") as CheckBox;
                    Label lblCartID = dlCartPhone.Items[j].FindControl("lblCartId") as Label;
                    if (chbSelectPhone.Checked)
                    {
                        select++;
                        cartID = Convert.ToInt64(lblCartID.Text);
                        Numcart += cartDA.DeleteShoppingCart(cartID);
                    }
                }
            }
            if (select == 0)
            {
                Response.Write("<Script>alert('请选择物品！')</Script>");
               // ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('');", true);
            }
            else
            {
                if (Numcart == select)
                {
                    Response.Write("<Script>alert('已成功从购物车删除！')</Script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('');", true);
                }
                else
                {
                    Response.Write("<Script>alert('未成功删除！')</Script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('');", true);
                }
            }
        }
        dlCartShop.DataBind();
    }
    protected void chbAllSelect_CheckedChanged(object sender, EventArgs e)
    {
        if (chbAllSelect.Checked)
        {
            lbtnSettlement.Enabled = true;
            int number = 0;
            int total = 0;
            for (int i = 0; i < dlCartShop.Items.Count; i++)
            {
                CheckBox chbSelectShop = dlCartShop.Items[i].FindControl("chbSelectShop") as CheckBox;
                chbSelectShop.Checked = true;
                DataList dlCartPhone = dlCartShop.Items[i].FindControl("dlCartPhone") as DataList;
             
                for (int j = 0; j < dlCartPhone.Items.Count; j++)
                {
                    CheckBox chbSelectPhone = dlCartPhone.Items[j].FindControl("chbSelectPhone") as CheckBox;
                    TextBox txtQuantity = dlCartPhone.Items[j].FindControl("txtQuantity") as TextBox;
                    Label lblTotalPrice = dlCartPhone.Items[j].FindControl("lblTotalPrice") as Label;
                    number += int.Parse(txtQuantity.Text);
                    total += int.Parse(lblTotalPrice.Text);
                    chbSelectPhone.Checked = true;
                }
            }
            lblSelected.Text = number.ToString();
            lblTotal.Text = total.ToString();

        }
        else
        {
            lbtnSettlement.Enabled = false;
            lblSelected.Text = "0";
            lblTotal.Text = "0";
            for (int i = 0; i < dlCartShop.Items.Count; i++)
            {
                CheckBox chbSelectShop = dlCartShop.Items[i].FindControl("chbSelectShop") as CheckBox;
                chbSelectShop.Checked = false;
                DataList dlCartPhone = dlCartShop.Items[i].FindControl("dlCartPhone") as DataList;
                for (int j = 0; j < dlCartPhone.Items.Count; j++)
                {
                    CheckBox chbSelectPhone = dlCartPhone.Items[j].FindControl("chbSelectPhone") as CheckBox;
                    chbSelectPhone.Checked = false;
                }
            }
        }
    }
    protected void chbSelectShop_CheckedChanged(object sender, EventArgs e)
    {
        int number = 0;
        int total = 0;
        int flag = 0;
        for (int i = 0; i < dlCartShop.Items.Count; i++)
        {
            CheckBox chbSelectShop = dlCartShop.Items[i].FindControl("chbSelectShop") as CheckBox;
            DataList dlCartPhone = dlCartShop.Items[i].FindControl("dlCartPhone") as DataList;          
                for (int j = 0; j < dlCartPhone.Items.Count; j++)
                {
                    TextBox txtQuantity = dlCartPhone.Items[j].FindControl("txtQuantity") as TextBox;
                    Label lblTotalPrice = dlCartPhone.Items[j].FindControl("lblTotalPrice") as Label;

                    CheckBox chbSelectPhone = dlCartPhone.Items[j].FindControl("chbSelectPhone") as CheckBox;
                    if (chbSelectShop.Checked)
                    {
                    flag = 1;
                    number += int.Parse(txtQuantity.Text);
                    total += int.Parse(lblTotalPrice.Text);
                    chbSelectPhone.Checked = true;
                    }
                    else
                    {
                        chbSelectPhone.Checked = false;
                    }
                }           
        }
        if (flag == 1)
        {
            lbtnSettlement.Enabled = true;
        }
        else
        {
            lbtnSettlement.Enabled = false;
        }
        if (number == int.Parse(lblTotalNumber.Text))
        {
            chbAllSelect.Checked = true;
        }
        else
        {
            chbAllSelect.Checked = false;
        }
        lblSelected.Text = number.ToString();
        lblTotal.Text = total.ToString();
    }
    protected void chbSelectPhone_CheckedChanged(object sender, EventArgs e)
    {
        int number = 0;
        int total = 0;
        int flag = 0;
        for (int i = 0; i < dlCartShop.Items.Count; i++)
        {
            CheckBox chbSelectShop = dlCartShop.Items[i].FindControl("chbSelectShop") as CheckBox;
            DataList dlCartPhone = dlCartShop.Items[i].FindControl("dlCartPhone") as DataList;
            int shopphone0 = 0;
            int shopphone1=0;
                for (int j = 0; j < dlCartPhone.Items.Count; j++)
                {
                    CheckBox chbSelectPhone = dlCartPhone.Items[j].FindControl("chbSelectPhone") as CheckBox;
                    TextBox txtQuantity = dlCartPhone.Items[j].FindControl("txtQuantity") as TextBox;
                    Label lblTotalPrice = dlCartPhone.Items[j].FindControl("lblTotalPrice") as Label;
                   shopphone1+= int.Parse(txtQuantity.Text);
                    if (chbSelectPhone.Checked)
                    {
                        flag = 1;
                        shopphone0++;

                        number += int.Parse(txtQuantity.Text);
                        total += int.Parse(lblTotalPrice.Text);
                    }
                   
                }
                if (shopphone0 == shopphone1)
                {
                    chbSelectShop.Checked = true;
                }
                else
                {
                    chbSelectShop.Checked = false;
                }
            
        }
        if (flag == 1)
        {
            lbtnSettlement.Enabled = true;
        }
        else
        {
            lbtnSettlement.Enabled = false;
        }
        if (number == int.Parse(lblTotalNumber.Text))
        {
            chbAllSelect.Checked = true;
        }
        else
        {
            chbAllSelect.Checked = false;
        }
        lblSelected.Text = number.ToString();
        lblTotal.Text = total.ToString();
    }
    protected void lbtnGo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Public/PhoneSearch.aspx?PhoneId="+"");
    }
  
    protected void lbtnAdd_Click(object sender, EventArgs e)
    {
       
        string id = ((LinkButton)sender).CommandArgument.ToString();
        long cartID = new long();
        cartID = Convert.ToInt64(id);

        V_ShopCartTableAdapter cartInfo = new V_ShopCartTableAdapter();

        DataTable cartInfoDT = cartInfo.GetCartInfoByCid(cartID);

        int quantity = int.Parse(cartInfoDT.Rows[0][6].ToString());
        int price = int.Parse(cartInfoDT.Rows[0][9].ToString());
        int amount = (quantity + 1) * price;
        ShopCartTableAdapter cartDA = new ShopCartTableAdapter();
        int subQuantity = cartDA.UpdateCartPhoneQuantity(quantity + 1, amount, cartID);
        lblTotalNumber.Text = (int.Parse(lblTotalNumber.Text) + 1).ToString();
        dlCartShop.DataBind();

    }
 
    protected void lbtnSub_Click(object sender, EventArgs e)
    {
      
    
       string id = ((LinkButton)sender).CommandArgument.ToString();
        long cartID = new long();
        cartID = Convert.ToInt64(id);
        V_ShopCartTableAdapter cartInfo = new V_ShopCartTableAdapter();

        DataTable cartInfoDT = cartInfo.GetCartInfoByCid(cartID);

        int quantity = int.Parse(cartInfoDT.Rows[0][6].ToString());
        int price = int.Parse(cartInfoDT.Rows[0][9].ToString());
        int amount = (quantity -1) * price;
        ShopCartTableAdapter cartDA = new ShopCartTableAdapter();
        lblTotalNumber.Text = (int.Parse(lblTotalNumber.Text) - 1).ToString();
        int subQuantity = cartDA.UpdateCartPhoneQuantity(quantity - 1, amount, cartID);
        dlCartShop.DataBind();
    }
    protected void ibtnContinue_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Public/PhoneSearch.aspx");
    }
}