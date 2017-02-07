// ---------------------------------------------------------------------
//	sqlite3/groovy/delete/sqlite3_delete.groovy
//
//					Nov/28/2014
//
// ---------------------------------------------------------------------
class sqlite3_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def sqlite3_file = args[0]
	def key_in=args[1]

	println (key_in)

	def db = new SQLite.Database()

	db.open (sqlite3_file, 0666);

	def sql_str = "delete from  cities where ID= '" + key_in + "'"

	def stmt = db.prepare(sql_str)

	while (stmt.step())
		{
		}

	stmt.close()
	db.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
