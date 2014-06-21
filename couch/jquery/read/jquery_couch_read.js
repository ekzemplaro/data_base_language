// -----------------------------------------------------------------------
//	jquery/read/jquery_couch_read.js
//
//				Jun/11/2010
//
// -----------------------------------------------------------------------
//
//	export http_proxy=""
//	curl -X GET http://cdbd026:5984/city/cities
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** jquery_couch_read.js *** start ***");

//	var url_json = "http://172.20.128.169:5984/city/cities" + "?callback=?";
	var url_json = "http://cdbd026:5984/city/cities" + "?callback=?";

	jQuery("#outarea_bb").text ("url_json = " + url_json);
            
	show_json (url_json);
        
	jQuery("#outarea_hh").text ("*** jquery_couch_read.js *** end ***");

});

// -----------------------------------------------------------------------
