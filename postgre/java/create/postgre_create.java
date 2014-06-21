// ---------------------------------------------------------------------
/*
	java/create/postgre_create.java

					Sep/13/2013

*/
// ---------------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

// ---------------------------------------------------------------------
public class postgre_create
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
	Connection conn =
        DriverManager.getConnection
		("jdbc:postgresql://localhost/city","scott","tiger");

	Statement ss = conn.createStatement ();

rdb_common.drop_table_proc (ss);
rdb_common.create_table_proc (ss);

	rdb_common.dict_to_db_proc (dict_aa,ss);

	rdb_common.display_proc (conn);

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
static HashMap <String, HashMap <String,String>> data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3461","広島",27639,"2008-7-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3462","福山",63841,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3463","東広島",98253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3464","呉",87624,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3465","尾道",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3466","竹原",28539,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3467","三次",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3468","大竹",47365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3469","府中",87421,"2008-10-24");

	return	dict_aa;
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

