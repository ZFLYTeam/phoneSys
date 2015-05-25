using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Buyer_SubmitOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCode.Visible = false;
        lblRevName.Visible = false;
        lblTelPhone.Visible = false;
        lblStreet.Visible = false;
        txtStreet.Visible = false;
        txtRevName.Visible = false;
        txtCode.Visible = false;
        txtTelPhone.Visible = false;
        btnAddress.Visible = false;
        btnCancel.Visible = false;
        Session["State"] = "是";
        if (Session["name"] != null)
        {
            BuyerDSTableAdapters.aspnet_UsersTableAdapter userDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
            DataTable userdDT = userDA.GetDataByUName(Session["name"].ToString());
            if (userdDT.Rows.Count != 0)
            {
                Session["BuyerId"] = System.Guid.Parse(userdDT.Rows[0][1].ToString());

                BuyerDSTableAdapters.UsersExtendTableAdapter addrDA = new BuyerDSTableAdapters.UsersExtendTableAdapter();
                DataTable addrDT = addrDA.GetDataByUid(System.Guid.Parse(userdDT.Rows[0][1].ToString()));
                if (addrDT.Rows.Count != 0)
                {
                    lblAddr.Text = addrDT.Rows[0][3].ToString() + ""
                               + "(" + addrDT.Rows[0][1].ToString() + " 收) "
                               + addrDT.Rows[0][2].ToString();
                    lblRevAddr.Text = addrDT.Rows[0][3].ToString() + "&nbsp;";
                    lblRevInfo.Text = addrDT.Rows[0][1].ToString() + " " + addrDT.Rows[0][2].ToString() + "&nbsp;";
                    Session["Addr"] = addrDT.Rows[0][3].ToString();
                    Session["RevName"] = addrDT.Rows[0][1].ToString();
                    Session["TelPhone"] = addrDT.Rows[0][2].ToString();
                }
                Show();
            }
        }
        else
        {
            Response.Write("<Script>alert('提示：登录后才能提交订单！')</Script>");
            Response.Redirect("~/Public/Index.aspx");
        }
        btnAddress.Attributes.Add("onclick", "return confirm('确定要修改吗？');");
    }
    void Show()
    {
        int sum = 0;
        BuyerDSTableAdapters.View_ChartDetailTableAdapter chartDA = new BuyerDSTableAdapters.View_ChartDetailTableAdapter();
        DataTable chartDT = chartDA.GetDataByUid(System.Guid.Parse(Session["BuyerId"].ToString()), "是");
        if (chartDT.Rows.Count != 0)
        {
            dlOrder.DataSource = chartDT;
            dlOrder.DataBind();
            for (int i = 0; i < chartDT.Rows.Count; i++)
            {
                Label lblProperity = (Label)dlOrder.Items[i].FindControl("lblProperity");
                Label lblPrice = (Label)dlOrder.Items[i].FindControl("lblAllPrice");

                BuyerDSTableAdapters.DM_colorTableAdapter colorDA = new BuyerDSTableAdapters.DM_colorTableAdapter();
                DataTable colorDT = colorDA.GetDataByColorId(chartDT.Rows[i][14].ToString());

                BuyerDSTableAdapters.DM_osTableAdapter osDA = new BuyerDSTableAdapters.DM_osTableAdapter();
                DataTable osDT = osDA.GetDataByOsId(chartDT.Rows[i][16].ToString());

                BuyerDSTableAdapters.DM_CPUTableAdapter cpuDA = new BuyerDSTableAdapters.DM_CPUTableAdapter();
                DataTable cpuDT = cpuDA.GetDataByCpuId(chartDT.Rows[i][17].ToString());

                if (colorDT.Rows.Count != 0 && osDT.Rows.Count != 0 && colorDT.Rows.Count != 0)
                {
                    lblProperity.Text = "颜色：" + colorDT.Rows[0][1].ToString()
                                      + " OS：" + osDT.Rows[0][1].ToString()
                                      + " CPU：" + cpuDT.Rows[0][1].ToString();
                }
                int total = int.Parse(lblPrice.Text.Substring(1));
                sum = sum + total;
            }
        }
        lblTotal.Text = "¥" + sum.ToString();
    }

    protected void btnAddress_Click(object sender, EventArgs e)
    {
        if (txtStreet.Text != "" && txtRevName.Text != "" && txtCode.Text != "" && txtTelPhone.Text != "")
        {
            lblAddr.Text = txtStreet.Text.ToString() + ""
                        + "(" + txtRevName.Text.ToString() + " 收)" + ""
                        + txtTelPhone.Text.ToString();
            Session["Addr"] = txtStreet.Text.ToString();
            Session["RevName"] = txtRevName.Text.ToString();
            Session["TelPhone"] = txtTelPhone.Text.ToString();
            lblRevAddr.Text = Session["Addr"].ToString() + "&nbsp;";
            lblRevInfo.Text = Session["RevName"].ToString() + " " + Session["TelPhone"].ToString() + "&nbsp;";
        }
    }
    protected void btnNewAddr_Click(object sender, EventArgs e)
    {
        lblCode.Visible = true;
        lblRevName.Visible = true;
        lblTelPhone.Visible = true;
        lblStreet.Visible = true;
        txtStreet.Visible = true;
        txtRevName.Visible = true;
        txtCode.Visible = true;
        txtTelPhone.Visible = true;
        btnAddress.Visible = true;
        btnCancel.Visible = true;
    }
    protected void imgbtnReChart_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Buyer/ShoppingCart.aspx");
    }
    protected void lbtnPName_Click(object sender, EventArgs e)
    {
        string PhoneId = ((LinkButton)sender).CommandArgument.ToString();
        if (PhoneId != "")
        {
            Response.Redirect("~/Public/GoodsInfo.aspx?PhoneId=" + PhoneId);
        }
    }
    protected void lbtnSName_Click(object sender, EventArgs e)
    {
        string ShopId = ((LinkButton)sender).CommandArgument.ToString();
        if (ShopId != "")
        {
            Response.Redirect("~/Public/LookShop.aspx?ShopId=" + ShopId);
        }
    }
    protected void imgbtnSubmit_Click1(object sender, ImageClickEventArgs e)
    {
        if (Session["Addr"] != null && Session["TelPhone"] != null && Session["RevName"] != null)
        {
            BuyerDSTableAdapters.View_ChartDetailTableAdapter chartDA = new BuyerDSTableAdapters.View_ChartDetailTableAdapter();
            DataTable chartDT = chartDA.GetDataByPid(System.Guid.Parse(Session["BuyerId"].ToString()), long.Parse(ddlSelectId.SelectedValue.ToString()), "是");

            if (chartDT.Rows.Count != 0)
            {
                int store = int.Parse(chartDT.Rows[0][21].ToString());
                int want = int.Parse(chartDT.Rows[0][4].ToString());
                lblAddr.Text = System.Guid.Parse(chartDT.Rows[0][2].ToString()).ToString();
                int money = int.Parse(chartDT.Rows[0][5].ToString());
                BuyerDSTableAdapters.OrderInfoTableAdapter orderDA = new BuyerDSTableAdapters.OrderInfoTableAdapter();
                int orderDT = orderDA.InsertOrder(System.Guid.Parse(chartDT.Rows[0][2].ToString()),
                                                  System.Guid.Parse(Session["BuyerId"].ToString()),
                                                  long.Parse(ddlSelectId.SelectedValue.ToString()),
                                                  want,
                                                  DateTime.Now, "1", DateTime.Now, DateTime.Now,
                                                  Session["Addr"].ToString(),
                                                  Session["TelPhone"].ToString(),
                                                  Session["RevName"].ToString()
                                                  );
                if (orderDT != 0)
                {
                    BuyerDSTableAdapters.PhoneInfoTableAdapter storeDA = new BuyerDSTableAdapters.PhoneInfoTableAdapter();
                    int storeDT = storeDA.UpdateStore(store - want, long.Parse(ddlSelectId.SelectedValue.ToString()));
                    BuyerDSTableAdapters.ShopCartTableAdapter delDA = new BuyerDSTableAdapters.ShopCartTableAdapter();
                    int delDT = delDA.DeleteShopChart(long.Parse(chartDT.Rows[0][0].ToString()));
                    if (storeDT != 0 && delDT != 0)
                    {
                        BuyerDSTableAdapters.OrderInfoTableAdapter SearchOrderDA = new BuyerDSTableAdapters.OrderInfoTableAdapter();
                        DataTable SearchDT = SearchOrderDA.GetOrderId(System.Guid.Parse(Session["BuyerId"].ToString()), long.Parse(ddlSelectId.SelectedValue.ToString()), "1");
                        if (SearchDT.Rows.Count != 0)
                        {
                            string OrderId = SearchDT.Rows[0][0].ToString();
                            Response.Redirect("~/Buyer/Pay.aspx?OrderId=" + OrderId + "&OrderName=" + ddlSelectId.SelectedValue.ToString() + "&Money=" + money + "&RevName=" + Session["RevName"].ToString() + "&RevAddr=" + Session["Addr"].ToString() + "&RevTel=" + Session["TelPhone"].ToString());
                        }
                    }
                    else
                    {
                        Response.Write("<Script>alert('订单未能提交！')</Script>");
                        //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('订单未能提交！');", true);
                    }
                }
            }
        }
        else
        {
            Response.Write("<Script>alert('收货人信息不完整！')</Script>");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lblCode.Visible = false;
        lblRevName.Visible = false;
        lblTelPhone.Visible = false;
        lblStreet.Visible = false;
        txtStreet.Visible = false;
        txtRevName.Visible = false;
        txtCode.Visible = false;
        txtTelPhone.Visible = false;
        btnAddress.Visible = false;
        btnCancel.Visible = false;
    }
    protected void ddlSelectId_SelectedIndexChanged(object sender, EventArgs e)
    {

        int sum = 0;
        BuyerDSTableAdapters.View_ChartDetailTableAdapter chartDA = new BuyerDSTableAdapters.View_ChartDetailTableAdapter();
        DataTable chartDT = chartDA.GetDataByPid(System.Guid.Parse(Session["BuyerId"].ToString()), long.Parse(ddlSelectId.SelectedValue.ToString()), "是");
        if (chartDT.Rows.Count != 0)
        {
            dlOrder.DataSource = chartDT;
            dlOrder.DataBind();
            for (int i = 0; i < chartDT.Rows.Count; i++)
            {
                Label lblProperity = (Label)dlOrder.Items[i].FindControl("lblProperity");
                Label lblPrice = (Label)dlOrder.Items[i].FindControl("lblAllPrice");

                BuyerDSTableAdapters.DM_colorTableAdapter colorDA = new BuyerDSTableAdapters.DM_colorTableAdapter();
                DataTable colorDT = colorDA.GetDataByColorId(chartDT.Rows[i][14].ToString());

                BuyerDSTableAdapters.DM_osTableAdapter osDA = new BuyerDSTableAdapters.DM_osTableAdapter();
                DataTable osDT = osDA.GetDataByOsId(chartDT.Rows[i][16].ToString());

                BuyerDSTableAdapters.DM_CPUTableAdapter cpuDA = new BuyerDSTableAdapters.DM_CPUTableAdapter();
                DataTable cpuDT = cpuDA.GetDataByCpuId(chartDT.Rows[i][17].ToString());

                if (colorDT.Rows.Count != 0 && osDT.Rows.Count != 0 && colorDT.Rows.Count != 0)
                {
                    lblProperity.Text = "颜色：" + colorDT.Rows[0][1].ToString()
                                      + " OS：" + osDT.Rows[0][1].ToString()
                                      + " CPU：" + cpuDT.Rows[0][1].ToString();
                }
                sum = int.Parse(lblPrice.Text.Substring(1));
                 
            }
        }
        lblTotal.Text = "¥" + sum.ToString();
    }

}