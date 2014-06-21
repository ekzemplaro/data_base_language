// -------------------------------------------------------------
//
//	redis_update.boo
//
//						Mar/12/2013
// -------------------------------------------------------------
import System

// -------------------------------------------------------------
print "*** 開始 ***"

id_in = argv[0]
population_in = int.Parse (argv[1])

print id_in,population_in

rd = Redis ("host_dbase",6379)

redis_manipulate.update_proc (rd,id_in,population_in)

print "*** 終了 ***"
// -------------------------------------------------------------
