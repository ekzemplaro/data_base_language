// -----------------------------------------------------------------
//	text_manipulate.scala
//
//						Feb/03/2015
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

import java.util.Date
import java.text.SimpleDateFormat

// -----------------------------------------------------------------
object text_manipulate
{
// -----------------------------------------------------------------
def text_read_proc (file_in:String):(mutable.Map[String,Object]) = {
	println	(file_in)

	var dict_aa = mutable.Map[String,Object] ()

	val source = Source.fromFile (file_in)

	for( line <- source.getLines )
		{
		val words = line.stripLineEnd.split ("\t")
		val id = words(0)

		var unit_aa = mutable.Map[String,String] ()
		unit_aa("name") = words(1)
		unit_aa("population") = words(2)
		unit_aa("date_mod") = words(3)
		dict_aa(id) = unit_aa
//		println( line.stripLineEnd )
		}

	dict_aa
}

// -----------------------------------------------------------------
def	text_write_proc (file_out:String,dict_aa: mutable.Map[String,Object])
{
	var out = new java.io.FileOutputStream (file_out)

	var writer = new java.io.OutputStreamWriter (out,"utf8")

	for (pair <- dict_aa)
		{
		var unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		val out_str = pair._1 + "\t" + unit_aa("name") + "\t" +
			unit_aa("population") + "\t" + unit_aa("date_mod") + "\n"

		writer.write	(out_str)
		}

	writer.close ()
	out.close ()
}

// -----------------------------------------------------------------
def	dict_display_proc (dict_aa: mutable.Map[String,Object])
{
	val list_aa = dict_aa.toList

	val list_bb = list_aa.sortWith((s1,s2) => s1._1 < s2._1)

	for (pair <- list_bb)
		{
		val key = pair._1
		if ((key != "_id") && (key != "_rev"))
			{
		val unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		val out_str = key + "\t" + unit_aa("name") + "\t" +
			unit_aa("population") + "\t" + unit_aa("date_mod")

			println	(out_str)
			}
		}
}

// -----------------------------------------------------------------
def dict_update_proc (dict_aa:mutable.Map[String,Object],id_in:String,population_in:Int)
		:(mutable.Map[String,Object]) = {

	var unit_aa = dict_aa(id_in).asInstanceOf [mutable.Map[String,String]]


	val out_str = unit_aa("name") + "\t" +
			unit_aa("population") + "\t" + unit_aa("date_mod")

		println	(out_str)

	val str_ddx = text_manipulate.get_current_date_proc ()

	unit_aa("population") = "%d".format (population_in)
	unit_aa("date_mod") = str_ddx

	dict_aa
}

// -----------------------------------------------------------------
def get_current_date_proc () =
{
	val now = new Date
	val dfm = new java.text.SimpleDateFormat ("yyyy-MM-dd")
	dfm format now
}

// -----------------------------------------------------------------
def dict_delete_proc (dict_aa:mutable.Map[String,Object],id_in:String)
		:(mutable.Map[String,Object]) = {

	dict_aa -= id_in

	dict_aa
}
// -----------------------------------------------------------------
def dict_append_proc (dict_aa:mutable.Map[String,Object],id_in:String,
	name_in:String,population_in:Int,date_mod_in:String)
		:(mutable.Map[String,Object]) = {

	var unit_aa = mutable.Map[String,String] ()
	unit_aa("name") = name_in
	unit_aa("population") = "%d".format (population_in)
	unit_aa("date_mod") = date_mod_in
	dict_aa(id_in) = unit_aa

	dict_aa
}

// -----------------------------------------------------------------
def csv_read_proc (file_in:String):(mutable.Map[String,Object]) = {
	println	(file_in)

	var dict_aa = mutable.Map[String,Object] ()

	val source = Source.fromFile (file_in)

	for( line <- source.getLines )
		{
		val words = line.stripLineEnd.split (",")
		val id = words(0)

		var unit_aa = mutable.Map[String,String] ()
		unit_aa("name") = words(1)
		unit_aa("population") = words(2)
		unit_aa("date_mod") = words(3)
		dict_aa(id) = unit_aa
		}

	dict_aa
}

// -----------------------------------------------------------------
def	csv_write_proc (file_out:String,dict_aa: mutable.Map[String,Object])
{
	var out = new java.io.FileOutputStream (file_out)

	var writer = new java.io.OutputStreamWriter (out,"utf8")

	for (pair <- dict_aa)
		{
		var unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		val out_str = pair._1 + "," + unit_aa("name") + "," +
			unit_aa("population") + "," + unit_aa("date_mod") + "\n"

		writer.write	(out_str)
		}

	writer.close ()
	out.close ()
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
