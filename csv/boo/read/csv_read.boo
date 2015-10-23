// ------------------------------------------------------------
//	csv_read.boo
//
//					Jul/30/2014
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
print '*** 開始 ***'
file_in = argv[0]

print file_in

dict_aa = text_manipulate.csv_read_proc (file_in)

print dict_aa.Count

text_manipulate.dict_display_proc (dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
