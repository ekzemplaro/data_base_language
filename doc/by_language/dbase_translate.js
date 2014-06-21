// -----------------------------------------------------------------------
//	dbase_translate.js
//
//					Mar/14/2012
// -----------------------------------------------------------------------
function dbase_translate_proc (dbase_in)
{
	var dbase_mod = dbase_in;

	switch (dbase_in)
		{
		case	"xls":
			dbase_mod = 'excel';
			break;

		case	"sql3":
			dbase_mod = 'sqlite3';
			break;

		case	"pstgr":
			dbase_mod = 'postgre';
			break;

		case	"fbd":
			dbase_mod = 'firebird';
			break;

		case	"drz":
			dbase_mod = 'drizzle';
			break;

		case	"dby":
			dbase_mod = 'derby';
			break;

		case	"hsql":
			dbase_mod = 'hsqldb';
			break;

		case	"xind":
			dbase_mod = 'xindice';
			break;

		case	"brkly":
			dbase_mod = 'berkeley';
			break;

		case	"mcd":
			dbase_mod = 'mcached';
			break;

		case	"mcdb":
			dbase_mod = 'mcachedb';
			break;

		case	"ttyr":
			dbase_mod = 'tyrant';
			break;

		case	"wbdv":
			dbase_mod = 'webdav';
			break;

		case	"mng":
			dbase_mod = 'mongo';
			break;

		case	"csdr":
			dbase_mod = 'cassandra';
			break;

		case	"volt":
			dbase_mod = 'voltdb';
			break;

		case	"vldmrt":
			dbase_mod = 'voldemort';
			break;
		}

	return	dbase_mod;
}

// -----------------------------------------------------------------------
