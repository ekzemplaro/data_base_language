// -----------------------------------------------------------------------
//	jquery_csharp_create.js
//
//					Oct/27/2010
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;
	var url_create;

	jQuery("#outarea_aa").text ("*** start *** jquery_csharp_create.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);


	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "create")
                {
		url_read = "../read/" + dbase + "_csharp_read.aspx";
		url_create = dbase + "_csharp_create.aspx";

	jQuery("#outarea_dd").text ("url_read = " + url_read);
	jQuery("#outarea_ee").text ("url_create = " + url_create);

	show_json (url_read);
		}
	else
		{
		jQuery("#outarea_aa").text ("*** initialize *** aaaa ***");
		jQuery("#outarea_dd").text ("ddd = " + url_read);
		jQuery("#outarea_ee").text ("eee = " + url_create);
		initialize_proc (url_create,url_read);
		}
	});


	jQuery("#outarea_hh").text ("*** end *** jquery_csharp_create.js ***");
});

// -----------------------------------------------------------------------
