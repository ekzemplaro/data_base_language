// --------------------------------------------------------------
//
//	Maria_create.hx
//
//					Jan/12/2016
//
// --------------------------------------------------------------
class Maria_create
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3321","岡山",389251,"1955-2-5");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3322","倉敷",869714,"1955-8-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3323","津山",128957,"1955-10-9");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3324","玉野",456128,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3325","笠岡",981725,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3326","井原",593714,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3327","総社",621497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3328","高梁",728561,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3329","新見",853124,"1955-12-19");

	dict_to_mysql_proc (dict_aa);

        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
static function dict_to_mysql_proc
	(dict_aa: Map <String,Map<String,String>>) : Void
{
	var cnx = sys.db.Mysql.connect({ 
		host : "localhost",
		port : 3306,
		user : "scott",
		pass : "tiger",
		socket : null,
		database : "city"
		});

	var command = "drop table if exists cities";
	cnx.request (command);

	command = "create TABLE cities (id varchar(10),name text, population int, date_mod text)";
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
