using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Jayrock.Json;
/// <summary>
///ResponseUtil 的摘要说明
/// </summary>
public class ResponseUtil
{

    /// <summary>
    /// 输入string
    /// 输出json
    /// </summary>
    /// <param name="strJsonText">要输出的json串</param>
    public static void writeStringtoJson(String strJsonText)
    {
        JsonReader reader = new JsonTextReader(new StringReader(strJsonText));
        JsonObject jsonObj = new JsonObject();
        jsonObj.Import(reader);
        HttpContext.Current.Response.Write(jsonObj);
        HttpContext.Current.Response.End();
    }
}