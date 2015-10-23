
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import org.apache.xmlrpc.*;
/*
import org.apache.xmlrpc.XmlRpc;
import org.apache.xmlrpc.XmlRpcClient;
import org.apache.xmlrpc.XmlRpcException;
*/
/**
 * PingサーバにweblogUpdates.pingを打つクライアントです。
 * 
 * @author Masatomi KINO
 * @version $Revision: 1.2 $
 */
public class PingClient {
  /**
   * Logger for this class
   */
  private static final Logger logger = Logger.getLogger(PingClient.class);

  String endpointURL = "http://localhost:8080/PingWeb/PingReceiver";

  //    String endpointURL = "http://ping.cocolog-nifty.com/xmlrpc";

  /**
   * PingサーバにPingを打ちます。
   * 
   * @param weblogname
   *      Blogの名前
   * @param weblogurl
   *      BlogのURL
   */
  public void doPing(String weblogname, String weblogurl) {
    logger.debug("doPing(String, String) - start");

    Vector parameterList = new Vector();
    parameterList.addElement(weblogname);
    parameterList.addElement(weblogurl);

    try {
      XmlRpcClient client = null;
      XmlRpc.setEncoding("UTF-8");
      client = new XmlRpcClient(endpointURL);

      //さっきのエンドポイントの、weblogUpdates.ping というメソッド
      //をコールする。パラメタはVectorに格納。
      Hashtable response = (Hashtable) client.execute(
          "weblogUpdates.ping", parameterList);
      if (response == null) {
        System.out.println("No Result Back from execute");
      } else {
        Enumeration e = response.keys();

        while (e.hasMoreElements()) {
          Object key = e.nextElement();
          System.out.println("KEY=" + key + " : VALUE="
              + response.get(key));
        }
      }
    } catch (MalformedURLException e1) {
      logger.error("doPing(String, String)", e1);
    } catch (XmlRpcException e) {
      logger.error("doPing(String, String)", e);
    } catch (IOException e) {
      logger.error("doPing(String, String)", e);
    }

    logger.debug("doPing(String, String) - end");
  }

  public static void main(String[] args) {
    BasicConfigurator.configure();
    PingClient client = new PingClient();
    client.doPing("なまえ", "URL");

  }

}
