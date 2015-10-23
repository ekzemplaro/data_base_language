// --------------------------------------------------------------------
/*
	text_create.rs

						Apr/09/2015
*/
// --------------------------------------------------------------------
use std::env;
use std::old_io::File;
use std::collections::HashMap;
// --------------------------------------------------------------------
fn unit_prepare_proc (name:&'static str,population:&'static str,date_mod:&'static str)
  -> HashMap<&'static str, &'static str>
{

	let mut unit_aa:HashMap<&str, &str> = HashMap::new();
	unit_aa.insert("name",name);
	unit_aa.insert("population",population);
	unit_aa.insert("date_mod",date_mod);

	return	unit_aa;
}

// --------------------------------------------------------------------
fn unit_to_string_proc (key:&'static str,unit_aa:HashMap <&str, &str>)
  ->  String {
	let str_out = key.to_string () + "\t" + unit_aa["name"]
		+ "\t" + unit_aa["population"] + "\t" + unit_aa["date_mod"];

	return	str_out;
}

// --------------------------------------------------------------------
fn main() {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_out = args[1];

	let mut file = File::create(&Path::new(fname_out));

	let mut dict_aa:HashMap <&str,HashMap<&str, &str>> = HashMap::new();

	let mut unit_aa = unit_prepare_proc ("名古屋","39815","1956-3-25");
	let mut str_out = unit_to_string_proc ("t2381",unit_aa);
	println! ("{}",str_out);
	file.write_line (&str_out);

	unit_aa = unit_prepare_proc ("豊橋","19268","1956-7-10");
	str_out = unit_to_string_proc ("t2382",unit_aa);
	println! ("{}",str_out);
	file.write_line (&str_out);

	unit_aa = unit_prepare_proc ("岡崎","42853","1956-9-21");
	str_out = unit_to_string_proc ("t2383",unit_aa);
	println! ("{}",str_out);
	file.write_line (&str_out);

//	let mut dict_aa = HashMap::new();
//	dict_aa.insert ("t2381", unit_aa);

	file.write_line("t2384	一宮	17845	1956-1-15");
	file.write_line("t2385	蒲郡	87463	1956-5-24");
	file.write_line("t2386	常滑	21789	1956-8-7");
	file.write_line("t2387	大府	42193	1956-4-21");
	file.write_line("t2388	瀬戸	54287	1956-8-12");
	file.write_line("t2389	犬山	79526	1956-10-28");

	println!("*** 終了 ***");
}

// --------------------------------------------------------------------
