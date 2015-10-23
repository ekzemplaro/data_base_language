'------------------------------------------------------------------------
'	csv_create.vb
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

	dict_aa ("t1271") = unit_gen_proc ("千葉","46175","1959-9-24")
	dict_aa ("t1272") = unit_gen_proc ("勝浦","82536","1959-1-18")
	dict_aa ("t1273") = unit_gen_proc ("市原","92365","1959-5-9")
	dict_aa ("t1274") = unit_gen_proc ("流山","15823","1959-7-15")
	dict_aa ("t1275") = unit_gen_proc ("八千代","97241","1959-6-24")
	dict_aa ("t1276") = unit_gen_proc ("我孫子","72614","1959-4-12")
	dict_aa ("t1277") = unit_gen_proc ("鴨川","53472","1959-7-18")
	dict_aa ("t1278") = unit_gen_proc ("銚子","65814","1959-5-21")
	dict_aa ("t1279") = unit_gen_proc ("市川","28951","1959-1-20")

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
	dict_to_file_proc (dict_aa,file_text,",")
 
	console.writeLine ("*** 終了 ***")
End Sub

'------------------------------------------------------------------------
End Module

'------------------------------------------------------------------------
