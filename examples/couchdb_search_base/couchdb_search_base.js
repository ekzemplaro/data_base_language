// -----------------------------------------------------------------------
//	couchdb_search.js
//
//					Jul/01/2014
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** couchdb_search *** start *** Jul/01/2014 ***");

	table_display_proc ('Japanese');

	click_monitor_proc ();

	jQuery("#outarea_hh").html
		("*** couchdb_search *** end *** Jul/01/2014 ***");
});

// -----------------------------------------------------------------------
// [4]:
function table_display_proc (language)
{
	jQuery("#result_aa").html ('<h2>' + language + '</h2>');

	var url_couchdb = 'http://localhost:5984/librivox/_design/myapp/_view/ex02?key="' + language + '"';

	var url_proxy = "./php_proxy_get.php"  + '?url=' + url_couchdb;
//	var url_proxy = url_couchdb;

	jQuery.getJSON (url_proxy,function (data_json)
		{
		var str_out = "<table>";
		for (var it in data_json.rows)
			{
			str_out += "<tr>";
			var value = data_json.rows[it];
			var icount = parseInt (it,10) + 1;
			str_out += '<td>' + String (icount) + '</td>';
			str_out += '<td>' + value.id + '</td>';
			str_out += '<td>' + value.value + '</td>';
			str_out += "</tr>";
			}
		str_out += "</table>";
		jQuery(".contents").html (str_out);
		});
}

// -----------------------------------------------------------------------
// [8]:
function click_monitor_proc ()
{
	jQuery ("button.filter").on ('click', function ()
		{
		jQuery ("button.filter").css ("color","black");
		jQuery ("button#" + this.id).css ("color","blue");

		var name_class = "";
		key = this.id;
		name_class = jQuery(this).attr("class");
		var str_tmp = key + "<br>";
		str_tmp += name_class + "<br>"; 
		jQuery ("#outarea_bb").html (str_tmp);
		if (name_class === "filter")
			{
			jQuery (".contents").html ("<br />");
			table_display_proc (key);
			}
		});
}

// -----------------------------------------------------------------------
