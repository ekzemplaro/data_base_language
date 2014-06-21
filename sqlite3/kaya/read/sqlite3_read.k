// -----------------------------------------------------------------
/*
	sqlite3_read.k

					Jan/28/2011
*/
// -----------------------------------------------------------------
program sqlite3_read;


import System;
import SQLiteDB;

// -----------------------------------------------------------------
Void main() {
    
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	args = getArgs ();

	sqlite3_file = args[1];

	putStrLn (sqlite3_file); 

	db = SQLiteDB::connect (sqlite3_file);

	result = exec (db, "SELECT * FROM cities");

	if (result.rows == 0)
		{
		putStrLn("No results found!");
		}
	else
		{
		for row in result.table
			{
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
