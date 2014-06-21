// ----------------------------------------------------------------
//	redis_csharp_read.aspx.cs
//
//
//					Aug/02/2011
//
// ----------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class redis_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	Redis rd = new Redis ("host_dbase",6379);

	Dictionary <string,Object> dict_aa
		= redis_manipulate.redis_to_dict_proc (rd);

	string json_str = JsonConvert.SerializeObject (dict_aa);

	Response.Write (json_str);
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
