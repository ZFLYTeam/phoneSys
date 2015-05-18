using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class Buyer_ApplyShop : System.Web.UI.Page
{
    public static string img = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        { 
            //Response.Write("<Script>alert('！')</Script>");
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('提示：登录后才能申请店铺！');", true);
            Response.Redirect("~/Public/Index.aspx");
           
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtShopName.Text != "")
        {
            BuyerDSTableAdapters.aspnet_UsersTableAdapter uidDA = new BuyerDSTableAdapters.aspnet_UsersTableAdapter();
            DataTable uidDT = uidDA.GetDataByUName(Session["name"].ToString());
            if (uidDT.Rows.Count != 0)
            {
                BuyerDSTableAdapters.UsersExtendTableAdapter upDA = new BuyerDSTableAdapters.UsersExtendTableAdapter();
                int upDT = upDA.UpdateSellerInfo(imgIdPhoto.ImageUrl, System.Guid.Parse(uidDT.Rows[0][1].ToString()));
                BuyerDSTableAdapters.UsersExtendTableAdapter infoDA = new BuyerDSTableAdapters.UsersExtendTableAdapter();
                DataTable infoDT = infoDA.GetDataByUid(System.Guid.Parse(uidDT.Rows[0][1].ToString()));
                if (infoDT.Rows.Count != 0 && upDT != 0)
                {
                    BuyerDSTableAdapters.ShopInfoTableAdapter shopDA = new BuyerDSTableAdapters.ShopInfoTableAdapter();
                    int shopDT = shopDA.InsertShop(txtShopName.Text, System.Guid.Parse(uidDT.Rows[0][1].ToString()), "", infoDT.Rows[0][2].ToString(),
                        infoDT.Rows[0][3].ToString(), DateTime.Now, "1", imgLogo.ImageUrl);
                    if (shopDT != 0)
                    {
                        //Response.Write("<Script>alert('已提交，等待审核！')</Script>");
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('已提交，等待审核！');", true);
                    }
                }
            }
        }
        else
        {
           // Response.Write("<Script>alert('！')</Script>");
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请先填写店铺名称！');", true);
        }
        
    }
    protected void btnPreViewLogo_Click(object sender, EventArgs e)
    {
        if (fulShopLogo.HasFile)
        {
            img = fulShopLogo.PostedFile.FileName;
            FileInfo picFile = new FileInfo(img);
            string fileType = img.Substring(img.LastIndexOf(".") + 1);
            string str_root = Server.MapPath("..");
            fileType = fileType.Trim().ToLower();
            if (fileType.Equals("jpg") || fileType.Equals("png") || fileType.Equals("jpeg"))
            {
                if (fulShopLogo.PostedFile.ContentLength >= 300000)
                {
                    //给出提示 = "图片大小不能超过300kb";
                     //Response.Write("<Script>alert('图片大小不能超过300kb！')</Script>");
                   ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "alert('图片大小不能超过300kb！')", true);
                    return;
                }
                img = img.Replace(img.Substring(0, img.LastIndexOf(".")), txtShopName.Text);

                fulShopLogo.SaveAs(Server.MapPath("..") + @"\images_shoplogo\" + txtShopName.Text.ToString() + "." + fileType);
                imgLogo.Visible = true;
                imgLogo.ImageUrl = "~/images_shoplogo/" + txtShopName.Text.ToString() + "." + fileType;

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('上传失败!仅支持jpg,png,jpeg格式的图片!');", true);
                //Response.Write("<script>alert(’’);</script>");
                return;
            }

        }
        else
        {
           // Response.Write("<script>alert(’请选择文件！’);</script>");
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请选择文件！');", true);
        }
    }
    protected void btnPreViewId_Click(object sender, EventArgs e)
    {
        if (fulIdPhoto.HasFile)
        {
            img = fulIdPhoto.PostedFile.FileName;
            FileInfo picFile = new FileInfo(img);
            string fileType = img.Substring(img.LastIndexOf(".") + 1);
            string str_root = Server.MapPath("..");
            fileType = fileType.Trim().ToLower();
            if (fileType.Equals("jpg") || fileType.Equals("png") || fileType.Equals("jpeg"))
            {
                if (fulIdPhoto.PostedFile.ContentLength >= 300000)
                {
                    //给出提示 = "图片大小不能超过300kb";
                   // Response.Write("<Script>alert('图片大小不能超过300kb！')</Script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "alert('图片大小不能超过300kb！')", true);
                    return;
                }
                img = img.Replace(img.Substring(0, img.LastIndexOf(".")), Session["name"].ToString());

                fulIdPhoto.SaveAs(Server.MapPath("..") + @"\images\seller\" + Session["name"].ToString() + "." + fileType);
                imgIdPhoto.Visible = true;
                imgIdPhoto.ImageUrl = "~/images/seller/" + Session["name"].ToString() + "." + fileType;

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('上传失败!仅支持jpg,png,jpeg格式的图片!');", true);
                return;
            }

        }
        else
        {
             //Response.Write("<script>alert(’请选择文件！’);</script>");
           ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请选择文件！');", true);
        }
    }
}