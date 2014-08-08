// -----------------------------------------------------------------------
//	update/jquery_ruby_delete.js
//
//					Jul/23/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;
	var url_delete;

	jQuery("#outarea_aa").text ("*** start *** jquery_ruby_delete.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "delete")
		{
		url_read = "../read/" + dbase + "_ruby_read.rb";
		url_delete = dbase + "_ruby_delete.rb";

		jQuery("#outarea_dd").text ("url_read = " + url_read);
		jQuery("#outarea_ee").text ("url_delete = " + url_delete);

		table_delete (url_read);
		}
	else
		{
		send_exec_proc_json (url_read,url_delete);
		}
	});


	jQuery("#outarea_hh").text ("*** end *** jquery_ruby_delete.js ***");
});

// -----------------------------------------------------------------------
