// --------------------------------------------------------------
//	socket_manipulate.java
//
//					Feb/02/2015
// --------------------------------------------------------------
import java.util.HashMap;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketException;

import  net.arnx.jsonic.JSON; 
// --------------------------------------------------------------
public class socket_manipulate
{
 
// --------------------------------------------------------------
static HashMap <String,String> socket_read_proc
	(String key,InputStream in,OutputStream out)
	throws IOException
{
	HashMap <String,String>unit_aa = null;

	String str_aa = socket_get_record_proc (key,in,out);
	int pos_value = str_aa.indexOf ("VALUE");
	if (0 <= pos_value)
		{
		String [] lines = str_aa.split ("\n",-1);

		String str_json = lines[1];

	        unit_aa = (HashMap <String,String>)JSON.decode (str_json);
		}

	return	unit_aa;
}

// ----------------------------------------------------------------
static String socket_get_record_proc (String key,InputStream in,OutputStream out)
	throws IOException
{
        byte[] msg = new byte[1024];
	String command = "get " + key + "\r\n";
        byte[] data = command.getBytes();
	int nmax = 256;
	out.write(data); // サーバに文字列を送付
//	System.out.println("送信：" + new String(data));
	int totalBytesRcvd = 0;
	int bytesRcvd;
//	System.out.println ("data.length = " + data.length);
	int icount = 0;
	String str_out = "";

	while (totalBytesRcvd < nmax)
	{ // 全文を受信するまでloop
//	System.out.println ("icount = " + icount);
            if ((bytesRcvd = in.read( // 引数は読込データ、Offset、読込データ長
                    msg,
                    totalBytesRcvd,
//                    data.length - totalBytesRcvd)) == -1) {
                    nmax - totalBytesRcvd)) == -1) {
//			break;
                throw new SocketException("接続遮断");
            }
//	System.out.println ("totalBytesRcvd = " + totalBytesRcvd);
            totalBytesRcvd += bytesRcvd;
 //       System.out.println("受信：" + new String(msg));
	str_out = new String (msg);

	int pos_end = str_out.indexOf( "END" );
/*
	System.out.println ("msg.length = " + msg.length);
	System.out.println ("str_out.length () = " + str_out.length ());
	System.out.println (pos_end);
*/
	if (0 <= pos_end)
		{
		break;
		}

	icount++;
	}

	return	str_out; 
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
