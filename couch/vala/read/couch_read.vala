// -------------------------------------------------------------------
//	couch_read.vala
//
//					Nov/30/2010
//
// -------------------------------------------------------------------
void main ()
{
	stdout.printf ("*** 開始 ***\n");

	var uri = "http://host_couch:5984/city/cities";

	var session = new Soup.SessionSync ();
	var message = new Soup.Message ("GET", uri);
	session.send_message (message);

	try {
		var parser = new Json.Parser ();
		parser.load_from_data (message.response_body.flatten ().data, -1);
//	stdout.printf (message.response_body.flatten ().data);

		var root_object = parser.get_root ().get_object ();
//	int64 count = root_object.get_int_member ("totalResultsCount");
//       stdout.printf ("%lld results:\n\n", count);

        foreach (var geonode in root_object.get_array_member ("cities").get_elements ()) {
            var geoname = geonode.get_object ();
            stdout.printf ("%lld\t%s\t%lld\t%s\n",
                          geoname.get_int_member ("id"),
                          geoname.get_string_member ("name"),
                          geoname.get_int_member ("population"),
                          geoname.get_string_member ("date_mod"));
        }

    } catch (Error e) {
        stderr.printf ("I guess something is not working...\n");
    }
	stdout.printf ("*** 終了 ***\n");

}

// -------------------------------------------------------------------
