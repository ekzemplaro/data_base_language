// ---------------------------------------------------------------
//	json_update.ts
//
//					Jul/28/2020
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/typescript_common/text_manipulate')

//
console.error ("*** 開始 ***")
var filename:string = process.argv[2]
var id_in:string = process.argv[3]
var population_in:number = parseInt(process.argv[4])

console.log (filename)
console.log (id_in + "\t" + population_in)

const json_str:string = fs.readFileSync(filename,'utf8')
var dict_aa:Object = JSON.parse (json_str)

const dict_bb = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

const json_str_out:string = JSON.stringify(dict_bb)

fs.writeFile (filename,json_str_out, function (err)
	{
	if (err) {
		console.log("Error on write: " + err)
		} else {
		console.log("File written.")
		}
	})

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
