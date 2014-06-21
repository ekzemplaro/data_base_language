// -----------------------------------------------------------------------
//	read/text_only_read.js
//
//					Jan/28/2011
//
// -----------------------------------------------------------------------
function text_read_proc (file_text)
{
	jQuery("#outarea_aa").text ("*** text_only_read.js *** start ***");

	jQuery("#outarea_dd").text ("file_text = " + file_text);

	jQuery.get(file_text,function (data_received)
		{
		var out_string = "<pre>";
		out_string += data_received;
		out_string += "</pre>"

		jQuery("#result_aa").html (out_string);
		
		});

	jQuery("#outarea_hh").text ("*** text_only_read.js *** end ***");

}

// -----------------------------------------------------------------------
