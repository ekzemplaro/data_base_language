#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	couch_read.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------
print	("*** 開始 ***")

// url_in="http://host_couch:5984/city/cities"
url_in="http://172.20.129.189:5984/city/cities"
// lines = Http.get(url_in).split("\n")  
//lines = Http.readLines(url_in)
// lines = Http.get(url_in)
//lines = Http.get (url_in)

// http = new Http ()
// lines = http.get (url_in)
lines = Http ().get (url_in)
print (lines)
//lines.pop() // <-- last item is empty... EOF?  


// print (lines.length)  
// json_str = lines[0]
// json_str = lines

// var dict_aa = JSON.parse (json_str)

// text_manipulate.dict_display_proc (dict_aa)

print	("*** 終了 ***")

