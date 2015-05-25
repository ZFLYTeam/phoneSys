using System;
using System.Web;
using System.Web.UI;

/// <summary>
/// 我的Js调用
/// 创建时间：2008-8-24
/// 创建者：五十九分
/// </summary>
public class Jscript
{        
           
    /// <summary>
    /// 弹出JavaScript小窗口
    /// </summary>
    /// <param name="js">窗口信息</param>
    public static void Alert(string message)
    {
        #region
        string js = @"<Script language='JavaScript'>
                alert('" + message + "');</Script>";
        HttpContext.Current.Response.Write(js);
        #endregion
    }

    /// <summary>
    /// 弹出消息框并且转向到新的URL
    /// </summary>
    /// <param name="message">消息内容</param>
    /// <param name="toURL">连接地址</param>
    public static void AlertAndRedirect(string message, string toURL)
    {
        #region
        string js = "<script language=javascript>alert('{0}');window.location.replace('{1}')</script>";
        HttpContext.Current.Response.Write(string.Format(js, message, toURL));
        #endregion
    }
    
    /// <summary>
    /// 回到历史页面
    /// </summary>
    /// <param name="value">-1/1</param>
    public static void GoHistory(int value)
    {
        #region
        string js = @"<Script language='JavaScript'>
                history.go({0});  
              </Script>";
        HttpContext.Current.Response.Write(string.Format(js, value));
        #endregion
    }

    /// <summary>
    /// 关闭当前窗口
    /// </summary>
    public static void CloseWindow()
    {
        #region
        string js = @"<Script language='JavaScript'>
                parent.opener=null;window.close();  
              </Script>";
        HttpContext.Current.Response.Write(js);
        HttpContext.Current.Response.End();
        #endregion
    }

    /// <summary>
    /// 刷新父窗口
    /// </summary>
    public static void RefreshParent(string url)
    {
        #region
        string js = @"<Script language='JavaScript'>
                window.opener.location.href='" + url + "';window.close();</Script>";
        HttpContext.Current.Response.Write(js);
        #endregion
    }

   
    /// <summary>
    /// 刷新打开窗口
    /// </summary>
    public static void RefreshOpener()
    {
        #region
        string js = @"<Script language='JavaScript'>
                opener.location.reload();
              </Script>";
        HttpContext.Current.Response.Write(js);
        #endregion
    }


    /// <summary>
    /// 打开指定大小的新窗体
    /// </summary>
    /// <param name="url">地址</param>
    /// <param name="width">宽</param>
    /// <param name="heigth">高</param>
    /// <param name="top">头位置</param>
    /// <param name="left">左位置</param>
    public static void OpenWebFormSize(string url)
    {
        #region
        string js = @"<Script language='JavaScript'>window.open('" + url + @"','','height=window.screen.height ,width=window.screen.width,top=0,left=0,toolbar=no,center:yes, menubar=no, scrollbars=no, resizable=yes,location=no, status=no');window.opener=null;window.close();</Script>";

        HttpContext.Current.Response.Write(js);
        #endregion
    }
   
    
    /// <summary>
    /// 转向Url制定的页面
    /// </summary>
    /// <param name="url">连接地址</param>
    public static void JavaScriptLocationHref(string url)
    {
        #region
        string js = @"<Script language='JavaScript'>
                window.location.replace('{0}');
              </Script>";
        js = string.Format(js, url);
        HttpContext.Current.Response.Write(js);
        #endregion
    }

    /// <summary>
    /// 打开指定大小位置的模式对话框
    /// </summary>
    /// <param name="webFormUrl">连接地址</param>
    /// <param name="width">宽</param>
    /// <param name="height">高</param>
    /// <param name="top">距离上位置</param>
    /// <param name="left">距离左位置</param>
    public static string GetModalString(string webFormUrl, int width, int height)
    {
        #region
        string features = "dialogWidth:" + width.ToString() + "px"
            + ";dialogHeight:" + height.ToString() + "px"
            + ";center:yes;help=no;resizable:no;status:no;scroll=yes";
        string strModalg = ShowModalDialogJavascript(webFormUrl, features);
        return strModalg;
        #endregion
    }
    //public static string GetModalString(string webFormUrl, int width, int height)
    //{
    //    #region
    //    string features ="center:yes;help=no;resizable:no;status:no;scroll=no;";
    //    string strModalg = ShowModalDialogJavascript(webFormUrl, features);
    //    return strModalg;
    //    #endregion
    //}

    public static string ShowModalDialogJavascript(string webFormUrl, string features)
    {
        #region
        string js = @"<script language=javascript>							
						showModalDialog('" + webFormUrl + "','','" + features + "');window.navigate(location);</script>";
        return js;
        #endregion
    }        

}