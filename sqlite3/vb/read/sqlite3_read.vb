' ----------------------------------------------------------------
'
'	read/sqlite3_read.vb
'
'					Aug/25/2015
'
'
' ----------------------------------------------------------------
imports System
imports Mono.Data.Sqlite

' ----------------------------------------------------------------
Module sqlite3_read

' ----------------------------------------------------------------
Sub Main ()
	Dim clArgs() As String = Environment.GetCommandLineArgs()
	console.writeLine("*** 開始 ***")

	Dim file_sqlite3 as String = clArgs(1)

	Dim str_connect as String = "Data Source = " + file_sqlite3 _
			+ ";UTF8Encoding=True;Version=3"


	Dim conn as SqliteConnection = new SqliteConnection (str_connect)

	conn.Open()

	Dim str_sql as String = "select id,name,population,date_mod from cities"
	Dim command as SqliteCommand = new SqliteCommand(str_sql, conn)

	Dim dr as SqliteDataReader = command.ExecuteReader()

	Dim delim as String = vbTab

	While dr.Read()
		For it As Integer = 0 To (dr.FieldCount - 1) 
			console.write (dr.GetValue(it).ToString ())
			console.write (delim)
		Next
		console.writeLine ()

	End While

	conn.Close()

	console.writeLine("*** 終了 ***")
End Sub
' ----------------------------------------------------------------
End Module
' ----------------------------------------------------------------
