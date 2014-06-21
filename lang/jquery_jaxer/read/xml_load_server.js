// ------------------------------------------------------------------
//	xml_load_server.js
//
//						Jun/29/2010
// ------------------------------------------------------------------
function xml_load_proc (dbase)
{
	var out_str = "{}";

	switch (dbase)
		{
		case	"xml":
			var file_name="/var/tmp/xml_file/cities.xml";
			out_str = Jaxer.File.read (file_name);
			break;


		case	"xindice":
			var url = "http://cdbd026:8888/xindice/db/cities/cities";
			out_str = Jaxer.Web.get (url, {as: "text"});
			break;

		case	"exist":
			var url = "http://cpt003:8086/exist/rest/cities/cities.xml";

			out_str = Jaxer.Web.get (url, {as: "text"});
			break;

		case	"dbxml":
			var url = "http://scott:tiger@cpt003:7280/rest/cities/cities.xml";


			out_str = Jaxer.Web.get (url, {as: "text"});
			break;


		default:
			out_str = master_gen_proc ();
			break;
		}

	return	out_str;
}

// ------------------------------------------------------------------
