// --------------------------------------------------------------
//
//	net_manipulate.js
//
//					Apr/10/2013
//
//
// --------------------------------------------------------------
function rest_get_proc (uri_aa,type_in)
{
	var httpclient = new HttpClient();
	var httpget = new GetMethod (uri_aa);

	var statusCode = httpclient.executeMethod(httpget)

	var reader = new BufferedReader(new InputStreamReader
				(httpget.getResponseBodyAsStream ()))

	var str_out = ""
	var line = ""

	while ((line= reader.readLine()) != null)
		{
		str_out += line
		}

	reader.close ();

	httpget.releaseConnection();

//	print("Response status code: " + statusCode);

	return	str_out;
}

// --------------------------------------------------------------
function rest_put_proc (uri_aa,str_data_in,type_in)
{
	var put = new PutMethod (uri_aa);
	var entity = new StringRequestEntity (str_data_in, type_in, "UTF-8");
	put.setRequestEntity (entity);

	var httpclient = new HttpClient();
	var result = httpclient.executeMethod(put);
	if (result != 204)
		{
	print("Response status code: " + result);
		}
}

// --------------------------------------------------------------
function rest_delete_proc (uri_aa)
{
	var del = new DeleteMethod (uri_aa);

	var httpclient = new HttpClient();
	var result = httpclient.executeMethod(del);

	if (result != 204)
		{
	print("Response status code: " + result);
		}
}

// --------------------------------------------------------------
