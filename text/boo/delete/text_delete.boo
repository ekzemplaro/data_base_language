// ------------------------------------------------------------
//	text_delete.boo
//
//					Jul/30/2014
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
print '*** 開始 ***'
file_txt = argv[0]
key_in = argv[1]

print file_txt
print key_in

dict_aa = text_manipulate.text_read_proc (file_txt)

print dict_aa.Count

if dict_aa.ContainsKey (key_in):
	dict_aa.Remove (key_in)
	print dict_aa.Count
	text_manipulate.text_write_proc (file_txt,dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
