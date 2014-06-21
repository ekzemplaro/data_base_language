// -----------------------------------------------------------------------
//	jquery_couchdb.js
//
//					Sep/05/2011
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_json_all = "http://localhost:5984/city/_all_docs";

	url_json_all += "?callback=?";

	jQuery.getJSON (url_json_all,function (data_json)
		{
		jQuery ("button.filter").click (function ()
			{
			var name_class = "";
			key = this.id;
			name_class = jQuery(this).attr("class");
			var str_tmp = key + "<br>";
			str_tmp += name_class + "<br>"; 
			jQuery ("#outarea_bb").html (str_tmp);
			if (name_class === "filter")
				{
				jQuery (".contents").html ("<br />");
				var out_str = show_nav_proc (data_json,key);
				jQuery(".nava").html (out_str);

				select_proc ();
				}
			});
		});
});

// -----------------------------------------------------------------------
function select_proc ()
{
	jQuery ("button.selection").click (function ()
		{
		var tmp_str = "";
		key = this.id;

		tmp_str += key + "<br />";
		jQuery("#outarea_bb").html (tmp_str);

		jQuery("#outarea_aa").html ("outarea_aa");
		jQuery("#outarea_cc").html ("outarea_cc");
		jQuery("#outarea_dd").html ("outarea_dd");
		jQuery("#outarea_ee").html ("outarea_ee");
		jQuery("#outarea_ff").html ("outarea_ff");
		jQuery("#outarea_gg").html ("outarea_gg");
		jQuery("#outarea_hh").html ("outarea_hh");

		show_contents_proc (key);
		});
}

// -----------------------------------------------------------------------
function show_nav_proc (data_json,key)
{
	var tmp_str = "*** show_nav_proc ppp *** ";

	tmp_str += data_json.total_rows;

	var out_str = "";

	var arry = new Array ();

	var icount = 0;

	if (key === "all")
		{
	for (var it in data_json.rows)
		{
		arry[icount] = data_json.rows[it].id;
		icount++;
		}
		}
	else
		{
	for (var it in data_json.rows)
		{
		var pref  = data_json.rows[it].id;
/*
		tmp_str += "key: " + key + " -- ";
		tmp_str += "pref: " + pref + " -- ";
*/
		hantei = hantei_proc (key,pref);
//		tmp_str += "hantei: " + hantei + "<br /> ";

		if (hantei)
			{
			arry[icount] = data_json.rows[it].id;
			icount++;
			}
		}
		}

	for (var it in arry)
		{
		tmp_str += it + " ";
		out_str += "<button class=\"selection\"  id=" + arry[it] + ">";
		out_str += arry[it] + "</button><br />";
		}

	jQuery ("#outarea_aa").html (tmp_str);
	jQuery ("#outarea_bb").html ("outarea_bb");
	jQuery ("#outarea_cc").html ("outarea_cc");
	jQuery ("#outarea_dd").html ("outarea_dd");
	jQuery ("#outarea_ee").html ("outarea_ee");
	jQuery ("#outarea_ff").html ("outarea_ff");
	jQuery ("#outarea_gg").html ("outarea_gg");
	jQuery ("#outarea_hh").html ("outarea_hh");

	return	out_str;
}

// -----------------------------------------------------------------------
function hantei_proc (key,pref)
{
	var area = new Object ();
	area["tohoku"] = ["hokkaido","aomori","iwate",
				"miyagi","akita",
				"yamagata","fukushima"];

	area["kanto"] = ["ibaraki","tochigi","gunnma","saitama",
				"chiba","tokyo",
				"kanagawa"];

	area["chyubu"] = ["niigata","toyama","ishikawa","fukui",
				"yamanashi","nagano","gifu","shizuoka",
				"aichi","mie"];

	area["kansai"] = ["shiga","kyoto","oosaka","hyogo",
				"nara","wakayama"];

	area["chyugoku"] = ["tottori","shimane","okayama","hiroshima",
				"yamaguchi","tokushima","kagawa",
				"ehime","kochi"];

	area["kyusyu"] = ["fukuoka","saga","nagasaki","kumamoto",
				"ooita","miyazaki",
				"kagoshima","okinawa"];

	switch (key)
		{
		case	"tohoku":
		case	"kanto":
		case	"chyubu":
		case	"kansai":
		case	"chyugoku":
		case	"kyusyu":
			if (area[key].indexOf (pref) === -1)
					hantei = false;
			else
					hantei = true;
			break;

		default:
			hantei = true;
			break;
		}

	return	(hantei);
}

// -----------------------------------------------------------------------
