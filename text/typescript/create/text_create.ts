// ---------------------------------------------------------------
//	text_create.ts
//
//					Jul/14/2015
//
// ---------------------------------------------------------------
import fs = require("fs");
import text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");
//

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2381','名古屋',97514,'2012-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2382','豊橋',29137,'2012-3-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2383','岡崎',67241,'2012-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2384','一宮',32864,'2012-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2385','蒲郡',49178,'2012-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2386','常滑',65792,'2012-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2387','大府',37251,'2012-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2388','瀬戸',53486,'2012-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2389','犬山',21857,'2012-11-18');
	
	return	dict_aa;
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var file_out:string = process.argv[2];

dict_aa = data_prepare_proc ();
text_manipulate.dict_display_proc (dict_aa);

text_manipulate.text_write_proc (file_out,dict_aa);

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
