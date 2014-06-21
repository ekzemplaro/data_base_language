// -----------------------------------------------------------------
/*
	sqlite3_update.k

					Jun/09/2011
*/
// -----------------------------------------------------------------
program sqlite3_update;


import System;
import SQLiteDB;
import Time;

// -----------------------------------------------------------------
Void main() {
    
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	args = getArgs ();

	sqlite3_file = args[1];
	id_in = args[2];
	population_in = args[3];

	putStrLn (sqlite3_file); 
	putStrLn (id_in);
	putStrLn (population_in);

	db = SQLiteDB::connect (sqlite3_file);

	today = isoTime (now ());

	command = "update cities set POPULATION = " + population_in;
	command += ",DATE_MOD= '" + today + "' where ID = '" + id_in + "'";
	putStrLn	(command);

	result = exec (db, command);

	putStrLn("*** end ***");
	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
