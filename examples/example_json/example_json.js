// -----------------------------------------------------------------------
//	example_json.js
//
//					Jul/24/2018
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** example_json *** start ***")

	var data_text = ""

//	var file_in = "./tochigi.json"
	var file_in = "./cities.json"

	jQuery.getJSON (file_in,function (data_aa)
		{
		var str_out = ""
		str_out += "<table>"
		for (var key in data_aa)
			{
			str_out += "<tr>"
			str_out += "<td>" + data_aa[key].name + "</td>"
			str_out += "<td>" + data_aa[key].population + "</td>"
			str_out += "<td>" + data_aa[key].date_mod + "</td>"
			str_out += "</tr>"
			}
		str_out += "</table>"

		jQuery(".contents").html (str_out)
		})
		.fail(function(jqXHR, textStatus, errorThrown)
			{
			var str_out = "<h2>Not Exist</h2>"
			str_out += "<blockquote>"
				str_out += file_in + "<br />"
			str_out += "</blockquote>"
			jQuery(".contents").html(str_out)
			jQuery("#outarea_ee").text("textStatus = " + textStatus)
			})

	jQuery("#outarea_hh").text ("*** example_json *** end ***")
})

// -----------------------------------------------------------------------
