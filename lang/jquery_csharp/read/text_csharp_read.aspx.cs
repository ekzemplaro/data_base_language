// ----------------------------------------------------------------
//	text_csharp_read.aspx.cs
//
//
//					Sep/18/2011
//
// ----------------------------------------------------------------
using System;
using	System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class text_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{

	Response.ContentType = "text/json";

	string  file_in = @"/var/tmp/plain_text/cities.txt";

	Dictionary <string,Object> dict_aa
		= text_manipulate.text_read_proc (file_in);

	string str_json_out = JsonConvert.SerializeObject (dict_aa);

	Response.Write (str_json_out);
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
