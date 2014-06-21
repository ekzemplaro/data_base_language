// ----------------------------------------------------------------
//	couch_csharp_create.aspx.cs
//
//
//					Aug/02/2011
//
// ----------------------------------------------------------------
using System;
using System.IO;
using System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class couch_csharp_create : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs ee)
{
	Response.ContentType = "text/html";

	string uri_collection  = "http://host_dbase:5984/city";
	string uri_target = uri_collection + "/cities";

	string user = "";
	string password = "";

	couch_manipulate.data_delete_proc (uri_collection,user,password);

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

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2021","長野",34500,"2009-6-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2022","松本",17900,"2009-5-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2023","上田",26700,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2024","小諸",25100,"2009-12-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2025","岡谷",24900,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2026","塩尻",28700,"2009-1-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2027","茅野",56100,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2028","飯田",54600,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2029","中野",54800,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2030","諏訪",51700,"2009-1-14");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2031","駒ヶ根",59300,"2009-8-9");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2032","佐久",58600,"2009-12-15");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2033","伊那",57200,"2009-12-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2034","千曲",51400,"2009-2-24");

	return	dict_aa;
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
