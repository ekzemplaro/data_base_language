// -----------------------------------------------------------------
/*
	mysql_update.k

					Oct/04/2011
*/
// -----------------------------------------------------------------
program mysql_update;


import System;
import MyDB;
import Time;

// -----------------------------------------------------------------
Void main() {
    
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	args = getArgs ();

	id_in = args[1];
	population_in = args[2];

	putStrLn (id_in);
	putStrLn (population_in);

	db = MyDB::connect("host_mysql","scott","tiger","city");

	rr = exec (db, "SET NAMES utf8");

	today = isoTime (now ());

	command = "update cities set POPULATION = " + population_in;
	command += ",DATE_MOD= '" + today + "' where ID = '" + id_in + "'";
	putStrLn	(command);

	result = exec (db, command);

	putStrLn("*** end ***");
	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
