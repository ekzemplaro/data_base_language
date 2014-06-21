// -----------------------------------------------------------------------
//	js/show_json.js
//
//					Jul/15/2013
// -----------------------------------------------------------------------
function show_json (url_json)
{
// if (url_json == "undefined")
{
var str_tmp = "*** show_json *** bbb ***<br />";
str_tmp += url_json + "<br />";
jQuery("#outarea_bb").html (str_tmp);
}
	jQuery.getJSON (url_json,function (data_json)
		{

		var out_str = "<table border=\"1\">";

		var keylist=new Array ();
		for(var it in data_json)
			{
 			keylist.push(it);
			};

		keylist.sort();

		for (var it in keylist)
			{
			id = keylist[it];
			var city = data_json[id];
			if ((id != "_id") && (id != "_rev"))
				{
				out_str += "<tr><td>" + id;
				out_str += "</td><td>" + city.name;
				out_str += "</td><td>" + city.population;
				out_str += "</td><td>" + city.date_mod;
				out_str += "</td></tr>";
				}
			}
		out_str += "</table>";

		jQuery("#result_aa").html (out_str);

		delete keylist;
		delete out_str;
		delete data_json;
		});
}

// -----------------------------------------------------------------------
function initialize_proc (url_create,url_read)
{
	jQuery("#outarea_gg").text ("*** initialize_proc ***");

	var out_str = "*** initialize ***<br />";

	out_str += url_create + "<br />";

	jQuery("#outarea_gg").html (out_str);

	jQuery.get (url_create,
                function (data_receive)
                        {
                        out_str = "url_post " + url_create + "<br />";
                        out_str += "initialize_proc fffff***<br />";
                        jQuery("#outarea_ff").html (out_str);
                        jQuery("#outarea_gg").html (data_receive);
		show_json (url_read);
                        });
}


// -----------------------------------------------------------------------
