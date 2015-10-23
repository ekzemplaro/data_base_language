' -------------------------------------------------------------------
'
'	deletee/maria_delete.vb
'
'					Aug/24/2015
'
'
'
' -------------------------------------------------------------------
imports	System
imports	MySql.Data.MySqlClient

imports	System.Text
' -------------------------------------------------------------------
Module maria_delete

' -------------------------------------------------------------------
Sub Main ()
	Dim clArgs() As String = Environment.GetCommandLineArgs()
	Console.WriteLine ("*** 開始 ***")

	Dim	id_in as String = clArgs(1)

	Dim server as String ="localhost"
	Dim str_db as String ="city"

	Dim str_connect as String  = "Server=" + server +  _
		";User Id=scott;Password=tiger;Database=" + str_db + ";"

	Dim conn as MySqlConnection = new MySqlConnection (str_connect)

	conn.Open()


	Dim sb_sql as StringBuilder = new StringBuilder _
			("DELETE from cities WHERE ID = '" + id_in + "'")

	Dim str_sql as string = sb_sql.ToString ()

	
	Console.WriteLine (str_sql)

	Dim command as MySqlCommand = new MySqlCommand (str_sql,conn)
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
