// ----------------------------------------------------------------
//	webdav_csharp_read.aspx.cs
//
//
//					Oct/03/2013
//
// ----------------------------------------------------------------
using System;
using System.IO;

// ----------------------------------------------------------------
public class webdav_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{

	Response.ContentType = "text/json";

	string url = "http://host_dbase:3004/city/tokyo.json";

	string str_json = get_uri.get_uri_proc (url,"","");

	Response.Write (str_json);

}
// ----------------------------------------------------------------

}
// ----------------------------------------------------------------
