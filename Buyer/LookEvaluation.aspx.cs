using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

using DMDataSetTableAdapters;
using BuyerDataSetTableAdapters;

public partial class Buyer_LookEvaluation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {

            string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();
            string SelectSql = "select * from V_UserInfo where UserName = '" + Session["name"].ToString() + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string id = "";
            if (ds.Tables[0].Rows.Count > 0)
            {

                id = ds.Tables[0].Rows[0][0].ToString();
            }
            //Guid guid = new Guid(id);
            //Session["buyerID"] = guid;
            SelectSql = "select * from V_Evaluation where estname = '" +System.Guid.Parse(id) + "'";
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            ds = new DataSet();
            da.Fill(ds);
            gvEvaluation.DataSource = ds.Tables[0];
            gvEvaluation.DataBind();
            if (gvEvaluation.Rows.Count > 0)
            {
                for (int i = 0; i < gvEvaluation.Rows.Count; i++)
                {
                    Label lblReply = (Label)gvEvaluation.Rows[i].FindControl("lblReply");
                    Label lblRTime = (Label)gvEvaluation.Rows[i].FindControl("lblRTime");
                    Label lblShow = (Label)gvEvaluation.Rows[i].FindControl("lblShow");
                    if (lblReply.Text == "")
                    {
                        lblReply.Enabled = false;
                        lblReply.Visible = false;
                        lblRTime.Enabled = false;
                        lblRTime.Visible = false;
                    }
                    else
                    {
                        lblRTime.Text = ds.Tables[0].Rows[i][9].ToString();
                        lblShow.Enabled = false;
                        lblShow.Visible = false;
                    }
                }
            }
        }
        else
        {
            Response.Redirect("../Public/Index.aspx");
        }
    }
    protected void lbtnShop_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();

        Response.Redirect("../Public/LookShop.aspx?ShopId=" + id);


    }
    protected void lbtnPhone_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument.ToString();

        Response.Redirect("../Public/GoodsInfo.aspx?PhoneId=" + id);

        //Response.Redirect("~/Buyer/orderDetail.aspx?orderID=" + txtUser.Text);
    }
    protected void gvEvaluation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEvaluation.PageIndex = e.NewPageIndex;
        gridviewBind();
    }
    public void gridviewBind()
    {
        string ConnSql = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlConnection Conn = new SqlConnection(ConnSql);
        Conn.Open();
        string SelectSql = "select * from V_UserInfo where UserName = '" + Session["name"].ToString() + "'";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string id = "";
        if (ds.Tables[0].Rows.Count > 0)
        {

            id = ds.Tables[0].Rows[0][0].ToString();
        }
       // Guid guid = new Guid(id);
        //Session["buyerID"] = guid;
        SelectSql = "select * from V_Evaluation where estname = '" + System.Guid.Parse(id) + "'";
        da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand(SelectSql, Conn);
        ds = new DataSet();
        da.Fill(ds);
        gvEvaluation.DataSource = ds.Tables[0];
        gvEvaluation.DataBind();
        if (gvEvaluation.Rows.Count > 0)
        {
            for (int i = 0; i < gvEvaluation.Rows.Count; i++)
            {
                Label lblReply = (Label)gvEvaluation.Rows[i].FindControl("lblReply");
                Label lblRTime = (Label)gvEvaluation.Rows[i].FindControl("lblRTime");
                Label lblShow = (Label)gvEvaluation.Rows[i].FindControl("lblShow");
                if (lblReply.Text == "")
                {
                    lblReply.Enabled = false;
                    lblReply.Visible = false;
                    lblRTime.Enabled = false;
                    lblRTime.Visible = false;
                }
                else
                {
                    lblRTime.Text = ds.Tables[0].Rows[i][9].ToString();
                    lblShow.Enabled = false;
                    lblShow.Visible = false;
                }
            }
        }
    }

}