// -------------------------------------------------------------------
//	vala_common/xml_parse.vala
//
//					Jun/22/2011
//
// -------------------------------------------------------------------
using Xml;

// -------------------------------------------------------------------
class xml_parse
{

// -------------------------------------------------------------------
public void parse_file (string path)
{
	Xml.Doc* doc = Parser.parse_file (path);
        if (doc == null)
		{
		stderr.printf ("File %s not found or permissions missing",path);
		return;
		}

	Xml.Node* root = doc->get_root_element ();
	if (root == null)
		{
		delete doc;
		stderr.printf ("The xml file '%s' is empty", path);
		return;
		}

	parse_node (root);
	delete doc;

	stdout.printf ("\n");
}

// -------------------------------------------------------------------
private void parse_node (Xml.Node* node)
{
	for (Xml.Node* iter = node->children; iter != null;iter = iter->next)
		{
		if (iter->type != ElementType.ELEMENT_NODE)
			{
			continue;
			}

		string node_name = iter->name;
		string node_content = iter->get_content ();

		if ((node_name != "name") && (node_name != "population")
			 && (node_name != "date_mod"))
			{
			stdout.printf (node_name + "\t");
			}
		else
			{
			stdout.printf ("%s\t",node_content);
			}

		 if (node_name == "date_mod")
			{
			stdout.printf ("\n");
			}
		parse_node (iter);
		}
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
