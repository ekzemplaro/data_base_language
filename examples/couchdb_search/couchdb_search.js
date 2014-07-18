// -----------------------------------------------------------------------
//	couchdb_search.js
//
//					Jul/10/2014
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** couchdb_search *** start *** Jul/10/2014 ***");

	table_display_proc ('Japanese');

	click_monitor_proc ();

	jQuery("#outarea_hh").html
		("*** couchdb_search *** end *** Jul/10/2014 ***");
});

// -----------------------------------------------------------------------
// [6]:
function table_display_proc (language)
{
	jQuery("#result_aa").html ('<h2>' + language + '</h2>');

	var url_db = 'http://localhost:5984/librivox';
	var url_proxy = "./php_proxy_get.php"  + '?url=' + url_db;

	var path_view = '/_design/myapp3/_view/ex03?key="' + language + '"';

	var url_view = url_proxy + path_view;

	jQuery.getJSON (url_view,function (data_json)
		{
		var str_out = "<table>";

		for (var it in data_json.rows)
			{
			var id =  data_json.rows[it].id;
			var value = data_json.rows[it].value;
			str_out += row_data_gen_proc (it,id,value);
			}

		str_out += "</table>";

		jQuery(".contents").html (str_out);
		});
}

// -----------------------------------------------------------------------
// [6-6]:
function row_data_gen_proc (it,id,unit_in)
{
	str_out = "<tr>";
	str_out += '<td>' + it + '</td>';
	str_out += '<td>' + id + '</td>';
	str_out += '<td>' + unit_in.title + '</td>';

	str_out += '<td>';
	if (unit_in.hasOwnProperty('publicdate'))
			{
			str_out += unit_in.publicdate;
			}
		else
			{
			str_out += '<br />';
			}
		str_out += '</td>';

		str_out += '<td>';
		if (unit_in.hasOwnProperty('totaltime'))
			{
			str_out += unit_in.totaltime;
			}
		else
			{
			str_out += '<br />';
			}
		str_out += '</td>';

	str_out += "</tr>";

	return	str_out;
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
