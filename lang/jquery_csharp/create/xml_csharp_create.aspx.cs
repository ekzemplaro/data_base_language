// ----------------------------------------------------------------
//	xml_csharp_create.aspx.cs
//
//						Sep/18/2011
// ----------------------------------------------------------------
using System;
using	System.Collections.Generic;

// ----------------------------------------------------------------
public class xml_csharp_create : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/html";

	string  xml_out = @"/var/tmp/xml_file/cities.xml";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	file_io.file_write_proc (xml_out,xml_str);

	Response.Write ("*** OK ***<p />");
}

// ----------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2261","静岡",74100,"2009-8-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2262","浜松",68700,"2009-7-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2263","沼津",49200,"2009-6-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2264","三島",72900,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2265","富士",87300,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2266","熱海",75600,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2267","富士宮",78600,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2268","藤枝",53700,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2269","御殿場",71300,"2009-10-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2270","島田",45200,"2009-9-24");

	return	dict_aa;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
