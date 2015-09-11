#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	cdb_create.js
//
//					Jun/17/2015
// --------------------------------------------------------------
importPackage (java.util)
importPackage (java.io)
importPackage (java.util)
 
importPackage (com.strangegizmo.cdb) 
// --------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

// --------------------------------------------------------------
print ("*** 開始 ***")

var file_cdb=arguments[0]

print (file_cdb)

var dict_aa = data_prepare_proc ()


var maker = new CdbMake()

for (var key in dict_aa)
	{

	var key_str =  key.toString ();
	print (key)
	var str_json = JSON.stringify (dict_aa[key])
	print (str_json)

//	key_str = new java.lang.String (key)
//	data_str = new java.lang.String (str_json)

//	var key_byte = get_byte (key)
	var key_byte = get_byte (key_str)
	var data_byte = get_byte (str_json.toString ())

//	print (data_byte)

//	maker.add (key_str.getBytes(), str_json.getBytes())

//	maker.add (key.getBytes(),data_byte)
	maker.add (key_byte,data_byte)
//	maker.add (key_byte,str_json)
//	maker.add (get_byte (key), get_byte (str_json))
	}

// dict_to_mcached_proc (server,port,dict_aa)

print ("*** 終了 ***")
 
// --------------------------------------------------------------
function get_byte (str_in)
{
	var bytes = []

	var utf8 = unescape(encodeURIComponent(str_in))

	for (var i = 0; i < utf8.length; ++i)
		{
		bytes.push (utf8.charCodeAt(i))
		}

	return bytes
}

// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t2761','豊中',35879,'1951-5-21')
	dict_aa = dict_append_proc (dict_aa,'t2762','池田',26357,'1951-8-15')
	dict_aa = dict_append_proc (dict_aa,'t2763','高槻',62941,'1951-1-2')
	dict_aa = dict_append_proc (dict_aa,'t2764','吹田',39124,'1951-6-22')
	dict_aa = dict_append_proc (dict_aa,'t2765','茨木',43792,'1951-8-14')
	dict_aa = dict_append_proc (dict_aa,'t2766','摂津',61524,'1951-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2767','泉大津',37981,'1951-3-21')
	dict_aa = dict_append_proc (dict_aa,'t2768','和泉',58416,'1951-7-26')
	dict_aa = dict_append_proc (dict_aa,'t2769','高石',72851,'1951-12-9')

	return	dict_aa
}
// --------------------------------------------------------------
