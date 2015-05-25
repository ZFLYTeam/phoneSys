using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Xml.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class Seller_My_Shop : System.Web.UI.Page
{

    protected static PagedDataSource pds = new PagedDataSource();
    static string strCon = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
    public SqlConnection conn = new SqlConnection(strCon);
    public static string img = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] == null)
                Response.Redirect("~/Public/Index.aspx");
            conn.Open();
            string SelectSql = "select * from V_UserInfo where UserName = '" + Session["name"].ToString() + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(SelectSql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["userId"] = ds.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                Response.Write("<Script>alert('运行错误!')</Script>");
            }           
            BindDataList(0);            
        }
    }
    private void BindDataList(int currentpage)
    {
        pds.AllowPaging = true;
        pds.PageSize = 2;
        pds.CurrentPageIndex = currentpage;
        string strSql = "select * from vw_phone_shop_user where sellerId='" + System.Guid.Parse(Session["userId"].ToString()) + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlDataAdapter sda = new SqlDataAdapter(strSql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["shopNamestr"] = ds.Tables[0].Rows[0][16].ToString();
            Session["shopStartTime"] = ds.Tables[0].Rows[0][23].ToString();
            pds.DataSource = ds.Tables[0].DefaultView;
            DataList1.DataSource = pds;
            DataList1.DataBind();
            conn.Close();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('加载出现错误！');", true);
        }

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "first": pds.CurrentPageIndex = 0;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "last": pds.CurrentPageIndex = pds.PageCount - 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "pre": pds.CurrentPageIndex = pds.CurrentPageIndex - 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "next": pds.CurrentPageIndex = pds.CurrentPageIndex + 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "search":
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int pageCount = int.Parse(pds.PageCount.ToString());
                    TextBox txtpage = e.Item.FindControl("txtPage") as TextBox;
                    int myPageNum = 0;
                    if (!txtpage.Text.Equals(""))
                    {
                        myPageNum = Convert.ToInt32(txtpage.Text.ToString());
                        if (myPageNum <= 0 || myPageNum > pageCount)
                        {
                            Response.Write("<Script>alert('请重新输入页码！')</Script>");
                        }
                        else BindDataList(myPageNum - 1);
                    }
                }
                break;
            case "Delete":
                int id = int.Parse(DataList1.DataKeys[e.Item.ItemIndex].ToString());
                string sql = "delete from PhoneInfo where phone_id='" + id + "'";
                if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
                SqlCommand cmd = new SqlCommand(sql, conn);
                if (Convert.ToInt32(cmd.ExecuteNonQuery()) > 0)
                {
                    Response.Write("<script>alert('下架成功！')</script>");
                    BindDataList(pds.CurrentPageIndex);
                }
                else
                {
                    Response.Write("<script>alert('删除失败，请查找原因！')</script>");
                }
                conn.Close();
                break;
            case"load":
                id = int.Parse(DataList1.DataKeys[e.Item.ItemIndex].ToString());
                Response.Redirect("~/Seller/UpdatePhoneInfo.aspx?phoneId=" + id);
                break;
           }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label CurrentPage = (Label)(this.DataList1.Controls[DataList1.Controls.Count - 1].FindControl("lblCurrentPage"));
            Label PageCount = e.Item.FindControl("lblPageCount") as Label;
            LinkButton FirstPage = e.Item.FindControl("lbtnFirst") as LinkButton;
            LinkButton PrePage = e.Item.FindControl("lbtnPre") as LinkButton;
            LinkButton NextPage = e.Item.FindControl("lbtnNext") as LinkButton;
            LinkButton LastPage = e.Item.FindControl("lbtnLast") as LinkButton;

            CurrentPage.Text = (pds.CurrentPageIndex + 1).ToString();
            PageCount.Text = pds.PageCount.ToString();

            if (pds.IsFirstPage)
            {
                FirstPage.Enabled = false;
                PrePage.Enabled = false;
            }
            if (pds.IsLastPage)
            {
                LastPage.Enabled = false;
                NextPage.Enabled = false;
            }
        }
        if (e.Item.ItemType == ListItemType.Header)
        {
            Label shopName = e.Item.FindControl("lblShopName") as Label;
            Label shopStart = e.Item.FindControl("lblShopStartTime") as Label;
            if (Session["shopNamestr"].ToString() != "")
                shopName.Text = Session["shopNamestr"].ToString();
            if (Session["shopStartTime"].ToString() != "")
                shopStart.Text = Session["shopStartTime"].ToString().Substring(0, 8);
        }
    }

    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        BindDataList(pds.CurrentPageIndex);
    }
    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        int id = int.Parse(DataList1.DataKeys[e.Item.ItemIndex].ToString());
        string phoneImage = ((Image)e.Item.FindControl("imgPhone")).ImageUrl;
        string phoneName = ((TextBox)e.Item.FindControl("txtName")).Text;
        string phonePrice = ((TextBox)e.Item.FindControl("txtPrice")).Text;
        string phoneStore = ((TextBox)e.Item.FindControl("txtStoreQuantity")).Text;
        string phoneIntroduction = ((TextBox)e.Item.FindControl("txtIntroduction")).Text;
        string phoneColor = ((DropDownList)e.Item.FindControl("ddlColor")).SelectedValue.ToString();
        string phoneBrand = ((DropDownList)e.Item.FindControl("ddlBrand")).SelectedValue.ToString();

        string phonePiexl = ((DropDownList)e.Item.FindControl("ddlPixel")).SelectedValue.ToString();
        string phoneOS = ((DropDownList)e.Item.FindControl("ddlOS")).SelectedValue.ToString();
        string phoneCPU = ((DropDownList)e.Item.FindControl("ddlCPU")).SelectedValue.ToString();
        string phoneType = ((DropDownList)e.Item.FindControl("ddlType")).SelectedValue.ToString();
        string phoneVersion = ((DropDownList)e.Item.FindControl("ddlVersion")).SelectedValue.ToString();
        string phoneScreenSize = ((DropDownList)e.Item.FindControl("ddlScreenSize")).SelectedValue.ToString();
        string sql = "update phoneInfo set phone_name ='" + phoneName
                                       + "',price='" + phonePrice
                                       + "',store_quantity='" + phoneStore
                                       + "',phone_introduction='" + phoneIntroduction
                                       + "',phonebrand='" + phoneBrand
                                       + "',phonecolor='" + phoneColor
                                       + "',phonepiexl='" + phonePiexl
                                       + "',phoneos='" + phoneOS
                                       + "',phonecpu='" + phoneCPU
                                       + "',phonetype='" + phoneType
                                       + "',phoneversion='" + phoneVersion
                                       + "',phonescreensize='" + phoneScreenSize
                                       + "',phone_image='" + phoneImage
                                       + "' where phone_id='" + id + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            cmd.ExecuteNonQuery();
            DataList1.EditItemIndex = -1;
            BindDataList(pds.CurrentPageIndex);
        }
        catch (Exception err)
        {
            Response.Write(err.ToString());
        }
        finally
        {
            conn.Close();
        }
    }

    protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = -1;
        BindDataList(pds.CurrentPageIndex);
    }
    //protected void btnLoad_Click(object sender, EventArgs e)
    //{
        
    //    FileUpload load = (FileUpload)((sender as Button).FindControl("fileUpload"));
    //    Image imgPhone = (Image)DataList1.FindControl("imgPhone");
    //    TextBox txtName = ((TextBox)DataList1.FindControl("txtName"));
    //    BindDataList(pds.CurrentPageIndex);
    //    Response.Write(load.FileName);
    //    if (load.HasFile)
    //    {
    //        if (txtName.Text == "")
    //        {
    //            txtName.Text = "123456";
    //        }
    //        //获取上传头像的名称
    //        img = load.FileName;
    //        //更该头像名称
    //        img = img.Replace(img.Substring(0, img.LastIndexOf(".")), txtName.Text);
    //        //设置保存路径
    //        img = "images_phone/" + img;
    //        //保存上传的头像
    //        load.SaveAs(Server.MapPath("~/") + img);
    //        //显示头像
    //        imgPhone.ImageUrl = "~/" + img;
    //        img = imgPhone.ImageUrl; 
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请选择文件！');", true);
    //    }
    //}

    protected void btnPublish_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Seller/Publish.aspx");
    }
}