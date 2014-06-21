#! /usr/bin/tclsh
# -*- coding: utf-8 -*-
#
#	couch_tcl_read.tcl
#
#					Dec/01/2010
#
# ---------------------------------------------------------------------
package require TclCurl
# ---------------------------------------------------------------------
proc http_get {url args} {
	set pairs {}
	foreach {name value} $args {
	lappend pairs "[curl::escape $name]=[curl::escape $value]"
	}
	append url ? [join $pairs &]

	set curlHandle [curl::init]
	$curlHandle configure -url $url -bodyvar html
	catch { $curlHandle perform } curlErrorNumber
	if { $curlErrorNumber != 0 } {
		error [curl::easystrerror $curlErrorNumber]
	}
	$curlHandle cleanup

	return $html
}

# ---------------------------------------------------------------------
puts "Content-type: text/json\n\n"
#
set data_in [http_get http://cdbd026:5984/city/cities]
puts $data_in
#
# ---------------------------------------------------------------------
