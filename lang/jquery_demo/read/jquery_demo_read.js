// -----------------------------------------------------------------------
//	read/jquery_demo_read.js
//
//					Oct/12/2011
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** jquery_demo_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var url_json;

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

//	data_demo_read_proc (dbase);

	var url_json = define_json_file_proc (dbase);

	show_json (url_json);

//	jQuery("#outarea_ee").text ("url_json = " + url_json);

	});


	jQuery("#outarea_hh").text ("*** end *** jquery_demo_read.js ***");
});

// -----------------------------------------------------------------------
