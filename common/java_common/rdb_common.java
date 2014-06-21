// ----------------------------------------------------------------------
/*
	java_common/rdb_common.java

					Sep/13/2013

*/
// ----------------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

// ----------------------------------------------------------------------
public class rdb_common
{

// ----------------------------------------------------------------------
static void display_proc (Connection conn)
{
	try
		{
	Statement stmt = conn.createStatement ();

	ResultSet rset = stmt.executeQuery (
	"SELECT ID, NAME, POPULATION, DATE_MOD FROM cities order by ID");

	while (rset.next())
		{
		String out_str = rset.getString (1) + "\t";
		out_str += rset.getString(2) + "\t";
		out_str += rset.getString(3) + "\t";
		out_str += rset.getString(4);

		System.out.println (out_str);
		}

	rset.close();
	stmt.close();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}
}

// ----------------------------------------------------------------------
/* [4]: */
static void update_proc (Connection conn,String id_in,int population)
{
	try
		{
		Statement stmt = conn.createStatement ();

		String str_sql;
		int result;

		str_sql = update_sql_gen_proc (id_in,population);
//	System.out.println ("before execute str_sql = " + str_sql);

		result = stmt.executeUpdate (str_sql);
//		System.out.println ("result = " + result);

		stmt.close ();
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}
}

// ----------------------------------------------------------------------
/* [4-4]: */
static String update_sql_gen_proc (String id_in,int population)
{
	String	str_ddx = text_manipulate.get_current_date_proc ();

	String str_sql = "update cities set POPULATION=" + population
		+ ",DATE_MOD='" + str_ddx +  "'  where ID= '" + id_in + "'";

	System.out.println ("str_sql = " + str_sql);

	return	str_sql;
}

// ----------------------------------------------------------------------
/* [6]: */
static void delete_proc (Connection conn,String id_in)
{
	try
		{
		Statement stmt = conn.createStatement ();

		String str_sql;
		int result;

	str_sql = "delete from  cities where ID= '" + id_in + "'";

		result = stmt.executeUpdate (str_sql);
//		System.out.println ("result = " + result);

		stmt.close ();
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}
}

// ----------------------------------------------------------------------
static void create_table_proc (Statement ss)
	throws SQLException
{
	String sql_command = "create table cities (id varchar(10), name varchar(20),"
		+ " population int, date_mod date)";
	ss.execute (sql_command);
}

// ----------------------------------------------------------------------
static void drop_table_proc (Statement ss)
	throws SQLException
{
	ss.execute ("drop table cities");
}

// ----------------------------------------------------------------------
static void insert_record_proc
	(Statement ss,String id,String name,int population,String date_mod)
	throws SQLException
{
	String str_ins
		= "insert into cities (id,name,population,date_mod) values (";

	String str_data = "'" + id + "','" + name + "',"
		+ Integer.toString (population) + ",'" + date_mod + "')";

	String sql_str = str_ins + str_data;

//	System.out.println ("sql_str = " + sql_str);

	ss.execute (sql_str);
}

// ----------------------------------------------------------------------
static void dict_to_db_proc (HashMap <String, HashMap<String,String>> dict_aa,
	Statement ss) throws SQLException
{
	Set set_aaa = dict_aa.keySet ();

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		HashMap <String,String> dict_unit = dict_aa.get (key);
		String name = dict_unit.get ("name");
		String str_population = dict_unit.get ("population");
		int population = Integer.parseInt (str_population);
		String date_mod = dict_unit.get ("date_mod");
	rdb_common.insert_record_proc (ss,key,name,population,date_mod);
		}
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
