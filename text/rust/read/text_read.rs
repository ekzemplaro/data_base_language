// --------------------------------------------------------------------
/*
	text_read.rs

						Jul/09/2020
*/
// --------------------------------------------------------------------
use std::env;
use std::error;
use std::fs::File;
use std::io::{BufRead, BufReader};
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
fn main () -> Result<(), Box<dyn error::Error>> {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_in = args[1];

	println! ("{}",fname_in);


	for line in BufReader::new(File::open(fname_in)?).lines() {
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

	Ok(())
}

// --------------------------------------------------------------------
