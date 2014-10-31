// -------------------------------------------------------------------
//	sqlite3_create.vala
//
//					Oct/22/2014
//
// -------------------------------------------------------------------
using GLib;
using Sqlite;

// -------------------------------------------------------------------
static int main (string[] args)
{
	Database db;
	int rc = 0;

	var sqlite3_file = args[1];

	stdout.printf ("*** 開始 ***\n");
	stdout.printf (sqlite3_file + "\n");

	GLib.Intl.setlocale (GLib.LocaleCategory.CTYPE, "ja_JP.utf8");

	if (args.length != 2) {
		printerr ("*** error ***\n");
		return 1;
	}

	if ((rc = Database.open (sqlite3_file, out db)) == 1) {
		printerr ("Can't open database: %s\n", db.errmsg ());
		return 1;
	}

	sql_execute (db,"drop table cities");

	string str_sql = "create table cities (id varchar(10), name varchar(20),population int, date_mod date)";

	sql_execute (db,str_sql);

	insert_proc (db,"t0711","郡山","84962","1923-4-12");
	insert_proc (db,"t0712","会津若松","42815","1923-7-24");
	insert_proc (db,"t0713","白河","52794","1923-9-8");
	insert_proc (db,"t0714","福島","71687","1923-2-9");
	insert_proc (db,"t0715","喜多方","37569","1923-5-1");
	insert_proc (db,"t0716","二本松","97452","1923-6-4");
	insert_proc (db,"t0717","いわき","81742","1923-3-21");
	insert_proc (db,"t0718","相馬","21853","1923-1-12");
	insert_proc (db,"t0719","須賀川","14527","1923-10-18");

	stdout.printf ("*** 終了 ***\n");

	return 0;

}

// -------------------------------------------------------------------
void insert_proc (Database db,string id,string name,string population,string date_mod)
{
	string str_sql = "insert into cities (id,name,population,date_mod) values ('"
		+ id + "','" + name + "'," + population + ",'"
			+ date_mod + "')";

	sql_execute (db,str_sql);

}

// -------------------------------------------------------------------
int sql_execute (Database db,string str_sql)
{
	Statement stmt;
	int col, cols;
	int rc = 0;

	if ((rc = db.prepare_v2 (str_sql, -1, out stmt, null)) == 1) {
	printerr ("SQL error: %d, %s\n", rc, db.errmsg ());
	return 1;
	}

	cols = stmt.column_count();
	do {
		rc = stmt.step();
		switch (rc) {
		case Sqlite.DONE:
			break;
		case Sqlite.ROW:
			for (col = 0; col < cols; col++) {
			string txt = stmt.column_text(col);
//		print ("%s = %s\t", stmt.column_name (col), txt);
		print ("%s\t", txt);
		}
		print ("\n");
		break;
	default:
		printerr ("Error: %d, %s\n", rc, db.errmsg ());
		break;
		}
	} while (rc == Sqlite.ROW);

	return 0;
}

// -------------------------------------------------------------------
