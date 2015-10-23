// ---------------------------------------------------------------------
//	exist_csharp_read.aspx.cs
//
//
//					Sep/18/2011
//
// ---------------------------------------------------------------------
using System;
using System.Collections.Generic;

using Newtonsoft.Json;
// ---------------------------------------------------------------------
public class exist_csharp_read : System.Web.UI.Page {

// ---------------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	string url = @"http://cpt003:8086/exist/rest/cities/cities.xml";

	string user = "";
	string password = "";
	string str_xml = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);

	string json_str = JsonConvert.SerializeObject (dict_aa);

	Response.Write (json_str);

}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
