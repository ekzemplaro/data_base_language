// ----------------------------------------------------------------
//	xml_csharp_read.aspx.cs
//
//
//					Sep/18/2010
//
// ----------------------------------------------------------------
using System;

using	System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class xml_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	string  xml_file = @"/var/tmp/xml_file/cities.xml";

	string str_xml = file_io.file_to_str_proc (xml_file);

	Dictionary <string,Object> dict_aa =xml_manipulate.xml_to_dict_proc (str_xml);

	string json_str = JsonConvert.SerializeObject (dict_aa);

	Response.Write (json_str);
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
