// ----------------------------------------------------------------
//	xml_csharp_delete.aspx.cs
//
//
//					May/24/2013
//
// ----------------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;

using	Newtonsoft.Json;
// ----------------------------------------------------------------
public class xml_csharp_delete : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";

	Response.Write ("xml_csharp_delete.aspx.cs");

	string	xml_file = "/var/tmp/xml_file/cities.xml";

	string str_xml = file_io.file_to_str_proc (xml_file);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);


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

	Response.Write ("May/23/2013");


	string xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	file_io.file_write_proc (xml_file,xml_str);

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
