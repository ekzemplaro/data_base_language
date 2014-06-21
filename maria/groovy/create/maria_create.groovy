// ---------------------------------------------------------------------
/*
	create/maria_create.groovy

					May/21/2014

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class maria_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.gjt.mm.mysql.Driver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:mysql://localhost/city"

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
	sql_manipulate.insert_record_proc (sql,"t3321","岡山",148567,"1999-8-11")
	sql_manipulate.insert_record_proc (sql,"t3322","倉敷",384721,"1999-6-24")
	sql_manipulate.insert_record_proc (sql,"t3323","津山",591462,"1999-9-17")
	sql_manipulate.insert_record_proc (sql,"t3324","玉野",726854,"1999-1-29")
	sql_manipulate.insert_record_proc (sql,"t3325","笠岡",981437,"1999-12-16")
	sql_manipulate.insert_record_proc (sql,"t3326","井原",492758,"1999-10-24")
	sql_manipulate.insert_record_proc (sql,"t3327","総社",518293,"1999-7-30")
	sql_manipulate.insert_record_proc (sql,"t3328","高梁",417892,"1999-9-18")
	sql_manipulate.insert_record_proc (sql,"t3329","新見",592347,"1999-7-21")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

