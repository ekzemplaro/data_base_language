// --------------------------------------------------------------
//	mcached_manipulate.scala
//
//					May/29/2012
// --------------------------------------------------------------
import scala.io.Source
import scala.util.parsing.json.JSON
import scala.collection.mutable

import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;

import java.net.Socket
import java.io.InputStreamReader
import java.io.BufferedReader
import java.io.OutputStream
// --------------------------------------------------------------
object mcached_manipulate
{
// --------------------------------------------------------------
def mcached_to_dict_proc (server:String,port:Int,keys:Array[String]):(mutable.Map[String,Object]) = {

	var ss = new Socket (server,port)

	var input = ss.getInputStream ()
	var rr = new InputStreamReader (input)
	var output = ss.getOutputStream ()

	var dict_aa = mutable.Map[String,Object] ()

	for (key <- keys)
		{
		var unit_aa = get_record_proc (key,rr,output)

// println ("key = " + key)

		if (unit_aa != null)
			{
// println ("not null key = " + key)
		dict_aa(key) = unit_aa
			}
		}

	dict_aa
}

// --------------------------------------------------------------
def get_record_proc (key_id:String,rr:InputStreamReader,output:OutputStream)
	:(mutable.Map[String,String]) = {
	var unit_aa = mutable.Map[String,String] ()

	val command = "get " + key_id + '\n'
	var data = command.getBytes()
	output.write (data)
	output.flush ()
	var key = ""
	var line = ""
	var buf = new BufferedReader(rr);

	var flag_find = false

	while( null != (line = buf.readLine() ) && line != "END"  )
		{
		if (line.contains ("VALUE"))
			{
			val cols = line.split (" ")
			key = cols(1)
	flag_find = true
// println (line)
			}
		else if (line.contains ("name"))
			{
			unit_aa = json_parse_proc (line)
			}
		else if (line.contains ("ERROR"))
			{
			println (line)
			return null
			}
		}

	if (flag_find == false)
		{
		unit_aa = null
		}

	unit_aa
}

// --------------------------------------------------------------
def json_parse_proc (str_json:String) :(mutable.Map[String,String]) = {
	var unit_aa = mutable.Map[String,String] ()

	for (tpl <- JSON.parse(str_json).get) {
		tpl match {
		case (t1:String, t2:String) if(t1 == "name") => unit_aa("name") = t2
		case (t1:String, t2:Double) if(t1 == "population") => unit_aa("population") = "%d".format (t2.toInt)
		case (t1:String, t2:Int) if(t1 == "population") => unit_aa("population") = "%d".format (t2) 
		case (t1:String, t2:String) if(t1 == "population") => unit_aa("population") = t2
		case (t1:String, t2:String) if(t1 == "date_mod") => unit_aa("date_mod") = t2
		case _ =>
		}
	}

	unit_aa
}
// --------------------------------------------------------------
def delete_record_proc (key_id:String,server:String,port:Int)
{
	println ("*** delete_record_proc aaa ***")

	var ss = new Socket (server,port)
	var input = ss.getInputStream ()
	var rr = new InputStreamReader (input)
	var output = ss.getOutputStream ()

	val command = "delete " + key_id + '\n'
	var data = command.getBytes()
	output.write (data)
	output.flush ()
	var key = ""
	var line = ""
	var buf = new BufferedReader(rr);
	println ("*** delete_record_proc ccc ***")
	while( null != (line = buf.readLine() ) && line != "END"  )
		{
			println (line)
		if (line.contains ("ERROR"))
			{
			println (line)
			return
			}
		if (line.contains ("NOT_FOUND"))
			{
			println (line)
			return
			}
		else if (line.contains ("DELETED"))
			{
			println (line)
			return
			}

		}
}

// --------------------------------------------------------------
def mcached_read_single (mc:MemCachedClient,key:String)
{
	var str_json  = mc.get (key).toString

if (str_json != null)
{
var unit_aa = json_manipulate.json_to_unit_proc (str_json)
	var name = unit_aa.get ("name")
	var pop_str = unit_aa.get ("population").toString ()
	var date_mod = unit_aa.get ("date_mod")

	var out_str = key + "\t" + name + "\t"
	out_str += pop_str + "\t" + date_mod
	println (out_str)
}

}
// --------------------------------------------------------------
def mcached_update_proc (mc:MemCachedClient,key:String,population_in:Int)
{
	System.out.println ("*** mcached_update_proc ***");
	System.out.println ("key = " + key);

	val str_json  = mc.get(key).toString

	System.out.println (str_json);

	val unit_aa = json_manipulate.json_to_unit_proc (str_json)

	print ("name = " +  unit_aa("name") + "\t")
	print (unit_aa("population") + "\t")
	println (unit_aa("date_mod"))

	val date_mod_new = text_manipulate.get_current_date_proc ()


	println ("key = " + key)

	mcached_manipulate.data_put_proc (mc,key,unit_aa("name"),population_in,date_mod_new)

}

// --------------------------------------------------------------
def data_put_proc (mc:MemCachedClient,
	key:String,name_in:String,population_in:Int,date_mod_in:String)
{
	val value  = json_manipulate.unit_json_gen_proc (
		name_in,population_in,date_mod_in)

	if(mc.set(key, value))
		{
		println("set ok")
		}
	else
		{
		println("set ng")
		}
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------

