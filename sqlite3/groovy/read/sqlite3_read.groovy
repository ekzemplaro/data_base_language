// ---------------------------------------------------------------------
//	sqlite3/groovy/read/sqlite3_read.groovy
//
//					Nov/28/2014
//
// ---------------------------------------------------------------------
class sqlite3_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")
	def sqlite3_file = args[0]

	def db = new SQLite.Database()

	db.open (sqlite3_file, 0666);
	println("DB version: " + db.dbversion());

	def sql = "select * from cities"
	def stmt = db.prepare(sql)

	while (stmt.step())
		{
		def i, ncol = stmt.column_count()

		def array_str = []
		for (it in  0..(ncol-1))
			{
			def obj = stmt.column(it)
			array_str.add (obj.toString())
			}

		def out_str = array_str.join ("\t") 
		println (out_str)
		}

	stmt.close()
	db.close()

	println ("*** 終了 ***")

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
