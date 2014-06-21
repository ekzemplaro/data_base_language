// -----------------------------------------------------------------------
//	sound_koho.js
//
//					Nov/26/2013
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** sound_koho *** start *** Nov/26/2012 ***");

	var url_couchdb = "http://localhost:5984/";

	var url_json_all = url_couchdb + "sound_koho/_all_docs";
	var url_proxy = "./php_proxy_get.php"  + '?url=' + url_json_all;

	url_json_all += "?callback=?";

	jQuery.getJSON (url_proxy,function (data_json)
		{
		jQuery ("button.filter").on ('click',function ()
			{
			var name_class = "";
			key = this.id;

			jQuery ("button.filter").css ("color","black");
			jQuery ("button#" + this.id).css ("color","blue");

			name_class = jQuery(this).attr("class");
			var str_tmp = key + "<br>";
			str_tmp += name_class + "<br>"; 
			jQuery ("#outarea_bb").html (str_tmp);
			if (name_class === "filter")
				{
				jQuery (".contents").html ("<br />");
				var out_str = show_nav_proc (data_json,key);
				jQuery(".nava").html (out_str);

				select_proc (url_couchdb);
				}
			});
		});

	jQuery("#outarea_hh").html
		("*** sound_koho *** end *** Nov/26/2012 ***");
});

// -----------------------------------------------------------------------
// [6]:
function select_proc (url_couchdb)
{
	jQuery ("button.selection").on ('click',function ()
		{
		var tmp_str = "";
		key = this.id;

		jQuery ("button.selection").css ("color","black");
		jQuery ("button#" + this.id).css ("color","blue");

		tmp_str += key + "<br />";
		jQuery("#outarea_bb").html (tmp_str);

		jQuery("#outarea_aa").html ("outarea_aa");
		jQuery("#outarea_cc").html ("outarea_cc");
		jQuery("#outarea_dd").html ("outarea_dd");
		jQuery("#outarea_ee").html ("outarea_ee");
		jQuery("#outarea_ff").html ("outarea_ff");
		jQuery("#outarea_gg").html ("outarea_gg");
		jQuery("#outarea_hh").html ("outarea_hh");

		show_contents_proc (url_couchdb,key);
		});
}

// -----------------------------------------------------------------------
