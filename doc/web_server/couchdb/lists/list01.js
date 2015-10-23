function(head, req) {
provides("html", function()
{
	icount = 0;
	html = "<html><body><ol>\n";
	html += "<table>\n";
	while (row = getRow()) {
		html += "<tr>";
		html += "<td>" + icount + "</td>";
		html += "<td>" + row.key + "</td>";
		html += "<td>" + row.value + "</td>";
		html += "</tr>\n";
		icount += 1;
	}   
	html += "</table>\n";
	html += "</body></head>";
	return html;
}); 
  
}
