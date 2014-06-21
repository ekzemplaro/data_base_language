// -----------------------------------------------------------------------
//	read/jquery_jaxer_read.js
//
//					Jun/29/2010
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** jquery_jaxer_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	var url_json;

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");


	switch	(dbase)
		{
		case	"xml":
		case	"xindice":
		case	"exist":
		case	"dbxml":
			var xml_str = xml_load_proc (dbase);
			jQuery("#outarea_ee").text (xml_str);
			xml_display_proc (xml_str);
			break;

		default:
			json_str = json_load_proc (dbase);

			jQuery("#outarea_ee").text (json_str);

			show_json_string (json_str);
			break;
		};

	});


	jQuery("#outarea_hh").text ("*** end *** jquery_jaxer_read.js ***");
});

// -----------------------------------------------------------------------
function xml_display_proc (xml_received)
{

	var out_string = '<table border="1">';

	jQuery(xml_received).find ('cities').each (function ()
		{
		var item_id = jQuery(this).find ("id").text();
		var item_name = jQuery(this).find ("name").text();
		var population = jQuery(this).find ("population").text();
		var date_mod = jQuery(this).find ("date_mod").text();
		out_string += '<tr><td>';
		out_string += item_id;
		out_string += '</td><td>';
		out_string += item_name;
		out_string += '</td><td>';
		out_string += population;
		out_string += '</td><td>';
		out_string += date_mod;
		out_string += '</td></tr>';
		});

	out_string += '</table>';

	jQuery("#result_aa").html (out_string);
}

// -----------------------------------------------------------------------
