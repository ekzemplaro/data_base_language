// -----------------------------------------------------------------------
//	js/example_php.js
//
//					Sep/11/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** js/example_php.js *** 開始 *** Sep/11/2014 ***");

	var data_text = "";

	var url_in = "prog/example_php.php";

	jQuery.get (url_in,function (data_rec)
		{
		jQuery(".contents").html (data_rec);
		});

	var ua = window.navigator.userAgent;
	var ver = window.navigator.appVersion;

	jQuery("#outarea_bb").html ('ua : ' + ua + '<br />');
	jQuery("#outarea_cc").html ('ver : ' + ver + '<br />');

	jQuery("#outarea_hh").html
		("*** js/example_php.js *** 終了 *** Sep/11/2014 ***");

});

// -----------------------------------------------------------------------
