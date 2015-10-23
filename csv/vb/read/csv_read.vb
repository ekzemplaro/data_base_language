'------------------------------------------------------------------------
'	csv_read.vb
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
	console.writeLine (file_text)

	Dim dict_aa as Hashtable = text_to_dict_proc (file_text,",")

	dict_display_proc (dict_aa)

	console.writeLine("*** 終了 ***")
End Sub

'------------------------------------------------------------------------
End Module

'------------------------------------------------------------------------
