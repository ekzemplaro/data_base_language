' ---------------------------------------------------------------
'
'	read/mssql_read.vb
'
'					Aug/24/2015
'
' ---------------------------------------------------------------
imports System
imports System.Text
imports System.Data.SqlClient

Module mssql_read
' ---------------------------------------------------------------
Sub Main ()

	Console.WriteLine("*** 開始 ***")

	Dim server as String ="host_mssql"
	Dim str_db as String ="city"

	Dim str_connect as String = "server=host_mssql;" _
			+ "uid=sa;" _
			+ "pwd=scott_tiger;" _
			+ "database=city"


	Dim conn as SqlConnection = new SqlConnection (str_connect)

	conn.Open()

	Dim str_sql as String = "Select id,name,population,date_mod From cities"

	Dim command as SqlCommand = new SqlCommand (str_sql, conn)

	Dim dr as SqlDataReader = command.ExecuteReader()

	Dim delim as String = vbTab

	While dr.Read()
		For it As Integer = 0 To (dr.FieldCount - 1) 
			Console.Write (dr.GetValue(it).ToString ())
			Console.Write (delim)
		Next
		Console.WriteLine ()

	End While

	conn.Close ()

	Console.WriteLine ("*** 終了 ***")

End Sub
' ---------------------------------------------------------------
End Module
' ---------------------------------------------------------------
