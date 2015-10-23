// ----------------------------------------------------------------
//	dbxml_csharp_read.aspx.cs
//
//
//					Apr/07/2010
//
// ----------------------------------------------------------------
using System;
using System.IO;
using System.Data;

// ----------------------------------------------------------------
public class dbxml_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{

	Response.ContentType = "text/json";

	string url = "http://cpt003:7280/rest/cities/cities.xml";

	string user = "scott";
	string password = "tiger";
	string str_xml = get_uri.get_uri_proc (url,user,password);

	DataTable dtable = table_manipulate.xmlstr_to_table_proc (str_xml);

	string str_json = table_manipulate.table_json_str_proc (dtable);

	Response.Write (str_json);

}

// ---------------------------------------------------------------------
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
