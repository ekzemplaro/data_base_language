// ---------------------------------------------------------------------- 
//
//	cassandra_create.groovy
//
//					Sep/05/2013
//
// ---------------------------------------------------------------------- 
import	java.util.HashMap

import	java.sql.Connection
import	java.sql.DriverManager

import	text_manipulate
import	cassandra_manipulate
// ---------------------------------------------------------------------- 
class cassandra_create {
 
// ---------------------------------------------------------------------- 
static void main(args)
{
	println ("*** 開始 ***")

	def dict_aa = data_prepare_proc ()

	def str_connect = "jdbc:cassandra://localhost:9160/city"

	def conn = DriverManager.getConnection (str_connect)

	cassandra_manipulate.dict_to_cassandra_proc (dict_aa,conn)

	conn.close ()

	println ("*** 終了 ***")

}
 
// ---------------------------------------------------------------------- 
static data_prepare_proc ()
{
	println "*** data_prepare_proc ***"

	def dict_aa = new HashMap()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t0531","秋田",51978,"1999-8-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t0532","男鹿",26174,"1999-2-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t0533","由利本荘",78235,"1999-11-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t0534","横手",54736,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t0535","鹿角",23491,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t0536","大館",18423,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t0537","能代",24518,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t0538","にかほ",17632,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t0539","湯沢",83715,"1999-10-2")

	return	dict_aa
}
// ---------------------------------------------------------------------- 
}
// ---------------------------------------------------------------------- 
