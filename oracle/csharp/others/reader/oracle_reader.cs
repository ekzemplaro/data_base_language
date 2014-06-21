/* ---------------------------------------------------------------- */
/*
	reader/oracle_reader.cs

					Apr/02/2010

export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/client
export PATH=$ORACLE_HOME/bin:$PATH
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export NLS_LANG=japanese_japan.UTF8
export ORACLE_SID=XE
#
./oracle_reader.exe

*/
/* ---------------------------------------------------------------- */
using System;
using System.Data;
using System.Data.OracleClient;

/* ---------------------------------------------------------------- */
public static class oracle_reader
{
public static void Main (string[] args)
{
	OracleConnection conn = new OracleConnection ();

	conn.ConnectionString =
		"User Id=system;Password=hello9;Data Source=cpt003:1521/xe";
//		"User Id=system;Password=hello9;Data Source=spn109:1521/orcl";


Console.WriteLine("*** start ***");

	conn.Open();
    
Console.WriteLine("*** bbb ***");

	OracleCommand command = new OracleCommand("select * from cities", conn);

	OracleDataReader dr = command.ExecuteReader();

	while(dr.Read())
		{
		for (int it = 0; it < dr.FieldCount; it++)
			{
			Console.Write("{0} \t", dr[it]);
			}
		Console.WriteLine();
		}

	conn.Close();

Console.WriteLine("*** end ***");
}
/* ---------------------------------------------------------------- */
}
/* ---------------------------------------------------------------- */
