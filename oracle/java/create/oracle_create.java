// --------------------------------------------------------------------
/*
	oracle_create.java

					Aug/05/2015

*/
// --------------------------------------------------------------------
import	java.sql.Connection;
import	java.sql.DriverManager;
import	java.sql.Statement;

import	java.util.HashMap;
// --------------------------------------------------------------------
public class oracle_create
{

// --------------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	String host = "host_oracle";
	String user = "scott";
	String password = "tiger";

	String str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe";

	try {
		Connection conn =
		DriverManager.getConnection (str_connect,user,password);

		Statement stmt = conn.createStatement ();
		rdb_common.drop_table_proc (stmt);
		rdb_common.create_table_proc (stmt);

		oracle_manipulate.dict_to_oracle_proc (dict_aa,stmt);

		stmt.close ();
		conn.close ();
	}
	catch (Exception ee)
	{
	ee.printStackTrace();
	}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0131","函館",51976,"2008-3-5");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0132","札幌",73249,"2008-9-13");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0133","帯広",98753,"2008-4-2");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0134","釧路",87124,"2008-2-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0135","旭川",72531,"2008-8-27");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0136","北見",28539,"2008-7-8");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0137","室蘭",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0138","根室",47365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0139","稚内",56874,"2008-10-24");

	return	dict_aa;
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
