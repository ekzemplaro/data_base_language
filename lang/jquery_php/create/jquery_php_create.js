// -----------------------------------------------------------------------
//	create/jquery_php_create.js
//
//					Dec/09/2013
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read = ""
	var url_create = ""


	jQuery("#outarea_aa").text ("*** start *** jquery_php_create.js ***")

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id)

	jQuery ("button").css ("color","black")
	jQuery ("button#" + this.id).css ("color","blue")

	var dbase = this.id
	jQuery("#outarea_ff").text ("*** " + dbase + " ***")

	if (dbase !== "create")
		{
		url_read = "../read/" + dbase + "_php_read.php"
		url_create = dbase + "_php_create.php"

		jQuery("#outarea_dd").text ("url_read = " + url_read)
		jQuery("#outarea_ee").text ("url_create = " + url_create)

		show_json (url_read)
		}
	else
		{
		jQuery("#outarea_dd").text ("aaaa = " + url_read)
		jQuery("#outarea_ee").text ("bbbb = " + url_create)

		initialize_proc (url_create,url_read)
		}
	})


	jQuery("#outarea_hh").text ("*** end *** jquery_php_create.js ***")
})

// -----------------------------------------------------------------------
