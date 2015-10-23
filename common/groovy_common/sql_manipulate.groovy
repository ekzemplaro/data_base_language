// ---------------------------------------------------------------------
//	sql_manipulate.groovy
//
//					May/22/2013
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

// ---------------------------------------------------------------------
class sql_manipulate
{
// -------------------------------------------------------------------
static display_proc (sql)
{
	sql.eachRow ("select * from cities order by id")
		{
		print it.id + "\t"
		print it.name  + "\t"
		print it.population  + "\t"
		println it.date_mod
		}
}

// -------------------------------------------------------------------
static update_proc (sql,id_in,population_in)
{
	def today = new Date ().format ("yyyy-MM-dd")

	def sql_str = "update cities set POPULATION = " + population_in +
		",DATE_MOD='" + today +  "'  where ID= '" + id_in + "'"

	sql.executeUpdate (sql_str)
}

// ---------------------------------------------------------------------
static delete_proc (sql,id_in)
{
	def sql_str = "delete from cities where ID= '" + id_in + "'"

	sql.execute (sql_str)
}

// ---------------------------------------------------------------------
static drop_table_proc (sql)
{
	def sql_str = "drop table cities"

	sql.execute (sql_str)
}

// ---------------------------------------------------------------------
static create_table_proc (sql)
{
	def sql_str = "create table cities (id varchar(10), name varchar(20),"
	sql_str	+= " population int, date_mod date)"

	sql.execute (sql_str)

//	sql_str = "commit"
//	sql.execute (sql_str)
}

// ---------------------------------------------------------------------
static insert_record_proc (sql,id,name,population,date_mod)
{
	def str_ins = "insert into cities (id,name,population,date_mod) values ("

	def str_data = "'" + id + "','" + name + "',"
	str_data += Integer.toString (population) + ",'" + date_mod + "')"

	def sql_str = str_ins + str_data

// println (sql_str)

	sql.execute (sql_str)

//	sql_str = "commit"
//	sql.execute (sql_str)
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
