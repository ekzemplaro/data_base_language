// ---------------------------------------------------------------------
/*
	java/create/mysql_create.java

					Sep/13/2013

*/
// ---------------------------------------------------------------------
import	java.util.HashMap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

// ---------------------------------------------------------------------
public class mysql_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>> dict_aa
			= data_prepare_proc ();
	try
	{
	String url="jdbc:mysql://host_mysql/city";
	Connection conn = DriverManager.getConnection (url,"scott","tiger");

	Statement ss = conn.createStatement ();

	rdb_common.drop_table_proc (ss);
	rdb_common.create_table_proc (ss);

	rdb_common.display_proc (conn);

	rdb_common.dict_to_db_proc (dict_aa,ss);

	ss.close ();

	conn.close();
	}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}


	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3321","岡山",91476,"2008-10-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3322","倉敷",72849,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3323","津山",98253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3324","玉野",87624,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3325","笠岡",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3326","井原",28539,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3327","総社",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3328","高梁",47365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3329","新見",56874,"2008-10-24");

	return	dict_aa;
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
