// -----------------------------------------------------------------------
//	change_monitor.js
//
//					Sep/05/2011
// -----------------------------------------------------------------------
function change_monitor (data_json,data_send)
{
	jQuery("#outarea_").text ("*** change_monitor *** start ***");

	jQuery("#table_aa td input").change (function ()
		{
		var idx = this.id;
		var value=jQuery(this).val ();
		jQuery(this).css ({color: "blue"});

		var array = idx.split ("_");

		if (array[0] === "delete")
			{
			value = jQuery(this).prop ("checked");

			change_monitor_delete_display_proc (idx,value,array);
			}

		var index = array[1];

		data_send[idx] = value;

		if (array[0] === "population")
			{
			var today = get_current_date_proc ();

			var id_date_mod = "date_mod_" + array[1];
			jQuery("#" + id_date_mod).text (today)
				.css ({color: "green"});

			data_json[index].population = value;
			data_json[index].date_mod = today;
		jQuery("#outarea_hh").text ("*** population ***");
			}
		else if (array[0] === "name")
			{
		var tmp_out = "outarea_hh *** name ***<br />";
		tmp_out += "index = " + index + "<br />";
		tmp_out += "value = " + value + "<br />";
		jQuery("#outarea_hh").html (tmp_out);
			data_json[index].name = value;
			}
/*

		var count = 0;

		for (var it in data_send)
			{
			count += 1;
			}

		out_str += "data_send = ";
		out_str += count + "<br />";

		for (var id in data_send)
			{
			out_str += "id = " + id + "<br />";
			out_str += "value = " + data_send[id] + "<br />";
			}

		jQuery("#outarea_ee").html (out_str);
*/
		});
}

// -----------------------------------------------------------------------
function change_monitor_delete_display_proc (idx,value,array)
{
	var out_str = "*** change_monitor_delete_display_proc ***<br />";
	out_str += "id= " + idx;
	out_str += " value = " + value + "<br />";
	out_str += " array[0] = " + array[0] + "<br />";
	out_str += " array[1] = " + array[1] + "<br />";
	jQuery("#outarea_dd").html (out_str);
}

// -----------------------------------------------------------------------
function get_current_date_proc ()
{
	var today = new Date ();
	var strx = today.getFullYear ();
	strx += "/" + (today.getMonth () + 1); 
	strx += "/" + today.getDate (); 

	return	(strx)
}

// -----------------------------------------------------------------------
