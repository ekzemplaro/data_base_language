// ---------------------------------------------------------------------
/*
	create/mysql_create.groovy

					Jun/27/2011

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class mysql_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.gjt.mm.mysql.Driver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:mysql://host_mysql/city"

	def sql = Sql.newInstance (protocol, user,password,driver )

	sql_manipulate.drop_table_proc (sql)
	sql_manipulate.create_table_proc (sql)

	println ("*** bbbbb ***")

	insert_data_proc (sql)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
static void insert_data_proc (sql)
{
	sql_manipulate.insert_record_proc (sql,"t3321","岡山",18567,"1999-2-11")
	sql_manipulate.insert_record_proc (sql,"t3322","倉敷",32421,"1999-1-24")
	sql_manipulate.insert_record_proc (sql,"t3323","津山",59592,"1999-5-17")
	sql_manipulate.insert_record_proc (sql,"t3324","玉野",72684,"1999-9-29")
	sql_manipulate.insert_record_proc (sql,"t3325","笠岡",98437,"1999-10-16")
	sql_manipulate.insert_record_proc (sql,"t3326","井原",49754,"1999-11-24")
	sql_manipulate.insert_record_proc (sql,"t3327","総社",58293,"1999-12-30")
	sql_manipulate.insert_record_proc (sql,"t3328","高梁",41784,"1999-11-18")
	sql_manipulate.insert_record_proc (sql,"t3329","新見",59247,"1999-7-21")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

