// ----------------------------------------------------------------
//	json_csharp_read.aspx.cs
//
//					Sep/18/2011
// ----------------------------------------------------------------
using System;

// ----------------------------------------------------------------
public class json_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	string  file_in = @"/var/tmp/json/cities.json";

	string	str_json = file_io.file_to_str_proc (file_in);

	Response.Write (str_json);
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
