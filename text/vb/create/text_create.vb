'------------------------------------------------------------------------
'	text_create.vb
'
'						Apr/07/2015
'
'------------------------------------------------------------------------
Imports System.IO
Imports System.Collections

Module Module_text
'------------------------------------------------------------------------
Function data_prepare_proc () as Hashtable
	Dim dict_aa As New Hashtable()

	dict_aa ("t2381") = unit_gen_proc ("名古屋","46975","1959-2-12")
	dict_aa ("t2382") = unit_gen_proc ("豊橋","82136","1959-8-21")
	dict_aa ("t2383") = unit_gen_proc ("岡崎","92465","1959-9-8")
	dict_aa ("t2384") = unit_gen_proc ("一宮","15723","1959-5-25")
	dict_aa ("t2385") = unit_gen_proc ("蒲郡","97841","1959-8-14")
	dict_aa ("t2386") = unit_gen_proc ("常滑","72314","1959-3-9")
	dict_aa ("t2387") = unit_gen_proc ("大府","53972","1959-7-12")
	dict_aa ("t2388") = unit_gen_proc ("瀬戸","65214","1959-5-24")
	dict_aa ("t2389") = unit_gen_proc ("犬山","28451","1959-1-30")

	return	dict_aa
End Function
'------------------------------------------------------------------------

Sub Main()
	Dim clArgs() As String = Environment.GetCommandLineArgs()
	console.writeLine ("*** 開始 ***")
	Dim file_text As String
	file_text = clArgs(1)
	console.writeLine (file_text)

	Dim dict_aa as HashTable =  data_prepare_proc ()
	dict_to_file_proc (dict_aa,file_text,vbTab)
 
	console.writeLine ("*** 終了 ***")
End Sub

'------------------------------------------------------------------------
End Module

'------------------------------------------------------------------------
