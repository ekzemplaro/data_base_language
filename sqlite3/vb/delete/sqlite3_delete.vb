' -------------------------------------------------------------------
'
'	delete/sqlite3_delete.vb
'
'					Aug/25/2015
'
'
'
' -------------------------------------------------------------------
imports	System
imports Mono.Data.Sqlite

imports	System.Text
' -------------------------------------------------------------------
Module maria_delete

' -------------------------------------------------------------------
Sub Main ()
	Dim clArgs() As String = Environment.GetCommandLineArgs()
	Console.WriteLine ("*** 開始 ***")

	Dim file_sqlite3 as String = clArgs(1)
	Dim	id_in as String = clArgs(2)

	Dim str_connect as String = "Data Source = " + file_sqlite3 _
			+ ";UTF8Encoding=True;Version=3"

	Dim conn as SqliteConnection = new SqliteConnection (str_connect)


	conn.Open()


	Dim sb_sql as StringBuilder = new StringBuilder _
			("DELETE from cities WHERE ID = '" + id_in + "'")

	Dim str_sql as string = sb_sql.ToString ()

	
	Console.WriteLine (str_sql)

	Dim command as SqliteCommand = new SqliteCommand (str_sql,conn)
	command.ExecuteNonQuery ()

'	Dim rowsAffected as integer = command.ExecuteNonQuery ()
	
'	Console.WriteLine ("rowsAffected = " + rowsAffected);
'	Console.WriteLine (rowsAffected);


	conn.Close()
	console.writeLine("*** 終了 ***")
End Sub
' ----------------------------------------------------------------
End Module

' -------------------------------------------------------------------
