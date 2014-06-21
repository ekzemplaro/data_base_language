// ---------------------------------------------------------------------- 
//
//	cassandra_create.java
//
//					Sep/05/2013
//
// ---------------------------------------------------------------------- 
import	java.util.HashMap;

import	java.sql.Connection;

import	java.sql.DriverManager;
// ---------------------------------------------------------------------- 
public class cassandra_create {
 
// ---------------------------------------------------------------------- 
public static final void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();


	String str_connect = "jdbc:cassandra://localhost:9160/city";

	Connection conn = DriverManager.getConnection (str_connect);

	cassandra_manipulate.dict_to_cassandra_proc (dict_aa,conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}
 
// ---------------------------------------------------------------------- 
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0531","秋田",27639,"2008-7-21");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0532","男鹿",73842,"2008-3-8");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0533","由利本荘",96253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0534","横手",87524,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0535","鹿角",72931,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0536","大館",28134,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0537","能代",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0538","にかほ",41365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0539","湯沢",56814,"2008-10-24");

	return	dict_aa;
}

// ---------------------------------------------------------------------- 
}
// ---------------------------------------------------------------------- 
