// --------------------------------------------------------------
//
//	tika_manipulate.groovy
//
//					Jan/09/2012
// --------------------------------------------------------------
import static java.lang.System.err
import static java.lang.System.exit
import static java.lang.System.out
import java.lang.Class

import java.io.IOException
import java.io.InputStream
import java.io.FileInputStream
import java.io.File

import org.apache.tika.metadata.Metadata
import org.apache.tika.parser.AutoDetectParser
import org.apache.tika.parser.Parser
import org.apache.tika.Tika
import org.apache.tika.sax.BodyContentHandler

import org.xml.sax.SAXException

import	java.util.HashMap
// --------------------------------------------------------------
class tika_manipulate
{

// --------------------------------------------------------------
static tika_parse (resourceLocation,class_name)
{
	System.out.println (resourceLocation)

	def dict_aa = new HashMap ()

        try {
		System.out.println (resourceLocation)
		def ff = new File (resourceLocation)
		def cc = null
		try {
		cc = Class.forName (class_name)
		} catch (Exception ex) {
                // This should not happen.
            }
       
	def input = cc.getResourceAsStream (resourceLocation)
	def metadata = new Metadata ()
   
	def handler = new BodyContentHandler ()
	def parser = new AutoDetectParser ()

	parser.parse (input, handler, metadata)
   
	def content = new Tika().parseToString(ff)

	dict_aa = content_parser (content)

//	text_manipulate.dict_display_proc (dict_aa)
	}
	catch (Exception e) {
		e.printStackTrace()
	}

	return	dict_aa
}

// --------------------------------------------------------------
static content_parser (content)
{
	def dict_aa = new HashMap ()

	String [] lines = content.split ("[\n]",-1)

/*
	System.out.println (lines.length)
	System.out.println (lines[0].length ())
*/

//	for (def it=0 it< lines.length; it++)
	lines.each {
		if (0 < it.length ())
			{
			def cols = it.split ("[, \t]",-1)

			if (3 < cols.length)
				{
				def dict_unit = ['name': cols[1], 'population': cols[2], 'date_mod': cols[3]]
			dict_aa.put (cols[0],dict_unit)
				}
			else
				{
			System.out.println (cols.length)
			System.out.println (lines[it])
				}
/*
			System.out.println (cols[0])
			System.out.println (lines[it])
*/
			}
		}
 
//	System.out.print (content) 

	return	dict_aa
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
