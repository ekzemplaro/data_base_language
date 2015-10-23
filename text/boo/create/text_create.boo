// ------------------------------------------------------------
//	text_create.boo
//
//					Jul/30/2014
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2381','名古屋','72436','1968-7-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2382','豊橋','58157','1968-10-27')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2383','岡崎','34593','1968-5-16')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2384','一宮','72492','1968-9-23')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2385','蒲郡','43851','1968-3-9')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2386','常滑','82763','1968-5-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2387','大府','51948','1968-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2388','瀬戸','94235','1968-8-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2389','犬山','57813','1968-2-11')
	return	dict_aa
// ------------------------------------------------------------
print '*** 開始 ***'
file_out = argv[0]

dict_aa = data_prepare_proc ()

text_manipulate.text_write_proc (file_out,dict_aa)


print '*** 終了 ***'
// ------------------------------------------------------------
