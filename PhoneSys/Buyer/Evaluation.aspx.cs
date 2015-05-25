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

public partial class Buyer_Evaluation : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();
    string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        ibtnConfirmEvaluation.Attributes.Add("onclick", "return confirm('确定要评价吗？');");
            if (Session["name"] == null)
            {
                Response.Redirect("../Public/Index.aspx");
            }
            else
            {
                long id = new long();
                id = Convert.ToInt64(Request.QueryString["orderID"].ToString());
              
                Session["orderID"] = id;

                View1TableAdapter order = new View1TableAdapter();
                DataTable odt = order.GetDataByorderID(id);
                if (odt.Rows.Count > 0)
                {

                    lbtnSeller.Text = odt.Rows[0][14].ToString();
                    lblSellerID.Text = odt.Rows[0][1].ToString();
                    lblBuyerID.Text = odt.Rows[0][2].ToString();
                    lblPhoneID.Text = odt.Rows[0][3].ToString();
                }
            }

               
            if (!IsPostBack)
            {
                BindDatalist(0);
            }
    }
    private void BindDatalist(int currentpage)
    {
        pds.AllowPaging = true;
        pds.PageSize = 5;
        pds.CurrentPageIndex = currentpage;

        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        string SelectSql = "select top 20 * from PhoneInfo order by sell_quantity desc";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        pds.DataSource = ds.Tables[0].DefaultView;
        DataList1.DataSource = pds;
        DataList1.DataBind();
        Conn.Close();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
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
                    TextBox txtSkip = e.Item.FindControl("txtSkip") as TextBox;
                    int MyPageNum = 0;
                    if (!txtSkip.Text.Equals(""))
                    {
                        MyPageNum = Convert.ToInt32(txtSkip.Text.ToString());

                    }
                    if (MyPageNum <= 0 || MyPageNum > pageCount)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('页数不正确！');", true);
                        //Response.Write("<script language=javascript>alert('');</script>");
                    }
                    else
                    {
                        BindDatalist(MyPageNum - 1);
                    }
                }
                break;
        }

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
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
   
    protected void ibtnConfirmEvaluation_Click(object sender, ImageClickEventArgs e)
    {

        long id = new long();
      id = Convert.ToInt64(Session["orderID"].ToString());
          // id = Convert.ToInt64("1100001");
        
        Guid buyer = new Guid(lblBuyerID.Text);
            long phone = new long();
            phone = Convert.ToInt64(lblPhoneID.Text);
            if (txtContent.Text != "")
            {
                EstimateInfoTableAdapter evaluate = new EstimateInfoTableAdapter();
                int EvaCount = evaluate.CreateEstimate(id, buyer, phone, txtContent.Text, DateTime.Now);
                if (EvaCount == 1)
                {
                   ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('恭喜您！\\n\\n评价成功！');", true);
                    // Response.Write("<script language=javascript>alert('恭喜您！\\n\\n评价成功！');</script>");
                   txtContent.Text = "";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('抱歉！\\n\\n评价失败，请重新评价！');", true);
                    //Response.Write("<script language=javascript>alert('抱歉！\\n\\n评价失败，请重新评价！');</script>");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请填写评价内容！');", true);
               // Response.Write("<script language=javascript>alert('请填写评价内容！');</script>");
            }
      
    }
    protected void lbtnSeller_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Public/LookShop.aspx?ShopId=" + lblSellerID.Text);
    }


    protected void ibtnPhonePhoto_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument.ToString();
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
    protected void lbtnName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
    protected void ibtnPhone_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument.ToString();
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);

    }
    protected void lbtnPhoneName_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();
        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);
    }
}