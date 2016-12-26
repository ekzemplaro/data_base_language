// -----------------------------------------------------------------------
//	example_author.js
//
//					Dec/18/2016
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** example_author *** start ***")

	var url_in = "http://cddn007:5984/librivox/Melville?callback=?"

	jQuery.getJSON (url_in,function (data_in)
		{
		var str_out = "<table>"

		str_out += "<tr>"
		str_out += "<th>no</th>"
		str_out += "<th>id</th>"
		str_out += "<th>title</th>"
		str_out += "<th>totaltime</th>"
		str_out += "</tr>"

		for (var it in data_in.books)
			{
			var book_cur = data_in.books[it]
			str_out += "<tr>"
			str_out += "<td>" + it + "</td>"
			str_out += "<td>" + book_cur.id + "</td>"
			str_out += "<td>" + book_cur.title + "</td>"
			str_out += "<td>" + book_cur.totaltime + "</td>"
			str_out += "</tr>"
			}

		str_out += "</table>"

		jQuery(".contents").html (str_out)
		})

	jQuery("#outarea_hh").text ("*** example_author *** end ***")
})

// -----------------------------------------------------------------------
