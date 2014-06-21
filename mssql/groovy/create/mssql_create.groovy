// ---------------------------------------------------------------------
/*
	create/mssql_create.groovy

					Jan/11/2013

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class mssql_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"

	String user     = "sa"
	String password = "scott_tiger"

//	def protocol = 'jdbc:sqlserver://host_mssql\\SQLEXPRESS;databaseName=city'
	def protocol = 'jdbc:sqlserver://host_mssql;databaseName=city'

	def sql = Sql.newInstance (protocol, user,password,driver)

	sql_manipulate.drop_table_proc (sql)
	mssql_create_table_proc (sql)

	println ("*** bbbbb ***")

	insert_data_proc (sql)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}

/* --------------------------------------------------------------------- */
static void mssql_create_table_proc (sql)
{
sql.execute ("create table cities (id varchar(10), name varchar(20), population int, date_mod datetime)");
}


// ---------------------------------------------------------------------
static void insert_data_proc (sql)
{
	sql_manipulate.insert_record_proc (sql,"t1071","前橋",21875,"1999-3-21")
	sql_manipulate.insert_record_proc (sql,"t1072","高崎",59486,"1999-7-7")
	sql_manipulate.insert_record_proc (sql,"t1073","桐生",78192,"1999-5-12")
	sql_manipulate.insert_record_proc (sql,"t1074","沼田",27643,"1999-9-18")
	sql_manipulate.insert_record_proc (sql,"t1075","伊勢崎",75219,"1999-10-14")
	sql_manipulate.insert_record_proc (sql,"t1076","水上",29174,"1999-11-21")
	sql_manipulate.insert_record_proc (sql,"t1077","太田",69178,"1999-12-16")
	sql_manipulate.insert_record_proc (sql,"t1078","安中",47532,"1999-5-8")
	sql_manipulate.insert_record_proc (sql,"t1079","みどり",52693,"1999-7-21")
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
