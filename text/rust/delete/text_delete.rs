// --------------------------------------------------------------------
/*
	text_delete.rs

						Jul/17/2020
*/
// --------------------------------------------------------------------
use std::env;
use std::error;
use std::fs::File;
use std::io::{BufRead, BufReader};
use std::collections::HashMap;
use std::io::{Write};
// --------------------------------------------------------------------
fn text_read_proc(fname_in: String) -> HashMap<String,HashMap<String,String>>{
	let mut dict_aa = HashMap::new();
	let file = File::open(fname_in).expect("file not found.");

	for line in BufReader::new(file).lines() {
		let line = line.unwrap();
		let vvv: Vec<&str> = line.trim ().split_terminator('\t').collect();
		let mut unit_aa:HashMap <String,String> = HashMap::new ();
		unit_aa.insert("name".to_string(), vvv[1].to_string());
		unit_aa.insert("population".to_string(), vvv[2].to_string());
		unit_aa.insert("date_mod".to_string(), vvv[3].to_string());

		dict_aa.insert(vvv[0].to_string(), unit_aa);
	}

	dict_aa
}

// --------------------------------------------------------------------
fn text_write_proc (fname_in: String, dict_aa: HashMap<String,HashMap<String,String>>) {
	let mut file = File::create(fname_in).expect("file not found.");

	for (key,value) in dict_aa.iter() {
		let str_out = key.to_string () + "\t" + &value["name"]
			+ "\t" + &value["population"]
			+ "\t" + &value["date_mod"] + "\n";
		print!("{}", str_out);
		file.write (String::from(str_out).as_bytes()).expect("cannot write.");
	}

}

// --------------------------------------------------------------------
fn main () -> Result<(), Box<dyn error::Error>> {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_in = args[1];
	let key_in = &args[2];

	println! ("{}",fname_in);
	println! ("{}",key_in);

	let mut dict_aa = text_read_proc(fname_in.to_string());

	dict_aa.remove(key_in);

	text_write_proc (fname_in.to_string(),dict_aa);

	println!("*** 終了 ***");

	Ok(())
}

// --------------------------------------------------------------------
