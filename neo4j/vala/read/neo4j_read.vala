// -------------------------------------------------------------------
//	neo4j_read.vala
//
//					Aug/30/2012
//
// -------------------------------------------------------------------
static void row_parser (string key)
{
	var uri = "http://localhost:7474/db/data/node/" + key + "/properties";

//	stdout.printf (uri + "\n");

	var session = new Soup.SessionSync ();
	var message = new Soup.Message ("GET", uri);
	session.send_message (message);

	try {
		var parser = new Json.Parser ();
		parser.load_from_data (message.response_body.flatten ().data, -1);
//	stdout.printf (message.response_body.flatten ().data + "\n");

		var root_object = parser.get_root ().get_object ();
//	int64 count = root_object.get_int_member ("totalResultsCount");
//       stdout.printf ("%lld results:\n\n", count);

            stdout.printf ("%s\t%s\t%lld\t%s\n",
                          root_object.get_string_member ("id"),
                          root_object.get_string_member ("name"),
                          root_object.get_int_member ("population"),
                          root_object.get_string_member ("date_mod"));

		} catch (Error e) {
		stderr.printf ("I guess something is not working...\n");
		}
}

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");


	string[] keys = {"1","2","3",
		"4","5","6",
		"7","8","9"};

	foreach (string key in keys)
		{
		row_parser (key);
		}

	stdout.printf ("*** 終了 ***\n");

	return 0;
}

// -------------------------------------------------------------------
