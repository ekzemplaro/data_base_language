// --------------------------------------------------------------
//	tyrant_update.java
//
//					Apr/22/2013
// --------------------------------------------------------------
import java.util.HashMap;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketException;

import	net.arnx.jsonic.JSON;
 
// --------------------------------------------------------------
public class tyrant_update
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws IOException
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation = " + population);

	String server = "localhost";
	int port = 1978;

        Socket socket = new Socket(server, port);
//        System.out.println("サーバとの接続を確立。");
 
	InputStream in = socket.getInputStream();
	OutputStream out = socket.getOutputStream();

	HashMap <String,String>unit_aa
			= socket_manipulate.socket_read_proc (key_in,in,out);

	if (unit_aa != null)
		{
       	System.out.println (unit_aa.get ("name"));
       	System.out.println (unit_aa.get ("date_mod"));

		String str_population = Integer.toString (population);
		unit_aa.put ("population",str_population);

		String today = text_manipulate.get_current_date_proc ();
		unit_aa.put ("date_mod",today);

		String str_json = JSON.encode (unit_aa);
      	System.out.println (str_json);

	socket_set_proc (key_in,str_json,in,out);
			}

//	System.out.println (str_aa);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
static void socket_set_proc (String key,String value,InputStream in,OutputStream out)
	throws IOException
{
	int	llx = value.getBytes().length;

	String command = "set " + key + " 0 0 "
		+ Integer.toString (llx) + "\r\n";

	byte[] data = command.getBytes();

	out.write(data);

	String command_bb = value + "\r\n";

	byte[]data_bb = command_bb.getBytes();

	out.write(data_bb);

	int nmax = 256;

int icount = 0;

int totalBytesRcvd = 0;
	int bytesRcvd;

String str_out = "";

byte[] msg = new byte[1024];

	System.out.println ("icount = " + icount);
            if ((bytesRcvd = in.read( // 引数は読込データ、Offset、読込データ長
                    msg,
                    totalBytesRcvd,
//                    data.length - totalBytesRcvd)) == -1) {
                    nmax - totalBytesRcvd)) == -1) {
//			break;
                throw new SocketException("接続遮断");
            }
	System.out.println ("totalBytesRcvd = " + totalBytesRcvd);
            totalBytesRcvd += bytesRcvd;
        System.out.println("受信：" + new String(msg));
	str_out = new String (msg);


}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
