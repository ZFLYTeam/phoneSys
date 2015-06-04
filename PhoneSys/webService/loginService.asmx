<%@ WebService Language="C#" Class="loginService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Security;
using System.Data;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
// [System.Web.Script.Services.ScriptService]
public class loginService  : System.Web.Services.WebService {

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    
    [WebMethod]
    public void login() {
        HttpContext.Current.Response.ContentType = "text/plain";
        string userName = HttpContext.Current.Request.Params["userName"];
        string password = HttpContext.Current.Request.Params["password"];
        if (Membership.ValidateUser(userName, password))
        {
            ResponseUtil.writeStringtoJson("{'status':'yes'}");
        }
        else { 
             ResponseUtil.writeStringtoJson("{'status':'no'}");
        }
       
    }
}