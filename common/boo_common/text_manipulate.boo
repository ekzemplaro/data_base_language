// ------------------------------------------------------------
//	text_manipulate.boo
//
//						Jul/30/2014
//
// ------------------------------------------------------------
namespace text_manipulate

import System.Collections
import System.IO
// ------------------------------------------------------------
def dict_display_proc (dict_aa as Hashtable):
//	print dict_aa.Count
//
	for key in dict_aa.Keys:
		uu_aa as Hashtable = dict_aa[key]
		name = uu_aa['name']
		population = uu_aa['population']
		date_mod = uu_aa['date_mod']
		print "${key}\t${name}\t${population}\t${date_mod}"

// ------------------------------------------------------------
def text_read_proc (file_in as string):
	delimit = '\t'
	dict_aa = text_read_proc_exec (file_in,delimit)
	return dict_aa
// ------------------------------------------------------------
def text_read_proc_exec (file_in as string,delimit):
	dict_aa = {}
	mylist as List = []
	fp_in = StreamReader (file_in)
	for line in fp_in:
		mylist.Add (line)
		bb as List = []
		for aa as string in line.Split (char.Parse (delimit)):
			bb.Add (aa)
		id = bb[0]
		unit_aa = {'name': bb[1],'population': bb[2],'date_mod': bb[3]}
		dict_aa[id] = unit_aa
	fp_in.Close ()
//
	return dict_aa

// ------------------------------------------------------------
def dict_to_string_proc (dict_aa as Hashtable,delimit):
	str_out = ""
	for key in dict_aa.Keys:
		uu_aa as Hashtable = dict_aa[key]
		name = uu_aa['name']
		population = uu_aa['population']
		date_mod = uu_aa['date_mod']
		str_out += "${key}${delimit}${name}${delimit}"
		str_out += "${population}${delimit}${date_mod}\n"
	return str_out
// ------------------------------------------------------------
def text_write_proc (file_out as string,dict_aa as Hashtable):
	delimit = '\t'
	text_write_proc_exec (file_out,dict_aa,delimit)
//
// ------------------------------------------------------------
def text_write_proc_exec (file_out as string,dict_aa as Hashtable,delimit):
	str_out = dict_to_string_proc (dict_aa as Hashtable,delimit)

	fp_out = StreamWriter (file_out)

	fp_out.Write (str_out)
	fp_out.Close ()
// ------------------------------------------------------------
def dict_append_proc (dict_aa as Hashtable,id,name,population,date_mod):
	unit_aa = {'name': name,'population': population,'date_mod': date_mod}
	dict_aa[id] = unit_aa
	return	dict_aa
// ------------------------------------------------------------
def dict_update_proc (dict_aa as Hashtable,id_in,population_in):
	uu_aa as Hashtable = dict_aa[id_in]
	print uu_aa['name']
	uu_aa['population'] = population_in
	uu_aa['date_mod'] = DateTime.Now
	return	dict_aa
// ------------------------------------------------------------
def csv_read_proc (file_in as string):
	delimit = ','
	dict_aa = text_read_proc_exec (file_in,delimit)
	return dict_aa
// ------------------------------------------------------------
def csv_write_proc (file_out as string,dict_aa as Hashtable):
	delimit = ','
	text_write_proc_exec (file_out,dict_aa,delimit)
//
// ------------------------------------------------------------
