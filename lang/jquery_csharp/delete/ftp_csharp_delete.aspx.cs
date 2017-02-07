// ----------------------------------------------------------------
//	ftp_csharp_delete.aspx.cs
//
//
//					Nov/12/2013
//
// ----------------------------------------------------------------
using	System;
using	System.IO;
using	System.Net;
using	System.Web;
using	System.Collections.Generic;

using	Newtonsoft.Json;
// ----------------------------------------------------------------
public class ftp_csharp_delete : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";

	string url = "ftp://host_dbase/city/iwate.json";

	string user = "scott";
	string passwd = "tiger";

	string str_json = ftp_manipulate.ftp_to_str_proc (url,user,passwd);

	Dictionary <string,Object> dict_aa
		= JsonConvert.DeserializeObject
			<Dictionary <string,Object>> (str_json);


	Response.Write ("*** rrrr ***<p />");

	String[] array_aa = request_delete_parser_proc ();

	for (int it=0; it< array_aa.Length; it++)
                {
		String key_in = array_aa[it];
		Response.Write (key_in + "<br />");

		if (dict_aa.ContainsKey (key_in))
			{
			dict_aa.Remove (key_in);
			}
		}

	string str_json_out = JsonConvert.SerializeObject (dict_aa);

	ftp_manipulate.str_to_ftp_proc (url,user,passwd,str_json_out);


	Response.Write ("OK");
}

// ----------------------------------------------------------------
String[] request_delete_parser_proc ()
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
