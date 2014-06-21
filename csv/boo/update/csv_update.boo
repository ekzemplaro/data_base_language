// ------------------------------------------------------------
//	csv_update.boo
//
//						Apr/22/2011
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
print '*** 開始 ***'
file_txt = argv[0]
id_in = argv[1]
population_in = argv[2]

print file_txt
print id_in,population_in

dict_aa = csv_read_proc (file_txt)

print dict_aa.Count

dict_update_proc (dict_aa,id_in,population_in)

dict_display_proc (dict_aa)

csv_write_proc (file_txt,dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
