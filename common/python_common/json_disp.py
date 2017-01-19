# -*- coding: utf-8 -*-
#
#	python_common/json_disp.py
#
#					Apr/25/2011
#
#
import	sys
import	datetime
#
#
# -------------------------------------------------------------------
def	json_display_proc (array_in):
	array_cities = array_in['cities']
	for it in range (len (array_cities)):
		print array_cities[it]['id'],"\t",
		print array_cities[it]['name'],"\t",
		print array_cities[it]['population'],"\t",
		print array_cities[it]['date_mod']
# -------------------------------------------------------------------
def	json_update_proc (array_in,id_in,population):
	array_cities = array_in['cities']
	for it in range (len (array_cities)):
		if (id_in == int (array_cities[it]['id'])):
			date_mod = datetime.datetime.now ()
			array_cities[it]['population'] = population
			array_cities[it]['date_mod'] = '%s' % date_mod
			print '*** json_update_proc ***',it,id_in
# -------------------------------------------------------------------
def	json_delete_proc (hash_in,id_in):
	array_cities = hash_in['cities']
	array_out = []
	for it in range (len (array_cities)):
		if (id_in == int (array_cities[it]['id'])):
			print '*** json_delete_proc ***',it,id_in
		else:
			array_out.append (array_cities[it])
	hash_aa = {'cities': array_out}
	if ('_rev' in hash_in):
		hash_aa['_rev']=hash_in['_rev']
#
	return	hash_aa

#	
# -------------------------------------------------------------------
#
#
