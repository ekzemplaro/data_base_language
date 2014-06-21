// -----------------------------------------------------------------------
//	db_sum.js
//
//					Apr/24/2014
// -----------------------------------------------------------------------
jQuery (function ()
{
//	jQuery("#outarea_aa").text ("*** start *** db_sum.js ***");

	var url_json = "../data/sheet_bb.json";
//	var url_json = "http://host_couch:5984/data_base/sheet_aa?callback=?";

	show_console_sum_proc (url_json);

//	jQuery("#outarea_hh").text ("*** end *** db_sum.js ***");
});

// -----------------------------------------------------------------------
// [4-4]:
function sum_up_proc (dbase,dbx)
{
	var success = 0;

	for (var lang in dbase)
		{
		if (lang !== "jQuery")
			{
			for (var crud in dbase[lang])
				{
				switch (crud)
					{
					case	"Create":
					case	"Read":
					case	"Update":
					case	"Delete":
			 	var status = dbase[lang][crud][dbx];
					 if ((status == "2")
					 	|| (status == "3")
					 	|| (status == "4")
					 	|| (status == "5")
					 	|| (status == "6")
					 	|| (status == "7")
					 	|| (status == "8"))
						{
						success += 1;
						break;
						}
					}
				}
			}
		}

	return	success;
}

// -----------------------------------------------------------------------
// [4-8]:
function result_out_proc (no,dbx,success,total)
{
	var percent = Math.round (success * 10000 / total) / 100.0;

	var out_str = "<tr>";
	out_str += "<td class=\"no\">" + no + "</td>";
	out_str += "<td>" + dbx + "</td>";

	if (80 <= success)
		{
		out_str += "<td bgcolor=\"#ccffcc\">";
		}
	else if (40 <= success)
		{
		out_str += "<td bgcolor=\"#ccddcc\">";
		}
	else if (20 <= success)
		{
		out_str += "<td bgcolor=\"#d8c8f8\">";
		}
	else if (10 <= success)
		{
		out_str += "<td bgcolor=\"#e0f0f0\">";
		}
	else
		{
		out_str += "<td>";
		}

	out_str += success + "</td>";

	out_str += "<td>" + total + "</td>";
	out_str += "<td>" + percent + " %</td>";

	out_str += "</tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
// [4-2]:
function table_head_proc ()
{
	var out_str = "<table>";

	out_str += "<tr><th class=\"no\">No.</th>";
	out_str += "<th>Data Base</th>";
	out_str += "<th>Success</th>";
	out_str += "<th>Total</th>";
	out_str += "<th>Percentage</th></tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
// [4-10]:
function total_show_proc (success_all,total_all)
{
	var percent = Math.round (success_all * 10000 / total_all) / 100.0;

	var out_str = "<tr><td class=\"no\"><br /></td>";
	out_str += "<td>Total</td>";
	out_str += "<td>" + success_all + "</td>";
	out_str += "<td>" + total_all + "</td>";
	out_str += "<td>" + percent + " %</td></tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
// [4]:
function show_console_sum_proc (url_json)
{
	jQuery.getJSON (url_json,function (data_json)
		{
		var success_all = 0;
		var total_all = 0;
		var total_language = 63;
		var nn_lang = total_language * 4;
		var out_str = table_head_proc ();

		var no = 1;
		for (var dbx in data_json.info)
			{
			if (dbx != "Code")
				{
				var success = sum_up_proc (data_json.dbase,dbx);
				out_str += result_out_proc (no,dbx,success,nn_lang);

				no += 1;
				total_all += nn_lang;
				success_all += success;
				}
			}

		out_str += total_show_proc (success_all,total_all);
		out_str += "</table>";

		jQuery("#result_aa").html (out_str);
		});
}

// -----------------------------------------------------------------------
