// -----------------------------------------------------------------------
//	couchdb_total.js
//
//					Apr/17/2016
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** couchdb_total *** start *** Apr/17/2016 ***");

	var url_proxy = "python_proxy_get.py";

	var url_couchdb = 'http://localhost:5984/';

	var url_in = url_couchdb + "city/_all_docs?include_docs=true";

	var args = {url: url_in};

	jQuery.post (url_proxy,args,function (data_json)
		{
		jQuery ("button.filter").on ('click', function ()
			{
			jQuery ("button.filter").css ("color","black");
			jQuery ("button#" + this.id).css ("color","blue");

			var name_class = "";
			key = this.id;
			name_class = jQuery(this).attr("class");
/*
			var str_tmp = key + "<br>";
			str_tmp += name_class + "<br>"; 
			jQuery ("#outarea_bb").html (str_tmp);
*/
			if (name_class === "filter")
				{
				jQuery (".contents").html ("<br />");
				var out_str = show_nav_proc (data_json,key);
				jQuery(".nava").html (out_str);

				select_proc (url_proxy,url_couchdb);
				}
			});
		});

	jQuery ("#mode").change (function ()
		{
		var index_mode = jQuery ("#mode").get(0).selectedIndex;
	jQuery("#outarea_ff").html
		("*** couchdb_total *** change *** " + index_mode);
		});

	jQuery("#outarea_hh").html
		("*** couchdb_total *** end *** Apr/17/2016 ***");
});

// -----------------------------------------------------------------------
function select_proc (url_proxy,url_couchdb)
{
//	jQuery ("button.selection").click (function ()
	jQuery ("button.selection").on ('click', function ()
		{
		var tmp_str = "";
		key = this.id;

		jQuery ("button.selection").css ("color","black");
		jQuery ("button#" + this.id).css ("color","blue");

		tmp_str += key + "<br />";
		jQuery("#outarea_bb").html (tmp_str);

		jQuery("#outarea_aa").html ("outarea_aa");
		jQuery("#outarea_cc").html ("outarea_cc");
		jQuery("#outarea_dd").html ("outarea_dd");
		jQuery("#outarea_ee").html ("outarea_ee");
		jQuery("#outarea_ff").html ("outarea_ff");
		jQuery("#outarea_gg").html ("outarea_gg");
		jQuery("#outarea_hh").html ("outarea_hh");

		show_contents_proc (url_proxy,url_couchdb,key);
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
