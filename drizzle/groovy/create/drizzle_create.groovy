// ---------------------------------------------------------------------
/*
	create/drizzle_create.groovy

					Jul/15/2014

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class drizzle_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.drizzle.jdbc.DrizzleDriver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:drizzle://localhost:4427/city"

	def sql = Sql.newInstance (protocol, user,password,driver )

	sql_manipulate.drop_table_proc (sql)
	sql_manipulate.create_table_proc (sql)

	insert_data_proc (sql)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
static void insert_data_proc (sql)
{
	sql_manipulate.insert_record_proc (sql,"t2651","京都",18267,"1999-3-11")
	sql_manipulate.insert_record_proc (sql,"t2652","福知山",39421,"1999-5-24")
	sql_manipulate.insert_record_proc (sql,"t2653","舞鶴",59182,"1999-1-17")
	sql_manipulate.insert_record_proc (sql,"t2654","綾部",72684,"1999-9-29")
	sql_manipulate.insert_record_proc (sql,"t2655","宇治",98437,"1999-10-16")
	sql_manipulate.insert_record_proc (sql,"t2656","宮津",39754,"1999-7-24")
	sql_manipulate.insert_record_proc (sql,"t2657","亀岡",58293,"1999-12-30")
	sql_manipulate.insert_record_proc (sql,"t2658","城陽",91784,"1999-11-18")
	sql_manipulate.insert_record_proc (sql,"t2659","向日",89247,"1999-8-21")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

