// --------------------------------------------------------------
//	mcached_manipulate.scala
//
//					Feb/03/2015
// --------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

import org.json4s._
import org.json4s.JsonDSL._
import org.json4s.native.JsonMethods._

import java.net.Socket
import java.io.DataInputStream
import java.io.InputStreamReader
import java.io.BufferedReader
import java.io.OutputStream
import	java.io.DataOutputStream
// --------------------------------------------------------------
object mcached_manipulate
{
// --------------------------------------------------------------
def get_record_proc (key_id:String,rr:InputStreamReader,output:OutputStream)
	:(mutable.Map[String,String]) = {
	var unit_aa = mutable.Map[String,String] ()

	val command = "get " + key_id + '\n'
	var data = command.getBytes()
	output.write (data)
	output.flush ()
	var key = ""
	var line:String = ""
	var buf = new BufferedReader(rr);

	var flag_find = false

	while(({line = buf.readLine(); line != null}) && line != "END")
		{
		if (line.contains ("VALUE"))
			{
			val cols = line.split (" ")
			key = cols(1)
			flag_find = true
			}
		else if (line.contains ("name"))
			{
	//		println (line)
			val json = parse(line)
			val name = (json \ "name").values
			val population = (json \ "population").values
			val date_mod = (json \ "date_mod").values
			unit_aa("name") = name.toString
			unit_aa("population") = population.toString
			unit_aa("date_mod") = date_mod.toString
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
def mcached_to_dict_proc (server:String,port:Int,keys:Array[String]):(mutable.Map[String,Object]) = {

	var ss = new Socket (server,port)

	var input = ss.getInputStream ()
	var rr = new InputStreamReader (input)
	var output = ss.getOutputStream ()

	var dict_aa = mutable.Map[String,Object] ()

	for (key <- keys)
		{
		var unit_aa = get_record_proc (key,rr,output)

//		println ("key = " + key)

		if (unit_aa != null)
			{
			dict_aa(key) = unit_aa
			}
		}

	dict_aa
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
	while(({line = buf.readLine(); line != null}) && line != "END")
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
def mcached_socket_write_proc (key:String ,value_in:String,
	input:DataInputStream,output:DataOutputStream)
{
	println (value_in)

	var rvalue = null
	val llx = value_in.getBytes().length
	val command = "set " + key + " 0 0 " + llx + "\r\n"
	println (command)

	output.writeBytes (command)
	output.flush ()

	var rr = new InputStreamReader (input)

	val command_bb =  value_in.getBytes()
	val rn = "\r\n"

	output.write (command_bb)
	output.writeBytes (rn)
	output.flush ()

	var buf = new BufferedReader(rr);

	var line:String = ""

	while(({line = buf.readLine(); line != null}) && line != "STORED")
		{
		if (line.contains ("ERROR"))
			{
			println (line)
//			return null
			}
		}

//	return	rvalue
}

// --------------------------------------------------------------
def dict_to_mcached_proc (server:String,port:Int,
	dict_aa: mutable.Map[String,Object])
{
	println ("*** dict_to_mcached_proc ***")

	var sock = new Socket (server,port)
	var output = new DataOutputStream (sock.getOutputStream ())
	var input = new DataInputStream (sock.getInputStream ())


	for (pair <- dict_aa)
		{
		val key = pair._1
		val unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]

		val unit_bb = unit_aa.toMap
		val json_str = compact(render(unit_bb))

		mcached_manipulate.mcached_socket_write_proc (key,json_str,input,output)
		}

	input.close ()
	output.close ()
	sock.close ()
}
// --------------------------------------------------------------
def mcached_update_proc (server:String,port:Int,key_in:String,population_in:Int)
{
	System.out.println ("*** mcached_update_proc ***");
	System.out.println ("key_in = " + key_in);

	var sock = new Socket (server,port)

	var iis = sock.getInputStream ()
	var input = new DataInputStream (iis)
	var rr = new InputStreamReader (iis)
	var output = new DataOutputStream (sock.getOutputStream ())

	var unit_aa = mcached_manipulate.get_record_proc (key_in,rr,output)

	if (unit_aa != null)
		{
		unit_aa("population") = "%d".format (population_in)
		val date_mod_new = text_manipulate.get_current_date_proc ()
		unit_aa("date_mod") = date_mod_new

		val unit_bb = unit_aa.toMap
		val json_str = compact(render(unit_bb))
		println (json_str)

		mcached_manipulate.mcached_socket_write_proc (key_in,json_str,input,output)
		}

	input.close ()
	output.close ()
	sock.close ()
}
// --------------------------------------------------------------
}

// --------------------------------------------------------------

