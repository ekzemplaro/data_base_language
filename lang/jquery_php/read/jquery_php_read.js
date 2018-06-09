// -----------------------------------------------------------------------
//	jquery_php_read.js
//
//					Dec/09/2016
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** jquery_php_read.js *** start ***")

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id)

	jQuery ("button").css ("color","black")
	jQuery ("button#" + this.id).css ("color","blue")

	var url_json = ""

	var dbase = this.id
	jQuery("#outarea_ff").text ("*** " + dbase + " ***")
	url_json = dbase + "_php_read.php"

	jQuery("#outarea_ee").text ("url_json = " + url_json)

	show_json (url_json)

	})

	jQuery("#outarea_hh").text ("*** jquery_php_read.js *** end ***")
})

// -----------------------------------------------------------------------
