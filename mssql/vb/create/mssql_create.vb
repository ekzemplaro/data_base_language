' -------------------------------------------------------------------
'
'	mssql_create.vb
'
'					Aug/24/2015
'
'
'
' -------------------------------------------------------------------
imports	System
imports	System.Text
imports	System.Data.SqlClient
Imports System.Collections

' -------------------------------------------------------------------
Module mssql_create
' -------------------------------------------------------------------
Sub Main ()
	Console.WriteLine ("*** 開始 ***")

	Dim dict_aa as HashTable =  data_prepare_proc ()

	Dim server as String ="host_mssql"
	Dim str_db as String ="city"

	Dim str_connect as String = "server=" + server + ";" _
			+ "uid=sa;" _
			+ "pwd=scott_tiger;" _
			+ "database=" + str_db

	Dim conn as SqlConnection = new SqlConnection (str_connect)

	conn.Open ()
	table_drop_proc (conn)
	table_create_proc (conn)

	Dim Item As DictionaryEntry

	Dim delim as String = " "
	
	For Each Item In dict_aa
		Dim unit_aa As New Hashtable()
		unit_aa = Item.Value

		mssql_insert_proc (conn,Item.key,unit_aa("name"), _
			unit_aa("population") ,unit_aa("date_mod"))
	next
	
	conn.Close ()
	Console.WriteLine ("*** 終了 ***")
End Sub
' -------------------------------------------------------------------
Sub table_drop_proc (conn as SqlConnection)
	Dim sql_str_drop as String = "drop table cities"

	Dim command as SqlCommand = new SqlCommand (sql_str_drop,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Sub table_create_proc (conn as SqlConnection)
	Dim sql_str_create as String = "create TABLE cities (" _
			+ "ID nvarchar(10) NOT NULL PRIMARY KEY," _
			+ "NAME nvarchar(20)," _
			+ "POPULATION int," _
			+ "DATE_MOD datetime)"

	Dim command as SqlCommand = new SqlCommand (sql_str_create,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Sub mssql_insert_proc (conn as SqlConnection,id_in as String,name as String, _
	population as String,str_date as String)
	Dim sql_str_insert as String = _
	"insert into cities (id, Name, Population, date_mod) values ('" _
		+ id_in + "','" _
		+ name + "'," _
		+ population + ",'" _
		+ str_date + "')"

	Dim command as SqlCommand = new SqlCommand (sql_str_insert,conn)

	command.ExecuteNonQuery ()

End Sub
' -------------------------------------------------------------------
Function data_prepare_proc () as Hashtable

	Dim dict_aa As New Hashtable()

	dict_aa ("t1071") = unit_gen_proc ("前橋","48975","1959-6-22")
	dict_aa ("t1072") = unit_gen_proc ("高崎","82136","1959-5-21")
	dict_aa ("t1073") = unit_gen_proc ("桐生","93465","1959-4-8")
	dict_aa ("t1074") = unit_gen_proc ("沼田","14723","1959-2-25")
	dict_aa ("t1075") = unit_gen_proc ("伊勢崎","97841","1959-8-14")
	dict_aa ("t1076") = unit_gen_proc ("水上","72314","1959-3-9")
	dict_aa ("t1077") = unit_gen_proc ("太田","53972","1959-7-12")
	dict_aa ("t1078") = unit_gen_proc ("安中","65214","1959-5-24")
	dict_aa ("t1079") = unit_gen_proc ("みどり","27451","1959-1-30")

	return	dict_aa

End Function


' -------------------------------------------------------------------
End Module
' -------------------------------------------------------------------
