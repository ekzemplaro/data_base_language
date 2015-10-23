// -------------------------------------------------------------------
//	sqlite3_read.vala
//
//					Oct/28/2010
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

	if ((rc = db.prepare_v2 ("select * from cities", -1, out stmt, null)) == 1) {
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

	stdout.printf ("*** 終了 ***\n");

	return 0;

}
// -------------------------------------------------------------------
