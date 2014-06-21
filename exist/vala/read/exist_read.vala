// -------------------------------------------------------------------
//	exist_read.vala
//
//					Aug/28/2011
//
//		xml_manipulate
// -------------------------------------------------------------------
using Xml;
using GLib;
// -------------------------------------------------------------------
void main ()
{
	stdout.printf ("*** 開始 ***\n");

	var uri = "http://localhost:8086/exist/rest/cities/cities.xml";

	var session = new Soup.SessionSync ();
	var message = new Soup.Message ("GET", uri);
	session.send_message (message);

	stdout.printf ("*** aaaa ***\n");
	var file_tmp = "/tmp/tmp_00329.xml";
	xml_write_proc (file_tmp,message);

	Parser.init ();

	var sample = new xml_parse ();

	sample.parse_file (file_tmp);

	Parser.cleanup ();

	var destination = File.new_for_path (file_tmp);
	destination.delete ();

//	stdout.write (message.response_body.data);

	stdout.printf ("*** 終了 ***\n");

}

// -------------------------------------------------------------------
static void xml_write_proc (string file_out,Soup.Message message)
{
	var file_stream = FileStream.open (file_out,"w");
	file_stream.write (message.response_body.data);
}


// -------------------------------------------------------------------
