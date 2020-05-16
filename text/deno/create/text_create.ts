// ---------------------------------------------------------------
//	text_create.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { text_write_proc } from "./text_manipulate.ts"
import { dict_append_proc } from "./text_manipulate.ts"
// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa : {[key: string]: any} = new Object()

	dict_aa = dict_append_proc (dict_aa,'t2381','名古屋',29514,'2012-5-12')
	dict_aa = dict_append_proc (dict_aa,'t2382','豊橋',47135,'2012-3-18')
	dict_aa = dict_append_proc (dict_aa,'t2383','岡崎',93241,'2012-10-4')
	dict_aa = dict_append_proc (dict_aa,'t2384','一宮',37864,'2012-6-22')
	dict_aa = dict_append_proc (dict_aa,'t2385','蒲郡',49178,'2012-8-14')
	dict_aa = dict_append_proc (dict_aa,'t2386','常滑',61792,'2012-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2387','大府',39251,'2012-3-21')
	dict_aa = dict_append_proc (dict_aa,'t2388','瀬戸',52486,'2012-7-26')
	dict_aa = dict_append_proc (dict_aa,'t2389','犬山',31859,'2012-11-11')
	
	return	dict_aa
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const file_out:string = Deno.args[0]

console.log (file_out)

const dict_aa = data_prepare_proc ()

text_write_proc (file_out,dict_aa)

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
