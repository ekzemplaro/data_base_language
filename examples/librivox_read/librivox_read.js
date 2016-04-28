// -----------------------------------------------------------------------
//	librivox_read.js
//
//					Nov/26/2013
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** librivox_read.js ***");
	var year_selected = jQuery ("#year").val ();
	var str_tmp = "year selected : " + year_selected;
	jQuery("#outarea_bb").text (str_tmp);

//	var url_json = "./latest_2000.json";
	var url_json = "./latest_on_going.json";

	jQuery.getJSON (url_json,function (data_json)
		{
		var out_str = table_gen (data_json,year_selected,"all");

		jQuery("#result_aa").html (out_str);

		jQuery ("button").on ('click',function ()
			{
		var month_selected = this.id;
		jQuery("#month_selected").text (month_selected);

	var str_out = this.id + " : " + year_selected + " : " + year_selected;
			jQuery("#outarea_cc").text (str_out);
		var out_str = table_gen (data_json,year_selected,this.id);
		jQuery("#result_aa").html (out_str);
			});

		jQuery ("#select_years").change (function ()
			{
			jQuery("#outarea_dd").text (this.id);
		var years = new Array ("2012","2011","2010");

	var index_year = jQuery ("#year").get(0).selectedIndex;

	year_selected =  years[index_year];

	var vv = jQuery ("#year").val ();

			jQuery("#outarea_dd").text (index_year);
			jQuery("#outarea_ee").text (year_selected + " -- " + vv);

		var month_selected = jQuery ("#month_selected").text ();
		var out_str = table_gen (data_json,year_selected,month_selected);
		jQuery("#result_aa").html (out_str);

			});
		});


	jQuery("#outarea_hh").text ("*** end *** librivox_read.js ***");
});

// -----------------------------------------------------------------------
function table_gen (data_json,year_filter,month_filter)
{
	var out_str = "<table border=\"1\">";

	for(var it in data_json.book)
		{
		var bx = data_json.book[it];
		if (0 < bx.completed.indexOf (year_filter))
			{
			if (month_filter === "all")
				{
				out_str += gen_record_proc (it,bx);
				}
			else if (0 < bx.completed.indexOf (month_filter))
				{
				out_str += gen_record_proc (it,bx);
				}
			}
		}

	out_str += "</table>";

	return	out_str;
}

// -----------------------------------------------------------------------
function gen_record_proc (it,bx)
{
	var out_str = "<tr><td>" + it + "</td>";
	out_str += "<td>" + bx.id;
	out_str += "</td><td>" + bx.title;
	out_str += "</td><td>" + bx.category;
	out_str += "</td><td>" + bx.language;
	out_str += "</td><td>" + bx.completed.substring (0,16);
	out_str += "</td></tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
