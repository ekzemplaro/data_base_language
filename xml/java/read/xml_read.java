// --------------------------------------------------------------
/*
	xml_file/java/xml_read.java

				May/16/2011

*/
// --------------------------------------------------------------
import java.io.FileInputStream;
import	java.util.HashMap;
// --------------------------------------------------------------
public class xml_read {
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String xml_file = args[0];

	String str_xml = file_io.file_to_str_proc (xml_file);

	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 **");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
