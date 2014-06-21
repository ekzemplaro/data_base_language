// -----------------------------------------------------------------
/*
	sqlite3_delete.k

					Jun/09/2011
*/
// -----------------------------------------------------------------
program sqlite3_delete;


import System;
import SQLiteDB;

// -----------------------------------------------------------------
Void main() {
    
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	args = getArgs ();

	sqlite3_file = args[1];
	id_in = args[2];

	putStrLn (sqlite3_file); 
	putStrLn (id_in);

	db = SQLiteDB::connect (sqlite3_file);


	command = "delete from cities where ID = '" + id_in + "'";
	putStrLn	(command);

	result = exec (db, command);

	putStrLn("*** end ***");
	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
