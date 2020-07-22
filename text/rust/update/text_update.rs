// --------------------------------------------------------------------
/*
	text_update.rs

						Jul/11/2020
*/
// --------------------------------------------------------------------
use std::env;
use std::error;
use std::fs::File;
use std::io::{BufRead, BufReader};
use std::collections::HashMap;
use std::io::{Write};

// use chrono::{Local, DateTime, Date};
// --------------------------------------------------------------------
fn main () -> Result<(), Box<dyn error::Error>> {
	eprintln!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_in = args[1];
	let key_in = &args[2];
	let population_in = &args[3];

	println! ("{}",fname_in);
	println! ("{}",key_in);
	println! ("{}",population_in);

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

//	dict_aa.remove(key_in);
	let unit_bb = &dict_aa[key_in];

	println! ("{:?}", unit_bb);
	let name_bb = &unit_bb["name"];
	println! ("{}", name_bb);

	let mut unit_cc:HashMap<String, String> = HashMap::new();
	unit_cc.insert("name".to_string(),name_bb.to_string());
	unit_cc.insert("population".to_string(),population_in.to_string());

//	let local_date: Date<Local> = Local::today();
//	println!("{}", local_date);

	let date_mod = "2020-7-10";
	unit_cc.insert("date_mod".to_string(),date_mod.to_string());

	dict_aa.insert(key_in.to_string(),unit_cc);

	let mut file = File::create(fname_in)?;

for (key,value) in dict_aa.iter() {
		let str_out = key.to_string () + "\t" + &value["name"]
			+ "\t" + &value["population"]
			+ "\t" + &value["date_mod"] + "\n";
		print!("{}", str_out);
		file.write_all (String::from(str_out).as_bytes())?;
	}

	eprintln!("*** 終了 ***");

	Ok(())
}

// --------------------------------------------------------------------
