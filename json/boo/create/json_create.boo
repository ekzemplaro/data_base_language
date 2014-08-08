// ------------------------------------------------------------
//	json_create.boo
//
//					Jul/04/2014
//
// ------------------------------------------------------------
import System

import Newtonsoft.Json
// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0921','宇都宮','79436','1968-7-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0922','小山','58157','1968-10-27')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0923','佐野','34593','1968-5-16')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0924','足利','52492','1968-9-23')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0925','日光','41851','1968-3-9')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0926','下野','82763','1968-5-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0927','さくら','51748','1968-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0928','矢板','94795','1968-8-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0929','真岡','57863','1968-2-11')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0930','栃木','89613','1968-7-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0931','大田原','57863','1968-9-25')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0932','鹿沼','69135','1968-2-28')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0933','那須塩原','87624','1968-3-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0934','那須烏山','39561','1968-8-7')
	return	dict_aa
// ------------------------------------------------------------
print '*** 開始 ***'
file_json = argv[0]

dict_aa = data_prepare_proc ()
str_json_out = JsonConvert.SerializeObject (dict_aa)

file_io.file_write_proc (file_json,str_json_out)

print '*** 終了 ***'
// ------------------------------------------------------------
