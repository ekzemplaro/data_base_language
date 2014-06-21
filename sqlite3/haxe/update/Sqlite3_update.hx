// -------------------------------------------------------------------
//	Sqlite3_update.hx
//
//					Feb/24/2014
// -------------------------------------------------------------------
class Sqlite3_update
{
// -------------------------------------------------------------------
static function main()
{
	Sys.print("*** 開始 ***\n");

	var file_sqlite3 = Sys.args ()[0];
	var key = Sys.args ()[1];
	var population = Sys.args ()[2];

	Sys.println (file_sqlite3);
	Sys.println (key);
	Sys.println (population);

	var today = Date.now().toString ();

	var cnx = sys.db.Sqlite.open (file_sqlite3);

	var command = "update cities set population =" + population + ",date_mod='" + today + "' where ID='" + key + "'";
	cnx.request (command);

	cnx.close();

	Sys.print("*** 終了 ***\n");
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
