// -----------------------------------------------------------------------
//	change_monitor.js
//
//					Oct/31/2011
// -----------------------------------------------------------------------
function change_monitor (data_json,data_send)
{
//	jQuery("#outarea_aa").text ("*** change_monitor *** start ***");

	jQuery("#table_aa td select,input").change (function ()
		{
		var idx = this.id;
		var value=jQuery(this).val ();
		jQuery(this).css ({color: "blue"});

		change_monitor_exec (data_json,data_send,idx,value);
		});
}

// -----------------------------------------------------------------------
// [4]:
function change_monitor_exec (data_json,data_send,idx,value)
{
	var array = idx.split ("_");

	var item = array[0];
	var index = array[1];

	if (array.length === 3)
		{
		item = array[0] + "_" + array[1];
		var index = array[2];
		}

	data_send[idx] = value;

	if (item === "paper")
		{
		data_json[index].paper = value;
		jQuery("#outarea_hh").text ("*** paper ***");
		}
	else if (item === "sound")
		{
		data_json[index].sound = value;
		jQuery("#outarea_hh").text ("*** sound ***");
		}
	else if (item === "url_city")
		{
		data_json[index].url_city = value;
		jQuery("#outarea_hh").text ("*** url_city ***");
		}
}

// -----------------------------------------------------------------------
