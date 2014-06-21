// ---------------------------------------------------------------------
//	net_manipulate.groovy
//
//					Mar/13/2013
//
// ---------------------------------------------------------------------
import org.apache.commons.httpclient.HttpClient
import org.apache.commons.httpclient.UsernamePasswordCredentials
import org.apache.commons.httpclient.methods.GetMethod
import org.apache.commons.httpclient.methods.PutMethod
import org.apache.commons.httpclient.methods.DeleteMethod
import org.apache.commons.httpclient.methods.RequestEntity
import org.apache.commons.httpclient.methods.StringRequestEntity
// ---------------------------------------------------------------------
class net_manipulate
{
// -------------------------------------------------------------------
static String get_uri_proc (uri_in,type_in)
{
	def client = new HttpClient()
	def get = new GetMethod(uri_in)
	get.setRequestHeader("Accept", type_in)
 get.setRequestHeader("Accept", "text/xml")
	client.executeMethod(get)

	def json_str = get.getResponseBodyAsString().toString()

	return	json_str
}

// ---------------------------------------------------------------------
static void rest_put_proc (uri_aa,str_data_in,type_in)
 throws Exception
{
	PutMethod put = new PutMethod (uri_aa)
	RequestEntity entity = 
		new StringRequestEntity (str_data_in, type_in, "UTF-8")
	put.setRequestEntity (entity)

	try
		{
		HttpClient httpclient = new HttpClient()
		int result = httpclient.executeMethod(put)
		println("Response status code: " + result)
		}
	finally
		{
		put.releaseConnection()
		}
}

// ---------------------------------------------------------------------
static void rest_delete_proc (String uri_aa)
 throws Exception
{
	DeleteMethod delete = new DeleteMethod (uri_aa)

	try
		{
		HttpClient httpclient = new HttpClient()
		int result = httpclient.executeMethod(delete)
		System.out.println("Response status code: " + result)
		}
	finally
		{
		delete.releaseConnection()
		}
}


// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
