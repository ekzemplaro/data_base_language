// -----------------------------------------------------------------------
//		data_base/js/table_manipulate.js
//
//					Jun/15/2011
//
// -----------------------------------------------------------------------
function table_manipulate (url_in,data_send)
{
	var str_aaa = "";

	var data = null;

	jQuery("#outarea_bb").text ("table_manipulate url_in = " + url_in);

	jQuery.getJSON (url_in,data,function (data_json)
		{
		var out_str = table_gen_proc (data_json);

		jQuery("#result_aa").html (out_str);

		change_monitor (data_send,str_aaa);
		});
}

// -----------------------------------------------------------------------
// [4]:
function change_monitor (data_send,str_aaa)
{
	jQuery("#table_aa td input").change (function ()
		{
		var idx = this.id;
		var value=jQuery(this).val ();
		jQuery(this).css ({color: "blue"});

		var out_str = "id= " + idx;
		out_str += " population = " + value;

		jQuery("#outarea_dd").text (out_str);

		duplicate_check (data_send,idx,value);

		var count = data_send.length;
		str_aaa += " CC " + count + " " + idx;
		str_aaa += " : " + " " + value;
		jQuery("#outarea_cc").text (str_aaa);

		});
}

// -----------------------------------------------------------------------
// [4-4]:
function duplicate_check (data_send,idx,value)
{
	var add_flag = true;

	if (0 < data_send.length)
		{
		add_flag = true;

		for (var it=0; it < data_send.length; it++)
			{
			if (data_send[it]['id'] === idx)
				{
				add_flag = false;
				data_send[it]['population'] = value;
				}
			}

		}

	if (add_flag)
		{
		var unit = {"id": idx,"population": value};
		data_send.push (unit);
		}
}

// -----------------------------------------------------------------------
// [6]:
function send_exec_proc (url_post,data_send)
{
	jQuery("#outarea_gg").text ("*** GGGGGG ***");

	var out_str = "*** ffff ***<br />";
	out_str += "send_exec_proc data_send.length = " + data_send.length;
	out_str += "<br />";

	out_str += url_post + "<br />";

	jQuery("#outarea_gg").html (out_str);

	send_display_proc (data_send);

	jQuery.post (url_post,{my_data: data_send},
		function (data_receive)
			{
			out_str += "url_post " + url_post + "<br />";
			out_str += "data_send " + data_send + "<br />";
			out_str += "send_exec_proc fffff***<br />";
			jQuery("#outarea_ff").html (out_str);
			jQuery("#outarea_gg").html (data_receive);
			});
}

// -----------------------------------------------------------------------
// [6-4]:
function send_display_proc (data_send)
{
	var out_str = "send_display_proc data_send.length = "
		+ data_send.length + "<br />";
	out_str += data_send + "<p />";
	jQuery("#outarea_bb").html (out_str);

	var today = new Date ();
	var strx = today.getFullYear ();
	strx += "/" + (today.getMonth () + 1); 
	strx += "/" + today.getDate (); 

	out_str = "*** send_display_proc *** start ***<br />";

	for (var it=0; it < data_send.length; it++)
		{
		var idx = data_send[it]['id'];
		var idx_date = idx + "_date_mod";

out_str += idx_date + "<br />";

		jQuery ("#" + idx_date).text (strx)
				.css ({color: "green"});
		}

	out_str += "<br />";
	out_str += "*** outarea_cc *** send_display_proc *** end ***<br />";

jQuery("#outarea_cc").html (out_str);

}

// -----------------------------------------------------------------------
// [8]:
function table_gen_proc (data_json)
{
	var keylist=new Array ();
	for(var it in data_json)
		{
 		keylist.push(it);
		};

	keylist.sort();

	var out_str = "<table id='table_aa' border=\"1\">";

	for (var it in keylist)
		{
		id = keylist[it];
		if ((id != "_id") && (id != "_rev"))
			{
			var city = data_json[id];
			out_str += gen_row (id,city);
			}
		}
	out_str += "</table>";

	return	out_str;
}
// -----------------------------------------------------------------------
// [8-4]:
function gen_row (id_in,city)
{
	var out_str = "<tr><td>" + id_in;
	out_str += "</td><td>" + city.name;
	out_str += "</td><td>";
	out_str += "<input size='8' type='text' value=" + city.population;
	out_str += " id=" + id_in;
	out_str += " /></td><td class='date_mod' id=" + id_in + "_date_mod >"
	out_str += city.date_mod;
	out_str += "</td></tr>";

	return	out_str;
}
// -----------------------------------------------------------------------
// [12]:
function send_exec_proc_json (url_post,str_json)
{
	data_send = eval ("(" + str_json + ")");

	send_display_proc (data_send);

	var out_str = "<br />";
	out_str += "url_post = " + url_post + "<br />";
	out_str += "*** send_exec_proc_json *** #outarea_ff ***<br />";

	jQuery("#outarea_ff").html (out_str);

	jQuery.post (url_post,{my_data: str_json},
		function (data_receive)
			{
			out_str = "url_post " + url_post + "<br />";
			out_str += "str_json " + str_json + "<br />";
			out_str += "send_exec_proc_json fffff***<br />";
			jQuery("#outarea_ff").html (out_str);
			jQuery("#outarea_gg").html (data_receive);
			});
}

// -----------------------------------------------------------------------
