// --------------------------------------------------------------
/*
	update/xindice_update.java

				May/17/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class xindice_update {
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

//	final String uri = "http://host_xindice:8888/xindice/db";
	final String uri = "http://cdbd026:8888/xindice/db";

	String collections = "cities";
	String name_in = "cities";

	String uri_aa = uri + "/" + collections + "/" + name_in;

	String str_xml = "";
	try
	{
	System.out.println ("uri_aa = " + uri_aa);
	str_xml = get_uri.get_uri_proc (uri_aa);
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);


	text_manipulate.dict_update_proc (dict_aa,id,population);

	text_manipulate.dict_display_proc (dict_aa);

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
