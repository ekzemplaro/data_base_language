// -------------------------------------------------------------------
//	basex_read.vala
//
//					Feb/03/2012
//
//		xml_manipulate
// -------------------------------------------------------------------
using Xml;
using GLib;
// -------------------------------------------------------------------
void main ()
{
	stdout.printf ("*** 開始 ***\n");

	var uri = "http://admin:admin@localhost:8984/rest/cities?query=/";


	var session = new Soup.SessionSync ();
	var message = new Soup.Message ("GET", uri);
	session.send_message (message);

	stdout.printf ("*** aaaa ***\n");
	stdout.write (message.response_body.data);
	stdout.printf ("*** ccc ***\n");

//	var file_tmp = "/tmp/tmp_00457.xml";
	var file_tmp = "./tmp_00457.xml";

	xml_write_proc (file_tmp,message);

	Parser.init ();

	var sample = new xml_parse ();

	sample.parse_file (file_tmp);

	Parser.cleanup ();

//	var destination = File.new_for_path (file_tmp);
//	destination.delete ();

	stdout.write (message.response_body.data);

	stdout.printf ("*** 終了 ***\n");

}

// -------------------------------------------------------------------
static void xml_write_proc (string file_out,Soup.Message message)
{
	var file_stream = FileStream.open (file_out,"w");
	file_stream.write (message.response_body.data);
}


// -------------------------------------------------------------------
