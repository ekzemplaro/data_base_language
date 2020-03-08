// ---------------------------------------------------------------
// ---------------------------------------------------------------
d3.json ("data01.json", function(error, data)
	{
	var str_out = ""
	for(var it=0; it<data.length; it++)
		{
		str_out += data[it].label + " = " + data[it].value + "<br>"
		}
	d3.select("#result").html (str_out)
})
// ---------------------------------------------------------------
