// ------------------------------------------------------------------
//	ftp_read.boo
//
//					Mar/12/2013
//
// ------------------------------------------------------------------
import	System

// ------------------------------------------------------------------

print "*** 開始 ***"

url_in = "ftp://host_dbase/city/iwate.json"
user = "scott"
passwd = "tiger"

str_json = ftp_manipulate.ftp_to_str_proc (url_in,user,passwd)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

text_manipulate.dict_display_proc (dict_aa)

print "*** 終了 ***"

// ------------------------------------------------------------------
