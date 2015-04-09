'------------------------------------------------------------------------
'	vb_common/text_manipulate.vb
'
'						Apr/07/2015
'
'------------------------------------------------------------------------
Imports System.IO
Imports System.Collections

Module Module_text
'------------------------------------------------------------------------
public Function unit_gen_proc _
	(name as String,population as String,date_mod as String) as Hashtable
	Dim unit_aa As New Hashtable()
	unit_aa("name") = name
	unit_aa("population") = population
	unit_aa("date_mod") = date_mod
	return	unit_aa
End Function
'------------------------------------------------------------------------
public Sub dict_to_file_proc _
	(dict_aa as HashTable,file_text as String,delim as String)
	Dim Writer As New IO.StreamWriter(file_text)

	Dim Item As DictionaryEntry
	For Each Item In dict_aa
		Dim unit_aa As New Hashtable()
		unit_aa = Item.Value

		Dim str_out as String
		str_out = Item.key + delim
		str_out += unit_aa("name") + delim
		str_out += unit_aa("population") + delim
		str_out += unit_aa("date_mod")
		Writer.WriteLine (str_out)
	next
	
	Writer.Close()
End Sub
'------------------------------------------------------------------------
Sub dict_display_proc (dict_aa as HashTable)
	Dim Item As DictionaryEntry
	Dim delim as String = vbTab
	For Each Item In dict_aa
		console.write (Item.key + delim)
		Dim unit_aa As New Hashtable()
		unit_aa = Item.Value
		console.write (unit_aa("name") + delim)
		console.write (unit_aa("population")  + delim)
		console.writeLine (unit_aa("date_mod"))
	next

End Sub
'------------------------------------------------------------------------
Function text_to_dict_proc (file_text as String,delim as String) as Hashtable
	Dim oReader As New StreamReader(file_text)
	Dim sLine As String = Nothing
	Dim dict_aa As New Hashtable()

 
	While Not oReader.EndOfStream
		sLine = oReader.ReadLine()
		Dim cols () as String = split (sLine,delim)
		if 3 < cols.length then
			Dim unit_aa As New Hashtable()
			unit_aa("name") = cols(1)
			unit_aa("population") = cols(2)
			unit_aa("date_mod") = cols(3)
			dict_aa(cols(0)) = unit_aa
		end if
	End While
 
	oReader.Close()

	return	dict_aa
End Function
'------------------------------------------------------------------------
Function dict_update_proc (dict_aa as Hashtable,key_in as String,population_in as String) as Hashtable
	Dim dateNow as DateTime = DateTime.Now
	Dim str_date as String = dateNow.ToString ()

	dict_aa(key_in)("population") = population_in
	dict_aa(key_in)("date_mod") = str_date

	return	dict_aa
End Function
'------------------------------------------------------------------------
End Module
'------------------------------------------------------------------------
