// -------------------------------------------------------------- 
//
//	java_common/cassandra_manipulate.java
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.util.HashMap;
import	java.util.Set;

import	java.sql.Connection;
import	java.sql.Statement;
import	java.sql.ResultSet;
import	java.sql.SQLException;

import	java.sql.DriverManager;

// -------------------------------------------------------------- 
public class cassandra_manipulate
{
// -------------------------------------------------------------- 
static HashMap <String,HashMap<String,String>> cassandra_to_dict_proc
	(Connection conn) throws Exception
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	String sql_str="select key,name,population,date_mod from cities;";
	System.out.println (sql_str);
	Statement st = conn.createStatement();
	ResultSet rset = st.executeQuery (sql_str);

	while (rset.next())
		{
		String key = rset.getString (1);
		String name = rset.getString (2);
		int population = Integer.parseInt (rset.getString (3));
		String date_mod = rset.getString (4);

		dict_aa = text_manipulate.dict_append_proc
			(dict_aa,key,name,population,date_mod);
		}

	rset.close();

	st.close();

	return	dict_aa;
}

// -------------------------------------------------------------- 
static void dict_to_cassandra_proc
	(HashMap <String, HashMap <String,String>>dict_aa,Connection conn)
	throws Exception
{
	String sql_str="drop table cities;";
	System.out.println (sql_str);
	Statement st = conn.createStatement();
	st.execute (sql_str);

	sql_str="create table cities (key varchar primary key,name text,population int,date_mod timestamp);";
	st.execute (sql_str);

	Set set_aaa = dict_aa.keySet ();

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		HashMap <String,String> dict_unit = dict_aa.get (key_aa);
		String name = dict_unit.get ("name");
		String population = dict_unit.get ("population");
		String date_mod = dict_unit.get ("date_mod");

		Object ppx = dict_unit.get ("population");

		String out_str = String.format
			("('%s','%s',%s,'%s');",key,name,population,date_mod);

//		System.out.println (out_str);

	sql_str="insert into cities (key,name,population,date_mod) values "
		+ out_str;

//		System.out.println (sql_str);
		st.execute (sql_str);
		};

	st.close();
}

// -------------------------------------------------------------- 
static void cassandra_update_proc
	(Connection conn,String key,int population_in) throws Exception
{
	String	str_ddx = text_manipulate.get_current_date_proc ();

	String sql_str="update cities set population =" + population_in;
	sql_str += ", date_mod = '" + str_ddx + "'";
	sql_str += " where key = '" + key + "';";
	System.out.println (sql_str);
	Statement st = conn.createStatement();
	st.execute (sql_str);

	st.close();
}

// -------------------------------------------------------------- 
static void cassandra_delete_proc
	(Connection conn,String key_in)
	throws Exception
{
	String sql_str="delete from cities where key = '" + key_in + "';";
	System.out.println (sql_str);
	Statement st = conn.createStatement();
	st.execute (sql_str);

	st.close();
}
// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
