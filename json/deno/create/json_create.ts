// ---------------------------------------------------------------
//	json_create.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { writeFileStrSync } from "https://deno.land/std/fs/write_file_str.ts"
import { dict_append_proc } from "./text_manipulate.ts"
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const file_out:string =Deno.args[0]

const dict_aa:Object  = data_prepare_proc ()

const json_str:string = JSON.stringify(dict_aa)

writeFileStrSync (file_out,json_str)



console.log ("*** 終了 ***")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa : {[key: string]: any} = new Object()

	dict_aa = dict_append_proc (dict_aa,'t0921','宇都宮',57214,'2014-3-12')
	dict_aa = dict_append_proc (dict_aa,'t0922','小山',31857,'2014-9-15')
	dict_aa = dict_append_proc (dict_aa,'t0923','佐野',68941,'2014-2-2')
	dict_aa = dict_append_proc (dict_aa,'t0924','足利',31764,'2014-8-22')
	dict_aa = dict_append_proc (dict_aa,'t0925','日光',49385,'2014-1-14')
	dict_aa = dict_append_proc (dict_aa,'t0926','下野',65792,'2014-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0927','さくら',36251,'2014-5-21')
	dict_aa = dict_append_proc (dict_aa,'t0928','矢板',52186,'2014-7-26')
	dict_aa = dict_append_proc (dict_aa,'t0929','真岡',26857,'2014-10-2')
	dict_aa = dict_append_proc (dict_aa,'t0930','栃木',41893,'2014-12-20')
	dict_aa = dict_append_proc (dict_aa,'t0931','大田原',45189,'2014-2-7')
	dict_aa = dict_append_proc (dict_aa,'t0932','鹿沼',92351,'2014-5-17')
	dict_aa = dict_append_proc (dict_aa,'t0933','那須塩原',71564,'2014-6-19')
	dict_aa = dict_append_proc (dict_aa,'t0934','那須烏山',32159,'2014-8-14')

	return	dict_aa
}

// ---------------------------------------------------------------

