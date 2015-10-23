// --------------------------------------------------------------
/*
	xml_file/java/update/xml_update.java

				May/26/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class xml_update {
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println("*** 開始 *** xml_update ***");
	String xml_file = args[0];

	String	id = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

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

	text_manipulate.dict_update_proc (dict_aa,id,population);

	String xml_str_new = xml_manipulate.dict_to_xml_proc (dict_aa);

	file_io.file_write_proc (xml_file,xml_str_new);


	System.out.println("***** 終了 *****");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
