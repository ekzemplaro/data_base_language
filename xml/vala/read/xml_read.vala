// -------------------------------------------------------------------
//	xml_read.vala
//
//					Jun/07/2011
//
// -------------------------------------------------------------------
using Xml;

// -------------------------------------------------------------------
int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");
	var file_in = args[1];
	stdout.printf (file_in + "\n");

	Parser.init ();

	var sample = new xml_parse ();

	sample.parse_file (file_in);

	Parser.cleanup ();

	stdout.printf ("*** 終了 ***\n");

	return 0;
}
// -------------------------------------------------------------------
