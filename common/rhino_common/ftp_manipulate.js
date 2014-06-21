// --------------------------------------------------------------
/*
	ftp_manipulate.js
					Jul/31/2011

*/
// --------------------------------------------------------------
importPackage (org.apache.commons.net.ftp);

// --------------------------------------------------------------
function ftp_put_proc (hostname,user,passwd,file_path,str_data)
{
	var file_src = "/tmp/tmp_042839.txt";
	string_write_proc (file_src,str_data);

	var fp = new FTPClient();

	fp.connect (hostname);

	if (!FTPReply.isPositiveCompletion(fp.getReplyCode()))
		{
		print ("connection failed\n");
		System.exit(1);
		}

	if (fp.login(user, passwd) == false)
		{
		print ("login failed\n");
		System.exit(1);
		}

	var is = new FileInputStream(file_src);
	fp.storeFile(file_path, is);
	is.close();

	print ("FTP PUT COMPLETED\t");
	print (file_src + "\t");
	print (file_path + "\n");

	var fileA = new File (file_src);
	fileA.delete();
}

// --------------------------------------------------------------
