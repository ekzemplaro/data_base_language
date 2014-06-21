// --------------------------------------------------------------
/*
	couch/java/create/couch_create.java

					Sep/12/2013

*/
// --------------------------------------------------------------
import java.util.HashMap;

// --------------------------------------------------------------
public class couch_create
{

// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	text_manipulate.dict_display_proc (dict_aa);

	final String uri_collection = "http://cddn007:5984/city";
	final String uri_target = uri_collection + "/cities";

	System.out.println("*** check bbb ***");

	couch_manipulate.data_delete_proc (uri_collection,"cities");

	System.out.println("*** check ccc ***");

	String str_json = json_manipulate.dict_to_json_proc (dict_aa);

	System.out.println("*** check ppp ***");

	get_uri.rest_put_proc (uri_target,str_json,"text/json");

	System.out.println("*** 終了 ***");
}
 
// --------------------------------------------------------------
static HashMap <String, HashMap<String,String>> data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2021","長野",91426,"2008-2-18");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2022","松本",35713,"2008-8-24");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2023","上田",49287,"2008-4-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2024","小諸",19256,"2008-3-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2025","岡谷",67392,"2008-5-25");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2026","塩尻",85647,"2008-9-9");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2027","茅野",67219,"2008-12-11");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2028","飯田",63981,"2008-5-27");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2029","中野",21548,"2008-1-5");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2030","諏訪",53297,"2008-7-4");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2031","駒ヶ根",39658,"2008-9-27");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2032","佐久",14256,"2008-10-24");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2033","伊那",31547,"2008-12-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2034","千曲",47251,"2008-11-29");

	return	dict_aa;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
