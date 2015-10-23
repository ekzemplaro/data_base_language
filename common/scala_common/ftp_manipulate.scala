// --------------------------------------------------------------
/*
	ftp_manipulate.scala
					Jul/18/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap

import java.io.File
import java.io.FileInputStream
import java.io.InputStream
import java.io.InputStreamReader
import java.io.BufferedReader
import org.apache.commons.net.ftp.FTPClient
import org.apache.commons.net.ftp.FTPReply
// --------------------------------------------------------------
object ftp_manipulate
{

// --------------------------------------------------------------
def ftp_get_proc (hostname:String, user:String, passwd:String, path_file:String) : String =
{
	val ftpclient = new FTPClient()

	var buf = new StringBuffer()

	ftpclient.connect (hostname)
	val reply = ftpclient.getReplyCode()
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

	val ff = ftpclient.retrieveFileStream (path_file)

	val reader = 
       		new BufferedReader(new InputStreamReader(ff, "UTF-8"))


//	for( str <- reader.getLines )
	for( str <- reader.readLine () )
//	while ((str = reader.readLine()) != null)
		{
		buf.append(str)
//		buf.append("\n")
		}

	ftpclient.disconnect ()


	buf.toString ()
}

// --------------------------------------------------------------
def ftp_put_proc (hostname:String, user:String, passwd:String, path_file:String,str_data:String)
{
	val file_src = "/tmp/tmp_042814.txt"

	var out = new java.io.FileOutputStream (file_src)

	var writer = new java.io.OutputStreamWriter (out,"utf8")

	writer.write (str_data)

	writer.close ()

	val fp = new FTPClient()

	fp.connect (hostname)

	if (!FTPReply.isPositiveCompletion(fp.getReplyCode()))
		{
		println("connection failed")
		System.exit(1)
		}

	if (fp.login(user, passwd) == false)
		{
		println("login failed")
		System.exit(1)
		}

	var is = new FileInputStream(file_src)
	fp.storeFile(path_file, is)
	is.close()

	print("FTP PUT COMPLETED\t")
	print(file_src + "\t")
	println(path_file)

	fp.disconnect()

	var fileA = new File (file_src)
	fileA.delete

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
