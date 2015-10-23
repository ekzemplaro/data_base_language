// -----------------------------------------------------------------
//	json_to_xml.scala
//
//						Jul/14/2010
// -----------------------------------------------------------------
import scala.xml._
import scala.util.parsing.json.JSON
import scala.io.Source

/**
 * The XML2JSON object will transform a string in json format to
 * a NodeSeq object.
 */
// -----------------------------------------------------------------
object json_to_xml {

  def apply(input:String):NodeSeq = {
    JSON.parse(input) match {
      case Some(json) => toXML(json)
      case _ => Seq.empty
    }
  }

// -----------------------------------------------------------------
  private def toXML(json:Any):NodeSeq = json match {
    case (k:String, v)  if !v.isInstanceOf[List[_]] =>
      toElem(k, Text(v.toString))
    case (k:String, Nil) => toElem(k, Nil:_*)
    case (k:String, v@(_,_)::_) =>
      toElem(k, v.flatMap(toXML(_)):_*)
    case (k:String, v:List[_]) => // array
      for(_v <- v) yield toElem(k, toXML(_v):_* )
    case l:List[_] => l.flatMap(toXML(_))
    case v => Text(v.toString)
  }

  private implicit def toSeq(n:Node):NodeSeq=List(n)

  private def toElem(label:String, child:Node*) =
      Elem(null, label, Null, TopScope, child:_*)
}

// -----------------------------------------------------------------
object json_to_xml_Test extends Application {

val file_in = "cities.json"

val source = Source.fromFile (file_in)

var json=""
for( line <- source.getLines )
	{
	json += line
	}


  println(new PrettyPrinter(80, 2).formatNodes(json_to_xml(json)))
}

// -----------------------------------------------------------------
