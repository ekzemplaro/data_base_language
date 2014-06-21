// ----------------------------------------------------------------
//	text_csharp_delete.aspx.cs
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
public class text_csharp_delete : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/html";

	Response.Write ("text_csharp_delete.aspx.cs<br />");

	string	file_txt = @"/var/tmp/plain_text/cities.txt";

	Dictionary <string,Object> dict_aa
		= text_manipulate.text_read_proc (file_txt);

//	String[] array_aa = cgi_manipulate.request_delete_parser_proc ();
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

	Response.Write ("May/23/2013 AM 08:12<br />");

	text_manipulate.text_write_proc (file_txt,dict_aa);

	Response.Write ("OK<br />");
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
