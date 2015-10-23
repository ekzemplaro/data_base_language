// ------------------------------------------------------------
//	csv_create.boo
//
//					Jul/30/2014
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1271','千葉','81436','1968-7-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1272','勝浦','59657','1968-3-27')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1273','市原','74593','1968-8-16')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1274','流山','56492','1968-9-23')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1275','八千代','43851','1968-3-9')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1276','我孫子','82136','1968-5-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1277','鴨川','51748','1968-2-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1278','銚子','94235','1968-4-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1279','市川','57341','1968-7-11')
	return	dict_aa
// ------------------------------------------------------------
print '*** 開始 ***'
file_out = argv[0]

dict_aa = data_prepare_proc ()

text_manipulate.csv_write_proc (file_out,dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
