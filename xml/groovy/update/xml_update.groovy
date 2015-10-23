// -------------------------------------------------------------------
//	xml_update.groovy
//
//					Jul/20/2011
//
// -------------------------------------------------------------------
// import	xml_manipulate

class xml_update
{

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def file_xml = args[0]
	def id_in = args[1]
	def population_in = args[2]

	println (file_xml + "\t" + id_in + "\t" + population_in)

	def xml_str = new File (file_xml).text

	def dd = new xml_manipulate ()
	def dict_aa = dd.xml_to_dict_proc (xml_str)

	def ff = new text_manipulate ()
	def dict_bb = ff.dict_update_proc (dict_aa,id_in,population_in)

	def out_str = dd.dict_to_xml_proc (dict_bb)

	def fp = new File (file_xml)
	fp.write (out_str)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
