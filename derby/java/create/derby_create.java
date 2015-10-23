// ---------------------------------------------------------------------
/*
	derby/java/create/derby_create.java

					Nov/28/2014

*/
// ---------------------------------------------------------------------
import	java.util.HashMap;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

// ---------------------------------------------------------------------
public class derby_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>> dict_aa
			= data_prepare_proc ();

//	String driver = "org.apache.derby.jdbc.EmbeddedDriver";
	String driver = "org.apache.derby.jdbc.ClientDriver";

	String str_connect= "jdbc:derby://localhost:1527/city_aaa;create=true";

	Connection conn = DriverManager.getConnection (str_connect);

	System.out.println ("*** connected. ***");

	Statement ss = conn.createStatement ();

	rdb_common.drop_table_proc (ss);
	rdb_common.create_table_proc (ss);

	rdb_common.dict_to_db_proc (dict_aa,ss);

	rdb_common.display_proc (conn);

	ss.close ();

	conn.close();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3551","山口",47128,"2008-10-13");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3552","下関",84536,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3553","萩",53198,"2008-6-25");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3554","徳山",87124,"2008-9-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3555","岩国",72631,"2008-8-9");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3556","光",28539,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3557","宇部",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3558","長門",47365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3559","防府",56874,"2008-10-24");

	return	dict_aa;
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
