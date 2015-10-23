// ----------------------------------------------------------------
/*
	read/oracle_read.cs

					Aug/17/2015

export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/client
export PATH=$ORACLE_HOME/bin:$PATH
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export NLS_LANG=japanese_japan.UTF8
export ORACLE_SID=XE

*/
// ----------------------------------------------------------------
using System;
using System.Data;
using System.Data.OracleClient;

// ----------------------------------------------------------------
public static class oracle_read
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string str_connect =
		"User Id=scott;Password=tiger;Data Source=host_oracle:1521/xe";

	string str_com = "select * from cities";

	OracleConnection connection = new OracleConnection (str_connect);

	OracleDataAdapter da_adapter = new OracleDataAdapter
			(str_com,str_connect);


	DataTable dtable = new DataTable ();

	connection.Open ();
	da_adapter.Fill (dtable);
	connection.Close ();

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
