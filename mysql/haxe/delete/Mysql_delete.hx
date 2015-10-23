// -------------------------------------------------------------------
//	Mysql_delete.hx
//
//					Feb/24/2014
// -------------------------------------------------------------------
class Mysql_delete {
// -------------------------------------------------------------------
static function main()
{
	Sys.print("*** 開始 ***\n");

	var key = Sys.args ()[0];

	Sys.println (key);

	var cnx = sys.db.Mysql.connect({ 
		host : "host_mysql",
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
