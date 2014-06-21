#
#	tcl_common/http_get.tcl
#
#					Oct/13/2011
#
# ---------------------------------------------------------------
package require TclCurl

# ---------------------------------------------------------------
proc http_get {url_in} {
#
	set curlHandle [curl::init]
	$curlHandle configure -url $url_in -bodyvar html
	catch { $curlHandle perform } curlErrorNumber
	if { $curlErrorNumber != 0 } {
		error [curl::easystrerror $curlErrorNumber]
	}
	$curlHandle cleanup

	return $html
}

# ---------------------------------------------------------------
