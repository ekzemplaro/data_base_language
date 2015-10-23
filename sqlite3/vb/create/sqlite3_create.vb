' -------------------------------------------------------------------
'
'	sqlite3_create.vb
'
'					Aug/25/2015
'
'
'
' -------------------------------------------------------------------
imports	System
imports	System.Text
Imports System.Collections
imports Mono.Data.Sqlite

' -------------------------------------------------------------------
Module sqlite3_create
' -------------------------------------------------------------------
Sub Main ()
	Dim clArgs() As String = Environment.GetCommandLineArgs()
	Console.WriteLine ("*** 開始 ***")

	Dim file_sqlite3 as String = clArgs(1)

	Dim dict_aa as HashTable =  data_prepare_proc ()

	Dim str_connect as String = "Data Source = " + file_sqlite3 _
			+ ";UTF8Encoding=True;Version=3"

	Dim conn as SqliteConnection = new SqliteConnection (str_connect)


	conn.Open ()
	table_drop_proc (conn)
	table_create_proc (conn)

	Dim Item As DictionaryEntry

	Dim delim as String = " "
	
	For Each Item In dict_aa
		Dim unit_aa As New Hashtable()
		unit_aa = Item.Value

		sqlite3_insert_proc (conn,Item.key,unit_aa("name"), _
			unit_aa("population") ,unit_aa("date_mod"))
	next
	
	conn.Close ()
	Console.WriteLine ("*** 終了 ***")
End Sub


' -------------------------------------------------------------------
Sub table_drop_proc (conn as SqliteConnection)
	Dim sql_str_drop as String = "drop table cities"

	Dim command as SqliteCommand = new SqliteCommand (sql_str_drop,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Sub table_create_proc (conn as SqliteConnection)
	Dim sql_str_create as String = "create TABLE cities (" _
			+ "ID nvarchar(10) NOT NULL PRIMARY KEY," _
			+ "NAME nvarchar(20)," _
			+ "POPULATION int," _
			+ "DATE_MOD datetime)"

	Dim command as SqliteCommand = new SqliteCommand (sql_str_create,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Sub sqlite3_insert_proc (conn as SqliteConnection,id_in as String,name as String, _
	population as String,str_date as String)

	Dim dt as DateTime = DateTime.Parse(str_date)
	Dim str_dt as String = dt.toString ("yyyy-MM-dd HH:mm:ss")
	Dim sql_str_insert as String = _
	"insert into cities (id, Name, Population, date_mod) values ('" _
		+ id_in + "','" _
		+ name + "'," _
		+ population + ",'" _
		+ str_dt + "')"

	Dim command as SqliteCommand = new SqliteCommand (sql_str_insert,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Function data_prepare_proc () as Hashtable
	Dim dict_aa As New Hashtable()

	dict_aa ("t0711") = unit_gen_proc ("郡山","41275","1959-8-5")
	dict_aa ("t0712") = unit_gen_proc ("会津若松","87136","1959-11-21")
	dict_aa ("t0713") = unit_gen_proc ("白河","93146","1959-9-8")
	dict_aa ("t0714") = unit_gen_proc ("福島","18523","1959-5-25")
	dict_aa ("t0715") = unit_gen_proc ("喜多方","93542","1959-8-14")
	dict_aa ("t0716") = unit_gen_proc ("二本松","72314","1959-3-9")
	dict_aa ("t0717") = unit_gen_proc ("いわき","53671","1959-7-12")
	dict_aa ("t0718") = unit_gen_proc ("相馬","65714","1959-5-24")
	dict_aa ("t0719") = unit_gen_proc ("須賀川","28451","1959-1-30")

	return	dict_aa
End Function
' -------------------------------------------------------------------
End Module
' -------------------------------------------------------------------
