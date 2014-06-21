// -------------------------------------------------------------
//
//	redis_create.boo
//
//					Mar/12/2013
// -------------------------------------------------------------
import System

// -------------------------------------------------------------
def redis_set_proc (rd as Redis,key,name,population,date_mod):
	json_new = kvalue_manipulate.json_create_proc (name,population,date_mod)
	rd.Set (key, json_new)

// -------------------------------------------------------------
print "*** 開始 ***"

rd = Redis ("host_dbase",6379)

redis_set_proc (rd,"t1851","福井",84592,"1968-10-16")
redis_set_proc (rd,"t1852","敦賀",29738,"1968-7-8")
redis_set_proc (rd,"t1853","小浜",25718,"1968-4-21")
redis_set_proc (rd,"t1854","大野",31735,"1968-6-9")
redis_set_proc (rd,"t1855","勝山",42531,"1968-8-14")
redis_set_proc (rd,"t1856","鯖江",34957,"1968-9-4")
redis_set_proc (rd,"t1857","あわら",92874,"1968-3-7")
redis_set_proc (rd,"t1858","越前",47635,"1968-1-5")
redis_set_proc (rd,"t1859","坂井",18723,"1968-2-17")

print "*** 終了 ***"

// -------------------------------------------------------------
