using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Seller_Estimate : System.Web.UI.Page
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
            DataList1.Visible = true;
            DataList2.Visible = false;
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

            conn.Close();
            BindDataList(0, 0);
        }
    }
    private void BindDataList(int currentpage1, int currentpage2)
    {
        pds1.AllowPaging = true;
        pds1.PageSize = 4;
        pds1.CurrentPageIndex = currentpage1;
        pds2.AllowPaging = true;
        pds2.PageSize = 4;
        pds2.CurrentPageIndex = currentpage2;

        string strSql_3 = "select * from OrderInfo where goodsseller='" + System.Guid.Parse(Session["userId"].ToString()) + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlDataAdapter sda3 = new SqlDataAdapter();
        sda3.SelectCommand = new SqlCommand(strSql_3, conn);
        DataSet ds3 = new DataSet();
        sda3.Fill(ds3);
        if (ds3.Tables[0].Rows.Count == 0)
        {
            lblShowMsg.Text = "没有评价需要回复!";

            DataList1.Visible = false;
            btnBoth.Enabled = false;
            btnOnlyBuyer.Enabled = false;
        }

        else
        {
            string strSql_1 = "select * from vw_buyerestimate_user where replyInfo is null and sellerId='" + System.Guid.Parse(Session["userId"].ToString()) + "'";
            if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
            SqlDataAdapter sda1 = new SqlDataAdapter(strSql_1, conn);
            DataSet ds1 = new DataSet();
            sda1.Fill(ds1);
            pds1.DataSource = ds1.Tables[0].DefaultView;
            DataList1.DataSource = pds1;
            DataList1.DataBind();

            string strSql_2 = "select * from vw_buyerestimate_user where replyInfo is not null and sellerId='" + System.Guid.Parse(Session["userId"].ToString()) + "'";
            if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
            SqlDataAdapter sda2 = new SqlDataAdapter(strSql_2, conn);
            DataSet ds2 = new DataSet();
            sda2.Fill(ds2);
            pds2.DataSource = ds2.Tables[0].DefaultView;
            DataList2.DataSource = pds2;
            DataList2.DataBind();
            conn.Close();
        }
    }
    protected void btnOnlyBuyer_Click(object sender, EventArgs e)
    {
        DataList1.Visible = true;
        DataList2.Visible = false;
        btnOnlyBuyer.Enabled = false;
        btnBoth.Enabled = true;
    }

    protected void btnBoth_Click(object sender, EventArgs e)
    {
        DataList2.Visible = true;
        DataList1.Visible = false;
        btnBoth.Enabled = false;
        btnOnlyBuyer.Enabled = true;
    }
    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        int id = int.Parse(DataList1.DataKeys[e.Item.ItemIndex].ToString());
        DateTime replytime = DateTime.Now;
        string Reply_info = ((TextBox)e.Item.FindControl("txtReply")).Text.ToString();
        string sql = "update EstimateInfo set replyInfo ='" + Reply_info + "',replytime='" + replytime + "',replyId='" + System.Guid.Parse(Session["userId"].ToString()) + "' where estimate_id='" + id + "'";
        if (conn.State.Equals(ConnectionState.Closed)) { conn.Open(); }
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            cmd.ExecuteNonQuery();
            DataList1.EditItemIndex = -1;
            BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
            if (pds2.Count == 0)
            {
                lblShowMsg.Text = "没有评价需要回复!";
                DataList1.Visible = false;
                btnBoth.Enabled = false;
                btnOnlyBuyer.Enabled = false;
            }
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
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
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
    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
    }
    protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = -1;
        BindDataList(pds1.CurrentPageIndex, pds2.CurrentPageIndex);
    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
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
        }
    }
    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
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
    }
}