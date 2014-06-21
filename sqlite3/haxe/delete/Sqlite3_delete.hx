// -------------------------------------------------------------------
//	Sqlite3_delete.hx
//
//					Feb/24/2014
// -------------------------------------------------------------------
class Sqlite3_delete {
// -------------------------------------------------------------------
static function main()
{
	Sys.print("*** 開始 ***\n");

	var file_sqlite3 = Sys.args ()[0];
	var key = Sys.args ()[1];

	Sys.println (file_sqlite3);
	Sys.println (key);

	var cnx = sys.db.Sqlite.open (file_sqlite3);

	cnx.request("delete FROM cities where ID='" + key + "'");

	cnx.close();

	Sys.print("*** 終了 ***\n");
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
