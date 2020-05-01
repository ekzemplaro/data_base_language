// ---------------------------------------------------------------
//	text_create.ts
//
//					May/01/2020
//
// ---------------------------------------------------------------
var text_manipulate=require ("/var/www/data_base/common/typescript_common/text_manipulate")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2381','名古屋',27514,'2012-6-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2382','豊橋',49138,'2012-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2383','岡崎',97241,'2012-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2384','一宮',32864,'2012-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2385','蒲郡',49178,'2012-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2386','常滑',65792,'2012-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2387','大府',37251,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2388','瀬戸',59486,'2012-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2389','犬山',21854,'2012-11-15')
	
	return	dict_aa
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

var file_out:string = process.argv[2]

var dict_aa = data_prepare_proc ()

text_manipulate.text_write_proc (file_out,dict_aa)

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
