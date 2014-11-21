// -------------------------------------------------------------------
/*
	postgre_manipulate.boo

					Nov/21/2014


*/
// -------------------------------------------------------------------
import	Npgsql
// -------------------------------------------------------------------
/* [6]: */
def postgre_update_proc (connection as NpgsqlConnection,id_a as string,population_a as int):
	dateNow = DateTime.Now
	str_date = dateNow.ToString ()

	sb_sql = "UPDATE cities SET population = " + population_a + \
		" , date_mod = '" \
		+ str_date + "' WHERE id = '" + id_a + "'"

	str_sql = sb_sql.ToString ()

	Console.WriteLine (str_sql)

	command = NpgsqlCommand (str_sql,connection)
	rowsAffected = command.ExecuteNonQuery ()
	Console.WriteLine ("rowsAffected = " + rowsAffected)

/* ------------------------------------------------------------------- */
def postgre_delete_proc (connection as NpgsqlConnection,id_a as string):
	sb_sql = "DELETE from cities WHERE ID = '" + id_a + "'"

	str_sql = sb_sql.ToString ()

	Console.WriteLine (str_sql)

	command = NpgsqlCommand (str_sql,connection)
	rowsAffected = command.ExecuteNonQuery ()
	Console.WriteLine ("rowsAffected = " + rowsAffected)

/* ------------------------------------------------------------------- */
def postgre_table_drop_proc (connection as NpgsqlConnection):
	sql_str_drop = "drop table cities"

	command = NpgsqlCommand (sql_str_drop,connection)
	command.ExecuteNonQuery ()

/* ------------------------------------------------------------------- */
def postgre_table_create_proc (connection as NpgsqlConnection):
	sql_str_create = "create TABLE cities (" \
			+ "id varchar(10) NOT NULL PRIMARY KEY," \
			+ "name text," \
			+ "population int," \
			+ "date_mod text)"

	command = NpgsqlCommand (sql_str_create,connection)
	command.ExecuteNonQuery ()

// -------------------------------------------------------------------
def postgre_insert_proc \
	(connection as NpgsqlConnection,id_a as string,name as string, \
		population_a as int,str_date as string):
	sb_sql = "insert into cities " \
		+ "(id, name, population, date_mod) values ('" \
		+ id_a + "','" \
		+ name + "'," \
		+ population_a + ",'" \
		+ str_date + "')"

	str_sql = sb_sql.ToString ()

	command = NpgsqlCommand (str_sql,connection)
	rowsAffected = command.ExecuteNonQuery ()

	if (rowsAffected < 1):
		Console.WriteLine ("rowsAffected = " + rowsAffected)

// -------------------------------------------------------------------
