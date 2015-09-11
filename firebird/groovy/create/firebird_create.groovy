// ---------------------------------------------------------------------
/*
	create/firebird_create.groovy

					Aug/25/2015

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
public class firebird_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.firebirdsql.jdbc.FBDriver"

	String user     = "sysdba"
	String password = "tiger"
	String database = "/var/tmp/firebird/cities.fdb"

//	def protocol = "jdbc:firebirdsql:localhost/3050:" + database
	def protocol = "jdbc:firebirdsql:host_firebird:" + database

	def sql = Sql.newInstance (protocol, user,password,driver )

	sql_manipulate.drop_table_proc (sql)
	sql_manipulate.create_table_proc (sql)

	insert_data_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
static void insert_data_proc (sql)
{
	sql_manipulate.insert_record_proc (sql,"t3821","松山",91567,"1999-8-21")
	sql_manipulate.insert_record_proc (sql,"t3822","今治",24671,"1999-9-14")
	sql_manipulate.insert_record_proc (sql,"t3823","宇和島",38276,"1999-10-27")
	sql_manipulate.insert_record_proc (sql,"t3824","八幡浜",29518,"1999-9-29")
	sql_manipulate.insert_record_proc (sql,"t3825","新居浜",15374,"1999-10-16")
	sql_manipulate.insert_record_proc (sql,"t3826","西条",29647,"1999-11-24")
	sql_manipulate.insert_record_proc (sql,"t3827","大洲",18596,"1999-12-30")
	sql_manipulate.insert_record_proc (sql,"t3828","伊予",43681,"1999-11-18")
	sql_manipulate.insert_record_proc (sql,"t3829","西予",53147,"1999-7-21")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
