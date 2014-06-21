// ---------------------------------------------------------------------
//	exist_csharp_read.aspx.cs
//
//
//					Jun/10/2010
//
// ---------------------------------------------------------------------
using System;
using System.IO;
using System.Data;

// ---------------------------------------------------------------------
public class exist_csharp_read : System.Web.UI.Page {

// ---------------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{

	Response.ContentType = "text/json";

//	string url = @"http://172.20.180.155:8086/exist/rest/cities/cities.xml";
	string url = @"http://cpt003:8086/exist/rest/cities/cities.xml";

	string user = "admin";
	string password = "hello9";
	string str_xml = get_uri.get_uri_proc (url,user,password);

	DataTable dtable = table_manipulate.xmlstr_to_table_proc (str_xml);

	string str_json = table_manipulate.table_json_str_proc (dtable);

	Response.Write (str_json);

}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
