// -------------------------------------------------------
//	text_manipulate.io
//
//					Aug/28/2011
//
// -------------------------------------------------------
insert_proc := method (dict_aa,key,name,population,date_mod,
	unit_aa := Map clone
	unit_aa atPut ("name", name)
	unit_aa atPut ("population", population)
	unit_aa atPut ("date_mod", date_mod)
	dict_aa atPut (key, unit_aa)

	return	(dict_aa)
}

// -------------------------------------------------------
record_out_proc := method (key,dict_aa,
	write (key)
	write ("\t")
	write ((dict_aa at (key)) at ("name"))
	write ("\t")
	write ((dict_aa at (key)) at ("population"))
	write ("\t")
	writeln ((dict_aa at (key)) at ("date_mod"))
}

// -------------------------------------------------------
record_to_str_proc := method (key,dict_aa,delimit,
	str_out := key
	str_out = str_out ..  delimit
	str_out = str_out .. (dict_aa at (key)) at ("name")
	str_out = str_out ..  delimit
	str_out = str_out .. (dict_aa at (key)) at ("population")
	str_out = str_out ..  delimit
	str_out = str_out .. (dict_aa at (key)) at ("date_mod")
	str_out = str_out ..  "\n"

	return	(str_out)
}

// -------------------------------------------------------
dict_to_str_proc := method (dict_aa,delimit,
	str_out := ""
	list_aa := dict_aa keys
	list_aa foreach (it,value,str_out = str_out .. record_to_str_proc (value,dict_aa,delimit))

	return	(str_out)
)
// -------------------------------------------------------
dict_display_proc := method (dict_aa,
	delimit := "\t"
	list_aa := dict_aa keys
	list_aa foreach (it,value,record_out_proc (value,dict_aa))

)
// -------------------------------------------------------
str_to_dict_proc := method (str_in,delimit,
	dict_aa := Map clone
	lines := str_in split(" ", "\n") 

	lines foreach (it,value,
		words := value split(" ", delimit)
		key := words at (0)
		name := words at (1)
		population := words at (2)
		date_mod := words at (3)
		dict_aa = insert_proc (dict_aa,key,name,population,date_mod)
		)

	return	(dict_aa)
)

// -------------------------------------------------------
dict_update_proc := method (dict_aa,key,population,
	today := Date year .. "-" .. Date month .. "-" .. Date day
	unit_aa := dict_aa at (key)
	unit_aa atPut ("population",population)
	unit_aa atPut ("date_mod",today)

	return	(dict_aa)
)

// -------------------------------------------------------
