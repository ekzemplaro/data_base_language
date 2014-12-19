// ---------------------------------------------------------------------
//	sqlite3/groovy/update/sqlite3_update.groovy
//
//					Nov/28/2014
//
// ---------------------------------------------------------------------
class sqlite3_update
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def sqlite3_file = args[0]
	def key_in=args[1]
	def population_in=args[2]

	println (key_in + "\t" +  population_in)

	def db = new SQLite.Database()

	db.open (sqlite3_file, 0666);

	def today = new Date ().format ("yyyy-MM-dd")

	def sql_str = "update cities set POPULATION = " + population_in +
		",DATE_MOD='" + today +  "'  where ID= '" + key_in + "'"

	def stmt = db.prepare(sql_str)

	while (stmt.step())
		{
		}

	stmt.close () 

	db.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
