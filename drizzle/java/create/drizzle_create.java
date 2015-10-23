// ---------------------------------------------------------------------
/*
	java/create/drizzle_create.java

					Jul/15/2014

*/
// ---------------------------------------------------------------------
import	java.util.HashMap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

// ---------------------------------------------------------------------
public class drizzle_create
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
//	String url="jdbc:drizzle://localhost:4427/city";
	String url="jdbc:drizzle://host_ubuntu1:4427/city";
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
		(dict_aa,"t2651","京都",13476,"2008-5-18");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2652","福知山",28349,"2008-8-7");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2653","舞鶴",25173,"2008-9-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2654","綾部",87624,"2008-2-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2655","宇治",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2656","宮津",28539,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2657","亀岡",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2658","城陽",47365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2659","向日",56874,"2008-10-24");

	return	dict_aa;
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
