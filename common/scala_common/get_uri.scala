// --------------------------------------------------------------
//	scala_common/get_uri.scala
//
//					Oct/12/2011
// --------------------------------------------------------------
import scala.util.parsing.json.JSON
import scala.io.Source

import	java.io.BufferedReader
import	java.io.InputStreamReader

import org.apache.commons.httpclient.HttpClient  
import org.apache.commons.httpclient.HttpStatus
import org.apache.commons.httpclient.methods.GetMethod
import org.apache.commons.httpclient.methods.PostMethod
import org.apache.commons.httpclient.methods.PutMethod
import org.apache.commons.httpclient.methods.DeleteMethod
import org.apache.commons.httpclient.methods.RequestEntity
import org.apache.commons.httpclient.methods.StringRequestEntity

// --------------------------------------------------------------
object get_uri
{

// --------------------------------------------------------------
def get_uri_proc (uri_in:String):String =
{
/*
	val source = Source.fromURL (uri_in)
	var str_out = ""

	for (line <- source.getLines )
		{
		str_out += line
		}

*/
	var str_out = ""

	val httpclient = new HttpClient()

	val httpget = new GetMethod (uri_in)

	try 
	{
		val statusCode = httpclient.executeMethod(httpget)


		if (statusCode != HttpStatus.SC_OK)
			{
			System.err.println
			("Method failed: " + httpget.getStatusLine())
			}

		val reader = new BufferedReader(new InputStreamReader
			(httpget.getResponseBodyAsStream ()))

		var line = ""

//		while ({line= reader.readLine(); 0 < line.length })
		while ({line= reader.readLine(); line != null})
			{
//			println (line)
			str_out += line
			}

		reader.close ();

	} finally
		{
		httpget.releaseConnection();
		}

	return	str_out
}
// --------------------------------------------------------------
def rest_put_proc (uri_aa:String,str_data_in:String,type_in:String)
// throws Exception
{
	val put = new PutMethod (uri_aa)
	val entity = 
		new StringRequestEntity (str_data_in, type_in, "UTF-8")
	put.setRequestEntity (entity)

	try
		{
		val httpclient = new HttpClient()
		val result = httpclient.executeMethod(put)
		System.out.println("Response status code: " + result)
		}
	finally
		{
		put.releaseConnection()
		}
}

// --------------------------------------------------------------
def rest_delete_proc (uri_aa:String)
// throws Exception
{
	val delete = new DeleteMethod (uri_aa)

	try
		{
		val httpclient = new HttpClient()
		val result = httpclient.executeMethod(delete)
		System.out.println("Response status code: " + result)
		}
	finally
		{
		delete.releaseConnection()
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
