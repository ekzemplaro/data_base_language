#! /usr/bin/booi
// ------------------------------------------------------------
//	xml_create.boo
//
//					Jul/30/2014
//
// ------------------------------------------------------------
import System
import System.IO

// ------------------------------------------------------------
def out_proc (id,name,population,date_mod):
	str_out = "<${id}>\n"
	str_out += "\t<id>${id}</id>\n"
	str_out += "\t<name>${name}</name>\n"
	str_out += "\t<population>${population}</population>\n"
	str_out += "\t<date_mod>${date_mod}</date_mod>\n"
	str_out += "</${id}>\n"
	return str_out
// ------------------------------------------------------------
print '*** 開始 ***'
file_out = argv[0]

fp_out = StreamWriter (file_out)

str_out = '<?xml version="1.0" encoding="utf-8"?>\n'
str_out += "<root>\n"
str_out += out_proc ('t2261','静岡','79821','1968-5-21')
str_out += out_proc ('t2262','浜松','59617','1968-10-27')
str_out += out_proc ('t2263','沼津','34593','1968-8-16')
str_out += out_proc ('t2264','三島','52497','1968-9-23')
str_out += out_proc ('t2265','富士','41856','1968-3-9')
str_out += out_proc ('t2266','熱海','83642','1968-5-19')
str_out += out_proc ('t2267','富士宮','51748','1968-9-12')
str_out += out_proc ('t2268','藤枝','94382','1968-7-18')
str_out += out_proc ('t2269','御殿場','51964','1968-4-11')
str_out += out_proc ('t2270','島田','61235','1968-9-24')
str_out += "</root>\n"

fp_out.Write (str_out)
fp_out.Close ()

print '*** 終了 ***'
// ------------------------------------------------------------
