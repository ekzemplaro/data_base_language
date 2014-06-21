// --------------------------------------------------------------------
/*
	oracle_create.groovy

					May/23/2011

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

	String driver = "oracle.jdbc.driver.OracleDriver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:oracl:thin:@spn109:1521/xe"

	def sql = Sql.newInstance (protocol,user,password,driver)

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
	sql_manipulate.insert_record_proc (sql,"t0131","函館",40500,"1999-7-21")
	sql_manipulate.insert_record_proc (sql,"t0132","札幌",33401,"1999-6-14")
	sql_manipulate.insert_record_proc (sql,"t0133","帯広",52592,"1999-5-7")
	sql_manipulate.insert_record_proc (sql,"t0134","釧路",30291,"1999-9-12")
	sql_manipulate.insert_record_proc (sql,"t0135","旭川",70298,"1999-8-19")
	sql_manipulate.insert_record_proc (sql,"t0136","北見",20290,"1999-1-21")
	sql_manipulate.insert_record_proc (sql,"t0137","室蘭",90252,"1999-2-24")
	sql_manipulate.insert_record_proc (sql,"t0138","根室",10272,"1999-5-22")
	sql_manipulate.insert_record_proc (sql,"t0139","稚内",60532,"1999-7-17")
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
