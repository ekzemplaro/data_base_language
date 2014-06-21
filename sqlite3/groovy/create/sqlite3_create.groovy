// ---------------------------------------------------------------------
/*
	create/sqlite3_create.groovy

					May/26/2011

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class sqlite3_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.sqlite.JDBC"

	def sqlite3_db = args[0]

	def protocol = "jdbc:sqlite:" + sqlite3_db

	def sql = Sql.newInstance (protocol, driver)

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
	sql_manipulate.insert_record_proc (sql,"t0711","郡山",41257,"1999-7-21")
	sql_manipulate.insert_record_proc (sql,"t0712","会津若松",34851,"1999-6-14")
	sql_manipulate.insert_record_proc (sql,"t0713","白河", 56279,"1999-5-27")
	sql_manipulate.insert_record_proc (sql,"t0714","福島",27184,"1999-9-29")
	sql_manipulate.insert_record_proc (sql,"t0715","喜多方",19837,"1999-2-16")
	sql_manipulate.insert_record_proc (sql,"t0716","二本松",85724,"1999-11-24")
	sql_manipulate.insert_record_proc (sql,"t0717","いわき",18296,"1999-12-30")
	sql_manipulate.insert_record_proc (sql,"t0718","相馬",43785,"1999-10-12")
	sql_manipulate.insert_record_proc (sql,"t0719","須賀川",59273,"1999-7-15")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

