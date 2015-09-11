// -----------------------------------------------------------------------
//	distribution.js
//
//					Aug/18/2015
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** distribution *** start *** Aug/18/2015 ***");

	var data_text = "";

	var file_in = "./data_distro.json";

	jQuery.getJSON (file_in,function (data_aa)
		{
		var str_out = "";
		str_out += "<table>";
		str_out += "<tr>";
		str_out += "<th>distribution</th>";
		str_out += "<th>kernel</th>";
		str_out += "<th>bash</th>";
		str_out += "</tr>";
		for (var key in data_aa)
			{
			str_out += record_gen_proc (key,data_aa[key]);
			}
		str_out += "</table>";

		jQuery(".contents").html (str_out);
		});

	jQuery("#outarea_hh").html
		("*** distribution *** end *** Aug/18/2015 ***");

});

// -----------------------------------------------------------------------
function record_gen_proc (key,data_record)
{
	var str_out = "";

	str_out += "<tr>";
	str_out += '<td><a href="' + key + '">';
	str_out += data_record.name + '</a></td>';
	str_out += "<td>" + data_record.kernel + "</td>";
	str_out += "<td>" + data_record.bash + "</td>";
	str_out += "</tr>";

	return	str_out;
}

// -----------------------------------------------------------------------
