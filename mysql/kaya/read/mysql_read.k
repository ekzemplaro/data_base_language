// -----------------------------------------------------------------
//	mysql_read.k
//
//						Jan/25/2011
// -----------------------------------------------------------------
program mysql_read;


import MyDB;

// -----------------------------------------------------------------
Void main() {
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	db = MyDB::connect("host_mysql","scott","tiger","city");

	rr = exec (db, "SET NAMES utf8");

	result = exec (db, "SELECT * FROM cities");

	if (result.rows == 0)
		{
		putStrLn("No results found!");
} else {
    for row in result.table {
	id = string(row[0]);
	name = string(row[1]);
	population = string(row[2]);
	date_mod = string(row[3]);
	putStr(id + "\t");
	putStr(name + "\t");
	putStr(population + "\t");
	putStr(date_mod + "\n");
	}
	}
	putStrLn("*** end ***");
	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
