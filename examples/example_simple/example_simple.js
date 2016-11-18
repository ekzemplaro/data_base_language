// -----------------------------------------------------------------------
//	example_simple.js
//
//					Nov/12/2016
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** example_simple *** start *** Nov/12/2016 ***")

	var data_text = ""

	var file_in = "./in01.txt"

	jQuery.get (file_in,function (data_text)
		{
		var str_out = "<b>source</b></br>"

		var txt_cc = data_text.replace (/</g,"&lt");
		txt_cc = txt_cc.replace (/>/g,"&gt");

		jQuery("#outarea_ff").html ("<pre>" + txt_cc + "</pre>")

		str_out += "<pre>" + txt_cc + "</pre>"

		jQuery(".contents").html (str_out)
		})

	jQuery("#outarea_hh").html
		("*** example_simple *** end *** Nov/12/2016 ***")

})

// -----------------------------------------------------------------------
