// -----------------------------------------------------------------------
//	show_nav.js
//
//					Nov/16/2011
// -----------------------------------------------------------------------
// [4]:
function show_nav_proc (data_json,key)
{
	var tmp_str = "*** show_nav_proc ppp *** ";

	tmp_str += data_json.total_rows;

	var out_str = "";

	var arry = new Array ();

	var icount = 0;

	if (key === "all")
		{
	for (var it in data_json.rows)
		{
		arry[icount] = data_json.rows[it].id;
		icount++;
		}
		}
	else
		{
	for (var it in data_json.rows)
		{
		var pref  = data_json.rows[it].id;

		hantei = hantei_proc (key,pref);

		if (hantei)
			{
			arry[icount] = data_json.rows[it].id;
			icount++;
			}
		}
		}

	for (var it in arry)
		{
		tmp_str += it + " ";
		out_str += "<button class=\"selection\"  id=" + arry[it] + ">";
		var kanji_name = to_kanji (arry[it]);
		out_str += kanji_name + "</button><p />";
//		out_str += arry[it] + "</button><p />";
		}

	jQuery ("#outarea_aa").html (tmp_str);
	jQuery ("#outarea_bb").html ("outarea_bb");
	jQuery ("#outarea_cc").html ("outarea_cc");
	jQuery ("#outarea_dd").html ("outarea_dd");
	jQuery ("#outarea_ee").html ("outarea_ee");
	jQuery ("#outarea_ff").html ("outarea_ff");
	jQuery ("#outarea_gg").html ("outarea_gg");
	jQuery ("#outarea_hh").html ("outarea_hh");

	return	out_str;
}

// -----------------------------------------------------------------------
function to_kanji (name_in)
{
	var name_out = name_in;
	var arry_pref = new Array ();

	arry_pref["hokkaido"] = "01 北海道";
	arry_pref["aomori"] = "02 青森";
	arry_pref["iwate"] = "03 岩手";
	arry_pref["miyagi"] = "04 宮城";
	arry_pref["akita"] = "05 秋田";
	arry_pref["yamagata"] = "06 山形";
	arry_pref["fukushima"] = "07 福島";

	arry_pref["ibaraki"] = "08 茨城";
	arry_pref["tochigi"] = "09 栃木";
	arry_pref["gunma"] = "10 群馬";
	arry_pref["saitama"] = "11 埼玉";
	arry_pref["chiba"] = "12 千葉";
	arry_pref["tokyo"] = "13 東京";
	arry_pref["kanagawa"] = "14 神奈川";

	arry_pref["niigata"] = "15 新潟";
	arry_pref["toyama"] = "16 富山";
	arry_pref["ishikawa"] = "17 石川";
	arry_pref["fukui"] = "18 福井";
	arry_pref["yamanashi"] = "19 山梨";
	arry_pref["nagano"] = "20 長野";
	arry_pref["gifu"] = "21 岐阜";
	arry_pref["shizuoka"] = "22 静岡";
	arry_pref["aichi"] = "23 愛知";

	arry_pref["mie"] = "24 三重";
	arry_pref["shiga"] = "25 滋賀";
	arry_pref["kyoto"] = "26 京都";
	arry_pref["osaka"] = "27 大阪";
	arry_pref["hyogo"] = "28 兵庫";
	arry_pref["nara"] = "29 奈良";
	arry_pref["wakayama"] = "30 和歌山";

	arry_pref["tottori"] = "31 鳥取";
	arry_pref["shimane"] = "32 島根";
	arry_pref["okayama"] = "33 岡山";
	arry_pref["hiroshima"] = "34 広島";
	arry_pref["yamaguchi"] = "35 山口";

	arry_pref["tokushima"] = "36 徳島";
	arry_pref["kagawa"] = "37 香川";
	arry_pref["ehime"] = "38 愛媛";
	arry_pref["kochi"] = "39 高知";

	arry_pref["fukuoka"] = "40 福岡";
	arry_pref["saga"] = "41 佐賀";
	arry_pref["nagasaki"] = "42 長崎";
	arry_pref["kumamoto"] = "43 熊本";
	arry_pref["oita"] = "44 大分";
	arry_pref["miyazaki"] = "45 宮崎";
	arry_pref["kagoshima"] = "46 鹿児島";
	arry_pref["okinawa"] = "47 沖縄";


	if (name_in in arry_pref)
		{
		name_out = arry_pref[name_in];
		}

	return	name_out;
}

// -----------------------------------------------------------------------
// [4-6]:
function hantei_proc (key,pref)
{
	var area = new Object ();
	area["tohoku"] = ["hokkaido","aomori","iwate",
				"miyagi","akita",
				"yamagata","fukushima"];

	area["kanto"] = ["ibaraki","tochigi","gunma","saitama",
				"chiba","tokyo",
				"kanagawa"];

	area["chyubu"] = ["niigata","toyama","ishikawa","fukui",
				"yamanashi","nagano","gifu","shizuoka",
				"aichi"];

	area["kinki"] = ["mie","shiga","kyoto","osaka","hyogo",
				"nara","wakayama"];

	area["chyugoku"] = ["tottori","shimane","okayama","hiroshima",
				"yamaguchi","tokushima","kagawa",
				"ehime","kochi"];

	area["kyusyu"] = ["fukuoka","saga","nagasaki","kumamoto",
				"oita","miyazaki",
				"kagoshima","okinawa"];

	switch (key)
		{
		case	"tohoku":
		case	"kanto":
		case	"chyubu":
		case	"kinki":
		case	"chyugoku":
		case	"kyusyu":
			if (area[key].indexOf (pref) === -1)
					hantei = false;
			else
					hantei = true;
			break;

		default:
			hantei = true;
			break;
		}

	return	(hantei);
}

// -----------------------------------------------------------------------
