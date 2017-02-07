// ---------------------------------------------------------------------
/*
	java/create/maria_create.java

					Sep/05/2016

*/
// ---------------------------------------------------------------------
import	java.util.HashMap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

// ---------------------------------------------------------------------
public class maria_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException,
	InstantiationException, IllegalAccessException
{
	System.err.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>> dict_aa
			= data_prepare_proc ();
	try
	{
	String url="jdbc:mysql://localhost/city";
	Connection conn = DriverManager.getConnection (url,"scott","tiger");

	Statement ss = conn.createStatement ();

	rdb_common.drop_table_proc (ss);
	rdb_common.create_table_proc (ss);

	rdb_common.dict_to_db_proc (dict_aa,ss);

	ss.close ();

	conn.close();
	}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}

	System.err.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3321","岡山",951476,"2008-5-18");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3322","倉敷",712849,"2008-9-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3323","津山",259413,"2008-3-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3324","玉野",762814,"2008-2-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3325","笠岡",253791,"2008-1-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3326","井原",852639,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3327","総社",945317,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3328","高梁",736415,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3329","新見",617924,"2008-10-24");

	return	dict_aa;
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
