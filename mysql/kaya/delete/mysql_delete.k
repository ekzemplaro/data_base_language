// -----------------------------------------------------------------
/*
	mysql_delete.k

					Oct/04/2011
*/
// -----------------------------------------------------------------
program mysql_delete;


import System;
import MyDB;

// -----------------------------------------------------------------
Void main() {
    
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	args = getArgs ();

	id_in = args[1];

	putStrLn (id_in);

	db = MyDB::connect("host_mysql","scott","tiger","city");

	rr = exec (db, "SET NAMES utf8");

	command = "delete from cities where ID = '" + id_in + "'";

	putStrLn	(command);

	result = exec (db, command);

	putStrLn("*** end ***");
	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
