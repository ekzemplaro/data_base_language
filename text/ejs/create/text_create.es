#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	text_create.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2381','名古屋',89261,'1952-7-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2382','豊橋',21537,'1952-11-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2383','岡崎',68741,'1952-5-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2384','一宮',34734,'1952-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2385','蒲郡',45352,'1952-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2386','常滑',61482,'1952-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2387','大府',35291,'1952-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2388','瀬戸',58276,'1952-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2389','犬山',27457,'1952-10-2')

	return	dict_aa
}

// ------------------------------------------------------------------
print	("*** 開始 ***")
var file_out = App.args[1]

var dict_aa = data_prepare_proc ()
text_manipulate.dict_display_proc (dict_aa)
text_manipulate.text_write_proc (file_out,dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
