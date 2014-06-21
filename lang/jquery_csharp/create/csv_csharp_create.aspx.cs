// ----------------------------------------------------------------
//	csv_csharp_create.aspx.cs
//
//
//					Sep/18/2011
//
// ----------------------------------------------------------------
using System;
using System.IO;
using	System.Collections.Generic;

// ----------------------------------------------------------------
public class csv_csharp_create : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/html";

	string  file_out = @"/var/tmp/csv/cities.csv";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	text_manipulate.csv_write_proc (file_out,dict_aa);

	Response.Write ("*** OK ***<p />");

}

// ----------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1271","千葉",15600,"2009-10-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1272","勝浦",87900,"2009-6-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1273","市原",25600,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1274","流山",72900,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1275","八千代",87300,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1276","我孫子",75600,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1277","鴨川",78600,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1278","銚子",53700,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1279","市川",71300,"2009-10-12");

	return	dict_aa;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
