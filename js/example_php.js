// -----------------------------------------------------------------------
//	js/example_php.js
//
//					Dec/23/2016
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** js/example_php.js *** 開始 ***")

	var data_text = ""

	var url_in = "prog/example_php.php"

	jQuery.get (url_in,function (data_rec)
		{
		jQuery(".contents").html (data_rec)
		})

	var ua = window.navigator.userAgent
	var ver = window.navigator.appVersion

	jQuery("#outarea_bb").html ('ua : ' + ua + '<br />')
	jQuery("#outarea_cc").html ('ver : ' + ver + '<br />')

	jQuery("#outarea_hh").text ("*** js/example_php.js *** 終了 ***")

})

// -----------------------------------------------------------------------
