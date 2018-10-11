// --------------------------------------------------------------
//	java_common/get_uri.java
//
//					Sep/13/2013
// --------------------------------------------------------------
import	java.io.BufferedReader;
import	java.io.InputStreamReader;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpDelete;

import org.apache.http.util.EntityUtils;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
// --------------------------------------------------------------
public class get_uri
{

// --------------------------------------------------------------
static String get_uri_proc (String uri)
{
	String json_str = "";

	Charset charset = StandardCharsets.UTF_8;
	CloseableHttpClient httpclient = HttpClients.createDefault();
	HttpGet request = new HttpGet(uri);

	CloseableHttpResponse response = null;

	try 
	{
		response = httpclient.execute(request);

		int status = response.getStatusLine().getStatusCode();

//		System.out.println(get.getStatusLine());

		if (status == HttpStatus.SC_OK)
			{

		String responseData = 
                             EntityUtils.toString(response.getEntity(),charset);

		System.out.println(responseData);
			}

	} catch (Exception ex)
		{
		ex.printStackTrace ();

	} finally
		{
//		get.releaseConnection();
		}

	return	json_str;
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
