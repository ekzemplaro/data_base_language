// ---------------------------------------------------------------
//	csv_create.ts
//
//					May/05/2015
//
// ---------------------------------------------------------------

var text_manipulate=require ("/var/www/data_base/common/typescript_common/text_manipulate")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1271','千葉',67214,'2012-5-16')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1272','勝浦',29837,'2012-4-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1273','市原',97641,'2012-3-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1274','流山',32964,'2012-12-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1275','八千代',49578,'2012-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1276','我孫子',65192,'2012-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1277','鴨川',38451,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1278','銚子',51986,'2012-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1279','市川',29357,'2012-11-15')
	
	return	dict_aa
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const file_out:string = process.argv[2]

const dict_aa: Object = data_prepare_proc ()

text_manipulate.csv_write_proc (file_out,dict_aa)

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
