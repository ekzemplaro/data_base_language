// ------------------------------------------------------------
//	csv_delete.boo
//
//						Apr/22/2011
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
print '*** 開始 ***'
file_txt = argv[0]
id_in = argv[1]

print file_txt
print id_in

dict_aa = csv_read_proc (file_txt)

print dict_aa.Count

dict_aa.Remove (id_in)
print dict_aa.Count

dict_display_proc (dict_aa)

csv_write_proc (file_txt,dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
