// --------------------------------------------------------------
//	java_common/get_uri.java
//
//					Sep/13/2013
// --------------------------------------------------------------
import	java.io.BufferedReader;
import	java.io.InputStreamReader;

/*
import org.apache.commons.httpclient.HttpClient;  
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;
import org.apache.commons.httpclient.methods.DeleteMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
*/
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpDelete;
// --------------------------------------------------------------
public class get_uri
{

// --------------------------------------------------------------
static String get_uri_proc (String uri)
{
	String json_str = "";

	try {
	HttpClient httpclient = new HttpClient();

	GetMethod get = new GetMethod (uri);

	try 
	{
		int statusCode = httpclient.executeMethod (get);

//		System.out.println(get.getStatusLine());

		if (statusCode != HttpStatus.SC_OK)
			{
			System.err.println
				("Method failed: " + get.getStatusLine());
			}

		BufferedReader reader = new BufferedReader(new InputStreamReader
			(get.getResponseBodyAsStream ()));

		String line;
		while ((line = reader.readLine()) != null)
			{
			json_str += line;
			}

		reader.close ();

	} finally
		{
		get.releaseConnection();
		}
	}
	catch (Exception ex)
		{
		ex.printStackTrace ();
		}

	return	json_str;
}
// --------------------------------------------------------------
static void rest_put_proc (String uri_aa,String str_data_in,String type_in)
 throws Exception
{
	PutMethod put = new PutMethod (uri_aa);
	RequestEntity entity = 
		new StringRequestEntity (str_data_in,type_in,"UTF-8");
	put.setRequestEntity (entity);

	try
		{
		HttpClient httpclient = new HttpClient();
		int result = httpclient.executeMethod(put);
		System.out.println("Response status code: " + result);
		}
	finally
		{
		put.releaseConnection();
		}
}

// --------------------------------------------------------------
static void rest_delete_proc (String uri_aa)
 throws Exception
{
	DeleteMethod delete = new DeleteMethod (uri_aa);

	try
		{
		HttpClient httpclient = new HttpClient();
		int result = httpclient.executeMethod(delete);
		System.out.println("Response status code: " + result);
		}
	finally
		{
		delete.releaseConnection();
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
