// -----------------------------------------------------------------------
//	define_json_file.js
//
//					Jul/25/2011
//
// -----------------------------------------------------------------------
function define_json_file_proc (dbase)
{
	var folder_json="../data/json";
	var url_json = folder_json;

	switch (dbase)
		{
		case	"master":
			url_json += "/miyagi.json";
			break;

		case	"text":
			url_json += "/aichi.json";
			break;

		case	"csv":
			url_json += "/chiba.json";
			break;

		case	"xml":
			url_json += "/shizuoka.json";
			break;

		case	"json":
			url_json += "/tochigi.json";
			break;

		case	"excel":
			url_json += "/nara.json";
			break;

		case	"sqlite3":
			url_json += "/fukushima.json";
			break;

		case	"oracle":
			url_json += "/hokkaido.json";
			break;

		case	"mssql":
			url_json += "/gunma.json";
			break;

		case	"db2":
			url_json += "/hyogo.json";
			break;

		case	"mysql":
			url_json += "/okayama.json";
			break;

		case	"postgre":
			url_json += "/hiroshima.json";
			break;

		case	"firebird":
			url_json += "/ehime.json";
			break;

		case	"derby":
			url_json += "/yamaguchi.json";
			break;

		case	"hsqldb":
			url_json += "/kagoshima.json";
			break;

		case	"h2":
			url_json += "/miyazaki.json";
			break;

		case	"xindice":
			url_json += "/aomori.json";
			break;

		case	"exist":
			url_json += "/nagasaki.json";
			break;

		case	"dbxml":
			url_json += "/yamagata.json";
			break;

		case	"gdbm":
			url_json += "/gifu.json";
			break;

		case	"berkeley":
			url_json += "/mie.json";
			break;

		case	"mcached":
			url_json += "/ishikawa.json";
			break;

		case	"mcachedb":
			url_json += "/niigata.json";
			break;

		case	"redis":
			url_json += "/fukui.json";
			break;

		case	"tcbn":
			url_json += "/ibaraki.json";
			break;

		case	"tyrant":
			url_json += "/okinawa.json";
			break;

		case	"couch":
			url_json += "/nagano.json";
			break;

		case	"ftp":
			url_json += "/iwate.json";
			break;

		case	"mongo":
			url_json += "/saitama.json";
			break;

		case	"cassandra":
			url_json += "/kanagawa.json";
			break;
		}

	return	url_json;
}

// -----------------------------------------------------------------------
