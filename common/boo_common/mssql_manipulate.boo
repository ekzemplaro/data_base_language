// -------------------------------------------------------------------
/*
	mssql_manipulate.boo

					Nov/21/2014


*/
// -------------------------------------------------------------------
// namespace mssql_manipulate
/*
using	System
using	System.Collections.Generic
using	System.Data
using	System.Text
using	MySql.Data.MySqlClient
*/
import	System.Data.SqlClient
// -------------------------------------------------------------------
/* [6]: */
def mssql_update_proc (connection as SqlConnection,id_a as string,population_a as int):
	dateNow = DateTime.Now
	str_date = dateNow.ToString ()

	sb_sql = "UPDATE cities SET population = " + population_a + \
		" , date_mod = '" \
		+ str_date + "' WHERE id = '" + id_a + "'"

	str_sql = sb_sql.ToString ()

	Console.WriteLine (str_sql)

	command = SqlCommand (str_sql,connection)
	rowsAffected = command.ExecuteNonQuery ()
	Console.WriteLine ("rowsAffected = " + rowsAffected)

/* ------------------------------------------------------------------- */
def mssql_delete_proc (connection as SqlConnection,id_a as string):
	sb_sql = "DELETE from cities WHERE ID = '" + id_a + "'"

	str_sql = sb_sql.ToString ()

	Console.WriteLine (str_sql)

	command = SqlCommand (str_sql,connection)
	rowsAffected = command.ExecuteNonQuery ()
	Console.WriteLine ("rowsAffected = " + rowsAffected)

/* ------------------------------------------------------------------- */
def mssql_table_drop_proc (connection as SqlConnection):
	sql_str_drop = "drop table cities"

	command = SqlCommand (sql_str_drop,connection)
	command.ExecuteNonQuery ()

/* ------------------------------------------------------------------- */
def mssql_table_create_proc (connection as SqlConnection):
	sql_str_create = "create TABLE cities (" \
			+ "id varchar(10) NOT NULL PRIMARY KEY," \
			+ "name text," \
			+ "population int," \
			+ "date_mod text)"

	command = SqlCommand (sql_str_create,connection)
	command.ExecuteNonQuery ()

// -------------------------------------------------------------------
def mssql_insert_proc \
	(connection as SqlConnection,id_a as string,name as string, \
		population_a as int,str_date as string):
	sb_sql = "insert into cities " \
		+ "(id, name, population, date_mod) values ('" \
		+ id_a + "','" \
		+ name + "'," \
		+ population_a + ",'" \
		+ str_date + "')"

	str_sql = sb_sql.ToString ()

	command = SqlCommand (str_sql,connection)
	rowsAffected = command.ExecuteNonQuery ()

	if (rowsAffected < 1):
		Console.WriteLine ("rowsAffected = " + rowsAffected)

// -------------------------------------------------------------------
