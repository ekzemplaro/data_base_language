// ----------------------------------------------------------------
//	ftp_csharp_read.aspx.cs
//
//
//					Nov/12/2013
//
// ----------------------------------------------------------------
using System;
using System.IO;

// ----------------------------------------------------------------
public class ftp_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	string url_in = "ftp://host_dbase/city/iwate.json";
	string user = "scott";
	string passwd = "tiger";

	string str_json = ftp_manipulate.ftp_to_str_proc (url_in,user,passwd);

	Response.Write (str_json);
}

// ----------------------------------------------------------------

}
// ----------------------------------------------------------------
