// --------------------------------------------------------------------
/*
	text_read.rs

						Jul/11/2020
*/
// --------------------------------------------------------------------
use std::env;
use std::error;
use std::fs::File;
use std::io::{BufRead, BufReader};
use std::collections::HashMap;
// --------------------------------------------------------------------
fn display_proc (map:HashMap<String, HashMap <String, String>>) {

	for (key, val) in map.iter() {
		print!("{}\t", key);
		print!("{}\t", val["name"]);
		print!("{}\t", val["population"]);
		println!("{}", val["date_mod"]);
	}
}

// --------------------------------------------------------------------
fn main () -> Result<(), Box<dyn error::Error>> {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_in = args[1];

	println! ("{}",fname_in);

	let mut dict_aa = HashMap::new();

	for line in BufReader::new(File::open(fname_in)?).lines() {
		let line = line.unwrap();
		let vvv: Vec<&str> = line.trim ().split_terminator('\t').collect();
		let mut unit_aa:HashMap <String,String> = HashMap::new ();
		unit_aa.insert("name".to_string(), vvv[1].to_string());
		unit_aa.insert("population".to_string(), vvv[2].to_string());
		unit_aa.insert("date_mod".to_string(), vvv[3].to_string());

		dict_aa.insert(vvv[0].to_string(), unit_aa);
	}

	display_proc (dict_aa);

	println!("*** 終了 ***");

	Ok(())
}

// --------------------------------------------------------------------
