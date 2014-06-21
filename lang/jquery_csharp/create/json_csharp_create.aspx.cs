// ----------------------------------------------------------------
//	json_csharp_create.aspx.cs
//
//						Aug/02/2011
// ----------------------------------------------------------------
using System;
using System.IO;
using	System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class json_csharp_create : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/html";

	string  file_out = @"/var/tmp/json/cities.json";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	text_manipulate.dict_display_proc (dict_aa);

	string str_json = JsonConvert.SerializeObject (dict_aa);

	file_io.file_write_proc (file_out,str_json);

	Response.Write ("*** OK ***<p />");

}
// ----------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0921","宇都宮",34500,"2009-6-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0922","小山",59200,"2009-5-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0923","佐野",26900,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0924","足利",25700,"2009-12-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0925","日光",47600,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0926","下野",28500,"2009-1-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0927","さくら",57600,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0928","矢板",54200,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0929","真岡",52300,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0930","栃木",14300,"2009-1-14");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0931","大田原",59300,"2009-8-9");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0932","鹿沼",57800,"2009-12-15");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0933","那須塩原",57100,"2009-12-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0934","那須烏山",51400,"2009-2-24");

	return	dict_aa;
}


// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
