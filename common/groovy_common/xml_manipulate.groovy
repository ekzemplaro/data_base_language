// ---------------------------------------------------------------------
//	xml_manipulate.groovy
//
//					Jul/20/2011
//
// ---------------------------------------------------------------------
import groovy.util.slurpersupport.GPathResult
// ---------------------------------------------------------------------
class xml_manipulate
{
// -------------------------------------------------------------------
static dict_to_xml_proc (dict_aa)
{
	println ("*** dict_to_xml_proc ***")
	def xml_str = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"
	xml_str += "<root>\n"
	dict_aa.keySet().each { key ->
		xml_str += row_data_gen (key,dict_aa[key]['name'],
//			Integer.decode (dict_aa[key]['population']),dict_aa[key]['date_mod'])
			dict_aa[key]['population'],dict_aa[key]['date_mod'])
		 }

	xml_str += "</root>"

	return	xml_str
}

// -------------------------------------------------------------------
static String row_data_gen (id,name,
	population,date_mod)
//static String row_data_gen (String id,String name,
//	int population,String date_mod)
{
	def str_out = "<" + id + ">\n" +
	"<name>" + name + "</name>\n" +
	"<population>" + population + "</population>\n" +
	"<date_mod>" + date_mod + "</date_mod>\n" +
	"</" + id + ">\n"

	return	str_out
}
// -------------------------------------------------------------------
def processNode( Map<String, ?> map, node) {
	if (  !map[node.name()] ){
	map[node.name()] = map.getClass().newInstance()
	}

	Map<String, ?> nodeMap = map[node.name()]
 
	node.children().each { it ->
	if (it.children().size() == 0) {
	processLeaf( nodeMap, it)
	} else {
		processNode( nodeMap, it)
	}
	}
nodeMap
}
 
// -------------------------------------------------------------------
def processLeaf(Map<String, ?> map, node) {
	if ( map[node.name()] == null) {
		map[node.name()] = node.text()
	} else {
	if (  ! (map[node.name()] instanceof List) ) {
	map[node.name()] = [ map[node.name()] ]
	}
	map[node.name()] << node.text()
	}
 
	map[node.name()]
}
 
// -------------------------------------------------------------------
def xml_to_dict_proc (String xmlString) {
	final GPathResult xml = new XmlSlurper().parseText(xmlString)
	final Map map = [ : ]
 
	xml.children().each {
		if ( it.children().size() == 0 ){
		processLeaf map, it 
		}
		else {
		processNode map, it
		}
	}
 
	map
}

// -------------------------------------------------------------------
static void disp_proc (xml_str)
{
//	print	xml_str

	def root = new XmlParser().parseText(xml_str)

	root.cities.each
		{
		print it.id.text () + "\t" + it.name.text () + "\t"
		println it.population.text () + "\t" + it.date_mod.text ()
		}
}

// ---------------------------------------------------------------------
static void xml_write_proc (root,file_xml)
{
	def out_str = xml_to_string_proc (root)

	def ff = new File (file_xml)
	ff.write (out_str)
}

// ---------------------------------------------------------------------
static String xml_to_string_proc (root)
{
	def writer = new StringWriter()
	new XmlNodePrinter(new PrintWriter(writer)).print(root)
	def out_str = writer.toString()

	return out_str
}

// ---------------------------------------------------------------------
static String xml_update_proc (xml_str,id_in,population_in)
{
	def root = new XmlParser().parseText(xml_str)

	def today = new Date ().format ("yyyy-MM-dd")
	root.cities.each
		{
		if (it.id.text () == id_in)
			{
			it.population[0].value = population_in
			it.date_mod[0].value = today
			}

//		print it.id.text () + "\t" + it.name.text () + "\t"
//		println it.population.text () + "\t" + it.date_mod.text ()
		}

	def out_str = xml_to_string_proc (root)

	return out_str
}
// ---------------------------------------------------------------------

static String xml_delete_proc (xml_str,id_in)
{
	def root = new XmlParser().parseText(xml_str)

	root.cities.each
		{
		if (it.id.text () == id_in)
			{
			print "delete\t"
		print it.id.text () + "\t" + it.name.text () + "\t"
		println it.population.text () + "\t" + it.date_mod.text ()

			root.remove (it)
			}

		}

	def out_str = xml_to_string_proc (root)

	return out_str
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
