// --------------------------------------------------------------
//	read/neo4j_read.boo
//
//					Oct/21/2011
// --------------------------------------------------------------
import	System

// --------------------------------------------------------------
def row_parser (key):
	uri= "http://localhost:7474/db/data/node/" + key + "/properties"
	user = ""
	passwd = ""

	json_str = get_uri.get_uri_proc (uri,user,passwd)

	if (json_str != null):
		neo4j_manipulate.out_record_proc (key,json_str)

// --------------------------------------------------------------
print "*** 開始 ***"

keys =["2","3","4","5","6","7","8","9","10"]

for key in keys:
	row_parser (key)

print "*** 終了 ***"

// --------------------------------------------------------------
