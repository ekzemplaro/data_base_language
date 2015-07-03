// -----------------------------------------------------------------------
//
//	count_up.js
//					Jun/01/2015
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery ("#outarea_aa").text ("*** count_up.js *** start ***");

	var url_api = "./count_up.py";

	jQuery("#outarea_ee").text ("url_api = " + url_api);

	show_received_data_proc (url_api);

	jQuery ("#outarea_hh").text ("*** count_up.js *** end ***");
});

// -----------------------------------------------------------------------
function show_received_data_proc (url_api)
{
var str_tmp = "*** show_received_data_proc *** bbb ***<br />";
str_tmp += url_api + "<br />";
jQuery("#outarea_bb").html (str_tmp);

	var args = {host : "host_name",
			date: "20150601-155055",
			key: "B0157"};

	jQuery.post (url_api,args,function (data_received)
		{
		var out_str = data_received.str_in;

		jQuery("#result_aa").html (out_str);

		var str_message = "";

		for (var it in data_received.message)
			{
			str_message += data_received.message[it] + "<br />";
			}

		jQuery("#message").html (str_message);
		});
}

// -----------------------------------------------------------------------
