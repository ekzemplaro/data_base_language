// ---------------------------------------------------------------
//	json_create.ts
//
//					Jul/28/2020
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/typescript_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const filename:string =process.argv[2]

const dict_aa:Object  = data_prepare_proc ()

const json_str:string = JSON.stringify(dict_aa)

fs.writeFile (filename,json_str, function (err)
	{
	if (err) {
		console.log("Error on write: " + err)
		} else {
		console.log("File written.")
		}
	})

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0921','宇都宮',57214,'2012-4-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0922','小山',31857,'2012-7-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0923','佐野',68941,'2012-9-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0924','足利',31764,'2012-2-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0925','日光',49385,'2012-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0926','下野',65792,'2012-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0927','さくら',36251,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0928','矢板',52186,'2012-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0929','真岡',26857,'2012-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0930','栃木',41893,'2012-12-20')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0931','大田原',45289,'2012-2-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0932','鹿沼',92354,'2012-5-17')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0933','那須塩原',81567,'2012-6-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0934','那須烏山',72158,'2012-8-14')

	return	dict_aa
}

// ---------------------------------------------------------------

