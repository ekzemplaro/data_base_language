// --------------------------------------------------------------------
/*
	text_read.rs

						Mar/20/2015
*/
// --------------------------------------------------------------------
use std::env;
use std::old_io::File;
use std::old_io::BufferedReader;
use std::collections::HashMap;
// --------------------------------------------------------------------
fn display_proc (map:HashMap<&str, HashMap <&str, &str>>) {

	for (key, val) in map.iter() {
		print!("{}\t", key);
		print!("{}\t", val["name"]);
		print!("{}\t", val["population"]);
		println!("{}", val["date_mod"]);
	}
}

// --------------------------------------------------------------------
fn main () {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_in = args[1];

	println! ("{}",fname_in);


	let path = Path::new(fname_in);
	let mut file = BufferedReader::new(File::open(&path));
//	let mut dict_aa:HashMap<&str, HashMap <&str, &str>> = HashMap::new();
	for line in file.lines() {
		let str_line:String = line.unwrap();
		let vvv: Vec<&str> = str_line.trim ().split_terminator('\t').collect();
		let mut unit_aa:HashMap <&str,&str> = HashMap::new ();
		unit_aa.insert("name", vvv[1]);
		unit_aa.insert("population", vvv[2]);
		unit_aa.insert("date_mod", vvv[3]);

	let mut dict_aa = HashMap::new();
		dict_aa.insert(vvv[0], unit_aa);
		display_proc (dict_aa);
	}



	println!("*** 終了 ***");
}

// --------------------------------------------------------------------
