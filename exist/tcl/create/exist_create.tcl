#! /usr/bin/tclsh8.5
#
#	exist_read.tcl
#
#					Dec/26/2011
#
# ---------------------------------------------------------------
package require TclCurl
package require xml

source /var/www/data_base/common/tcl_common/show_xml.tcl
source /var/www/data_base/common/tcl_common/http_get.tcl

# ---------------------------------------------------------------
puts "*** 開始 ***"

set url_in http://localhost:8086/exist/rest/cities/cities.xml
set data_in [http_get $url_in]
#

set h {}
set parser [::xml::parser -parser tcl \
 -characterdatacommand "cdataCmd h" \
 -elementstartcommand "estartCmd h" \
 -elementendcommand "eendCmd h" \
 -defaultcommand defaultCmd \
]
$parser parse [encoding convertfrom utf-8 $data_in]
#

puts "*** 終了 ***"
# ---------------------------------------------------------------
