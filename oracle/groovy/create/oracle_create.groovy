// --------------------------------------------------------------------
/*
	oracle_create.groovy

					Aug/05/2015

*/
// --------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate

// --------------------------------------------------------------------
public class oracle_create
{

// --------------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	String host = "host_oracle"
	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:oracl:thin:@" + host + ":1521/xe"

	def sql = Sql.newInstance (protocol,user,password)

	sql_manipulate.drop_table_proc (sql)
	sql_manipulate.create_table_proc (sql)

	insert_data_proc (sql)


	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}
// --------------------------------------------------------------------
static void insert_data_proc (sql)
{
	sql_manipulate.insert_record_proc (sql,"t0131","函館",49582,"21-JUL-1999")
	sql_manipulate.insert_record_proc (sql,"t0132","札幌",37421,"14-JUN-1999")
	sql_manipulate.insert_record_proc (sql,"t0133","帯広",51892,"7-MAY-1999")
	sql_manipulate.insert_record_proc (sql,"t0134","釧路",38291,"12-SEP-1999")
	sql_manipulate.insert_record_proc (sql,"t0135","旭川",71238,"19-AUG-1999")
	sql_manipulate.insert_record_proc (sql,"t0136","北見",25793,"21-JAN-1999")
	sql_manipulate.insert_record_proc (sql,"t0137","室蘭",96451,"24-FEB-1999")
	sql_manipulate.insert_record_proc (sql,"t0138","根室",18472,"22-MAY-1999")
	sql_manipulate.insert_record_proc (sql,"t0139","稚内",61538,"17-MAR-1999")
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
