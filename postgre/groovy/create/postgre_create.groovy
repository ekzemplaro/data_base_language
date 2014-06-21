// ---------------------------------------------------------------------
/*
	create/postgre_create.groovy

					Jul/16/2011

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class postgre_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.postgresql.Driver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:postgresql://localhost/city"

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
	sql_manipulate.insert_record_proc (sql,"t3461","広島",47592,"1999-7-21")
	sql_manipulate.insert_record_proc (sql,"t3462","福山",34261,"1999-6-14")
	sql_manipulate.insert_record_proc (sql,"t3463","東広島", 53725,"1999-5-27")
	sql_manipulate.insert_record_proc (sql,"t3464","呉",23984,"1999-9-29")
	sql_manipulate.insert_record_proc (sql,"t3465","尾道",45397,"1999-10-16")
	sql_manipulate.insert_record_proc (sql,"t3466","竹原",29734,"1999-11-24")
	sql_manipulate.insert_record_proc (sql,"t3467","三次",82195,"1999-12-30")
	sql_manipulate.insert_record_proc (sql,"t3468","大竹",43284,"1999-11-18")
	sql_manipulate.insert_record_proc (sql,"t3469","府中",78512,"1999-9-24")
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
