' -------------------------------------------------------------------
'
'	maria_create.vb
'
'					Aug/24/2015
'
'
'
' -------------------------------------------------------------------
imports	System
imports	System.Text
imports	MySql.Data.MySqlClient
Imports System.Collections

' -------------------------------------------------------------------
Module maria_create
' -------------------------------------------------------------------
Sub Main ()
	Console.WriteLine ("*** 開始 ***")

	Dim dict_aa as HashTable =  data_prepare_proc ()



	Dim server as String ="localhost"
	Dim str_db as String ="city"

	Dim str_connect as String = "Server=" + server + _
	";User Id=scott;Password=tiger;" + _
		"Database=" + str_db + ";"

	Dim conn as MySqlConnection = new MySqlConnection (str_connect)

	conn.Open ()
	table_drop_proc (conn)
	table_create_proc (conn)

	Dim Item As DictionaryEntry

	Dim delim as String = " "
	
	For Each Item In dict_aa
		Dim unit_aa As New Hashtable()
		unit_aa = Item.Value

		maria_insert_proc (conn,Item.key,unit_aa("name"), _
			unit_aa("population") ,unit_aa("date_mod"))
	next
	
	conn.Close ()
	Console.WriteLine ("*** 終了 ***")
End Sub


' -------------------------------------------------------------------
Sub table_drop_proc (conn as MySqlConnection)
	Dim sql_str_drop as String = "drop table cities"

	Dim command as MySqlCommand = new MySqlCommand (sql_str_drop,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Sub table_create_proc (conn as MySqlConnection)
	Dim sql_str_create as String = "create TABLE cities (" _
			+ "ID nvarchar(10) NOT NULL PRIMARY KEY," _
			+ "NAME nvarchar(20)," _
			+ "POPULATION int," _
			+ "DATE_MOD datetime)"

	Dim command as MySqlCommand = new MySqlCommand (sql_str_create,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Sub maria_insert_proc (conn as MySqlConnection,id_in as String,name as String, _
	population as String,str_date as String)
	Dim sql_str_insert as String = _
	"insert into cities (id, Name, Population, date_mod) values ('" _
		+ id_in + "','" _
		+ name + "'," _
		+ population + ",'" _
		+ str_date + "')"

	Dim command as MySqlCommand = new MySqlCommand (sql_str_insert,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Function data_prepare_proc () as Hashtable
	Dim dict_aa As New Hashtable()

	dict_aa ("t3321") = unit_gen_proc ("岡山","412975","1959-10-15")
	dict_aa ("t3322") = unit_gen_proc ("倉敷","897136","1959-11-21")
	dict_aa ("t3323") = unit_gen_proc ("津山","931465","1959-9-8")
	dict_aa ("t3324") = unit_gen_proc ("玉野","185723","1959-5-25")
	dict_aa ("t3325") = unit_gen_proc ("笠岡","923841","1959-8-14")
	dict_aa ("t3326") = unit_gen_proc ("井原","728314","1959-3-9")
	dict_aa ("t3327") = unit_gen_proc ("総社","536972","1959-7-12")
	dict_aa ("t3328") = unit_gen_proc ("高梁","657214","1959-5-24")
	dict_aa ("t3329") = unit_gen_proc ("新見","289451","1959-1-30")

	return	dict_aa
End Function
' -------------------------------------------------------------------
End Module
' -------------------------------------------------------------------
