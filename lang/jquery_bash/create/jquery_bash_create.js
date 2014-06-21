// -----------------------------------------------------------------------
//	create/jquery_bash_create.js
//
//					Nov/04/2010
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;
	var url_create;
	var base_cgi = "/cgi-bin/data_base/bash/";

	jQuery("#outarea_aa").text ("*** start *** jquery_bash_create.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);


	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "create")
		{
		url_read = base_cgi + dbase + "_bash_read.sh";
		url_create = base_cgi + dbase + "_bash_create.sh";
		jQuery("#outarea_ee").text ("url_read = " + url_read);

		show_json (url_read);
		}
	else
		{
		initialize_proc (url_create,url_read);
		}

	});

	jQuery("#outarea_hh").text ("*** end *** jquery_bash_create.js ***");
});

// -----------------------------------------------------------------------
