#! /usr/bin/tclsh8.5
#
#	riak_read.tcl
#
#					Aug/28/2013
#
# ---------------------------------------------------------------
package require TclCurl
package require json
#
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/http_get.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
set url_shimane http://localhost:8098/riak/shimane
set url_in $url_shimane?keys=true
#puts $url_in 
#
set str_json [http_get $url_in]
#
set data_aa [json::json2dict $str_json]
#
set keys [dict get $data_aa "keys"]
#puts $keys
#
set dict_aa [dict create]
foreach key $keys {
#	puts $key
	set url_single $url_shimane/$key
	set str_json [http_get $url_single]
#	puts $str_json
	set unit_aa [json::json2dict $str_json]
	set name [dict get $unit_aa "name"]
	set population [dict get $unit_aa "population"]
	set date_mod [dict get $unit_aa "date_mod"]
#	puts $name
	set dict_aa [dict_append_proc $dict_aa $key $name $population $date_mod]
	}
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
