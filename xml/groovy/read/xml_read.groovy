// -----------------------------------------------------------
//	xml_read.groovy
//
//					Jul/20/2011
//
// -----------------------------------------------------------
import groovy.util.slurpersupport.GPathResult  
 
// -----------------------------------------------------------
class xml_read
{

// -----------------------------------------------------------
static void main (args)
{ 
	println ("*** 開始 ***")

	def file_xml = args[0]

	def xml_str = new File (file_xml).text

	def dd = new xml_manipulate ()
	def dict_aa = dd.xml_to_dict_proc (xml_str)

	def ff = new text_manipulate ()

	ff.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// -----------------------------------------------------------
}
// -----------------------------------------------------------
