// -----------------------------------------------------------------------
//	example_json.js
//
//					Dec/21/2016
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text
		("*** example_json *** start *** Dec/21/2016 ***")

	var data_text = ""

	var file_in = "./id_8303.json"

	jQuery.getJSON (file_in,function (data_aa)
		{
		var str_out = ""
		for (var key in data_aa.books)
			{
			str_out += data_aa.books[key].id + "<br />"
			str_out += data_aa.books[key].title + "<br />"
			str_out += data_aa.books[key].language + "<br />"
			str_out += data_aa.books[key].num_sections + "<br />"
			str_out += data_aa.books[key].totaltime + "<br />"
			}

		jQuery(".contents").html (str_out)
		})

	jQuery("#outarea_hh").text
		("*** example_json *** end *** Dec/21/2016 ***")

})

// -----------------------------------------------------------------------
