// --------------------------------------------------------------
/*
	xml_file/java/create/xml_create.java

				May/16/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class xml_create {
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String xml_file = args[0];

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	String xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	file_io.file_write_proc (xml_file,xml_str);
	
	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2261","静岡",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2262","浜松",49742,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2263","沼津",96853,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2264","三島",81324,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2265","富士",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2266","熱海",28429,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2267","富士宮",39157,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2268","藤枝",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2269","御殿場",56872,"2008-10-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2270","島田",87236,"2008-12-9");

	return	dict_aa;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
