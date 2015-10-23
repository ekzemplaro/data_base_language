// -------------------------------------------------------------- 
//
//	cassandra_manipulate.scala
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import scala.collection.mutable

import	java.util.HashMap

import	java.sql.Connection
import	java.sql.Statement
import	java.sql.ResultSet
import	java.sql.SQLException

// -------------------------------------------------------------- 
object cassandra_manipulate
{
// -------------------------------------------------------------- 
def cassandra_to_dict_proc (conn:Connection):(mutable.Map[String,Object]) =
{
	var dict_aa = mutable.Map[String,Object] ()

	var sql_str="select key,name,population,date_mod from cities;"
	System.out.println (sql_str)
	var st = conn.createStatement()
	var rset = st.executeQuery (sql_str)

	while (rset.next())
		{
		val key = rset.getString (1)
		val name = rset.getString (2)
		val population = Integer.parseInt (rset.getString (3))
		val date_mod = rset.getString (4)

		dict_aa = text_manipulate.dict_append_proc (dict_aa,key,name,population,date_mod)
		}

	rset.close()

	st.close()

	dict_aa
}

// -------------------------------------------------------------- 
def dict_to_cassandra_proc (dict_aa: mutable.Map[String,Object],conn:Connection)
{
	var sql_str="drop table cities;"
	System.out.println (sql_str)
	var st = conn.createStatement()
	st.execute (sql_str)

	sql_str="create table cities (key varchar primary key,name text,population int,date_mod timestamp);"
	st.execute (sql_str)

	for (pair <- dict_aa)
		{
		val key = pair._1
		var unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]

		val name = unit_aa ("name")
		val population = unit_aa ("population")
		val date_mod = unit_aa ("date_mod")

		val str_aa = "insert into cities (key,name,population,date_mod) values "
		val str_bb = String.format ("('%s','%s',%s,'%s');",key,name,population,date_mod)

		sql_str = str_aa + str_bb

		st.execute (sql_str)
		}

	st.close()
}

// -------------------------------------------------------------- 
def cassandra_update_proc (conn:Connection,key:String,population_in:Int)
{
	print ("*** cassandra_update_proc ***\t" + key)
	println ("\t" + population_in)

	val str_pp = Integer.toString (population_in)

	var str_ddx = text_manipulate.get_current_date_proc ()

	var sql_str="update cities set population =" + population_in
	sql_str += ", date_mod = '" + str_ddx + "'"
	sql_str += " where key = '" + key + "';"
	System.out.println (sql_str)
	val st = conn.createStatement()
	st.execute (sql_str)

	st.close()

}

// -------------------------------------------------------------- 
def cassandra_delete_proc (conn:Connection,key:String)
{
	var sql_str="delete from cities where key = '" + key + "';"
	System.out.println (sql_str)
	val st = conn.createStatement()
	st.execute (sql_str)

	st.close()

}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
