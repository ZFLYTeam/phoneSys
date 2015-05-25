using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdminmaindatasetTableAdapters;

public partial class Admin_phonecompmanage : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //BindDataList(0);
        }
    }

    private void BindDataList(int currentpage)
    {
        pds.AllowPaging = true;//允许分页
        pds.PageSize = 8;//每页显示3条数据
        pds.CurrentPageIndex = currentpage;//当前页为传入的一个int型值
        //complaintTableAdapter comds = new complaintTableAdapter();
        //DataTable ds = comds.GetData();
        pds.DataSource = sdscomphonemana.SelectCommand ;
        
    }
    protected void dlphonecomp_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        string compid = dlphonecomp.DataKeys[e.Item.ItemIndex].ToString();
        ComplaintInfoTableAdapter compstate = new ComplaintInfoTableAdapter();
        long id = new long();
        id = Convert.ToInt64(compid);
        int result = compstate.Updatecomplaintstate("2", id);
        if (result > 0)
        {
            Response.Write("<script language=javascript>window.location.href='phonecompmanage.aspx'</script>");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('温馨提示：\\n\\n投诉状态由于一些原因设置失败！');", true);

        }
    }
    protected void dlphonecomp_ItemCommand(object source, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            //以下5个为 捕获用户点击 上一页 下一页等时发生的事件
            case "first"://第一页
                pds.CurrentPageIndex = 0;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "pre"://上一页
                pds.CurrentPageIndex = pds.CurrentPageIndex - 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "next"://下一页
                pds.CurrentPageIndex = pds.CurrentPageIndex + 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "last"://最后一页
                pds.CurrentPageIndex = pds.PageCount - 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "search"://页面跳转页
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int PageCount = int.Parse(pds.PageCount.ToString());
                    TextBox txtPage = e.Item.FindControl("txtPage") as TextBox;
                    int MyPageNum = 0;
                    if (!txtPage.Text.Equals(""))
                        MyPageNum = Convert.ToInt32(txtPage.Text.ToString());
                    if (MyPageNum <= 0 || MyPageNum > PageCount)
                        Response.Write("<script>alert('请输入页数并确定没有超出总页数！')</script>");
                    else
                        BindDataList(MyPageNum - 1);
                }
                break;
        }
    }
    protected void dlphonecomp_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            //以下六个为得到脚模板中的控件,并创建变量.
            Label CurrentPage = e.Item.FindControl("labCurrentPage") as Label;
            Label PageCount = e.Item.FindControl("labPageCount") as Label;
            LinkButton FirstPage = e.Item.FindControl("lnkbtnFirst") as LinkButton;
            LinkButton PrePage = e.Item.FindControl("lnkbtnFront") as LinkButton;
            LinkButton NextPage = e.Item.FindControl("lnkbtnNext") as LinkButton;
            LinkButton LastPage = e.Item.FindControl("lnkbtnLast") as LinkButton;
            CurrentPage.Text = (pds.CurrentPageIndex + 1).ToString();//绑定显示当前页
            PageCount.Text = pds.PageCount.ToString();//绑定显示总页数
            if (pds.IsFirstPage)//如果是第一页,首页和上一页不能用
            {
                FirstPage.Enabled = false;
                PrePage.Enabled = false;
            }
            if (pds.IsLastPage)//如果是最后一页"下一页"和"尾页"按钮不能用
            {
                NextPage.Enabled = false;
                LastPage.Enabled = false;
            }
        }
    }
    protected void dlphonecomp_EditCommand(object source, DataListCommandEventArgs e)
    {
        string id = dlphonecomp.DataKeys[e.Item.ItemIndex].ToString();
        Response.Redirect("~/Admin/Colormanage.aspx?id="+id);
    }
}