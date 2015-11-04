// -----------------------------------------------------------------------
//	list_file.js
//
//					Nov/03/2015
//
// -----------------------------------------------------------------------
function list_file_proc (folder_in,data_aa)
{
	var array_aa = sort_proc (data_aa);

	var str_out = "<table>";

	for (var it in array_aa)
		{
		var fname=array_aa[it].key;
		var value=array_aa[it].value;

		str_out += "<tr>";
		str_out += "<td>";
		str_out += '<a href="' + folder_in + '/' + fname + '"</a>';
		str_out += fname + '</td><td>';
		str_out += value['size'] + '</td><td>';
		str_out += value['date'] + '</td>';
		str_out += "</tr>";
		}
	str_out += "</table>";

	jQuery(".contents").html (str_out);
}

// -----------------------------------------------------------------------
function sort_proc (dict_aa)
{
	var array = new Array();
	for(var it in dict_aa)
		{
		array.push({'key':String (it), 'value':dict_aa[it]});
		}

	array.sort (sort_by_key_proc);

	return array;
}

// -----------------------------------------------------------------------
function sort_by_key_proc (left,right)
{
	var aa = left.key;
	var bb = right.key;

	var rvalue = 0;

	if (aa < bb)
		{
		rvalue = -1;
		}
	else if (aa > bb)
		{
		rvalue = 1;
		}

	return	rvalue;
}

// -----------------------------------------------------------------------
