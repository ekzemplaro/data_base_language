// --------------------------------------------------------------
/*
	xml_file/java/delete/xml_delete.java

				Jun/13/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class xml_delete {
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println("*** 開始 ***");
	String xml_file = args[0];

	String	id = args[1];
	System.out.println ("\tid = " + id);

	String str_xml = "";
	try
	{
	str_xml = file_io.file_to_str_proc (xml_file);
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_delete_proc (dict_aa,id);

	String xml_str_new = xml_manipulate.dict_to_xml_proc (dict_aa);

	file_io.file_write_proc (xml_file,xml_str_new);

	System.out.println("***** 終了 *****");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
