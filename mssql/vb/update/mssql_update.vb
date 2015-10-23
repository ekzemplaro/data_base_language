' -------------------------------------------------------------------
'
'	update/mssql_update.vb
'
'					Aug/24/2015
'
'
'
' -------------------------------------------------------------------
imports	System
imports	System.Data.SqlClient
imports	System.Text

' -------------------------------------------------------------------
Module mssql_update

' -------------------------------------------------------------------
Sub Main ()
	Dim clArgs() As String = Environment.GetCommandLineArgs()
	Console.WriteLine ("*** 開始 ***")

	Dim key_in as String = clArgs(1)
	Dim population_in as String = clArgs(2)

	Console.WriteLine (key_in + vbTab + population_in)

	Dim server as String ="host_mssql"
	Dim str_db as String ="city"

	Dim str_connect as String = "server=" + server + ";" _
			+ "uid=sa;" _
			+ "pwd=scott_tiger;" _
			+ "database=" + str_db

	Dim conn as SqlConnection = new SqlConnection (str_connect)

	Dim dateNow as DateTime = DateTime.Now
	Dim str_date as String = dateNow.ToString ()

	Dim sb_sql as StringBuilder = new StringBuilder _
			("UPDATE cities SET population = " _
			+ population_in + " , date_mod = '" + str_date + _
			"' WHERE id = '" + key_in + "'")

	Dim str_sql as String = sb_sql.ToString ()

	Console.WriteLine (str_sql)

	conn.Open()

	Dim command as SqlCommand = new SqlCommand (str_sql, conn)

	command.ExecuteNonQuery ()

	conn.Close ()

	Console.WriteLine ("*** 終了 ***")

End Sub
' ---------------------------------------------------------------
End Module
' ---------------------------------------------------------------

' -------------------------------------------------------------------
