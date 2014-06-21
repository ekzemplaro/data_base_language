// -----------------------------------------------------------------------
//	post_python.js
//
//					Feb/10/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** post_python *** start *** Feb/10/2014 ***");

	var data_text = "";

	var url_python = "./post_python.py";

	var nc_aa = "p01.nc";
	var nc_bb = "p02.nc";

	jQuery.post (url_python,
		{
                data_aa : nc_aa,
                data_bb : nc_bb,
                },
		function (res)
		{
		var str_out = "";

		for (var it in res.message)
			{
			str_out += res.message[it] + "<br />";
			}

		jQuery(".contents").html (str_out);

		var str_tmp = JSON.stringify (res);
		jQuery("#outarea_cc").html (str_tmp);
		});

	jQuery("#outarea_hh").html
		("*** post_python *** end *** Feb/10/2014 ***");

});

// -----------------------------------------------------------------------
