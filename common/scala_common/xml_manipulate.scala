// -----------------------------------------------------------------
//	xml_manipulate.scala
//
//						Sep/22/2014
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

import scala.xml._

// -----------------------------------------------------------------
object xml_manipulate
{
// -----------------------------------------------------------------
def xml_to_dict_proc (xml_str:String,keys:Array[String])
	:(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	val root = xml.XML.loadString (xml_str)

	for (key:String <- keys)
		{
		val unit_pp = root \ key

		if (unit_pp != None)
			{
			var unit_aa = mutable.Map[String,String] ()
			var name = (unit_pp \ "name").text
			if (name != "")
				{
				unit_aa("name") = name
			unit_aa("population") = (unit_pp \ "population").text
			unit_aa("date_mod") = (unit_pp \ "date_mod").text
				dict_aa(key) = unit_aa
				}
			}
		}

	dict_aa
}
// -----------------------------------------------------------------
def dict_to_xml_proc (dict_aa : mutable.Map[String,Object]) : String = {

	var str_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
	str_xml += "<root>"

	for (pair <- dict_aa)
		{
		var unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		str_xml += row_data_gen (pair._1,unit_aa("name"),unit_aa("population"),unit_aa("date_mod"))
		}

	str_xml += "</root>"
	return	str_xml
}
// -----------------------------------------------------------------
def row_data_gen (id:String,name:String,population:String,date_mod:String):String = {
	"<" + id + ">\n" +
	"<name>" + name + "</name>\n" +
	"<population>" + population + "</population>\n" +
	"<date_mod>" + date_mod + "</date_mod>\n" +
	"</" + id + ">\n"
}

// -----------------------------------------------------------------
// -----------------------------------------------------------------
def disp_proc (root:Node)
{
	val cities = root \ "cities"

	for (city <- cities)
		{
		val id = (city \ "id").text
		val name = (city \ "name").text
		val population = (city \ "population").text
		val date_mod = (city \ "date_mod").text
		println (id + "\t" + name + "\t" + population + "\t" + date_mod)
		}
}

// -----------------------------------------------------------------
def read_proc (xml_file:String) =
{
	val root = xml.XML.loadFile (xml_file)

	val cities_xml = root \ "cities"
	var cities = mutable.Map[Int,mutable.Map[String,String]] ()

	for (city_xml <- cities_xml)
		{
		var city = mutable.Map[String,String] ()
		
		val id_in = (city_xml \ "id").text
		val name_in = (city_xml \ "name").text
		val population_in = (city_xml \ "population").text
		val date_mod_in = (city_xml \ "date_mod").text

		city += ("id" -> id_in)
		city += ("name" -> name_in)
		city += ("population" -> population_in)
		city += ("date_mod" -> date_mod_in)

		cities += (id_in.toInt -> city)
		}

	cities
}

// -----------------------------------------------------------------
def write_proc (xml_file:String,
	cities:mutable.Map[Int,mutable.Map[String,String]])
{
	var out_str = "<?xml version=\"1.0\" encoding=\"utf-8\"?><root>\n"

	for (city <- cities)
		{
		val str_aa = xml_row_gen_proc (city._2)
//	println (str_aa)

		out_str += str_aa
		}
	out_str += "</root>\n"


	val out = new java.io.FileWriter (xml_file)

	out.write (out_str)
	out.close
}

// -----------------------------------------------------------------
def xml_row_gen_proc (city:mutable.Map[String,String]):String =
{
	"<cities>\n" + "<id>" + city("id") + "</id>\n" +
	"<name>" + city("name") + "</name>\n" +
	"<population>" + city("population") + "</population>\n" +
	"<date_mod>" + city("date_mod") + "</date_mod>\n" +
	"</cities>\n"
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
