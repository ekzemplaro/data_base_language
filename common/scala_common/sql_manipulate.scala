// ----------------------------------------------------------------------
/*
	scala_common/sql_manipulate.scala

				Sep/27/2012

*/
// ----------------------------------------------------------------------
import java.util.Date
import java.util.Calendar
import java.sql.ResultSet
import java.sql.Statement
import java.sql.Connection
import java.sql.SQLException

// ----------------------------------------------------------------------
object sql_manipulate
{

// ----------------------------------------------------------------------
def display_proc (conn:Connection)
{
	val stmt = conn.createStatement ()

	val rset = stmt.executeQuery (
	"SELECT ID, NAME, POPULATION, DATE_MOD FROM cities order by ID")

	while (rset.next())
		{
		var out_str = rset.getString (1) + "\t"
		out_str += rset.getString(2) + "\t"
		out_str += rset.getString(3) + "\t"
		out_str += rset.getString(4)

		println (out_str)
		}

    rset.close()
    stmt.close()
}

// ----------------------------------------------------------------------
/* [4]: */
def update_proc (conn:Connection,id_in:String,population:Int)
{
	def stmt = conn.createStatement ()

	val str_sql = update_sql_gen_proc (id_in,population)

	val result = stmt.executeUpdate (str_sql)

	stmt.close ()
}

// ----------------------------------------------------------------------
/* [4-4]: */
def update_sql_gen_proc (id_in:String,population:Int):(String) =
{
	val	str_ddx = current_date_gen_proc ()

	val str_sql = "update cities set POPULATION=" + population +
		",DATE_MOD='" + str_ddx +  "'  where ID= '" + id_in + "'"

	println ("str_sql = " + str_sql)

	return	str_sql
}

// ----------------------------------------------------------------------
def current_date_gen_proc ():String =
{
	val cal = Calendar.getInstance ()
	val year = cal.get (Calendar.YEAR)
	val month = cal.get (Calendar.MONTH) + 1
	val day = cal.get (Calendar.DATE)


	val	str_ddx = year + "-" + month + "-" + day

	return	str_ddx
}

// ----------------------------------------------------------------------
/* [6]: */
def delete_proc (conn:Connection,id_in:String)
{
	val stmt = conn.createStatement ()

	val str_sql = "delete from  cities where ID= '" + id_in + "'"

	val result = stmt.executeUpdate (str_sql)

	stmt.close ()
}

// ----------------------------------------------------------------------
def create_table_proc (ss:Statement)
{
	val sql_command =
	"create table cities (id varchar(10), name varchar(20)," +
		" population int, date_mod date)"
	ss.execute (sql_command)
}

// ----------------------------------------------------------------------
def drop_table_proc (ss:Statement)
{
	ss.execute ("drop table cities")
}

// ----------------------------------------------------------------------
def insert_record_proc (ss:Statement,id:String,name:String,population:Int,date_mod:String)
{
	val str_ins =
		"insert into cities (id,name,population,date_mod) values ("

	val str_data = "'" + id + "','" + name + "'," +
		Integer.toString (population) + ",'" + date_mod + "')"

	val sql_str = str_ins + str_data

	ss.execute (sql_str)
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
