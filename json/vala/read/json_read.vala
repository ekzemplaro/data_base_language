// -------------------------------------------------------------------
//	json_read.vala
//
//					Sep/12/2013
//
// -------------------------------------------------------------------
void main (string[] args) {
	stdout.printf ("*** 開始 ***\n");
	stdout.printf (args[1] + "\n");

	var file_in = args[1];

	var file = File.new_for_path (file_in);

	if (!file.query_exists (null)) {
		stderr.printf ("File '%s' doesn't exist.\n", file.get_path ());
//		return 1;
		}

	var out_str = "";
	try {
		var in_stream = new DataInputStream (file.read (null));
		string line;
		while ((line = in_stream.read_line (null, null)) != null) {
			out_str += line;
		}
		} catch (Error ee) {
			error ("%s", ee.message);
    		}

		stdout.printf ("%s\n", out_str);

	try {
		var parser = new Json.Parser ();
		parser.load_from_data (out_str, -1);

		var root_object = parser.get_root ().get_object ();
//        int64 count = root_object.get_int_member ("totalResultsCount");
 //       stdout.printf ("%lld results:\n\n", count);

//	foreach (var geonode in root_object.get_array_member ("").get_elements ()) {
//	foreach (var geonode in root_object.get_elements ()) {
	foreach (var geonode in root_object.get_array_member ("*").get_elements ()) {
//	foreach (var geonode in root_object.get_object_member ("*").get_elements ()) {
            var geoname = geonode.get_object ();
//            stdout.printf ("%lld\t%s\t%lld\t%s\n",
            stdout.printf ("\t%s\t%lld\t%s\n",
//                          geoname.get_int_member ("id"),
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
