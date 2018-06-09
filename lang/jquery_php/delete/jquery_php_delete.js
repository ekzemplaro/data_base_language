// -----------------------------------------------------------------------
//	delete/jquery_php_delete.js
//
//					Oct/31/2016
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read = ""
	var url_delete = ""

	jQuery("#outarea_aa").text ("*** start *** jquery_php_delete.js ***")

	jQuery ("button").click (function ()
	{
	jQuery ("button").css ("color","black")
	jQuery ("button#" + this.id).css ("color","blue")

	var dbase = this.id

	if (dbase !== "delete")
		{
		url_read = "../read/" + dbase + "_php_read.php"
		url_delete = dbase + "_php_delete.php"

		table_delete (url_read)
		}
	else
		{
		send_exec_proc_delete (url_read,url_delete)
		}

	jQuery("#outarea_dd").text ("url_read = " + url_read)
	jQuery("#outarea_ee").text ("url_delete = " + url_delete)
	})


	jQuery("#outarea_hh").text ("*** end *** jquery_php_delete.js ***")
})

// -----------------------------------------------------------------------
