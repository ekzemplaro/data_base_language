' ----------------------------------------------------------------
'
'	read/maria_read.vb
'
'					Aug/24/2015
'
'
' ----------------------------------------------------------------
imports System
imports MySql.Data.MySqlClient

' ----------------------------------------------------------------
Module maria_read

' ----------------------------------------------------------------
Sub Main ()
	console.writeLine("*** 開始 ***")

	Dim server as String ="localhost"
	Dim str_db as String ="city"

	Dim str_connect as String  = "Server=" + server +  _
		";User Id=scott;Password=tiger;Database=" + str_db + ";"

	Dim conn as MySqlConnection = new MySqlConnection (str_connect)

	conn.Open()

	Dim command as MySqlCommand = new MySqlCommand("select * from cities", conn)

	Dim dr as MySqlDataReader = command.ExecuteReader()

	Dim delim as String = vbTab

	While dr.Read()
		For it As Integer = 0 To (dr.FieldCount - 1) 
			console.write (dr.GetString(it))
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
