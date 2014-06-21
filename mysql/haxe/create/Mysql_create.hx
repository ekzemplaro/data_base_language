// --------------------------------------------------------------
//
//	Mysql_create.hx
//
//					Feb/24/2014
//
// --------------------------------------------------------------
class Mysql_create
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3321","岡山",89251,"1955-2-5");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3322","倉敷",69714,"1955-8-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3323","津山",28957,"1955-10-9");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3324","玉野",56128,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3325","笠岡",81725,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3326","井原",93714,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3327","総社",21497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3328","高梁",28531,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t3329","新見",53127,"1955-12-19");
	Text_manipulate.dict_display_proc (dict_aa);

	dict_to_mysql_proc (dict_aa);

        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
static function dict_to_mysql_proc
	(dict_aa: Map <String,Map<String,String>>) : Void
{
	var cnx = sys.db.Mysql.connect({ 
		host : "host_mysql",
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
