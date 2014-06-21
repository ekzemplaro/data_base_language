// --------------------------------------------------------------
/*
	ftp_create.java
					Jan/26/2012

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class ftp_create
{
// --------------------------------------------------------------
public static void main(String[] arg) throws Exception
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	String json_str = json_manipulate.dict_to_json_proc (dict_aa);

	String hostname = "host_dbase";
	String user = "scott";
	String passwd = "tiger";
	String file_path = "city/iwate.json";

	ftp_manipulate.ftp_put_proc (hostname,user,passwd,file_path,json_str);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0361","盛岡",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0362","久慈",49742,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0363","二戸",96853,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0364","宮古",89524,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0365","遠野",72931,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0366","八幡平",28529,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0367","大船渡",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0368","一関",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0369","花巻",56872,"2008-10-24");

	return	dict_aa;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
