// --------------------------------------------------------------
//
//	Sqlite3_create.hx
//
//					Jan/12/2016
//
// --------------------------------------------------------------
class Sqlite3_create
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
	Sys.println ("*** 開始 ***");

	var file_sqlite3 = Sys.args ()[0];
	neko.Lib.println (file_sqlite3);

	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0711","郡山",89251,"1955-2-5");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0712","会津若松",69714,"1955-8-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0713","白河",28356,"1955-10-9");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0714","福島",96128,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0715","喜多方",81725,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0716","二本松",93756,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0717","いわき",21497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0718","相馬",58316,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0719","須賀川",43127,"1955-12-19");

	dict_to_sqlite3_proc (file_sqlite3,dict_aa);

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
static function dict_to_sqlite3_proc
	(file_sqlite3:String,dict_aa: Map <String,Map<String,String>>) : Void
{
	var cnx = sys.db.Sqlite.open (file_sqlite3);
	var command = "drop table if exists cities";
	cnx.request (command);

	command = "create TABLE cities (id text NOT NULL PRIMARY KEY,name text, population int, date_mod text)";
	cnx.request (command);

	for (key in dict_aa.keys ())
		{
		var unit_bb = dict_aa.get (key);
		var name = unit_bb.get ("name");
		var population = unit_bb.get ("population");
		var date_mod = unit_bb.get ("date_mod");

		command = "insert into cities (id, Name, Population, date_mod)";
 		command += " values ('";
		command += key + "','" + name;
		command += "','" + population;
		command += "','" + date_mod + "')";
		cnx.request (command);
//        	neko.Lib.println (command);
		}

	cnx.close();
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
