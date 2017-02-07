// --------------------------------------------------------------
/*
	create/basex_create.java

				Oct/29/2013

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class basex_create {
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	final String uri = "http://admin:admin@localhost:8984/rest/cities";


	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	String xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	System.out.println (xml_str);
	try
	{
	get_uri.rest_put_proc (uri,xml_str,"text/xml");
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
		(dict_aa,"t4161","佐賀",51876,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4162","唐津",49342,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4163","鳥栖",92153,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4164","多久",87324,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4165","伊万里",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4166","武雄",28149,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4167","鹿島",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4168","小城",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4169","嬉野",56812,"2008-10-24");

	return	dict_aa;
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
