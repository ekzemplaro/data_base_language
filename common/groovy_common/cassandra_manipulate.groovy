// -------------------------------------------------------------- 
//
//	groovy_common/cassandra_manipulate.groovy
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.util.HashMap
import	java.util.Set
import	java.text.DateFormat
import	java.text.SimpleDateFormat

import	java.sql.Connection
import	java.sql.Statement
import	java.sql.ResultSet
import	java.sql.SQLException

import	java.sql.DriverManager
import	text_manipulate
// -------------------------------------------------------------- 
class cassandra_manipulate
{
// -------------------------------------------------------------- 
static cassandra_to_dict_proc (conn)
{
	def dict_aa = new HashMap <String, HashMap<String,String>> ()

	def sql_str="select key,name,population,date_mod from cities;"
	System.out.println (sql_str)
	def st = conn.createStatement()
	def rset = st.executeQuery (sql_str)

	while (rset.next())
		{
		def key = rset.getString (1)
		def name = rset.getString (2)
		def population = Integer.parseInt (rset.getString (3))
		def date_mod = rset.getString (4)

		dict_aa = text_manipulate.dict_append_proc (dict_aa,key,name,population,date_mod)
		}

	rset.close()

	st.close()

	dict_aa
}

// -------------------------------------------------------------- 
static void dict_to_cassandra_proc (dict_aa,conn)
{
	def sql_str="drop table cities;"
	System.out.println (sql_str)
	def st = conn.createStatement()
	st.execute (sql_str)


	sql_str="create table cities (key varchar primary key,name text,population int,date_mod timestamp);"
	st.execute (sql_str)

	dict_aa.keySet().each { key ->
		println ("key = " + key)
		def dict_unit = dict_aa.get (key)
		def name = dict_unit.get ("name")
		def population = dict_unit.get ("population")
		def date_mod = dict_unit.get ("date_mod")

		def str_aa = "insert into cities (key,name,population,date_mod) values "
		def str_bb = String.format ("('%s','%s',%s,'%s');",key,name,population,date_mod)

		sql_str = str_aa + str_bb

		st.execute (sql_str)
		}

	st.close()
}

// -------------------------------------------------------------- 
static void cassandra_update_proc (conn,key,population_in)
{
	print ("*** cassandra_update_proc ***\t" + key)
	println ("\t" + population_in)

	def str_pp = Integer.toString (population_in)

	def str_ddx = new Date ().format ("yyyy-MM-dd")

	def sql_str="update cities set population =" + population_in
	sql_str += ", date_mod = '" + str_ddx + "'"
	sql_str += " where key = '" + key + "';"
	System.out.println (sql_str)
	def st = conn.createStatement()
	st.execute (sql_str)

	st.close()

}
// -------------------------------------------------------------- 
static void cassandra_delete_proc (conn,key_in)
{
	println ("*** delete_proc ***\t" + key_in)

	def sql_str="delete from cities where key = '" + key_in + "';"
	System.out.println (sql_str)
	def st = conn.createStatement()
	st.execute (sql_str)

	st.close()
}
// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
