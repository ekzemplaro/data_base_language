// -----------------------------------------------------------------------
//	statistics.js
//
//					Apr/21/2014
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** statistics.js ***");

	var url_json = "data/sheet_bb.json";
//	var url_json = "http://host_couch:5984/data_base/sheet_aa?callback=?";

	show_statistics_proc (url_json);

	jQuery("#outarea_hh").text ("*** end *** statistics.js ***");
});

// -----------------------------------------------------------------------
// [6-6-4-4]:
function mark_convert_proc (str_in)
{
	var	str_out;

	str_out = str_in;

	switch (str_in)
		{
 		case "8":
			str_out = "◎";
			break;

 		case "7":
			str_out = "S";
			break;

 		case "6":
			str_out = "R";
			break;

 		case "5":
			str_out = "Q";
			break;

 		case "4":
			str_out = "P";
			break;

 		case "3":
			str_out = "L";
			break;

 		case "2":
			str_out = "M";
			break;

 		case "1":
			str_out = "X";
			break;
		}

	return	str_out;
}

// -----------------------------------------------------------------------
// [6-6]:
function show_record_proc (lang,record,info)
{
	var out_str = "";

	for (var crud in record)
		{
		if ((crud === "Only")
			|| (crud === "Create")
			|| (crud === "Read")
			|| (crud === "Update")
			|| (crud === "Delete")
			|| (crud === "jQ_C")
			|| (crud === "jQ_R")
			|| (crud === "jQ_U")
			|| (crud === "jQ_D"))
			{
			out_str += show_record_one_line_proc (lang,crud,record,info);
			}
		}

	return	out_str;
}

// -----------------------------------------------------------------------
// [6-6-4]:
function show_record_one_line_proc (lang,crud,record,info)
{
	var rowspan = 0;

	var out_str = "";
	if (crud === "Only")
		{
		out_str += "<tr>";
		out_str += "<td>";
		out_str += lang;
		out_str += "</td>";
		}
	else if (crud === "Create")
		{
		out_str += "<tr class=\"cyan\">";
		rowspan = 4;
		if ("jQ_R" in record)
			{
			rowspan = 8;
			}

		out_str += "<td rowspan=\"" + rowspan + "\">";
		out_str += lang;
		out_str += "</td>";
		}
	else
		{
		out_str += "<tr>";
		}

	out_str += "<td>";
	out_str += crud;
	out_str += "</td>";

	for (var db in info)
		{
		out_str += "<td>";
		if (db in record[crud])
			{
			out_str += mark_convert_proc (record[crud][db]);
			}
		else
			{
			out_str += "<br />";
			}

		out_str += "</td>";
		}

	out_str += lang_title_tail_proc (lang,crud,rowspan);

	out_str += "</tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
// [6-6-4-8]:
function lang_title_tail_proc (lang,crud,rowspan)
{
	var out_str = "";

	if (crud === "Only")
		{
		out_str += "<td>";
		out_str += lang;
		out_str += "</td>";
		}
	else if (crud === "Create")
		{
		out_str += "<td rowspan=\"" + rowspan + "\">";
		out_str += lang;
		out_str += "</td>";
		}

	return	out_str;
}

// -----------------------------------------------------------------------
// [6]:
function show_statistics_proc (url_json)
{
	jQuery.getJSON (url_json,function (data_json)
		{
		var out_str = "<table>";

		out_str += show_column_title_proc (data_json);

		var icount = 0;

		for (var lang in data_json.dbase)
			{
			var record = data_json.dbase[lang];


			out_str += show_record_proc
				(lang,record,data_json.info);

			if ((icount % 8) === 7)
				{
		out_str += gen_db_title_proc ("",data_json.info);
				}

			icount += 1;
			}

		out_str += gen_db_title_proc ("",data_json.info);
		out_str += "</table>";

		jQuery("#result_aa").html (out_str);

		});
}


// -----------------------------------------------------------------------
// [6-2]:
function show_column_title_proc (data_json)
{
	var str_out = gen_db_title_proc (data_json.date_created,data_json.info);

	str_out += "<tr>";
	str_out += "<td><br /></td>";
	str_out += "<td><br /></td>";

	for (var db in data_json.info)
		{
		str_out += "<td>";
		str_out += data_json.info[db].pref;
		str_out += "</td>";
		}

	str_out += "<td><br /></td>";
	str_out += "</tr>";

	str_out += "<tr>";
	str_out += "<td><br /></td>";
	str_out += "<td><br /></td>";

	for (var db in data_json.info)
		{
		str_out += "<td>";
		str_out += data_json.info[db].code;
		str_out += "</td>";
		}

	str_out += "<td><br /></td>";
	str_out += "</tr>";

	return	str_out;
}

// -----------------------------------------------------------------------
// [6-2-2]:
function gen_db_title_proc (comment,info)
{
	var str_out = "<tr>";
	str_out += "<td colspan=2>" + comment + "</td>";
//	str_out += "<td><br /></td>";

	for (var db in info)
		{
		str_out += "<td>";
		str_out += db;
		str_out += "</td>";
		}

	str_out += "<td><br /></td>";
	str_out += "</tr>";

	return	str_out;
}

// -----------------------------------------------------------------------
