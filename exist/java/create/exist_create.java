// --------------------------------------------------------------
/*
	create/exist_create.java

				Nov/05/2013

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class exist_create {
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println("*** 開始 *** exist_create ***");

	final String uri = "http://localhost:8086/exist/rest/db";

	String collections = "cities";
	String xml_file = "cities.xml";

	String uri_aa = uri + "/" + collections + "/" + xml_file;

	HashMap <String, HashMap <String,String>> dict_aa
		= data_prepare_proc ();

	String xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	try
	{
	get_uri.rest_put_proc (uri_aa,xml_str,"text/xml");
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	System.out.println("***** 終了 *****");
}
 
// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>> data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4251","長崎",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4252","佐世保",49152,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4253","島原",69153,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4254","大村",85124,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4255","諫早",72831,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4256","五島",28519,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4257","平戸",36957,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4258","雲仙",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4259","松浦",16875,"2008-10-24");

	return	dict_aa;
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
