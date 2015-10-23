// -----------------------------------------------------------------------
//	jquery_read.js
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	file_xml = "cities.xml";
	file_xsl = "cities.xsl";

	jQuery("#outarea_dd").text ("xml_file = " + file_xml);
	jQuery("#outarea_ee").text ("xsl_file = " + file_xsl);

	jQuery("#result_aa").xslt(file_xml,file_xsl);


});

// -----------------------------------------------------------------------
