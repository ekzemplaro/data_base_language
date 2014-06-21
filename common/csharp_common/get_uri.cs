// ------------------------------------------------------------------
//	csharp_common/get_uri.cs
//
//					Dec/19/2013
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Net;
using System.Web;
using System.Text;
using System.Collections;

// ------------------------------------------------------------------
public class get_uri {
// ------------------------------------------------------------------
public static string get_uri_proc (string url,string user,string password)
{
	Encoding enc = Encoding.UTF8;

	HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
	req.Method = "GET";
	req.ContentType = "application/x-www-form-urlencoded";
	req.Proxy = null;
	req.Credentials = new NetworkCredential (user,password);

	WebResponse res = req.GetResponse();

	Stream resStream = res.GetResponseStream();
	StreamReader sr = new StreamReader(resStream, enc);
	string str_json = sr.ReadToEnd();
	sr.Close();
	resStream.Close();

	return str_json;
}

// ------------------------------------------------------------------
public static string put_uri_file_proc
	(string url,string file_in,string user,string password)
{
	HttpWebRequest WRequest;
	HttpWebResponse res;

// Console.WriteLine ("*** put_uri_proc *** start ***");

	WRequest = (HttpWebRequest)HttpWebRequest.Create (url);
	WRequest.Credentials = new NetworkCredential (user, password);
	WRequest.PreAuthenticate = true;
	WRequest.UserAgent = "Upload Test";
	WRequest.Method = "PUT";
	WRequest.AllowWriteStreamBuffering = false;
	WRequest.Timeout = 10000;
	WRequest.Proxy = null;

	FileStream ReadIn = new FileStream (file_in, FileMode.Open, FileAccess.Read);
	ReadIn.Seek(0, SeekOrigin.Begin); // Move to the start of the file.
	WRequest.ContentLength = ReadIn.Length;
		 // Set the content length header to the size of the file.

// Console.WriteLine ("*** ReadIn.Length = " + ReadIn.Length);

	int nn = (int)ReadIn.Length;

	if (nn < 2048)
		{
		nn = 2048;
		}

	Byte[] FileData = new Byte[nn]; // Read the file in 2 KB segments.
	int DataRead = 0;
	Stream tempStream = WRequest.GetRequestStream();
	do
		{
		DataRead = ReadIn.Read(FileData,0,2048);
		if (DataRead > 0) //we have data
			{
			tempStream.Write(FileData,0,DataRead); 
			Array.Clear(FileData,0, 2048); // Clear the array.
			}
		}while(DataRead > 0);
	

	res = (HttpWebResponse)WRequest.GetResponse(); 
	ReadIn.Close();
	tempStream.Close();

/* Jan/12 */
	Encoding enc = Encoding.UTF8;
	Stream resStream = res.GetResponseStream();
	StreamReader sr = new StreamReader(resStream, enc);
	string str_json = sr.ReadToEnd();
	sr.Close();
	resStream.Close();

	res.Close();

// Console.WriteLine ("*** put_uri_proc *** end ***");

	return str_json;
}

// ------------------------------------------------------------------
public static string put_uri_string_proc
	(string url,string str_out,string user,string password)
{
	HttpWebRequest WRequest;

// Console.WriteLine ("*** put_uri_string_proc *** start ***");

	byte [] byte_data = Encoding.UTF8.GetBytes (str_out);

	WRequest = (HttpWebRequest)HttpWebRequest.Create (url);
	WRequest.Method = "PUT";
	WRequest.Credentials = new NetworkCredential (user, password);
	WRequest.ContentLength = byte_data.Length;
	WRequest.ContentType = "text/plain";
	WRequest.Proxy = null;

//	Console.WriteLine ("*** byte_data.Length = " + byte_data.Length);
//	Console.WriteLine ("*** str_out.Length = " + str_out.Length);

	using (StreamWriter writer = new StreamWriter
		 (WRequest.GetRequestStream( )))
	{
	writer.Write (str_out);
	}

	WebResponse res = WRequest.GetResponse( );


/* Jan/12 */
	Encoding enc = Encoding.UTF8;
	Stream resStream = res.GetResponseStream();
	StreamReader sr = new StreamReader(resStream, enc);
	string str_json = sr.ReadToEnd();
	sr.Close();
	resStream.Close();

	res.Close();

// Console.WriteLine ("*** put_uri_string_proc *** end ***");
	return str_json;
}

// ------------------------------------------------------------------
public static void rest_delete_proc (string url,string user,string password)
{
	HttpWebRequest WRequest;

	WRequest = (HttpWebRequest)HttpWebRequest.Create (url);
	WRequest.Credentials = new NetworkCredential (user, password);
	WRequest.PreAuthenticate = true;
	WRequest.UserAgent = "Upload Test";
	WRequest.Method = "DELETE";
	WRequest.AllowWriteStreamBuffering = false;
	WRequest.Timeout = 10000;
	WRequest.Proxy = null;

	WebResponse response = WRequest.GetResponse( );

	response.Close();

}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
