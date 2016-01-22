// -------------------------------------------------------------------
//	Maria_update.hx
//
//					Jan/12/2016
// -------------------------------------------------------------------
class Maria_update
{
// -------------------------------------------------------------------
static function main()
{
	Sys.print("*** 開始 ***\n");

	var key = Sys.args ()[0];
	var population = Sys.args ()[1];

	Sys.println (key);
	Sys.println (population);

	var today = Date.now().toString ();

	var cnx = sys.db.Mysql.connect({ 
		host : "localhost",
		port : 3306,
		user : "scott",
		pass : "tiger",
		socket : null,
		database : "city"
		});

	var command = "update cities set population =" + population + ",date_mod='" + today + "' where ID='" + key + "'";
	cnx.request (command);

	cnx.close();

	Sys.print("*** 終了 ***\n");
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
