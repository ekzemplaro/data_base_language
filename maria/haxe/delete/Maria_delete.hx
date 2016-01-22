// -------------------------------------------------------------------
//	Maria_delete.hx
//
//					Jan/12/2016
// -------------------------------------------------------------------
class Maria_delete {
// -------------------------------------------------------------------
static function main()
{
	Sys.print("*** 開始 ***\n");

	var key = Sys.args ()[0];

	Sys.println (key);

	var cnx = sys.db.Mysql.connect({ 
		host : "localhost",
		port : 3306,
		user : "scott",
		pass : "tiger",
		socket : null,
		database : "city"
		});

	cnx.request("delete FROM cities where ID='" + key + "'");

	cnx.close();

	Sys.print("*** 終了 ***\n");
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
