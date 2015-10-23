// --------------------------------------------------------------
/*
	delete/xindice_delete.java

				Jul/02/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class xindice_delete {
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

	final String uri = "http://cdbd026:8888/xindice/db";

	String collections = "cities";
	String name_in = "cities";

	String uri_aa = uri + "/" + collections + "/" + name_in;

	String str_xml = "";
	try
	{
	str_xml = get_uri.get_uri_proc (uri_aa);
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_delete_proc (dict_aa,id);

	String str_out_aa = xml_manipulate.dict_to_xml_proc (dict_aa);

	try
	{
	get_uri.rest_put_proc (uri_aa,str_out_aa,"text/xml");
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	System.out.println ("***** 終了 *****");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
