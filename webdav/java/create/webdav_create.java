// --------------------------------------------------------------
/*
	webdav_create.java
					Sep/12/2013

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class webdav_create
{
// --------------------------------------------------------------
public static void main(String[] arg) throws Exception
{
	System.out.println ("*** 開始 ***");

	final String uri_target= "http://cddn007:3004/city/tokyo.json";

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	String str_json = json_manipulate.dict_to_json_proc (dict_aa);

	get_uri.rest_put_proc (uri_target,str_json,"text/json");


	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1351","八王子",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1352","立川",49712,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1353","武蔵野",96853,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1354","三鷹",89524,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1355","青梅",72931,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1356","府中",28529,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1357","昭島",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1358","調布",47369,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1359","町田",36875,"2008-10-24");

	return	dict_aa;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
