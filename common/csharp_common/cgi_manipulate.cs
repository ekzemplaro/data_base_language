// ----------------------------------------------------------------
//	cgi_manipulate.cs
//
//
//					May/23/2013
//
// ----------------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;

using	Newtonsoft.Json;
// ----------------------------------------------------------------
public class cgi_manipulate : System.Web.UI.Page
// public class cgi_manipulate
{

// ----------------------------------------------------------------
// public static String[] request_delete_parser_proc (Object Response)
public String[] request_delete_parser_proc ()
{
	Response.Write ("request_parser_proc *** AM 08:12<br />");

	foreach (string ss in Request.Form)
		{
		Response.Write ("Form : " + ss + " ");
		string pp = Request.Form.Get (ss).ToString ();
		Response.Write ("Form.Get : " + pp + " ");
		}

	string str_json = Request.Form.Get ("my_data").ToString ();

	Response.Write ("str_json : " + str_json + "<br />");

	String []array_aa = JsonConvert.DeserializeObject <String []> (str_json);
	Response.Write ("Length : " + array_aa.Length + "<br />");

	return	array_aa;
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
