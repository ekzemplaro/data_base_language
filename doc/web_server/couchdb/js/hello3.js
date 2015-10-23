function(doc, req) {
	var str_out = "*** Hello World! ***<br />";
	str_out += "*** Good Afternoon ***<br />";
	str_out += req.query.who + "<br />";
	return str_out;
}
