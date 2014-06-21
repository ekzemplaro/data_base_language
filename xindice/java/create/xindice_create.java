// --------------------------------------------------------------
/*
	create/xindice_create.java

				Jun/13/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class xindice_create {
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	final String uri = "http://@host_dbase:8888/xindice/db";

	String collections = "cities";
	String name_in = "cities";

	String uri_aa = uri + "/" + collections + "/" + name_in;

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

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
		(dict_aa,"t0271","青森",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0272","弘前",49642,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0273","八戸",92853,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0274","三沢",87124,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0275","黒石",72131,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0276","むつ",28529,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0277","五所川原",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0278","十和田",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0279","平川",56872,"2008-10-24");

	return	dict_aa;
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
