// ---------------------------------------------------------------
//	json02.js
//
//						Feb/15/2017
//
// ---------------------------------------------------------------
d3.json ("cities.json", function(error, data)
	{
	var str_out = "table<p />"

	str_out += to_table_proc (data)

	d3.select("#result").html (str_out)
	})

// ---------------------------------------------------------------

function to_table_proc (dict_aa)
{
	var str_out = "<table>"

	const array_aa = sort_key_proc (dict_aa)

	for (var it in array_aa)
		{
		const key = array_aa[it].key
		const value = array_aa[it].value

		if ((key != '_id') && (key != '_rev')
			&& (1 < key.length))
			{
			str_out += "<tr>"
			str_out += "<td>" + key + "</td>"
			str_out += "<td>" + value.name + "</td>"
			str_out += "<td>" + value.population + "</td>"
			str_out += "<td>" + value.date_mod + "</td>"
			str_out += "</tr>"
			}
		}

	str_out += "</table>"

	return	str_out
}

// ---------------------------------------------------------------
function sort_key_proc (dict_aa)
{
	var array = new Array()
	for(var it in dict_aa)
		{
		array.push({'key':String (it), 'value':dict_aa[it]})
		}

	array.sort (compare_by_key_proc)

	return array
}

// ---------------------------------------------------------------
function compare_by_key_proc (left,right)
{
	var aa = left.key
	var bb = right.key

	var rvalue = 0

	if (aa < bb)
		{
		rvalue = -1
		}
	else if (aa > bb)
		{
		rvalue = 1
		}

	return	rvalue
}

// ---------------------------------------------------------------
