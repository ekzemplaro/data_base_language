// -----------------------------------------------------------------
//	xml_to_json.scala
//
//					Jul/14/2010
// -----------------------------------------------------------------

import scala.xml._
import scala.collection.mutable.{Map, HashMap}

// -----------------------------------------------------------------
/**                                                                             
 * The XML2JSON object will transform the XML data in scala.xml.Node to         
 * the string in JSON format.                                                   
 */
// -----------------------------------------------------------------
object xml_to_json {

  sealed trait JSONObject
  case class JSONObj(objects:List[JSONObject]) extends JSONObject
  case class JSONArray(array:List[JSONObject]) extends JSONObject
  case class JSONEntry(key:String, value:JSONObject) extends JSONObject
  case class JSONString(str:String) extends JSONObject

  def apply(xml:Node):String = {

    type Env = Map[String, List[JSONObject]]

    def emptyMap:Env = HashMap.empty[String, List[JSONObject]]

    def env2obj(env:(String, List[JSONObject])) = env match {
      case (key, v::Nil) => JSONEntry(key, v)
      case (key, v) => JSONEntry(key, JSONArray(v))
    }

    implicit def opt2list(opt:Option[List[JSONObject]]) = opt match {
      case Some(v) => v
      case _ => Nil
    }

// -----------------------------------------------------------------
    def toJSON(xml:Node, env:Env):Env = {
      xml match {
        case _:Elem => xml.child match {
          case c if c.length==1 && c.first.isInstanceOf[Text] =>
            c.first match {
              case Text(data) =>
                env += xml.label -> (JSONString(data)::env.get(xml.label))
          }
          case c => {
            var foo = c.foldLeft(emptyMap){
              (env, c) => toJSON(c, env)
            }.map{env2obj}.toList

            env += xml.label -> (JSONObj(foo)::env.get(xml.label))
          }
        }
        case Text(data) => { }
        case _ => { }
      }
      env
    }

    format(JSONObj(toJSON(xml, emptyMap).map{env2obj}.toList))
  }

  /**                                                                           
   * The following method is not functional for duplicate keys,                 
   * but it will be a good example how to combine with "Option" and "for".      
   */
  def toJSON(xml:Node):String = {
    def _toJSON(xml:Node):Option[JSONObject] = xml match {
      case _:Elem => xml.child match {
        /**                                                                     
         * The xml.child will be in List if xml is created by XML#load() .      
         * If xml is created as the literal, it will be in ArrayBuffer          
         */
        // case Text(data)::Nil =>                                              
        //   Some(JSONEntry(xml.label, JSONString(data)))                       
        //                                                                      
        case c if c.length==1 && c.first.isInstanceOf[Text] => c.first match {
          case Text(data) =>
            Some(JSONEntry(xml.label, JSONString(data)))
        }
        case c => {
          val objects=(for(i <- c; j <- _toJSON(i)) yield j).toList
          Some(JSONEntry(xml.label, JSONObj(objects)))
        }
      }
      case Text(data) => None
      case _ =>  None
    }
    format(JSONObj(List(_toJSON(xml).get)))
  }

  /**                                                                           
   * This method will transform a JSONObject to a string with indentions.       
   */
  def format(o:JSONObject):String = {
    val tab="  "
    def wrap(str:String)="\""+str.replaceAll("\"", "\\\"")+"\""
    def format(o:JSONObject, indent:Int):String = o match {
      case JSONObj(objects) => {
        var f=objects.map(format(_, indent+1)).mkString(",\n"+(tab*(indent+1)))
        if(f.length>0) f="\n"+(tab*(indent+1))+f+"\n"+(tab*indent)
        "{"+f+"}"
      }
      case JSONArray(array) => {
        var f=array.map(format(_, indent+1)).mkString(",\n"+(tab*(indent+1)))
        if(f.length>0) f="\n"+(tab*(indent+1))+f+"\n"+(tab*indent)
        "["+f+"]"
      }
      case JSONEntry(key, value) =>
        wrap(key)+" : "+format(value, indent)
      case JSONString(str) => wrap(str)
    }
    format(o, 0)
  }
}

// -----------------------------------------------------------------
object xml_to_json_Test {
      import java.net.URL
      val url="http://cpt003:8086/exist/rest//db/cities/cities.xml"
      var xml=XML.load(new URL(url).openStream)

  def main(arg:Array[String])={
    println (xml_to_json(xml))
  }
}

// -----------------------------------------------------------------
