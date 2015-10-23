// -----------------------------------------------------------------
/*
	postgre_update.k

					Oct/04/2011
*/
// -----------------------------------------------------------------
program postgre_update;


import System;
import PostgresDB;
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

	conninfo = "dbname='city' user='scott' password='tiger'";

	db = PostgresDB::connect(conninfo);


	today = isoTime (now ());

	command = "update cities set POPULATION = " + population_in;
	command += ",DATE_MOD= '" + today + "' where ID = '" + id_in + "'";
	putStrLn	(command);

	result = exec (db, command);

	putStrLn("*** end ***");
	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
