using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;//Regex 
using System.Text;                    //StringBuilder
using System.Data;
using System.Data.SqlClient;
using ViewDateSetTableAdapters;
/// <summary>
///query 的摘要说明
/// </summary>
public class query
{
	public query()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public static string SubString(string str)
    {
        Regex regex = new Regex("^[\u4e00-\u9fa5]$");
        StringBuilder sb = new StringBuilder();
        int nLength = 0;

        for (int i = 0; i < str.Length; i++)
        {
            if (regex.IsMatch((str[i]).ToString()))
            {
                sb.Append(str[i]);
                nLength += 2;
            }
            else
            {
                sb.Append(str[i]);
                nLength = nLength + 1;
            }
            sb.Append('%');
            nLength = nLength + 1;
        }
        str = sb.ToString();
        return str;
    }
    /*品牌，os,cameta,sreenSize查询*/
    public static DataTable queryByKeyword(string keyword, int type)
    {
        int key = 0; double k;
        shopinfo_phoneinfo_query_view1TableAdapter adpter = new shopinfo_phoneinfo_query_view1TableAdapter();
        DataTable table = new DataTable();
        switch (type)
        {
            case 0:
            case 1: table = adpter.GetDataByphonebrand("%" + keyword + "%"); break;
            case 2: table = adpter.GetDataByphoneos("%" + keyword + "%"); break;
            case 3: table = adpter.GetDataBycolor("%" + keyword + "%"); break;
            case 4: table = adpter.GetDataByscreensize("%" + keyword + "%"); break;
        }
        return table;
    }
    /*函数重载，价格区间查询*/
    public static DataTable queryByKeyword(int low,int high)
    {
        shopinfo_phoneinfo_query_view1TableAdapter adpter = new shopinfo_phoneinfo_query_view1TableAdapter();
        DataTable table = new DataTable();
        table = adpter.GetDataByprice(high ,low);
        return table;
    }
    /*函数重载，模糊查询*/
    public static DataTable queryByKeyword(string keyword)
    {
        keyword = "%" + keyword + "%";
        keyword = SubString(keyword);
        shopinfo_phoneinfo_query_view1TableAdapter adpter = new shopinfo_phoneinfo_query_view1TableAdapter();
        DataTable table = new DataTable();
        table = adpter.GetDataByAll(keyword);
        return table;
    }
}
