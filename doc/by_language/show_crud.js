// -----------------------------------------------------------------------
//	show_crud.js
//
//					Apr/23/2014
// -----------------------------------------------------------------------
function show_crud_proc (lang,lang_mod,dbase_cur,dbase_aa,data_ref)
{
	show_selection_proc (lang,lang_mod,dbase_cur,"");

	var str_crud = show_crud_proc_crud (lang,dbase_cur,dbase_aa);

	switch (lang)
		{
		case	"Bash":
		case	"PHP":
		case	"Python":
		case	"Perl":
		case	"Ruby":
		case	"Java":
//		case	"C#":
		case	"Csharp":
			str_crud += show_crud_proc_jquery
				(lang,dbase_cur,dbase_aa);
			break;
		}

	if ( reference (lang))
		{
		str_crud += reference_append_proc (dbase_cur,data_ref);
		}

	jQuery(".crud").html (str_crud);
}

// -----------------------------------------------------------------------
// [4]:
function show_crud_proc_crud (lang,dbase_cur,dbase_aa)
{
	var crud_array = crud_exist_check_proc (lang,dbase_cur,dbase_aa);
	var text_crud = ["Create","Read","Update","Delete"];

	str_crud = show_crud_proc_crud_exec (crud_array,text_crud);

	return	str_crud;
}

// -----------------------------------------------------------------------
// [4-8]:
function show_crud_proc_crud_exec (crud_array,text_crud)
{
	var str_crud = "";

	for (it=0; it< crud_array.length; it++)
		{
//		if (crud_array[it] == 1)
		if (crud_array[it])
			{
		str_crud += "<button class=\"crud\" id=\"";
		str_crud += text_crud[it] + "\">";
		str_crud += text_crud[it] + "</button>";
			}
		else
			{
			str_crud += text_crud[it];
			}
		}

	str_crud += "<p />";

	return	str_crud;
}

// -----------------------------------------------------------------------
// [6]:
function show_crud_proc_jquery (lang,dbase_in,dbase_aa)
{
	var dbase_short = get_dbase_short_name (dbase_in);

	var crud_array = [false,false,false,false];

	var text_crud = ["jQ_Create","jQ_Read","jQ_Update","jQ_Delete"];
	var crud_key = ["jQ_C","jQ_R","jQ_U","jQ_D"];

	for (var crud in dbase_aa[lang])
		{
		switch (crud)
			{
			case	"jQ_C":
				crud_array[0] = crud_exist_check_proc_hantei
					(dbase_aa[lang][crud][dbase_short]);
				break;

			case	"jQ_R":
				crud_array[1] = crud_exist_check_proc_hantei
					(dbase_aa[lang][crud][dbase_short]);
				break;

			case	"jQ_U":
				crud_array[2] = crud_exist_check_proc_hantei
					(dbase_aa[lang][crud][dbase_short]);
				break;

			case	"jQ_D":
				crud_array[3] = crud_exist_check_proc_hantei
					(dbase_aa[lang][crud][dbase_short]);
				break;
			}
		}

	str_crud = show_crud_proc_crud_exec (crud_array,text_crud);

	return	str_crud;
}

// -----------------------------------------------------------------------
// [2]:
function show_selection_proc (lang,lang_mod,dbase,crud)
{
	var button_lang = 
	"<button class=\"selection\" id=\"" + lang_mod + "\"value=\"lang\">"
		+ lang + "</button>";

	var button_dbase = 
	"<button class=\"selection\" id=\"" + dbase + "\"value=\"dbase\">"
		+ dbase + "</button>";

	var str_crud = button_lang + " --- " + button_dbase;

	if (crud !== "")
		{
		str_crud += " --- " + crud;
		}

	str_crud += "<p />";

	jQuery(".selection").html (str_crud);
}

// -----------------------------------------------------------------------
// [4-4]:
function crud_exist_check_proc (lang,dbase_cur,dbase_aa)
{
	var crud_array = [false,false,false,false];

	var dbase_short = get_dbase_short_name (dbase_cur);


	for (var crud in dbase_aa[lang])
		{
		switch (crud)
			{
			case	"Create":
				crud_array[0] = crud_exist_check_proc_hantei
					(dbase_aa[lang][crud][dbase_short]);
				break;

			case	"Read":
				crud_array[1] = crud_exist_check_proc_hantei
					(dbase_aa[lang][crud][dbase_short]);
				break;

			case	"Update":
				crud_array[2] = crud_exist_check_proc_hantei
					(dbase_aa[lang][crud][dbase_short]);
				break;

			case	"Delete":
				crud_array[3] = crud_exist_check_proc_hantei
					(dbase_aa[lang][crud][dbase_short]);
				break;
			}
		}

	return	crud_array;
}

// -----------------------------------------------------------------------
// [4-4-2]:
function crud_exist_check_proc_hantei (value_in)
{
	var value_out = false;

	switch (value_in)
		{
		case	"8":
		case	"7":
		case	"6":
		case	"5":
		case	"4":
		case	"3":
		case	"2":
			value_out = true;
			break;
		}

	return	value_out;
}

// -----------------------------------------------------------------------
// [4-4-2-6]:
function get_dbase_short_name (dbase_in)
{
	var dbase_short = dbase_in;

	switch (dbase_in)
		{
		case	"excel":
			dbase_short = 'xls';
			break;

		case	"sqlite3":
			dbase_short = 'sql3';
			break;

		case	"postgre":
			dbase_short = 'pstgr';
			break;

		case	"firebird":
			dbase_short = 'fbd';
			break;

		case	"drizzle":
			dbase_short = 'drz';
			break;

		case	"derby":
			dbase_short = 'dby';
			break;

		case	"hsqldb":
			dbase_short = 'hsql';
			break;

		case	"xindice":
			dbase_short = 'xind';
			break;

		case	"berkeley":
			dbase_short = 'brkly';
			break;

		case	"mcached":
			dbase_short = 'mcd';
			break;

		case	"mcachedb":
			dbase_short = 'mcdb';
			break;

		case	"tyrant":
			dbase_short = 'ttyr';
			break;

		case	"webdav":
			dbase_short = 'wbdv';
			break;

		case	"mongo":
			dbase_short = 'mng';
			break;

		case	"cassandra":
			dbase_short = 'csdr';
			break;

		case	"voltdb":
			dbase_short = 'volt';
			break;

		case	"voldemort":
			dbase_short = 'vldmrt';
			break;
		}

	return	dbase_short;
}

// -----------------------------------------------------------------------
// [8]:
function reference_append_proc (dbase,data_ref)
{
	var str_out = "";

	for (var item in data_ref)
		{
		str_out += "<button class=\"crud\" id=\"";
		str_out += item + "\">";
		str_out += item + "</button>";
		}

	return	str_out;
}

// -----------------------------------------------------------------------
