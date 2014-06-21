// -----------------------------------------------------------------
/*
	postgre_read.k

					Jan/28/2011
*/
// -----------------------------------------------------------------
program postgre_read;


import PostgresDB;

// -----------------------------------------------------------------
Void main() {
    
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	conninfo = "dbname='city' user='scott' password='tiger'";

	db = PostgresDB::connect(conninfo);

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
