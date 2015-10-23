// -----------------------------------------------------------------------
//	read/jquery_only_read.js
//
//					Oct/12/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** jquery_only_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var url_json;

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	switch (dbase)
		{
		case	"master":
			var url_xml = "xml_file/miyagi.xml";
			xml_read_proc (url_xml);
			break;

		case	"text":
			text_read_proc ("cities.txt");
			break;

		case	"xml":
			var url_xml = "cities.xml";
			xml_read_proc (url_xml);
			break;

		case	"json":
			url_json = "cities.json";
			show_json (url_json);
			break;


		case	"xindice":
	var url_in = 'http://cdbd026:8888/xindice/db/cities/cities';
	var url_proxy = "php_proxy_get.php" + '?url=' + url_in;
			xml_read_proc (url_proxy);
			break;

		case	"exist":
	var url_in = 'http://localhost:8086/exist/rest/db/cities/cities.xml';
	var url_proxy = "php_proxy_get.php" + '?url=' + url_in;
			xml_read_proc (url_proxy);
			break;

		case	"basex":
	var url_in = 'http://admin:admin@localhost:8984/rest/cities?query=/';
	var url_proxy = "php_proxy_get.php" + '?url=' + url_in;
			xml_read_proc (url_proxy);
			break;

		case	"dbxml":
			break;

		case	"tcbn":
			jQuery("#outarea_gg").text ("*** tcbn ***");
			var $url_in = 'http://cdbd026:5984/city/cities';
	var url_proxy = "php_proxy_get.php" + '?url=' + $url_in;
			json_read_proc (url_proxy);
//			show_json (url_proxy);
			break;

		case	"couch":
			url_json = "http://cddn007:5984/city/cities?callback=?";
//			url_json = "http://host_dbase:5984/city/cities?callback=?";
			show_json (url_json);
			break;

		case	"ftp":
			url_in = 'ftp://scott:tiger@host_dbase/city/iwate.json';
			var url_proxy = "php_proxy_get.php" + '?url=' + url_in;
			show_json (url_proxy);
			break;

		case	"webdav":
		var	url_in = "http://host_dbase:3004/city/tokyo.json";
	var url_proxy = "php_proxy_get.php" + '?url=' + url_in;
			show_json (url_proxy);
			break;

		case	"mongo":
		case	"cassandra":
			var url_xml = "xml_file/kanagawa.xml";
			xml_read_proc (url_xml);
			break;


		}

//	jQuery("#outarea_ee").text ("url_json = " + url_json);



	});


	jQuery("#outarea_hh").text ("*** end *** jquery_jaxer_read.js ***");
});

// -----------------------------------------------------------------------
