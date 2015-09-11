// --------------------------------------------------------------------
/*
	oracle_manipulate.java

					Aug/05/2015

*/
// --------------------------------------------------------------------
import	java.sql.Connection;
/*
import	java.sql.DriverManager;
*/
import	java.sql.Statement;
import	java.sql.SQLException;

import	java.util.HashMap;
import	java.util.Set;
import	java.util.TreeSet;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.text.ParseException;
// --------------------------------------------------------------------
public class oracle_manipulate
{

// --------------------------------------------------------------------
static void dict_to_oracle_proc
	(HashMap <String, HashMap <String,String>> dict_aa,Statement stmt)
	throws SQLException,ParseException
{
	Set <String> set_aaa = dict_aa.keySet ();

	Set <String> ssx = new TreeSet <String> (set_aaa);

	HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

	String DATE_PATTERN ="dd-MMM-yyyy";

	for (Object key_aa:ssx)
		{
		String key = (String)key_aa;
		dict_unit = dict_aa.get (key_aa);
		String name = dict_unit.get ("name");
		String str_population = dict_unit.get ("population");
		int population = Integer.parseInt (str_population);
		String str_date = dict_unit.get ("date_mod");
		System.out.println (key + "\t" + str_date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date_aa = sdf.parse (str_date);
		String str_ee = new SimpleDateFormat(DATE_PATTERN,Locale.ENGLISH).format(date_aa);
	rdb_common.insert_record_proc (stmt,key,name,population,str_ee);
		}
}

// --------------------------------------------------------------------
static void oracle_update_proc (Connection conn,String id_in,int population)
{
	try
		{
		Statement stmt = conn.createStatement ();

		String str_sql;
		int result;

		str_sql = oracle_update_sql_gen_proc (id_in,population);

		result = stmt.executeUpdate (str_sql);

		stmt.close ();
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}
}

/* ---------------------------------------------------------------------- */
static String oracle_update_sql_gen_proc (String id_in,int population)
{
	Date ddx = new Date ();
	DateFormat dfm = new SimpleDateFormat ("dd-MMM-yyyy",Locale.ENGLISH);
	String	str_ddx = dfm.format (ddx);

	String str_sql = "update cities set POPULATION=" + population
		+ ",DATE_MOD='" + str_ddx +  "'  where ID= '" + id_in + "'";

	System.out.println ("str_sql = " + str_sql);

	return	str_sql;
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
