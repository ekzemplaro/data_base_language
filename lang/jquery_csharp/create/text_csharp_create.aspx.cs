// ----------------------------------------------------------------
//	text_csharp_create.aspx.cs
//
//
//					Aug/01/2011
//
// ----------------------------------------------------------------
using System;
using System.IO;
using	System.Collections.Generic;

// ----------------------------------------------------------------
public class text_csharp_create : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/html";

	string  file_out = @"/var/tmp/plain_text/cities.txt";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	text_manipulate.dict_display_proc (dict_aa);

	text_manipulate.text_write_proc (file_out,dict_aa);

	Response.Write ("*** OK ***<p />");

}

// ----------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2381","名古屋",74100,"2009-1-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2382","豊橋",68700,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2383","岡崎",49200,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2384","一宮",72900,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2385","蒲郡",87300,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2386","常滑",75600,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2387","大府",78600,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2388","瀬戸",53700,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2389","犬山",71300,"2009-10-12");

	return	dict_aa;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
