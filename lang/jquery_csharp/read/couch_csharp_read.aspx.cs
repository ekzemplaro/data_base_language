// ----------------------------------------------------------------
//	couch_csharp_read.aspx.cs
//
//
//					Apr/09/2010
//
// ----------------------------------------------------------------
using System;
using System.IO;

// ----------------------------------------------------------------
public class couch_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{

	Response.ContentType = "text/json";

	string url = "http://host_dbase:5984/city/cities";

	string str_json = get_uri.get_uri_proc (url,"","");

	Response.Write (str_json);

}
// ----------------------------------------------------------------

}
// ----------------------------------------------------------------
