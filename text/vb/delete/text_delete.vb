'------------------------------------------------------------------------
'	text_delete.vb
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
	console.writeLine (file_text)
	console.writeLine (key_in)

	Dim dict_aa as Hashtable = text_to_dict_proc (file_text,vbTab)

	if  dict_aa.ContainsKey (key_in) then
		dict_aa.Remove (key_in)
		dict_display_proc (dict_aa)
		dict_to_file_proc (dict_aa,file_text,vbTab)
	end if


	console.writeLine("*** 終了 ***")
End Sub

'------------------------------------------------------------------------
End Module

'------------------------------------------------------------------------
