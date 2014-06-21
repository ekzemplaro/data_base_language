#! /usr/bin/tclsh8.5
#
#	couch_read.tcl
#
#					Sep/12/2013
#
# ---------------------------------------------------------------
package require TclCurl
package require json
#
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/http_get.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
set url_in http://host_dbase:5984/city/cities
#
set str_json [http_get $url_in]
set str_json [encoding convertfrom utf-8 $str_json]
#
set dict_aa [json::json2dict $str_json]
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
