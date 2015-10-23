'------------------------------------------------------------------------
'	text_update.vb
'
'						Apr/07/2015
'
'------------------------------------------------------------------------
Imports System.IO
Imports System.Collections

'------------------------------------------------------------------------
Module Module1

'------------------------------------------------------------------------
Sub Main()
	Dim clArgs() As String = Environment.GetCommandLineArgs()
	console.writeLine("*** 開始 ***")
	Dim file_text As String = clArgs(1)
	Dim key_in As String = clArgs(2)
	Dim population_in As String = clArgs(3)
	console.writeLine (file_text)
	console.writeLine (key_in)
	console.writeLine (population_in)

	Dim dict_aa as Hashtable = text_to_dict_proc (file_text,vbTab)

	if  dict_aa.ContainsKey (key_in) then
		dict_aa = dict_update_proc (dict_aa,key_in,population_in)
		dict_display_proc (dict_aa)
		dict_to_file_proc (dict_aa,file_text,vbTab)

	end if

	console.writeLine("*** 終了 ***")
End Sub

'------------------------------------------------------------------------
End Module

'------------------------------------------------------------------------
