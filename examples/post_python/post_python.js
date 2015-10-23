// -----------------------------------------------------------------------
//	post_python.js
//
//					Sep/01/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** post_python *** start *** Sep/01/2014 ***");

	var data_text = "";

	var url_python = "./post_python.py";

	var nc_aa = "p01.nc";
	var nc_bb = "p02.nc";
	var parm_array = ["Oyama","Ashikaga","Shimotsuke"];
	var parm_str = JSON.stringify (parm_array);

//	var args = {data_aa : nc_aa,data_bb : nc_bb,parm_array: parm_array};
	var args = {data_aa: nc_aa,data_bb: nc_bb,parm_str: parm_str};

	jQuery.post (url_python,args,function (res)
		{
		var str_out = "";

		for (var it in res.message)
			{
			str_out += res.message[it] + "<br />";
			}

		jQuery("#message").html (str_out);

		var str_contents = "";
		str_contents += "fname_in = " + res.fname_in + "<br />";
		str_contents += "fname_out = " + res.fname_out + "<br />";
 
		jQuery(".contents").html (str_contents);
		var str_tmp = JSON.stringify (res);
		jQuery("#outarea_cc").html (str_tmp);
		});

	jQuery("#outarea_hh").html
		("*** post_python *** end *** Sep/a1/2014 ***");

});

// -----------------------------------------------------------------------
