// ------------------------------------------------------------
//	csv_create.boo
//
//					Sep/27/2011
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t1271','千葉','82436','1968-7-21')
	dict_aa = dict_append_proc (dict_aa,'t1272','勝浦','52657','1968-3-27')
	dict_aa = dict_append_proc (dict_aa,'t1273','市原','34593','1968-8-16')
	dict_aa = dict_append_proc (dict_aa,'t1274','流山','52492','1968-9-23')
	dict_aa = dict_append_proc (dict_aa,'t1275','八千代','41851','1968-3-9')
	dict_aa = dict_append_proc (dict_aa,'t1276','我孫子','82536','1968-5-19')
	dict_aa = dict_append_proc (dict_aa,'t1277','鴨川','51748','1968-9-12')
	dict_aa = dict_append_proc (dict_aa,'t1278','銚子','94239','1968-8-18')
	dict_aa = dict_append_proc (dict_aa,'t1279','市川','57641','1968-7-11')
	return	dict_aa
// ------------------------------------------------------------
print '*** 開始 ***'
file_out = argv[0]

dict_aa = data_prepare_proc ()

csv_write_proc (file_out,dict_aa)


print '*** 終了 ***'
// ------------------------------------------------------------
