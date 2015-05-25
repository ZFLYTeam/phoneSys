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

public partial class Seller_OrderManage : System.Web.UI.Page
{
    protected static PagedDataSource pds1 = new PagedDataSource();
    protected static PagedDataSource pds2 = new PagedDataSource();
    static string strCon = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
    public SqlConnection conn = new SqlConnection(strCon);

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
            }///////////////由session["name"]求userID 
         
            lblTest.Visible = false;
            lblTest0.Visible = false;
            dlistUnfinished.Visible = true;
            dlistFinished.Visible = false;
            BindDataList(0, 0);
        }

    }
    private void BindDataList(int currentpage1, int currentpage2)
    {
        if (Session["userId"] != null)
        {
            pds1.AllowPaging = true;
            pds1.PageSize = 4;
            pds1.CurrentPageIndex = currentpage1;
            pds2.AllowPaging = true;
            pds2.PageSize = 4;
            pds2.CurrentPageIndex = currentpage2;

            string strSql = "select * from vw_order_user_shop_phone_estimate where (orderstate='1' or orderstate='2') and sellerId='" + Session["userId"].ToString() + "'";
            if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
            SqlDataAdapter sda = new SqlDataAdapter(strSql, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                pds1.DataSource = ds.Tables[0].DefaultView;
                dlistUnfinished.DataSource = pds1;
                dlistUnfinished.DataBind();
            }
            else
            {
                lblTest.Visible = true;
                lblTest.Text = "没有未发货的订单！";
                dlistUnfinished.Visible = false;
                btnUnfinished.Enabled = false;
            }
            string strSql2 = "select * from  vw_order_user_shop_phone_estimate where (orderstate='3' or orderstate='4' or orderstate='5' or orderstate='6') and sellerId='" + Session["userId"].ToString() + "'";
            if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
            SqlDataAdapter sda2 = new SqlDataAdapter(strSql2, conn);
            DataSet ds2 = new DataSet();
            sda2.Fill(ds2);
            if (ds2.Tables[0].Rows.Count > 0)
            {
                pds2.DataSource = ds2.Tables[0].DefaultView;
                dlistFinished.DataSource = pds2;
                dlistFinished.DataBind();
            }
            else
            {
                lblTest0.Visible = true;
                lblTest0.Text = "没有已完成订单！";
                dlistFinished.Visible = false;
                btnFinished.Enabled = false;
            }
            conn.Close();
        }
        else 
        {
            Response.Redirect("~/Public/Index.aspx");
        }
    }
    protected void btnUnfinished_Click(object sender, EventArgs e)
    {
        dlistUnfinished.Visible = true;
        dlistFinished.Visible = false;
        lblTest0.Visible = false;
    }
    protected void btnFinished_Click(object sender, EventArgs e)
    {
        dlistUnfinished.Visible = false;
        dlistFinished.Visible = true;
        lblTest.Visible = false;
    }
    protected void btnShowBoth_Click(object sender, EventArgs e)
    {
        dlistUnfinished.Visible = true;
        dlistFinished.Visible = true;
    }
    //protected void dlistFinished_DeleteCommand(object source, DataListCommandEventArgs e)
    //{
    //    //int id = int.Parse(dlistFinished.DataKeys[e.Item.ItemIndex].ToString());
    //    //string sql = "delete from OrderInfo where orderId='" + id + "' cascade";
    //    //if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
    //    //SqlCommand cmd = new SqlCommand(sql, conn);
    //    //if (Convert.ToInt32(cmd.ExecuteNonQuery()) > 0)
    //    //{
    //    //    Response.Write("<script>alert('订单删除成功！')</script>");
    //    //}
    //    //else
    //    //{
    //    //    Response.Write("<script>alert('删除失败，请查找原因！')</script>");
    //    //}
    //    //conn.Close();
    //}
    protected void dlistUnfinished_EditCommand(object source, DataListCommandEventArgs e)
    {
        dlistUnfinished.EditItemIndex = e.Item.ItemIndex;
        BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
    }
    protected void dlistUnfinished_ItemCommand(object source, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "first": pds1.CurrentPageIndex = 0;
                BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                break;
            case "last": pds1.CurrentPageIndex = pds1.PageCount - 1;
                BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                break;
            case "pre": pds1.CurrentPageIndex = pds1.CurrentPageIndex - 1;
                BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                break;
            case "next": pds1.CurrentPageIndex = pds1.CurrentPageIndex + 1;
                BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                break;
            case "search":
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int pageCount = int.Parse(pds1.PageCount.ToString());
                    TextBox txtpage = e.Item.FindControl("txtPage") as TextBox;
                    int myPageNum = 0;
                    if (!txtpage.Text.Equals(""))
                    {
                        myPageNum = Convert.ToInt32(txtpage.Text.ToString());
                        if (myPageNum <= 0 || myPageNum > pageCount)
                        {
                            Response.Write("<Script>alert('请重新输入页码！')</Script>");
                        }
                        else BindDataList((myPageNum - 1), pds2.CurrentPageIndex);
                    }
                }
                break;
            case "Redirect":
                Label orderId = e.Item.FindControl("lblOrderId") as Label;
                Response.Redirect("~/Seller/SendGoods.aspx?orderId=" + orderId.Text.ToString());
                break;
        }
    }
    protected void dlistUnfinished_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label CurrentPage = (Label)(this.dlistUnfinished.Controls[dlistUnfinished.Controls.Count - 1].FindControl("lblCurrentPage"));
            Label PageCount = e.Item.FindControl("lblPageCount") as Label;
            LinkButton FirstPage = e.Item.FindControl("lbtnFirst") as LinkButton;
            LinkButton PrePage = e.Item.FindControl("lbtnPre") as LinkButton;
            LinkButton NextPage = e.Item.FindControl("lbtnNext") as LinkButton;
            LinkButton LastPage = e.Item.FindControl("lbtnLast") as LinkButton;

            CurrentPage.Text = (pds1.CurrentPageIndex + 1).ToString();
            PageCount.Text = pds1.PageCount.ToString();

            if (pds1.IsFirstPage)
            {
                FirstPage.Enabled = false;
                PrePage.Enabled = false;
            }
            if (pds1.IsLastPage)
            {
                LastPage.Enabled = false;
                NextPage.Enabled = false;
            }
        }
    }
    protected void dlistFinished_ItemCommand(object source, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "first": pds2.CurrentPageIndex = 0;
                BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                break;
            case "last": pds2.CurrentPageIndex = pds2.PageCount - 1;
                BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                break;
            case "pre": pds2.CurrentPageIndex = pds2.CurrentPageIndex - 1;
                BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                break;
            case "next": pds2.CurrentPageIndex = pds2.CurrentPageIndex + 1;
                BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                break;
            case "search":
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int pageCount = int.Parse(pds2.PageCount.ToString());
                    TextBox txtpage = e.Item.FindControl("txtPage") as TextBox;
                    int myPageNum = 0;
                    if (!txtpage.Text.Equals(""))
                    {
                        myPageNum = Convert.ToInt32(txtpage.Text.ToString());
                        if (myPageNum <= 0 || myPageNum > pageCount)
                        {
                            Response.Write("<Script>alert('请重新输入页码！')</Script>");
                        }
                        else BindDataList(pds1.CurrentPageIndex, (myPageNum - 1));
                    }
                }
                break;
            case "agree":
                int id = int.Parse(dlistFinished.DataKeys[e.Item.ItemIndex].ToString());
                string sql = "update OrderInfo set orderstate ='5' where orderId='" + id + "'";
                if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
                SqlCommand cmd = new SqlCommand(sql, conn);
                try
                {
                    cmd.ExecuteNonQuery();
                    dlistUnfinished.EditItemIndex = -1;
                    BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
                }
                catch (Exception err)
                {
                    Response.Write(err.ToString());
                }
                finally
                {
                    conn.Close();
                }
                break;
        }
    }
    protected void dlistFinished_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label CurrentPage = e.Item.FindControl("lblCurrentPage") as Label;
            Label PageCount = e.Item.FindControl("lblPageCount") as Label;
            LinkButton FirstPage = e.Item.FindControl("lbtnFirst") as LinkButton;
            LinkButton PrePage = e.Item.FindControl("lbtnPre") as LinkButton;
            LinkButton NextPage = e.Item.FindControl("lbtnNext") as LinkButton;
            LinkButton LastPage = e.Item.FindControl("lbtnLast") as LinkButton;
           

            CurrentPage.Text = (pds2.CurrentPageIndex + 1).ToString();
            PageCount.Text = pds2.PageCount.ToString();

            if (pds2.IsFirstPage)
            {
                FirstPage.Enabled = false;
                PrePage.Enabled = false;
            }
            if (pds2.IsLastPage)
            {
                LastPage.Enabled = false;
                NextPage.Enabled = false;
            }
        }
        //Control agree = e.Item.FindControl("btnAgree");
        //Control state = e.Item.FindControl("lblState");
        //if (((Label)(e.Item.FindControl("lblState"))).Text.ToString() == "退款中的订单")
        //{
        //    agree.Visible = true;
        //}         
    }
    protected void dlistUnfinished_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        int id = int.Parse(dlistUnfinished.DataKeys[e.Item.ItemIndex].ToString());
        string sql = "update OrderInfo set orderstate ='5' where orderId='" + id + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            cmd.ExecuteNonQuery();
            dlistUnfinished.EditItemIndex = -1;
            BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
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
    protected void dlistUnfinished_CancelCommand(object source, DataListCommandEventArgs e)
    {
        dlistUnfinished.EditItemIndex = -1;
        BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
    }
}