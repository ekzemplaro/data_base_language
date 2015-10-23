// ----------------------------------------------------------------
//	webdav_csharp_delete.aspx.cs
//
//
//					Oct/03/2013
//
// ----------------------------------------------------------------
using	System;
using	System.IO;
using	System.Net;
using	System.Web;
using	System.Collections.Generic;

using	Newtonsoft.Json;
// ----------------------------------------------------------------
public class webdav_csharp_delete : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";

	Response.Write ("webdav_csharp_delete.aspx.cs");

	string url_aa = "http://host_dbase:3004/city/tokyo.json";

	string user = "";
	string password = "";

	string str_json = get_uri.get_uri_proc (url_aa,user,password);


	Dictionary <string,Object> dict_bb
		= JsonConvert.DeserializeObject
			<Dictionary <string,Object>> (str_json);


	Response.Write ("*** pppp ***<p />");


string str_json_bb = JsonConvert.SerializeObject (dict_bb);
	Response.Write ("*** qqqq ***<p />");

	Response.Write (str_json_bb);

	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json_bb);

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

	get_uri.put_uri_string_proc (url_aa,str_json_out,user,password);

	Response.Write ("*** Oct/03/2013 *** PM 14:00 ");

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
