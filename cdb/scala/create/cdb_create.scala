// ----------------------------------------------------------------
/*
	cdb_create.scala

					Jun/12/2015

*/
// ----------------------------------------------------------------
import	java.io.IOException
import	java.util.HashMap
import	java.util.Set

import	com.strangegizmo.cdb.CdbMake

import  net.arnx.jsonic.JSON

import scala.collection.mutable
// ----------------------------------------------------------------
object cdb_create
{
// ----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val file_cdb = args(0)
		
	var dict_aa = data_prepare_proc ()

	cdb_manipulate.dict_to_cdb_proc (dict_aa,file_cdb)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {
	var dict_aa = mutable.Map[String,Object] ()


	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2761","豊中",63914,"2008-8-7")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2762","池田",84257,"2008-9-16")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2763","高槻",98253,"2008-5-18")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2764","吹田",87324,"2008-9-21")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2765","茨木",72531,"2008-8-12")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2766","摂津",28529,"2008-7-28")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2767","泉大津",39457,"2008-6-19")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2768","和泉",47362,"2008-11-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2769","高石",56872,"2008-10-24")

	return	dict_aa
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
