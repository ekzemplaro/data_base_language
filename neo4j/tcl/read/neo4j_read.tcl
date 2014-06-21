#! /usr/bin/tclsh8.5
#
#	neo4j_read.tcl
#
#					Oct/13/2011
#
# ---------------------------------------------------------------
package require TclCurl
package require json
#
source /var/www/data_base/common/tcl_common/http_get.tcl
# ---------------------------------------------------------------
proc show_json {data_in} {
	set city [json::json2dict $data_in]
	set id [dict get $city id]
	set name [dict get $city name]
	set population [dict get $city population]
	set date_mod [dict get $city date_mod]
	puts [format "%s\t%s\t%s\t%s" $id $name $population $date_mod]
}
#

# ---------------------------------------------------------------
proc row_parser {key} {
	set url_in [format "http://localhost:7474/db/data/node/%d/properties" $key
		]
#
	set data_in [http_get $url_in]
#
	show_json [encoding convertfrom utf-8 $data_in]
}

# ---------------------------------------------------------------
puts "*** 開始 ***"
#source /var/www/data_base/common/tcl_common/show_json.tcl
#
foreach key {31 32 33 34 35 36 37 38 39} {
	row_parser $key
	}
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
