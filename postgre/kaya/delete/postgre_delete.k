// -----------------------------------------------------------------
/*
	postgre_delete.k

					Oct/04/2011
*/
// -----------------------------------------------------------------
program postgre_delete;


import System;
import PostgresDB;

// -----------------------------------------------------------------
Void main() {
    
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	args = getArgs ();

	id_in = args[1];

	putStrLn (id_in);

	conninfo = "dbname='city' user='scott' password='tiger'";

	db = PostgresDB::connect(conninfo);

	command = "delete from cities where ID = '" + id_in + "'";

	putStrLn	(command);

	result = exec (db, command);

	putStrLn("*** end ***");
	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
