// ----------------------------------------------------------------
//	webdav_csharp_create.aspx.cs
//
//
//					Oct/03/2013
//
// ----------------------------------------------------------------
using System;
using System.IO;
using System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class webdav_csharp_create : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs ee)
{
	Response.ContentType = "text/html";

	string uri_collection  = "http://host_dbase:3004/city";
	string uri_target = uri_collection + "/tokyo.json";

	string user = "";
	string password = "";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string str_json = JsonConvert.SerializeObject (dict_aa);

	get_uri.put_uri_string_proc (uri_target,str_json,user,password);

	Response.Write ("*** OK ***<p />");
}

// ----------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1351","八王子",51800,"2009-3-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1352","立川",75400,"2009-4-29");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1353","武蔵野",62800,"2009-7-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1354","三鷹",59700,"2009-11-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1355","青梅",29600,"2009-10-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1356","府中",95700,"2009-5-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1357","昭島",68400,"2009-9-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1358","調布",56200,"2009-8-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1359","町田",25100,"2009-2-12");


	return	dict_aa;
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
