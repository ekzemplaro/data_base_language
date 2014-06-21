// --------------------------------------------------------------
/*
	ftp_manipulate.groovy
					Jul/18/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap

import java.io.InputStream
import java.io.InputStreamReader
import java.io.BufferedReader
import org.apache.commons.net.ftp.FTPClient
import org.apache.commons.net.ftp.FTPReply
// --------------------------------------------------------------
class ftp_manipulate
{

// --------------------------------------------------------------
static String ftp_get_proc (String hostname,String user,String passwd,String path_file)
{
	FTPClient ftpclient = new FTPClient()

	StringBuffer buf = new StringBuffer()

	try {
		ftpclient.connect (hostname)
		int reply = ftpclient.getReplyCode()
		if (!FTPReply.isPositiveCompletion(reply))
			{
			System.err.println("connect fail")
			System.exit(1)
			}

		if (ftpclient.login(user,passwd) == false)
			{
			System.err.println("login fail")
			System.exit(2)
			}

	InputStream ff = ftpclient.retrieveFileStream (path_file)

	BufferedReader reader = 
       		new BufferedReader(new InputStreamReader(ff, "UTF-8"))

	String str
	while ((str = reader.readLine()) != null)
		{
		buf.append(str)
		buf.append("\n")
		}

	ftpclient.disconnect ()

	}
	catch (Exception ee)
		{
		ee.printStackTrace ()
		}

	return (buf.toString ())
}

// --------------------------------------------------------------
static void ftp_put_proc (String hostname,String user,String passwd,String file_path,
	String str_data)
		throws Exception
{
	String file_src = "/tmp/tmp_042814.txt"

//	file_io.file_write_proc (file_src,str_data)

	def ff = new File (file_src)
	ff.write (str_data)

	FTPClient fp = new FTPClient()
	FileInputStream is = null

	try {

		fp.connect (hostname)

		if (!FTPReply.isPositiveCompletion(fp.getReplyCode()))
			{
			System.out.println("connection failed")
			System.exit(1)
			}

		if (fp.login(user, passwd) == false)
			{
			System.out.println("login failed")
			System.exit(1)
			}

		is = new FileInputStream(file_src)
		fp.storeFile(file_path, is)
		is.close()

		System.out.print("FTP PUT COMPLETED\t")
		System.out.print(file_src + "\t")
		System.out.println(file_path)

		}
	 catch (Exception e)
	{
	e.printStackTrace()
	}
	finally
	{
	fp.disconnect()
	is.close()
	}

	File fileA = new File (file_src)
	fileA.delete()
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
