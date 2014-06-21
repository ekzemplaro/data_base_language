// -----------------------------------------------------------------------
//	read/xml_only_read.js
//
//					May/19/2011
//
// -----------------------------------------------------------------------
function xml_read_proc (url_xml)
{
	jQuery("#outarea_dd").text ("url_xml = " + url_xml);

	var icount = 0;

	jQuery.get(url_xml,function (xml_received)
		{
		var out_string = '<table>';
		jQuery (xml_received).find ("name").each (function ()
			{
			var ppx = jQuery(this).parent ();
			var item_name = jQuery(this).text();
//			var item_id = ppx.text ();
			var item_id = ppx.get (0).tagName;
			var population = ppx.find ("population").text();
			var date_mod = ppx.find ("date_mod").text();


			out_string += '<tr><td>';
			out_string += item_id;
			out_string += '</td><td>';
			out_string += item_name;
			out_string += '</td><td>';
			out_string += population;
			out_string += '</td><td>';
			out_string += date_mod;
			out_string += '</td></tr>';
			icount++;
			});

		out_string += '</table>'

		jQuery("#result_aa").html (out_string);
		});
}

// -----------------------------------------------------------------------
