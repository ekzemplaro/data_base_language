// ---------------------------------------------------------------------
/*
	create/hsqldb_create.groovy

					May/30/2011

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class hsqldb_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	def source = new org.hsqldb.jdbc.jdbcDataSource ()

	source.database = 'jdbc:hsqldb:file:/var/tmp/hsqldb/cities;shutdown=true'

	source.user = 'SA'
	source.password = ''

	def sql = new Sql (source)


	sql_manipulate.drop_table_proc (sql)
def sql_str = "commit"
sql.execute (sql_str)
	sql_manipulate.create_table_proc (sql)

sql_str = "commit"
sql.execute (sql_str)

	println ("*** bbbbb ***")

	insert_data_proc (sql)

sql_str = "commit"
sql.execute (sql_str)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
static void insert_data_proc (sql)
{
	sql_manipulate.insert_record_proc (sql,"t4671","鹿児島",61542,"1999-7-22");
	sql_manipulate.insert_record_proc (sql,"t4672","指宿",54378,"1999-8-12");
	sql_manipulate.insert_record_proc (sql,"t4673","志布志",52958,"1999-5-11");
	sql_manipulate.insert_record_proc (sql,"t4674","川内",27234,"1999-9-25");
	sql_manipulate.insert_record_proc (sql,"t4675","鹿屋",12617,"1999-10-16");
	sql_manipulate.insert_record_proc (sql,"t4676","枕崎",34518,"1999-11-2");
	sql_manipulate.insert_record_proc (sql,"t4677","出水",19831,"1999-2-6");
	sql_manipulate.insert_record_proc (sql,"t4678","阿久根",39438,"1999-5-29");
	sql_manipulate.insert_record_proc (sql,"t4679","霧島",59812,"1999-10-17");
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
