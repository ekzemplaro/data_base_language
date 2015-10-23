// -----------------------------------------------------------------------
//	create/jquery_ruby_create.js
//
//					Jul/23/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;
	var url_create;

	jQuery("#outarea_aa").text ("*** start *** jquery_ruby_create.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "create")
		{
		url_read = "../read/" + dbase + "_ruby_read.rb";
		url_create = dbase + "_ruby_create.rb";

		jQuery("#outarea_ee").text ("url_read = " + url_read);

		show_json (url_read);
		}
	else
		{
		jQuery("#outarea_dd").text ("ddd = " + url_read);
		jQuery("#outarea_ee").text ("eee = " + url_create);
		initialize_proc (url_create,url_read);
		}
	});

	jQuery("#outarea_hh").text ("*** end *** jquery_ruby_create.js ***");
});

// -----------------------------------------------------------------------
