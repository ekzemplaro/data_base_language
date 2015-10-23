// ----------------------------------------------------------------
//	ftp_csharp_create.aspx.cs
//
//
//					ftp/12/2013
//
// ----------------------------------------------------------------
using System;
using System.IO;
using System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class ftp_csharp_create : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs ee)
{
	Response.ContentType = "text/html";

	string url_in = "ftp://host_dbase/city/iwate.json";

	string user = "scott";
	string passwd = "tiger";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string str_json = JsonConvert.SerializeObject (dict_aa);

	ftp_manipulate.str_to_ftp_proc (url_in,user,passwd,str_json);

	Response.Write ("*** OK ***<p />");
}

// ----------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0361","盛岡",51200,"2009-7-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0362","久慈",75400,"2009-8-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0363","二戸",28400,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0364","宮古",29700,"2009-12-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0365","遠野",97300,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0366","八幡平",89500,"2009-1-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0367","大船渡",56100,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0368","一関",63200,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0369","花巻",95100,"2009-2-12");


	return	dict_aa;
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
