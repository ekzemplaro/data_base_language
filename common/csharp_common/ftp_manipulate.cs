// ------------------------------------------------------------------
//	ftp_manipulate.cs
//
//					Jul/30/2014
//
// ------------------------------------------------------------------
using	System;
using	System.IO;
using	System.Net;
using	System.Collections.Generic;

// ------------------------------------------------------------------
public class ftp_manipulate
{
// ------------------------------------------------------------------
public static string ftp_to_str_proc (string url_in,string user,string passwd)
{
	FtpWebRequest request = (FtpWebRequest)WebRequest.Create (url_in);
	request.Method = WebRequestMethods.Ftp.DownloadFile;

	request.Credentials = new NetworkCredential (user,passwd);

	FtpWebResponse response = (FtpWebResponse)request.GetResponse();
    
	Stream responseStream = response.GetResponseStream();
	StreamReader reader = new StreamReader(responseStream);
	string str_json = reader.ReadToEnd();

	Console.WriteLine("Download Complete, status {0}", response.StatusDescription);
	reader.Close();
	response.Close();

	return str_json;
}

// ------------------------------------------------------------------
public static void str_to_ftp_proc
	(string url_in,string user,string passwd,string str_json)
{
	string upFile = "/tmp/tmp00189.json";

	file_io.file_write_proc (upFile,str_json);

	Uri uri_aa = new Uri (url_in);

	FtpWebRequest request
		= (FtpWebRequest)FtpWebRequest.Create (uri_aa);

	request.Method = WebRequestMethods.Ftp.UploadFile;
	request.Credentials = new NetworkCredential (user,passwd);
	request.UsePassive = true;
	request.UseBinary = true;
	request.KeepAlive = false;

	FileStream fs = File.OpenRead (upFile);

	byte[] buffer = new byte[fs.Length];
	fs.Read (buffer,0,buffer.Length);
	fs.Close();

	Stream reqStrm = request.GetRequestStream();
	reqStrm.Write (buffer,0,buffer.Length);
	reqStrm.Close();

	FtpWebResponse ftpRes = (FtpWebResponse)request.GetResponse();
	ftpRes.Close();
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
