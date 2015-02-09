// -----------------------------------------------------------------------
/*
	text_manipulate.groovy


					Feb/04/2015
*/
// -----------------------------------------------------------------------
import	java.text.DateFormat
import	java.text.SimpleDateFormat


// -----------------------------------------------------------------------
class text_manipulate
{
// -----------------------------------------------------------------------
static text_read_proc (file_in)
{
	println (file_in)

	def text = new File (file_in).text
	def lines = text.split ("\n")

	def dict_aa = new HashMap()

	lines.each {
		def words = it.split ("\t")


		def map = ['name': words[1], 'population': words[2], 'date_mod': words[3]]

		def key = words[0] as String

		dict_aa [(key as String)] = map
		}

	return	dict_aa;
}

// -----------------------------------------------------------------------
static void dict_display_proc (dict_aa)
{
	println ("*** dict_display_proc ***")

	dict_aa = dict_aa.sort ()

	dict_aa.keySet().each { key ->
		if ((key != '_id') && (key != '_rev'))
		{
		if (dict_aa[key]['name'] != [])
		{
		println key + "\t" + dict_aa[key]['name'] + "\t" + dict_aa[key]['population'] + "\t" + dict_aa[key]['date_mod']
		 }
		}
		 }
}


// -----------------------------------------------------------------------
static dict_update_proc (dict_in,key_in,population_in)
{
	if (dict_in.containsKey (key_in))
		{
		def today = new Date ().format ("yyyy-MM-dd")

		dict_in[key_in]['population'] = population_in
		dict_in[key_in]['date_mod'] = today
		}

	return	dict_in
}

// -----------------------------------------------------------------------
static dict_delete_proc (dict_in,id_in)
{
	println ("dict_in.size () = " + dict_in.size ())

	if (dict_in.containsKey (id_in))
		{
		println dict_in[id_in]
		println dict_in[id_in]['population']
		println dict_in[id_in]['date_mod']

		dict_in.remove (id_in)
		}

	println ("dict_in.size () = " + dict_in.size ())

	return	dict_in
}

// -----------------------------------------------------------------------
static text_write_proc (file_out,dict_aa)
{
	println ("*** text_write_proc ***")

	def file = new File (file_out).newWriter ('UTF-8')

	dict_aa.keySet().each { key ->
		 file.println key + "\t" + dict_aa[key]['name'] + "\t" +
		dict_aa[key]['population'] + "\t" +
		dict_aa[key]['date_mod'] }

//	file.println words[0]+"\t"+words[1]+"\t"+words[2]+"\t"+words[3]

	file.close ()
}

// -----------------------------------------------------------------------
static dict_append_proc (dict_in,key,name_in,population_in,date_mod_in)
{
	def map = ['name': name_in, 'population': population_in, 'date_mod': date_mod_in]

//	def key = id_in as String

//	dict_in [(key as String)] = map
	dict_in [key] = map

	return	dict_in
}

// -----------------------------------------------------------------------
static csv_read_proc (file_in)
{
	println (file_in)

	println ("*** csv_read_proc aaa ***")
	def text = new File (file_in).text
	def lines = text.split ("\n")

	def dict_aa = new HashMap()


	lines.each {
		def words = it.split (",")


		def map = ['name': words[1], 'population': words[2], 'date_mod': words[3]]

		def key = words[0] as String

		dict_aa [(key as String)] = map
		}

	return	dict_aa;
}

// -----------------------------------------------------------------------
static csv_write_proc (file_out,dict_aa)
{
	println ("*** csv_write_proc ***")

	def file = new File (file_out).newWriter ('UTF-8')

	dict_aa.keySet().each { key ->
		 file.println key + "," + dict_aa[key]['name'] + "," +
		dict_aa[key]['population'] + "," +
		dict_aa[key]['date_mod'] }

	file.close ()
}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------

