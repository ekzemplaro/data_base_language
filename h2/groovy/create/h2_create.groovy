// ---------------------------------------------------------------------
/*
	create/h2_create.groovy

					Jun/12/2015

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class h2_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	def db_file=args[0]

	def sql = Sql.newInstance \
		("jdbc:h2:file:" + db_file, "sa", "", "org.h2.Driver")

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
	sql_manipulate.insert_record_proc (sql,"t4561","宮崎",14932,"1999-9-8")
	sql_manipulate.insert_record_proc (sql,"t4562","日南",86571,"1999-2-25")
	sql_manipulate.insert_record_proc (sql,"t4563","延岡",43145,"1999-5-11")
	sql_manipulate.insert_record_proc (sql,"t4564","都城",28735,"1999-8-15")
	sql_manipulate.insert_record_proc (sql,"t4565","小林",19432,"1999-10-12")
	sql_manipulate.insert_record_proc (sql,"t4566","日向",79514,"1999-5-7")
	sql_manipulate.insert_record_proc (sql,"t4567","串間",57326,"1999-6-21")
	sql_manipulate.insert_record_proc (sql,"t4568","西都",12478,"1999-9-14")
	sql_manipulate.insert_record_proc (sql,"t4569","えびの",21357,"1999-4-22")
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
