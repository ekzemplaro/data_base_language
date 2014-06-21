// -------------------------------------------------------------------
//	sqlite3_delete.vala
//
//					Jun/06/2011
//
// -------------------------------------------------------------------
using GLib;
using Sqlite;

// -------------------------------------------------------------------
static int main (string[] args)
{
	Database db;
	Statement stmt;
	int rc = 0;
	int col, cols;

	var sqlite3_file = args[1];
	var id_in = args[2];

	stdout.printf ("*** 開始 ***\n");
	stdout.printf (sqlite3_file + "\n");
	stdout.printf (id_in + "\n");

	GLib.Intl.setlocale (GLib.LocaleCategory.CTYPE, "ja_JP.utf8");

	if ((rc = Database.open (sqlite3_file, out db)) == 1) {
		printerr ("Can't open database: %s¥n", db.errmsg ());
		return 1;
	}

	var sql_str = "delete from cities where ID= '" + id_in + "'";

	if ((rc = db.prepare_v2 (sql_str, -1, out stmt, null)) == 1) {
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
			print ("%s\t", txt);
		}
		print ("\n");
		break;
	default:
		printerr ("Error: %d, %s\n", rc, db.errmsg ());
		break;
		}
	} while (rc == Sqlite.ROW);

	stdout.printf ("*** 終了 ***\n");

	return 0;

}
// -------------------------------------------------------------------
