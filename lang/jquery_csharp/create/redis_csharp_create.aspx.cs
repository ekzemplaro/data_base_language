// ----------------------------------------------------------------
//	redis_csharp_create.aspx.cs
//
//
//					Nov/16/2010
//
// ----------------------------------------------------------------
using	System;
using	System.Collections;
using	System.Collections.Generic;

// using Newtonsoft.Json;
// ----------------------------------------------------------------
public class redis_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/html";

Response.Write ("*** aaaa ***<p />");
	Redis rd = new Redis ("host_dbase",6379);

Response.Write ("*** ffff ***<p />");
	redis_set_proc (rd,1851,"福井",43500,"2009-12-6");
/*
	redis_set_proc (rd,1852,"敦賀",61400,"2009-9-18");
	redis_set_proc (rd,1853,"小浜",71800,"2009-5-24");
	redis_set_proc (rd,1854,"大野",31500,"2009-6-9");
	redis_set_proc (rd,1855,"勝山",23100,"2009-8-14");
	redis_set_proc (rd,1856,"鯖江",46700,"2009-9-4");
	redis_set_proc (rd,1857,"あわら",92400,"2009-3-7");
	redis_set_proc (rd,1858,"越前",63600,"2009-8-15");
	redis_set_proc (rd,1859,"坂井",72600,"2009-2-7");
*/
	Response.Write ("*** OK ***<p />");
}

// ----------------------------------------------------------------
static void redis_set_proc
	(Redis rd,int id,String name,int population,String date_mod)
{
	String json_new = kvalue_manipulate.json_create_proc
		(name,population,date_mod);
	rd.Set (id.ToString (), json_new);
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
