// --------------------------------------------------------------
/*
	java_common/xml_manipulate.java

				Feb/22/2012

*/
// --------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Element;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.DOMImplementation;

import org.xml.sax.InputSource;

import java.io.StringReader;
import java.io.BufferedReader;
import java.io.StringWriter;
import java.io.IOException;


// --------------------------------------------------------------
public class xml_manipulate {
// --------------------------------------------------------------
public static HashMap <String, HashMap<String,String>>
	xml_to_dict_proc (String xml_str)
{
	Document doc = string_to_doc_proc (xml_str);

	System.out.println ("*** xml_manipulate.xml_to_dict_proc ***");

	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	try
	{
	Element root = doc.getDocumentElement();

	System.out.println ("TagName : " + root.getTagName());
	NodeList list = root.getElementsByTagName ("name");

	for (int it=0; it < list.getLength() ; it++)
		{
       		Element element = (Element)list.item(it);
		Node parent = element.getParentNode ();
		String key = parent.getNodeName ();

       		Element element_pp = (Element)parent;
		String name = get_value_proc (element_pp,"name");
		String str_pop = get_value_proc (element_pp,"population");
		String date_mod = get_value_proc (element_pp,"date_mod");

		dict_aa = text_manipulate.dict_append_proc
			(dict_aa,key,name,Integer.parseInt (str_pop),date_mod);
		}

	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	return	dict_aa;
}

// --------------------------------------------------------------
static Document string_to_doc_proc (String str)
{
	Document doc = null;

	try
		{
		DocumentBuilderFactory factory
			= DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		StringReader strReader = new StringReader(str);
		doc = builder.parse(new InputSource(strReader));

		builder = factory.newDocumentBuilder();
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}

	return doc;
}

// --------------------------------------------------------------
public static String	dict_to_xml_proc
	(HashMap <String, HashMap<String,String>> dict_aa)
		throws Exception
{
	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	DocumentBuilder builder = factory.newDocumentBuilder();
	DOMImplementation domImpl=builder.getDOMImplementation();
	Document doc = domImpl.createDocument("","root",null);

	Set set_aaa = dict_aa.keySet ();

	HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

for (Object key_aa: set_aaa)
		{
		dict_unit = dict_aa.get (key_aa);

		String name = dict_unit.get ("name");
		String population = dict_unit.get ("population");
		String date_mod = dict_unit.get ("date_mod");

add_row_proc (doc,(String)key_aa,name,Integer.parseInt (population),date_mod);
		}

String xml_str = document2String (doc);

	return	xml_str;
}

// --------------------------------------------------------------
static void add_row_proc
	(Document document,
	String key,String name,int population,String date_mod)
{
	Element root=document.getDocumentElement();
	Element cities=document.createElement(key);

	Element name_aa=document.createElement("name");
	name_aa.appendChild(document.createTextNode(name));
	Element population_aa=document.createElement("population");
	population_aa.appendChild(document.createTextNode(Integer.toString (population)));
	Element date_mod_aa=document.createElement("date_mod");
	date_mod_aa.appendChild(document.createTextNode(date_mod));

	cities.appendChild(name_aa);
	cities.appendChild(population_aa);
	cities.appendChild(date_mod_aa);

	root.appendChild (cities);
}

// --------------------------------------------------------------
static String document2String(Document doc)
{
	String string = null;
	StringWriter writer = new StringWriter();
	StreamResult result = new StreamResult(writer);
	TransformerFactory factory = TransformerFactory.newInstance();

	Transformer former;
	try {
		former = factory.newTransformer();
		former.transform(new DOMSource(doc.getDocumentElement()),
			result);
	string = result.getWriter().toString();
		}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	return string;
}

// --------------------------------------------------------------
static String get_value_proc (Element root,String tag_name)
{
	NodeList list_aa = root.getElementsByTagName (tag_name);
	Element element = (Element)list_aa.item(0);
	String rvalue = element.getFirstChild().getNodeValue();

	return	rvalue;
}

// --------------------------------------------------------------
static void document_parser_unit (String str_xml)
{
//	System.out.println ("aaa");
//	System.out.println (str_xml);

	Document doc = string_to_doc_proc (str_xml);

	Element root = doc.getDocumentElement();

	System.out.print (root.getTagName() + "\t");

	String name = get_value_proc (root,"name");
	String str_pop = get_value_proc (root,"population");
	String date_mod = get_value_proc (root,"date_mod");

	System.out.print (name + "\t");
	System.out.print (str_pop + "\t");
	System.out.print (date_mod + "\n");
}

// --------------------------------------------------------------
// --------------------------------------------------------------
}
// --------------------------------------------------------------
