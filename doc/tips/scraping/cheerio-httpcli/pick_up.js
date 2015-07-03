#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	pick_up.js
//
//					Jun/26/2015
//
// ---------------------------------------------------------------
var fs = require("fs");
// ---------------------------------------------------------------
function write_proc (file_json,json_str)
{
fs.writeFile (file_json,json_str,function (err)
	{
	if (err) {
		console.log("Error on write: " + err)
		}
	else {
		fs.chmodSync (file_json,0666);
		console.log("File written.");
		console.log ("*** 終了 ***");
		}
	});
}

// ---------------------------------------------------------------

var file_html=process.argv[2];
var file_json=process.argv[3];

var url = 'http://localhost/tmp/' + file_html;

var client = require('cheerio-httpcli');

client.fetch (url,function (err, $, res) {

    // レスポンスヘッダを参照
// console.log(res.headers);

    // HTMLタイトルを表示
console.log($('title').text());

   // console.log($('body').text());

	console.log ("------");


	var count = 0;

	var array_out = new Array ();

    $('table tr').each(function() {

		var itd = 0;
		var record_array = new Array ();
		$(this).find("td").each (function (){
			record_array.push ($(this).text ());
			itd  += 1; 
		});

	//	console.log ("itd = " + itd);

		array_out.push (record_array);


	count += 1;
	});

	var json_str = JSON.stringify(array_out);
//	console.log (json_str);

	write_proc (file_json,json_str);

});
// ---------------------------------------------------------------
