// -----------------------------------------------------------------------
//	data_base/js/table_delete.js
//
//				Jun/11/2011
//
// -----------------------------------------------------------------------
function table_delete (url_in)
{
	var data = null;

	jQuery("#outarea_bb").text ("table_manipulate url_in = " + url_in);

	jQuery.getJSON (url_in,data,function (data_json)
		{
		var out_str = table_delete_gen_proc (data_json);

		jQuery("#result_aa").html (out_str);
		});
}

// -----------------------------------------------------------------------
// [6]:
function send_exec_proc_delete (url_read,url_delete)
{
	var arry_delete = [];
	jQuery('#table_aa :checked').each(function(){
		var file = this.id;
		arry_delete.push(file);
		});

	jQuery.post (url_delete,{my_data: arry_delete},function (data_receive)
		{
		var data = null;

		jQuery.getJSON (url_read,data,function (data_json)
			{
			var out_str = table_delete_gen_proc (data_json);
			jQuery("#result_aa").html (out_str);
			});
		});
}

// -----------------------------------------------------------------------
// [8]:
function table_delete_gen_proc (data_json)
{
	var keylist=new Array ();
	for(var it in data_json)
		{
 		keylist.push(it);
		};

	keylist.sort();

	var out_str = "<table id='table_aa'>";

	for (var it in keylist)
		{
		id = keylist[it];
		if ((id != '_id') && (id != '_rev'))
			{
			var city = data_json[id];
			out_str += gen_row_delete (id,city);
			}
		}
	out_str += "</table>";

	return	out_str;
}
// -----------------------------------------------------------------------
// [8-4]:
function gen_row_delete (id_in,city)
{
	var out_str = "<tr><td>" + id_in;
	out_str += "</td><td>" + city.name;
	out_str += "</td><td>" + city.population;;
	out_str += "</td><td>" + city.date_mod;
	out_str += "</td><td>";
	out_str += "<input type=\"checkbox\" ";
	out_str += "id=" + id_in + ">";
	out_str += "</td></tr>";

	return	out_str;
}
// -----------------------------------------------------------------------
// [12]:
function send_exec_proc_json (url_read,url_delete)
{
	var arry_delete = [];
	jQuery('#table_aa :checked').each(function(){
		var file = this.id;
		arry_delete.push(file);
		});

	var str_json = jQuery.toJSON(arry_delete);

	jQuery.post (url_delete,{my_data: str_json},function (data_receive)
		{
		var data = null;

		jQuery.getJSON (url_read,data,function (data_json)
			{
			var out_str = table_delete_gen_proc (data_json);

			jQuery("#result_aa").html (out_str);
			});
		});
}

// -----------------------------------------------------------------------
