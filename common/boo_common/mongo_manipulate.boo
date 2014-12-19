// --------------------------------------------------------------------
/*
	mongo_manipulate.boo

				Nov/25/2014


*/
// --------------------------------------------------------------------
namespace mongo_manipulate

// --------------------------------------------------------------------
def mongo_display_proc (things as IMongoCollection):
//
	cursor as ICursor = things.FindAll ()

	for doc in cursor.Documents: 
		key = doc["key"]
		name = doc["name"]
		population = doc["population"]
		date_mod = doc["date_mod"]
		print "${key}\t${name}\t${population}\t${date_mod}"
// --------------------------------------------------------------------
def mongo_update_proc (things as IMongoCollection,key_in,population_in):
//
	print "*** mongo_update_proc *** start ***"

	doc_new = Document ()
	doc_new["key"] = key_in

	name_aa = ""

	count = 0

	for contact in things.Find(doc_new).Documents:
		print "*** mongo_update_proc *** aaa ***"
		name_aa = contact["name"].ToString ()
		count++

	print count

	if (0 < count):
		print "*** mongo_update_proc *** bbb ***"
		things.Remove (doc_new)

		doc_new["name"] = name_aa
		doc_new["population"] = population_in
		doc_new["date_mod"] = DateTime.Now
		things.Save (doc_new)

//
	print "*** mongo_update_proc *** end ***"
// --------------------------------------------------------------------
